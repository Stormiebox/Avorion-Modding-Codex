# 🚀 The Avorion Modding Codex

**A practical, field-tested guide to Avorion's Lua modding API — written by a modder, for modders.**

*By [Stormbox](https://github.com/Stormiebox) (stormiebox) — distilled from hands-on lessons across the **Cosmic** mod series (Cosmic Vault, Cosmic Overhaul, Cosmic War, Cosmic Chronicles, Cosmic Ascendancy, and Cosmic Starfall).*

---

### 🧭 Who this is for

This Codex is aimed at **novice-to-intermediate Avorion modders** — if you can write basic Lua and want to understand *why* Avorion's engine behaves the way it does, this is for you. Experienced modders will find a lot of this to be common sense, but there are still deep-cut lessons in here that took real, in-production bugs to uncover.

> [!TIP]
> **New here? Start with [🏁 Start Here — Core Concepts](#-start-here--core-concepts)**, then [🧵 Execution Contexts](#-execution-contexts--who-runs-where). Those two sections cover the mental model almost everything else in this guide builds on. After that, jump around freely — each entry is written to stand on its own.

### ✅ How every claim here is verified

Every rule below is written as a standalone lesson: what the engine actually does, why it surprises people, and the pattern that works. Where a claim could be checked against the `Avorion Stubs` folder (the authoritative per-class API reference — see the [Appendix](#-appendix--engine-trivia--hard-limitations)) or the vanilla script source, it was. A handful of entries that could **not** be confirmed against any source are clearly marked ⚠️ **Unverified**, so you know to test before relying on them. Where an earlier version of this Codex got something wrong, you'll see a `> [!NOTE]` **Correction** callout instead of a silent edit — this is a living document, and the corrections are part of the record.

> [!NOTE]
> Setting up `Avorion Stubs` in your own workspace (the game's per-class Lua API reference) is highly recommended, alongside a copy of Avorion's own vanilla script resources. Both are referenced constantly throughout this guide — and copies of `Avorion Stubs/` and the raw `Avorion API Indexes Documentation/` HTML docs are bundled directly in this repository (see the [Appendix](#-appendix--engine-trivia--hard-limitations) for sourcing/credit) so you can follow along without setting them up yourself first.
>
> This document is a heavily compacted version of Stormbox's own development diary, which runs past 4,700 lines. A handful of entries may still reference personal files, scripts or files you won't have locally — that's normal, and called out inline wherever it matters.

### 🤝 Contributing

This Codex is open source and welcomes contributions from the wider Avorion modding community — found a mistake, confirmed one of the ⚠️ **Unverified** entries, or learned something worth sharing? See **[CONTRIBUTING.md](../CONTRIBUTING.md)** for how to propose an addition or correction.

---

## 📑 Table of Contents

1. [🏁 Start Here — Core Concepts](#-start-here--core-concepts)
2. [🧵 Execution Contexts — Who Runs Where](#-execution-contexts--who-runs-where)
3. [📦 The Virtual File System — `include()`, Overrides & Namespaces](#-the-virtual-file-system--include-overrides--namespaces)
4. [📊 The Stat Modifier System](#-the-stat-modifier-system)
5. [🎯 Entities, Components & Combat](#-entities-components--combat)
6. [🖥️ UI Development](#️-ui-development)
7. [🌐 Multiplayer, Networking & Determinism](#-multiplayer-networking--determinism)
8. [🏛️ Factions, Alliances & Diplomacy](#️-factions-alliances--diplomacy)
9. [🌌 Sectors, Galaxy & Missions](#-sectors-galaxy--missions)
10. [🔄 Self-Healing Systems — Idempotent Triggers & Reconciliation](#-self-healing-systems--idempotent-triggers--reconciliation)
11. [🧩 Cross-Mod Compatibility](#-cross-mod-compatibility)
12. [💬 Community-Sourced Tips](#-community-sourced-tips)
13. [⚡ Quick-Reference: Common Crashes](#-quick-reference-common-crashes)
14. [📚 Appendix — Engine Trivia & Hard Limitations](#-appendix--engine-trivia--hard-limitations)

---

## 🏁 Start Here — Core Concepts

Five things to internalize before you write a single line of Avorion Lua. Almost every crash in this guide traces back to forgetting one of these.

### 1. It's Lua 5.1, and every entity gets its own VM

Avorion embeds **Lua 5.1** — not 5.2, 5.3, or 5.4 — regardless of what DLLs ship alongside the game. Bitwise operators, `goto`, and most LuaRocks packages will not work without heavy modification. The engine also assigns a **separate Lua VM to every entity** to isolate scripts and control memory usage. This has a real consequence: a Lua table declared in one script's VM (e.g. a library's module-local cache) does **not** exist in another VM that also `include()`s the same library — each inclusion re-executes the file fresh in its own memory space.

### 2. C++ userdata objects are strict — typos crash, they don't return `nil`

In plain Lua, reading a property that doesn't exist on a table just returns `nil` and execution continues. Avorion's API objects (`Sector`, `Entity`, `Player`, `Faction`, `Matrix`...) are **not** plain tables — they're C++ userdata bindings. Read or write a property the engine didn't explicitly bind, and it throws immediately: `Property not found or not readable: Sector.numFactions`, for example — `Sector` has `numPlayers` and `numEntities`, but no `numFactions`.

> **Rule of thumb:** never guess a property name. Verify it against `Avorion Stubs/<ClassName>.lua` or a vanilla script that already uses it. A typo like `ai.isAttacking` instead of the real `ai.isAttackingSomething` throws a fatal `[C]:-1: in function '__index'` and kills the whole script's logic loop.

### 3. `0` is truthy in Lua

This isn't Avorion-specific, it's just a universal Lua gotcha that trips people up constantly when reading traits or stat scores:

```lua
-- WRONG: fires even when the faction is perfectly neutral (0)
if faction:getTrait("aggressive") then

-- CORRECT: explicitly compare the number
if (faction:getTrait("aggressive") or 0) > 0.5 then
```

### 4. Dot-accessed members are copies, not references

Accessing a sub-member of an Avorion object via `.` returns a **copy**. Mutating that copy does nothing to the original:

```lua
-- Does NOT modify the matrix — .look returned a copy
matrix.look.x = 14

-- DOES modify the matrix — a whole new vec3 is assigned back
matrix.look = vec3(14, 5, 5)
```

This applies broadly across the API (matrices, vectors, and similar value-type members) — if a write to a sub-property silently does nothing, this is almost always why.

### 5. Silent failures are the real enemy, not crashes

A crash tells you exactly where to look. Avorion's nastiest bugs are the ones that run clean and **do nothing**: writing to a property the engine doesn't expose (silently discarded), calling a wrong overload that returns `nil` and gets used unguarded three lines later, or applying a stat bias that's real but the UI just never refreshes to show it. Test every new system in isolation — apply the buff and check the actual stat changed, drop the item and check it's actually on the ground, fire the callback and check it actually ran. Never assume success just because nothing threw.

### 6. `local` inside a function can silently shadow a module-scope variable of the same name instead of updating it

Declaring `local x = ...` inside a function that's meant to update a module-scope `local x` (declared earlier, at the top of the same file) doesn't reuse that outer variable — it creates a brand-new, function-local one that shadows it for the rest of that function body, then vanishes when the function returns. The outer `x`, which every *other* function in the file reads via upvalue, is never actually touched. This is a pure silent failure: no error, no crash, the function runs exactly as written — it just doesn't do what its own name and its sibling functions' expectations both assume it does.

Confirmed real case, `Cosmic Starfall`'s `complexCraft/complexCore.lua`: a module-scope `local restoredValue = nil` near the top of the file is the variable `MX.restoreOperate()` reads to decide whether saved data exists. `MX.restore(values)` — the engine's own restore-lifecycle callback, called with the exact table `MX.secure()` returned — did `local restoredValue = secureTable` instead of reading its own `values` parameter: the `local` shadowed the outer variable inside `MX.restore()` alone, and `secureTable` itself was *also* a name that only exists as a `local` inside the unrelated `MX.secure()`, so outside of it the read silently resolved to an unset global (`nil`) regardless. Net effect: every Megacomplex station's saved production/consumption/storage configuration was discarded on every server restart or sector reload, forever, with nothing in the logs to point at it.

**Rule:** in a `secure()`/`restore()` pair (or any function meant to populate module state from a parameter), the variable being assigned in `restore()` must be the *same* upvalue every other function in the file reads — write `x = ...`, not `local x = ...`, whenever `x` already exists as a module-scope local. If you genuinely want a new function-scoped temporary, give it a visibly different name so a reviewer (or you, in six months) doesn't mistake it for the outer variable at a glance.

### 7. Escaping an apostrophe inside a single-quoted string is a backslash, not a doubled quote

Another universal Lua gotcha, not Avorion-specific, but one that's easy to get wrong on autopilot if you've spent time in SQL (where doubling a quote is the correct escape). In Lua, doubling the quote does **not** escape it — it closes the string early and opens an immediately-adjacent second string literal, which is a syntax error (two string literals with no operator between them):

```lua
-- WRONG: closes the string after "faction", then "s next move...'" is a second,
-- illegal literal butted up against the first with nothing joining them
'...rival''s next move...'

-- CORRECT: backslash-escape the apostrophe
'...rival\'s next move...'
```

This bites hardest in codex/UI text strings, which are exactly the kind of long, prose-heavy, apostrophe-containing content most likely to need it — and a full-file syntax error there fails the whole script, not just the one string.

### 8. `getEntitiesByType()` and friends return multiple values, not a table — wrap the call in `{}`

`Sector:getEntitiesByType(type)`, `getEntitiesByFaction()`, and similar plural-sounding API calls are documented as returning "multiple return values," not a Lua table. Assigning the bare call to a single local only keeps the *first* result:

```lua
-- WRONG: with exactly one match, targetStation is a bare Entity (userdata), not a table
local targetStation = Sector():getEntitiesByType(EntityType.Station)
if #targetStation == 0 then ... end -- crashes: "attempt to get length of a userdata value"

-- CORRECT: {} collects every returned value into a real table, and an empty table
-- (rather than a userdata or nil) is the correct "no matches" signal to check for
local targetStation = {Sector():getEntitiesByType(EntityType.Station)}
if #targetStation == 0 then ... end
```

This exact defect (`cw_stationsiege.lua`, Cosmic War) shipped for a full point release before being caught, specifically *because* it only breaks visibly when the match count is exactly one — with zero or multiple matches the unwrapped call still happens to behave plausibly enough in casual testing.

---

[⬆ Back to top](#-table-of-contents)

## 🧵 Execution Contexts — Who Runs Where

Avorion strictly separates where code executes, and mixing these up is the single most common source of fatal crashes in modding.

### The five contexts

| Context | Lives where | Key trait |
| --- | --- | --- |
| **Server** | Always running | Global, no physical sector |
| **Galaxy** | Always running | Global, tracks the whole galaxy map/factions |
| **Sector** | Only while loaded | Suspended entirely when no players/alliances present |
| **Entity** | Only while its sector is loaded | Attached scripts run alongside the sector |
| **Client / Player** | Per connected player | Runs UI and rendering-adjacent logic |

### `update(timeStep)` is a real, third tick callback — not exclusive to `Galaxy()` scripts

`data/scripts/entity/stationscripttemplate.lua` — the engine's own official template for any station/ship/entity script — documents three separate, simultaneously-valid per-tick lifecycle callbacks side by side:

- `update(timeStep)` — called every tick, on **both** client and server (one shared function, one shared call site)
- `updateClient(timeStep)` — called every tick, client only
- `updateServer(timeStep)` — called every tick, server only

It's easy to assume `update()` (no suffix) is only a `Galaxy()`-script thing, since `data/scripts/galaxy/server.lua` uses it and Galaxy has no client/server split to name explicitly. That's one valid use of it, not the only one — the template above proves it's a general entity/sector/player-script hook too. Vanilla's own `lib/structuredmission.lua` defines all three simultaneously on a **player**-attached script, each dispatching to a different subset of `mission.currentPhase`/`mission.globalPhase` handlers depending on which side needs the logic.

A script that defines only `update()` and internally guards with `if not onServer() then return end` (or the `onClient()` mirror) is a normal, working pattern — not a missing/misnamed `updateServer()`. Don't flag it as dead code without first checking whether the attached context is Galaxy-only (where `update()` really is the only option) or one of the entity/sector/player contexts where the engine calls whichever of the three names the script actually defines.

### `Sector()` doesn't exist outside a sector thread

Scripts in `data/scripts/galaxy/server.lua` (the global Server/Galaxy script) run in a context with no physical sector. Calling `Sector()` there triggers an instant, fatal Lua panic on dedicated servers. If you need to touch a specific sector from a global script:

- **Sector is loaded:** use `runSectorCode(x, y, printErrors, code, functionName, arguments)` to inject and run a function inside that sector's own thread, or `Player():addScriptOnce()` to run something from a connected player's context instead.
- **Sector is unloaded:** `runSectorCode` will simply fail (it does **not** load the sector for you — see the callout below). Store the pending change in global state instead (`Server():setValue(...)`), and apply it from a `Player()` script hooked to `onSectorEntered` the moment a player actually loads that sector.

> [!WARNING]
> **`runSectorCode`'s third argument is `printErrors`, not "load if not loaded."** The real signature is `runSectorCode(x, y, printErrors, code, functionName, arguments)`, and per the engine's own doc comment: *"The sector must be loaded in memory in order for this call to succeed. It will not be loaded from disk or generated."* It returns `1` if the sector wasn't loaded. If you need to guarantee a sector is loaded before running code in it, call `Galaxy():loadSector(x, y)` first (it's asynchronous — loading can take a few seconds), then poll `Galaxy():sectorLoaded(x, y)` before dispatching your `runSectorCode` call.

There is also no `Galaxy():setFaction(x, y, factionIndex)` — no such setter exists. Sector ownership on the Galaxy Map is **derived**, live, from which faction controls the physical stations in that sector (`Galaxy():getControllingFaction(x, y)`). To flip a sector's ownership you have to change the stations themselves, which — same as above — requires the sector to be loaded.

### `Sector()` scripts freeze completely when the sector is unloaded

Avorion suspends `Sector()` scripts entirely when no players or active alliances are present. A 15-minute countdown built directly into a sector script simply stops ticking the moment everyone leaves and never catches up.

> **Rule:** any timer that must keep running whether or not a player is watching belongs in a `Galaxy()` script (always running). Have the Galaxy script track the countdown, and only inject or update the Sector-side script when a player actually enters those coordinates.

### Deferred APIs: `removeScript()` doesn't take effect immediately

`Entity():removeScript()` is **deferred** — it's queued and applied at the end of the current tick, not executed synchronously on the line you call it. This makes a `while` loop that waits for `hasScript()` to become false hang the server forever, because it never becomes false within the same frame:

```lua
-- WRONG: hasScript() stays true within this frame — infinite hang
while entity:hasScript("buff.lua") do
    entity:removeScript("buff.lua")
end

-- CORRECT: a single if is all that's needed
if entity:hasScript("buff.lua") then
    entity:removeScript("buff.lua")
end
```

### Re-entrant VM deadlocks: don't call back into a VM that's still running

Avorion processes callbacks **synchronously**. If VM A is mid-execution and the engine tries to force VM A to run *another* function via `invokeFunction`/`player:invokeFunction` before A's original call stack has unwound, the engine crashes with `EXCEPTION_ACCESS_VIOLATION`. This is easy to trigger by accident with a chain like: a UI script sends a server callback → the server callback synchronously triggers a second callback → that callback tries to `invokeFunction` straight back into the *original* UI script, which is still on the stack from step one.

This isn't hypothetical — it's the genericized shape of a real crash `Cosmic Vault`'s own `data/scripts/server/cosmicvaultnews_server.lua` was written to avoid, with the mitigation spelled out in its own code comments: *"We do this in updateServer to avoid re-entrant VM deadlocks! ... Calling invokeFunction back into `cc_newsboard.lua` creates a re-entrant VM deadlock and crashes the C++ engine!"* — the flag-and-poll pattern below is that file's real structure with only the names changed.

**The fix is always the same: decouple the request from the response with a state flag**, and let the engine's own `updateServer(timeStep)` loop — which runs completely outside any callback stack — do the actual notification:

```lua
function MyServerScript.publishArticle(article)
    table.insert(self.publishedNews, 1, article)
    -- Flag it. Do NOT call invokeFunction here, even though it's tempting.
    self.needsPlayerNotification = true
end

function MyServerScript.updateServer(timeStep)
    if self.needsPlayerNotification then
        self.needsPlayerNotification = false
        for _, player in pairs({Server():getOnlinePlayers()}) do
            player:invokeFunction("player/ui/mynewsboard.lua", "onNewsPublished")
        end
    end
end
```

### Async coroutines and the two ways they crash the engine

Avorion mods often wrap heavy background work (faction diplomacy, reputation decay, bounty generation) in a coroutine-based async task helper — `Cosmic Vault`'s own `data/scripts/lib/cosmicvaulttask.lua` (`CosmicVaultTask.RunAsync()`/`.Update()`/`.Yield(duration)`, which `MyTask.Yield()` below is a genericized stand-in for) is a real, shipped example of exactly this pattern, built for "intensive Lua operations across multiple server ticks... preventing massive TPS drops or server hangs." Two failure modes recur constantly:

1. **Unpumped coroutines leak C++ references.** An async task only advances if something explicitly resumes it on every `updateServer()` tick. If nothing pumps it, the coroutine sits there forever holding references to C++ objects (like a captured `Galaxy()` handle). When the owning script eventually stops or its VM gets garbage-collected, the engine forcibly destroys those objects out from under the dangling coroutine, causing an out-of-bounds memory violation. **Only use an async/coroutine wrapper for genuinely large loops in a script that explicitly pumps its own scheduler every tick** — for anything cheap enough to finish in one frame, just run it synchronously. This is a confirmed, changelogged crash, not a hypothetical: `Cosmic Overhaul`'s `DynamicReputationDecay.lua` (v5.0.1) and `Cosmic War`'s `cosmicwarceasefires.lua`/`cosmicwardiplomaticsanctions.lua`/`cosmicwarbounties.lua` (v3.0.1) all shipped this exact bug — `CosmicVaultTask.RunAsync` used with no `Update()` pump, leaving dangling coroutines holding a captured `Galaxy()` handle, which the garbage collector later tore into with a fatal `EXCEPTION_ACCESS_VIOLATION`. Both mods' changelogs document the fix as rewriting the affected calls to run synchronously.
2. **Userdata goes stale across a `yield()`.** When the C++ engine destroys an entity, the Lua userdata wrapper for it is **not** set to `nil`. If a ship is destroyed while your coroutine is yielded, `if ship then` still evaluates `true` on resume — you need the engine's actual `valid()` check, not a truthiness check:

```lua
-- WRONG: userdata may be stale/dangling after a yield
local ship = Entity(sid)
MyTask.Yield()
local pos = ship.translationf -- can crash if ship was destroyed mid-yield

-- CORRECT: never hold userdata across a yield — store the id, re-fetch after
local shipId = sid
MyTask.Yield()
local ship = Entity(shipId)
if not valid(ship) then return end
local pos = ship.translationf
```

Also never use an async wrapper to *write* to sector-physics-relevant properties (`entity.durability = ...` and similar). ⚠️ **Unverified mechanism, confirmed real risk:** the reasoning given is that sector physics run on parallel worker threads, and a coroutine write racing a physics worker's own collision/damage calculation for that entity causes heap corruption and a `SIGSEGV` — but no source in `Avorion Stubs/`, the HTML docs, or any changelog in this workspace documents that specific mechanism; the only Lua-visible evidence is that `Server()` exposes undocumented `generatorThreads`/`scriptThreads`/`workerThreads` counters with zero descriptive text on what they actually run. Treat the *advice* (keep physical writes synchronous, do cheap filtering before the expensive C++ calls) as sound defensive practice regardless — it costs nothing and this class of crash is real elsewhere in this codebase (see the unpumped-coroutine case above) — but don't repeat the specific "races a physics worker thread" explanation as a confirmed fact until it's verified against something more concrete than the thread-count properties' bare existence.

### Lazy generation: the galaxy starts (almost) empty

Avorion doesn't generate the whole galaxy up front. On a new save there are no pre-existing AI factions or populated sectors — the engine instantiates territory and factions **on demand** as players physically explore. If you're building any kind of background simulation (war heat, famine tracking, dynamic reputation), there's no bulk roster to query at all at the start of a save. Your background systems must tolerate an empty roster and pick up new factions as they're born — via the `Galaxy:onFactionCreated(index)` callback for factions created after your mod starts listening, and by periodically re-scanning the known indices in `server:getValue("factions")` (see "🏛️ Factions, Alliances & Diplomacy" below) for factions that already existed before your mod's `initialize()` ever ran.

> [!NOTE]
> **Correction:** An earlier revision of this entry cited `server:getFactions()` as the call to poll for existing factions. No such method exists anywhere in the API — confirmed by reading the complete `Server` stub, a zero-result search across both `Avorion Stubs/` and the raw HTML docs for `getFactions`, and a full-workspace grep that found no real call site (the only `getFactions()` hit anywhere is an unrelated, locally-scoped helper function inside vanilla's own `entity/sellobject.lua`). The real mechanism — already documented correctly elsewhere in this Codex — is `server:getValue("factions")`: a persisted custom-value list of every faction index that has ever existed, maintained by vanilla itself, not a queryable bulk-enumeration method.

This isn't just about *new* factions born after your mod is already running — it's the same failure mode as a mod being **installed mid-playthrough**, onto a save where plenty of factions already exist. A one-time "generate my custom faction data" pass that only runs at your mod's own `initialize()` never revisits factions that existed before that pass ran, or that get created afterward through a code path you didn't anticipate. See "🔄 Self-Healing Systems" below for the general pattern (periodic reconciliation instead of a one-shot pass) and a real case study of exactly this happening.

---

[⬆ Back to top](#-table-of-contents)

## 📦 The Virtual File System — `include()`, Overrides & Namespaces

### `include()`, not `require()`

Standard Lua `require()` completely ignores Avorion's Virtual File System (VFS) and searches the literal vanilla `data/scripts/lib/` path — so `require("mymodlibrary")` from inside your mod folder throws a fatal `module not found`. **Always use Avorion's native `include()`.** It's a custom wrapper (functionally close to a scoped `dofile()`) purpose-built to scan and merge paths across every active VFS mod folder.

### Overriding a vanilla file? Don't add a `return` at the end

Avorion's VFS lazily concatenates mod files onto the end of the vanilla file they share a path with, all inside the same compiled chunk. Vanilla library files (`galaxy.lua`, `shiputility.lua`, `asteroidfieldgenerator.lua`, and most of `data/scripts/lib/`) typically end with `return Namespace`. If your override file *also* ends with a `return`, the VFS inserts your code **before** the vanilla return but keeps the vanilla return at the very bottom — producing two `return` statements in the merged chunk and a fatal `<eof> expected near 'return'` syntax error.

> **Rule:** if you're overriding a vanilla file that already ends in `return`, don't add your own `return` — just end on your last logic block or `end`. The VFS supplies the vanilla return automatically.
>
> **Exception:** a standalone custom script (not overriding anything) still needs its own `return` if other scripts are meant to `include()` it.

Relatedly, never manually `include()` the exact vanilla path you're overriding (e.g. `include("data/scripts/galaxy/server.lua")` at the top of your own `server.lua` override) — the recursive resolution fails and floods both `clientlog` and `serverlog` with `module not found` spam.

### The "capture the original, then wrap it" pattern only works on a function defined *earlier* in the merged chunk

A common way to extend a function without fully replacing it: save a reference to the current definition, then define a new one that calls the saved reference plus your own logic:

```lua
local original_initialize = SomeNamespace.initialize
function SomeNamespace.initialize()
    original_initialize()
    -- your own extra logic
end
```

This is only safe when `SomeNamespace.initialize` was already assigned by code that ran *earlier* in the same merged chunk — typically vanilla's own file, with your override file's code appended after it by the VFS (see "Overriding a vanilla file" above), or an earlier-loaded mod's own override of that same vanilla path. The capture line reads whatever is *currently* on the table at that point in execution, not whatever the function is named or "supposed to" resolve to.

> [!WARNING]
> **If you are the *sole* author of that function in this codebase** — a mod's own from-scratch namespace built via a factory call like `ShopAPI.CreateNamespace()`, with no vanilla or other-mod file sharing that exact path — there is nothing earlier in the chunk to capture. Replacing your own `function SomeNamespace.initialize() ... end` with the capture-and-wrap pattern, *in the same file, at the same position*, captures `nil` (the field was never set before that line runs), and calling it later throws `attempt to call a nil value`. Caught during a Cosmic Overhaul equipment-dock/turret-merchant split before it shipped: the fix was to just rewrite the function body directly — keep the original logic, add the new logic, no capture needed, since being the sole author means there's no earlier version to preserve in the first place. Reach for this pattern only when actually extending something defined earlier in the chain; if you wrote the whole function yourself, edit it in place.

### Before deleting "dead" code from an override file, first tell the two file shapes apart

A mod folder full of vanilla-path overrides is not one uniform thing — it's (at least) two structurally different shapes, and they call for opposite levels of caution when you're cleaning up code that looks unused:

- **Full reimplementation.** The override reassigns the whole namespace (`SomeNamespace = ShopAPI.CreateNamespace()`, or equivalent) and then redefines every function vanilla had, function-for-function, with its own logic. Vanilla's own version of those functions is already fully discarded the moment the reassignment runs — nothing in the merged chunk before that point is ever reached again. Confirm this by diffing the override's function list against vanilla's own copy of the same file: if the override redefines the same complete set (not a subset), it's this shape, and code that's become unreachable *within the override's own logic* (e.g. a helper only called by a function you've since neutered) is genuinely dead — safe to remove, because there was never any vanilla behavior riding along with it to lose.
- **Wrap-and-extend.** The override captures vanilla's original function (`local original = SomeNamespace.initialize`) and calls it from inside its own replacement, adding logic around that call. Here, vanilla's real behavior *is* still running, threaded through the capture — removing the capture line, or anything that depends on it having run, deletes vanilla's actual functionality, not dead weight.

> **Rule:** before deleting anything from an override file that looks unused, identify which shape you're looking at. A full reimplementation earns real scrutiny of what's actually still reachable (safe to prune once confirmed dead). A wrap-and-extend file should be treated as carrying real vanilla behavior by default — verify by reading vanilla's own copy of the file directly, not by assuming the shape from a superficial read of the override alone. The two shapes can sit side by side in the same mod's own `merchants/` folder, so the previous file you audited being one shape says nothing about the next one.

### Libraries must never define global engine callbacks

If a `lib/` file defines a bare global callback like `function updateServer(...)` or `function getUpdateInterval(...)`, then **every script that `include()`s that library inherits and silently overwrites its own global callback with the library's** — because `include()` executes the file's code directly into the calling script's global memory space (see "Transitive includes" below). A territory-tracking library that happened to define `updateServer` at the bottom once broke a completely unrelated mission script's update loop purely because the mission included the library for one of its math helpers.

> **Rule:** library files (`data/scripts/lib/*.lua`) only ever export a namespace table (`return MyLibrary`). The actual server/sector/entity script that includes the library defines the real global callback and delegates into the library's namespaced functions.

### Namespaced scripts vs. global scripts

When a script declares `-- namespace MyNamespace` at the top, the engine automatically maps that script's lifecycle functions (`initialize()`, `updateServer()`, `secure()`, etc.) and `callable()` registries into the namespace table in C++ — you don't write global wrapper functions for these.

- **Namespaced scripts must NEVER append a global wrapper** like `function initialize(...) if MyNamespace.initialize then return MyNamespace.initialize(...) end end` at the bottom. Doing so shadows the namespace and duplicates the engine's internal callback handler, leading to double-execution, VFS corruption, or silent hangs. All RPCs in a namespaced script must be registered as `callable(MyNamespace, "functionName")`, grouped at the end of the file inside the namespace scope.
- **Global (non-namespaced) scripts** define their hooks globally (`function onInteract()`) and register RPCs the legacy way: `callable(nil, "functionName")`.
- A namespaced script that fails to actually declare `-- namespace X` at the top but still relies on `X.updateServer` being called will silently fall back to a slower engine default background update interval instead of whatever `getUpdateInterval()` was supposed to return — a subtle source of "why is this so laggy" bugs. ⚠️ **Unverified:** an earlier revision of this entry gave this fallback as exactly **15 seconds**. No source in `Avorion Stubs/`, the raw HTML docs, or vanilla script source corroborates that specific figure — the one related doc entry (`EntityFunctions.html`'s `getUpdateInterval()` entry) documents a *different* fallback, "every tick," for the unrelated case of a script that never defines `getUpdateInterval()` at all. Treat "noticeably laggier than expected" as the confirmed symptom; treat the exact number as unconfirmed until someone measures it directly.

### Transitive includes: you don't need to `include()` everything by hand

Because vanilla files like `galaxy.lua` declare their functions globally (no `local`), including one library that itself includes `galaxy` means your script automatically inherits every one of `galaxy.lua`'s global functions too — you don't need to manually `include("galaxy")` again. The engine also caches includes, so a redundant explicit `include()` is harmless, just unnecessary.

### A `local` at file scope in vanilla shadows the global for every mod appended after it

Because the merge described above concatenates mod content into the *same compiled chunk* as the vanilla file, a `local` variable vanilla declares at file scope becomes a real Lua **upvalue** for every function defined anywhere later in that merged chunk — including code your own mod appends when overriding that same file. Vanilla's `data/scripts/player/background/simulation/simulation.lua` is a real example: it opens with `local Galaxy = include("galaxy")`, aliasing the *galaxy.lua library table* to the name `Galaxy` purely for its own internal convenience. Any code your mod appends to an override of that same file which calls the bare global `Galaxy()` (the real entity constructor) will instead silently resolve to this shadowed local — and since the library table has no matching method, Lua throws `attempt to call upvalue 'Galaxy' (a table value)`, pointing at your own line as if it were the bug, when the actual cause is a few hundred lines earlier in a vanilla file you never touched.

> **Rule:** if a name you need as a global (`Galaxy`, `Sector`, `Player`, etc.) is also used as a `local` alias for an unrelated library somewhere earlier in the vanilla file you're overriding, reach for it explicitly as `_G.Galaxy()` (or whatever the name is) instead of the bare call — `_G` always resolves to the true global table regardless of what upvalue is shadowing the name in the merged chunk.

### Reading a vanilla file's private state? Don't assume it lives on the namespace table

The section above ("A `local` shadows the global") covers the danger of a bare global call accidentally resolving to a vanilla local. There's a mirror-image trap when your override *wants* to read a vanilla script's internal state: because the namespace table (`Factory`, `Sector`, etc.) is what the engine routes lifecycle callbacks through, it's tempting to assume every piece of a namespaced script's state lives on that table too (`Factory.someInternalThing`). It usually doesn't — most of a vanilla script's working state is kept in plain file-scope `local`s that never touch the namespace table at all, and Lua returns `nil` for an unset table field with no error, so the mistake is completely silent.

A real case from Cosmic Overhaul's `factory.lua` override: vanilla's own production-error state lives in `local productionError` / `local newProductionError` (plain file-scope locals, `entity/merchants/factory.lua` lines ~51-52) — never `Factory.productionError`. The mod's override read `Factory.productionError` to build the Factory Overview tab's "Status" column, which is a table field **nothing in vanilla, and nothing else in the mod, ever wrote** (the mod's own siege-blockade branch was the only writer, and only conditionally). The read was never `nil`-guarded into an error — it just silently evaluated to `nil` on every ordinary tick, so the "current error" always fell through to the "Running" default regardless of the factory's real state. The fix wasn't a namespace lookup at all — it was reaching for the bare local (`newProductionError`), which is a valid upvalue for override code appended after vanilla's declaration in the same merged chunk, by the exact same VFS-merge mechanics as the shadowing case above.

```lua
-- WRONG: assumes vanilla exposes its internal error state on the namespace table
local currentError = Factory.productionError -- always nil; nobody ever sets this field

-- CORRECT: read vanilla's own file-scope local directly — it's a real upvalue here
-- because the VFS merge puts this override code after vanilla's `local newProductionError`
-- declaration in the same compiled chunk (see "A local shadows the global", above)
local currentError = newProductionError
```

> **Rule:** before reading `Namespace.someField` in an override, grep the vanilla file for how that value is actually produced. If it's a `local` (not a `Namespace.field =` assignment anywhere), reach for the bare name instead — it's a real upvalue in the merged chunk, exactly as reachable as the shadowing hazard above, just in the direction you actually want this time. Never assume a namespace table field exists just because the script is namespaced; a namespace declaration only governs which functions the *engine* auto-routes, not which internal variables the script's author chose to expose.

### A repeating `include error` scoped to one workshop folder — don't assume it's a broken download

When a player's `serverlog`/`clientlog` shows `include error: module 'X' not found`, first check *which* files are missing and *where the error originates*. A recurring signature: `cv_weather_ui.lua` failing to `include("cosmicvaultweatherdictionary")`, and `cosmicbuff.lua` failing to `include("callable")` (then crashing with `attempt to call global 'callable' (a nil value)`) — both reported from the *same* workshop item's own folder, with the "Tried the following paths" list showing the file missing from **every** currently-loaded mod folder, including the very folder the failing script itself lives in.

Neither of those two files is actually missing from the mod's real source — `cosmicvaultweatherdictionary.lua` is present and correct in the shipped `Cosmic Vault` package, and `callable.lua` is a vanilla `data/scripts/lib/` file, not something any mod ships at all (confirmed byte-identical between the reference vanilla copy and a live local install). Start there: confirm your own shipped source is clean before touching code.

> [!NOTE]
> **Correction:** An earlier revision of this entry concluded, after seeing this signature on two separate machines, that the cause was necessarily a corrupted/partial Steam Workshop download on the reporting player's end, and told modders to stop there. That conclusion was **falsified** by a third occurrence: the same reporting player's server hit the identical error again, on the identical two files, after Steam file-integrity verification, a full mod reinstall, and unsubscribing every conflicting third-party mod — a sequence that should defeat any ordinary corrupted-cache theory. Both failing scripts share a trait a corrupted-download explanation doesn't need to account for: they're not loaded from the initial galaxy/server bootstrap list, but attached **dynamically at runtime** — `cosmicbuff.lua` via `entity:addScript(...)` from `cosmicvaultbuffs.lua`, `cv_weather_ui.lua` via `player:addScriptOnce(...)` from `cv_weather_controller.lua` — while scripts that *are* part of the initial bootstrap (e.g. `cosmicvaultnews_server.lua`) load cleanly in the same sessions. Whether `include()`'s vanilla/mod-folder fallback behaves differently for a script attached this way, versus one loaded at initial VFS construction, is not yet confirmed against any documented engine behavior — flagging it here as the live open question rather than asserting a mechanism that hasn't been verified.

> **Rule:** don't stop at "the file exists in my shipped source, so it must be the player's environment" — that explanation must survive a controlled retest (clean reinstall) before you treat it as the diagnosis. If it doesn't survive, the next thing to check is what's structurally different about *how* the failing script gets loaded (bootstrap-list vs. dynamically `addScript()`/`addScriptOnce()`-attached) rather than assuming file corruption a second time.

> [!NOTE]
> **New evidence (still doesn't confirm the mechanism, but narrows it):** the same reporting player hit the identical `cosmicbuff.lua:110` failure a fourth and fifth time, and this time the logs showed the shape of the problem more clearly: once `include("callable")` fails for a given server session, it does not self-heal — every subsequent `entity:addScript("data/scripts/entity/cosmicbuff.lua", ...)` attempt for the rest of that session fails identically, with no successful attach ever recorded afterward. One log showed 280 repeats of the exact same crash line in under 4 minutes.
>
> That volume wasn't the engine retrying on its own — it was a downstream consumer amplifying it. `CosmicVaultBuffs.applyBuff()` (`Cosmic Vault/data/scripts/lib/cosmicvaultbuffs.lua`) has no memory of a failed attach, so any caller polling on a `refreshBuff()`-fails → `applyBuff()`-retries pattern (Cosmic Overhaul's `captainelitetraits.lua` Commodore trait does this every 5 seconds, for every ship in the faction, for two buffs each) re-issues a brand new `addScript()` call on every single poll — forever, since a permanently-failing attach can never produce a script instance for `refreshBuff()` to find. One stuck buff, multiplied by fleet size and poll frequency, is what actually floods the log.
>
> **Generalizable lesson, independent of whatever the root engine cause turns out to be:** any library function that dynamically `addScript()`/`addScriptOnce()`-attaches a script on behalf of a caller should assume the attach can fail silently (no synchronous error is returned to the caller — `include()` failures inside the attached script surface only in the log, on a background thread, well after the call site has already moved on) and should never let a caller's naive retry-on-failure poll turn one failure into an unbounded retry storm. `cosmicvaultbuffs.lua`'s `applyBuff()` now tracks the last attach attempt per `(entity, buffId)` and enforces a 15-second cooldown before re-attempting, clearing it immediately on a confirmed-successful `refreshBuff()` or an explicit `terminateBuff()`. This is a backoff on the *symptom*, not a fix for the underlying `include()` failure — treat it as a template for any other dynamic-attach API in this codebase, not as evidence the root cause is understood.

### Cross-platform: match file-path case exactly

Windows file systems are case-insensitive; the Linux systems most dedicated servers run on are not. `include("sectorgenerator")` loads fine on Windows even though the real file is `SectorGenerator.lua` — and then throws a fatal `module not found` the moment someone runs your mod on a Linux dedicated server. This applies to every string path: `include()` targets, audio (`.ogg`), and textures (`.png`) alike. **Always match the exact on-disk capitalization**, and test on Linux (or at least audit paths) before publishing.

### VFS parse order isn't guaranteed — don't assume an enum is loaded

If you append content to a vanilla file (e.g. adding entries to `data/scripts/lib/galaxy.lua`) that reference a global enum like `WeaponType.PulseCannon`, and the VFS happens to parse `galaxy.lua` before `weapontype.lua` defines that enum, `WeaponType` is `nil` at that point — and the resulting syntax error can wipe the *entire* `Galaxy` export table from memory, breaking unrelated background systems in ways that look nothing like the real cause. **Explicitly `include()` any library your appended code depends on, at the very top of the file you're appending to** — don't rely on load order.

---

[⬆ Back to top](#-table-of-contents)

## 📊 The Stat Modifier System

This is the part of the API with the worst naming in the entire engine. Get comfortable with the underlying equation and the four functions stop being confusing.

### The equation

```
Final = (Base + Sum(MultiplyableBias)) × (1 + Sum(BaseMultiplier)) × Product(Multiplier) + Sum(AbsoluteBias)
```

### The four pillars

| Function | What it does | Use it for |
| --- | --- | --- |
| `entity:addMultiplyableBias(stat, value)` | Adds a **flat** number to the base, *before* multipliers | Flat additions meant to scale with later % buffs (`+3 Jump Range`) |
| `entity:addBaseMultiplier(stat, value)` | Adds to a cumulative, additive **percentage pool** | Ordinary % buffs (`+50%` → pass `0.5`) and penalties (`-10%` → pass `-0.1`) |
| `entity:addAbsoluteBias(stat, value)` | Adds a **flat** number at the very end, ignoring all multipliers | A guaranteed flat bonus regardless of the ship's other buffs |
| `entity:addMultiplier(stat, value)` | A final, **compounding/exponential** multiplier (real API, confirmed in `Avorion Stubs/Entity.lua`) | Rare boss items / true relics only |

Two `addBaseMultiplier` calls of `0.5` each combine additively into a `2.0` (200%) base multiplier. Two `addMultiplier` calls of `1.5x` each combine *multiplicatively* into `2.25x` — which is exactly why it's reserved for rare, high-impact items: stack two or three of these and balance breaks fast. `addMultiplier` is also the pillar most prone to UI-sync issues — it can visibly fail to update a ship's displayed stats until a reload, and can appear to "bounce" when a module is toggled. For routine, everyday buffs (station production, ship subsystems), prefer `addMultiplyableBias` or `addBaseMultiplier` — they update reliably.

> ⚠️ **Common trap:** `addMultiplyableBias` adds a *flat* number, not a percentage — even for percentage-flavored stats. `addMultiplyableBias(StatsBonuses.ShieldDurability, 0.5)` adds a virtually undetectable **0.5 HP**, not +50%. If you meant a percentage, you wanted `addBaseMultiplier`.

### Removing a stat bonus: always use the returned key

There is no `removeMultiplyableBias`/`removeBaseMultiplier`/etc. Every `add*` call above returns a unique `key`; store it, and pass it to the single universal removal function:

```lua
local activeBuffs = {}
local key = entity:addMultiplyableBias(StatsBonuses.ShieldDurability, 0.5)
table.insert(activeBuffs, key)

-- later, to remove:
for _, k in pairs(activeBuffs) do
    entity:removeBonus(k)
end
activeBuffs = {}
```

> [!WARNING]
> **These keys are volatile — they reset on every server restart.** If you persist a `key` via `secure()`/`restore()` and try to `removeBonus()` it after a restart, the call silently fails because the key is no longer valid, leaving the old buff permanently stuck while a fresh one stacks on top. **Never persist bonus keys across a restart.** Clear your key table in `restore()` and let the next `updateServer()` tick reapply fresh ones.

Upgrade module scripts (`data/scripts/systems/*.lua`) are the one exception — `addMultiplyableBias` there acts as a special global callback the engine calls during stat aggregation, and stats are automatically stripped when the upgrade is physically uninstalled. You don't need the key pattern inside an upgrade module.

### `entity:removeScriptBonuses()` clears every script's bonuses on the entity, not just the calling script's own

The official doc comment (`Avorion Stubs/Entity.lua`) reads "Deletes all bonuses added by the current script," which reads as scoped to whichever script instance calls it. In practice, on a ship carrying bonuses from multiple different scripts (a temporary buff script, a subsystem's own passive bonus, another mod's aura), calling this from any ONE of them wipes the others' bonuses too — confirmed independently in this workspace across Cosmic Ascendancy's `ascendantaegis.lua` (Aegis Reactor's 15-second refresh cycle was erasing Cosmic Overhaul's Captain Elite Trait buffs and Cosmic Starfall's Bastion System buffs on the same ship), Cosmic Vault's `cosmicbuff.lua` (a Commodore's paired Shield + FireRate buffs — two separate script instances stacked via `entity:addScript()` — silently erasing each other the instant the second one applied), and Cosmic Starfall's `starfall_setbonuses.lua` (its doctrine/set-bonus recalculation, which fires on every turret change and every reload, was wiping every individually-installed subsystem's own base passive bonuses).

> [!WARNING]
> **Rule:** never call `entity:removeScriptBonuses()` from a script if the entity might also be carrying bonuses added by *any other* script — which, on a player/alliance ship in a suite with multiple concurrently-stackable buff/subsystem/aura systems, is close to always. Track your own bonus key(s) (the "Removing a stat bonus" pattern above) and call `entity:removeBonus(key)` for exactly the bonus you added instead. Reserve `removeScriptBonuses()` for a script you've confirmed is the *only* thing that ever adds bonuses to that specific entity (vanilla's own `captainshipbonuses.lua` is one such case — it's the sole owner of captain-derived bonuses on a ship).

### `addMultiplyableBias` vs `addBaseMultiplier`: a flat bias is not a percentage, even when a `factor - 1.0` conversion is layered on top

A `factor - 1.0` (or `multiplier - 1.0`) delta conversion is the correct way to turn a "2.0 = double" scale factor into the additive delta `addBaseMultiplier` expects — but that conversion doesn't make `addMultiplyableBias` (a **flat**, pre-multiplier bias) into a percentage lever just because the same delta math is applied before it. If you see `factor - 1.0` (or similar) feeding into `addMultiplyableBias`, it's very likely a copy-paste of the correct `addBaseMultiplier` pattern with the wrong primitive swapped in — this exact swap was found (and corrected above) in two of this Codex's own prior entries, and independently as a live bug in Cosmic Ascendancy's `eclipse_boss_scaling.lua` (via `CosmicVaultBuffs.applyPermanentFactor`, which wraps `addMultiplyableBias`) where an intended ~26x-42x boss shield multiplier landed as a flat, negligible +25 raw HP instead.

### There is no per-damage-type or generic "Damage"/"SalvageYield" stat

The full `StatsBonuses` enum (verified against `Avorion Stubs/Globals.lua`, 41 members from `RadarReach` to `FireRate`) has **no** `EnergyDamage`, `PhysicalDamage`, `Damage`, or `SalvageYield` member — for ships *or* turrets. (Don't confuse this with the separate `DamageType` enum — `Physical`, `Energy`, `AntiMatter`, `Electric`, `Plasma`, `Fragments` — which classifies *incoming* damage in calls like `inflictDamage` and has nothing to do with stat bonuses.)

- To boost combat DPS through the stat system, use `StatsBonuses.FireRate` — it scales all installed weapons uniformly and is the standard DPS proxy.
- Don't fake it by buffing `StatsBonuses.ArmedTurrets` — that only raises turret *slot capacity*, causing UI stat oscillation with no real DPS gain unless the player actually builds more turrets.
- For custom yield mechanics (Salvage, Mining) that have no native enum at all, set a plain entity flag (`entity:setValue("elite_scavenger_yield", true)`) and intercept it directly inside `salvage.lua` / `minecommand.lua`'s loot logic.

### Shields: never touch `shieldMaxDurability` directly

Writing `entity.shieldMaxDurability = 50000` looks like it works — until the ship takes damage. The instant it does, the C++ engine recalculates max shield capacity from the ship's *physical* shield-generator blocks. A vanilla-generated ship with zero shield blocks recalculates straight back down to `0`, instantly wiping your override. Use the stat modifier system instead:

- **Flat override regardless of blocks:** `entity:addAbsoluteBias(StatsBonuses.ShieldDurability, 50000)`
- **Percentage buff:** `entity:addBaseMultiplier(StatsBonuses.ShieldDurability, 10.0)` for +1000% — but the ship's base plan needs **at least one** shield block, or a multiplier on a `0` base is still `0`.

> [!NOTE]
> **Correction:** This entry previously listed `entity:addMultiplyableBias(...)` as the "Percentage buff" option. That's wrong, and contradicts this very section's own "Common trap" callout above: `addMultiplyableBias` adds a **flat** number before multipliers are considered (confirmed against `Avorion Stubs/Entity.lua`'s own doc comment: "Adds a bias for stat of type type. This bias will be added to stat before multipliers are considered"), not a percentage. Passing `10.0` there adds a flat +10 raw shield HP, not +1000%. `addBaseMultiplier` is the pillar that actually produces a percentage buff (see "The four pillars" table above). Found while fixing a live bug in Cosmic Ascendancy's `eclipse_boss_scaling.lua`, which had followed this exact (wrong) guidance and was calling the flat-bias primitive for what was meant to be a ~26x-42x endgame boss shield multiplier, silently granting a negligible flat bonus instead.

### Watch your percentage math

`addBaseMultiplier` treats its argument as the *delta* to add to the pool, not the final multiplier. Passing `1.10` doesn't mean "+10%" — it means "+110%" (a `1 + 1.10 = 2.10`, i.e. 210%, total). For a genuine +10% buff, pass `0.10`.

---

[⬆ Back to top](#-table-of-contents)

## 🎯 Entities, Components & Combat

### Component wrappers: `Shield(id)`, `Durability(id)`, `Hangar(id)`, `Weapons(id)` are all real

These are genuine, documented component-wrapper constructors (see their respective `Documentation/*.html` pages, and vanilla scripts like `corruptedaibehaviour.lua`'s `Shield(entity.id)` or `playerprofile.lua`'s `Hangar(craft)`) — they are **not** phantom APIs, and they accept either an entity id or the entity itself. If a call through one of these appears to do nothing, the constructor itself is essentially never the culprit; look for:

- **A stale/destroyed target.** Guard with `valid(...)`, not a truthiness check, since a destroyed entity's wrapper doesn't reliably become falsy:

```lua
local durability = Durability(ship.id)
if valid(durability) then
    durability:inflictDamage(1000000, DamageSource.Collision, DamageType.Energy, boss.id)
end
```

- **A wrong `inflictDamage` argument order.** The real signature is `(damage, damageSource, damageType, inflictorId, ...)` — mixing up the order (or passing a raw type number where a `DamageSource`/`DamageType` enum is expected) fails silently or hangs the engine.

Similarly, `.prefix` doesn't exist directly on a turret `Entity` — the text prefix lives on the `Weapons` component: `Weapons(turretEntity).weaponPrefix`. And there is no `entity:getWeapons()` on the raw entity wrapper either — go through the component: `Weapons(entity.id):getWeapons()`.

### `onRemove()` is not "the entity was destroyed" — that's `onDelete()`

These two script-lifecycle callbacks sound interchangeable and aren't. Per the engine's own doc text (`EntityFunctions.html`, and the matching entries under `PlayerFunctions.html`/`SectorFunctions.html`):

- **`onRemove()`** — "Called when the script is about to be removed from the object, before the removal." This fires when *the script itself* is detached (e.g. an explicit `removeScript()` call) while the object it's attached to keeps existing.
- **`onDelete()`** — "Called when the script is about to be deleted from the object, before the deletion. This is the last call that will be done to an object script. This function is also called when the object it is attached to is deleted."

If you need to clean up an entry this script owns in some *other* shared/persistent registry (a galaxy-level table, a global database key, an external tracking list) once the entity is gone for good — sold isn't the concern, actual destruction is — hook `onDelete()`, not `onRemove()`. Vanilla's own `entity/utility/jumprangeboost.lua` does exactly this correctly:

```lua
-- CORRECT (vanilla precedent): cleans up on actual entity deletion
function JumpRangeBoost.onDelete()
    Sector():removeStaticHyperspaceGlow(JumpRangeBoost.entityId)
    removeShipProblem("HSJumpRangeBoost", JumpRangeBoost.entityId)
end
```

A script that only overrides `onRemove()` for this purpose will work fine in manual testing (removing the script, or even scrapping via a UI action that happens to detach the script first) but silently never fire for the much more common real-world case — the entity being destroyed outright (combat loss, demolished, etc.) — leaving a permanent stale/"ghost" entry in whatever it was supposed to clean up. Confirmed as a live bug in Cosmic Overhaul's `entity/merchants/factory.lua`: its Factory Overview registry unregister call was wired to `onRemove()` only, so a factory destroyed in combat never left the tracked-factories list, showing frozen last-known data forever. If you're not certain live `Entity()`/`Faction()` context is still safe to read this late in the lifecycle (jumprangeboost.lua's use of a pre-cached `.entityId` rather than a fresh `Entity()` call is a hint that it might not always be), cache the identity you'll need earlier (e.g. during your normal periodic update) and fall back to it in `onDelete()` rather than trusting a fresh lookup unconditionally.

> [!NOTE]
> **Correction:** this entry previously stopped at "hook `onDelete()`, not `onRemove()`," and offered `jumprangeboost.lua` as the vanilla precedent for doing so. That's incomplete in a way that will bite you on a dedicated server. Read on.

#### `onDelete()` also fires on a routine sector unload — it does **not** mean "destroyed"

Re-read the doc text above: *"also called when the object it is attached to is deleted."* Deletion is not destruction. When the server saves a sector and drops it from memory — which happens constantly, to every sector with no player in it — every entity in that sector is deleted, and every one of their scripts gets `onDelete()`. Nobody blew anything up.

Two consequences, and the second is the nastier one:

1. **`Sector()` is already gone by then.** Confirmed by a live server log: the crash landed between `create save work for sector (163:312)` and `sector (163:312) saved`, with `attempt to index local 'sector' (a nil value)` on the handler's very first `Sector()` use.
2. **Any world mutation in there runs on every unload.** Broadcasts, news/announcement publishes, stripping a flag off a faction, restoring state on other entities — all of it fires repeatedly, for a thing that never happened. The crash in (1) is actually the *merciful* failure mode, because aborting on line one stops the rest of the handler from doing damage.

Check what vanilla actually does before copying the pattern: every `onDelete()` in the shipping scripts is client-side or purely local teardown — `gate.lua` and `wormhole.lua` terminate a sound source, and `jumprangeboost.lua`'s is wrapped in `if onClient() then`. None of them mutates server-side world state. That's not a coincidence.

If what you mean is "this entity was destroyed," register the callback that says so:

```lua
-- WRONG: fires on every sector unload too, and Sector() is nil by then
function onDelete()
    local sector = Sector()
    for _, e in pairs({sector:getEntitiesByType(EntityType.Station)}) do ... end
    sector:broadcastChatMessage("Server", ChatMessageType.Warning, "It's destroyed!")
end

-- CORRECT: onDestroyed only fires on real destruction, and the sector is still loaded
function initialize()
    if onServer() then
        Entity():registerCallback("onDestroyed", "onDestroyed")
    end
end

function onDestroyed(index, lastDamageInflictor)
    local sector = Sector() -- safe here
    ...
end
```

Vanilla registers it exactly this way inside an `onServer()` guard in `entity/enemies/worldboss.lua` and `entity/events/asteroidshieldboss.lua`, and both handlers then call `Sector()` freely — proof the sector context is still live at that point.

So the split is three ways, not two: `onRemove()` = the script was detached; `onDestroyed()` = the object was destroyed; `onDelete()` = the object is going away *for any reason at all*, including being saved to disk. Use `onDelete()` for local, in-memory cleanup that should happen whenever this script instance stops existing (that sound source), and `onDestroyed()` for anything that reacts to the entity actually dying. If you genuinely need a registry cleanup that survives both, do it in `onDestroyed()` and treat `onDelete()` as unload-safe only.

### `entity.damageMultiplier` is real, but doesn't reliably move the needle on DPS

> [!NOTE]
> **Correction:** An earlier revision of this entry claimed `damageMultiplier` "isn't a property the C++ engine exposes for writing" and that assignments to it are silently discarded. That's wrong — `damageMultiplier = 0.0, -- float` is genuinely listed as a writable property on `Entity` in `Avorion Stubs/Entity.lua` (it's only `[read-only]` on the `ReadOnlyEntity`/`Turret` wrapper classes, not on `Entity` itself). This was found by grepping the per-class stub directly — the earlier check apparently never actually searched for this specific property name and just carried forward an unverified claim, which is exactly the failure mode that motivated retiring the old files in favor of always searching `Avorion Stubs/` directly (see the Appendix).

The property write itself is not silently discarded. What's still unconfirmed is whether it actually feeds into the same damage-output pipeline you'd expect — the original report behind this entry was that setting `entity.damageMultiplier` produced no visible change in a ship's dealt damage in practice, which is consistent with the property existing but not being read by whatever calculation path was being tested (it could be scoped to a narrower mechanic, get overwritten every tick by the engine, or simply not be the lever that controls general DPS). Until that's independently confirmed one way or the other, treat `entity.damageMultiplier` as a real but **unproven** lever, and prefer the stat-modifier system for a DPS change you can actually verify landed:

```lua
-- REAL PROPERTY, EFFECT UNCONFIRMED — don't rely on this for a proven DPS change
entity.damageMultiplier = 2.0

-- PROVEN: fire rate is a documented, verified DPS lever
entity:addBaseMultiplier(StatsBonuses.FireRate, factor - 1.0)
```

> [!NOTE]
> **Correction:** This example previously used `entity:addMultiplyableBias(...)` for the "proven" FireRate lever. That's the wrong primitive — `addMultiplyableBias` is a flat bias, not a percentage (see the correction on the shields entry above), so `factor - 1.0` there produces a near-meaningless flat number instead of a real percentage DPS change. `addBaseMultiplier` is the pillar that correctly turns a `factor` (e.g. `2.0` for double damage) into a percentage bonus via the same `factor - 1.0` delta conversion — this is exactly what Cosmic Ascendancy's own `eclipsegenerator.lua:EclipseGenerator.applyDamageMultiplier(entity, factor)` does, and what every current boss-DPS-scaling call site in this workspace already uses correctly.

If you do test `damageMultiplier` directly and confirm what it actually affects, update this entry with the real answer instead of leaving it as a guess.

The same applies to `.isPlayer` on an `Entity` — that property belongs to `Faction`/`Alliance`/`Player`, not `Entity`. For ownership checks on an entity, use `entity.playerOwned` / `entity.allianceOwned` instead.

### Stripping weapons: there's no `removeTurret`

`entity:removeTurret(turret)` doesn't exist. Turrets are physical child `Entity` objects parented to the ship — to disarm a ship, fetch them and delete them at the `Sector` level:

```lua
local turrets = {ship:getTurrets()}
for _, turret in pairs(turrets) do
    Sector():deleteEntity(turret)
end
```

### `getEntitiesByType` and friends return multiple values, not a table

`Sector:getEntitiesByType(type)` is documented in the vanilla API as `function Entity... getEntitiesByType(int type)` — that `Entity...` is Lua's vararg notation. The function returns one `Entity` per match as **separate return values**, not a single Lua table. `Entity:getTurrets()` (what `ship:getTurrets()` calls below) and any other function whose signature ends in `...` follow the same rule.

Assign the call straight to one local and you silently keep only the *first* match, discarding the rest. Worse, if there's exactly one match, that lone value is a bare `Entity` (userdata) — not the empty-or-populated table the rest of your code will assume it got:

```lua
-- WRONG: keeps only the first station (or none), and is a bare Entity — not a table — when exactly one exists
local targetStation = Sector():getEntitiesByType(EntityType.Station)
if #targetStation == 0 then -- crashes here with exactly 1 station:
    -- "attempt to get length of a userdata value"
end

-- CORRECT: brace-wrap the call to collect every returned value into a real table
local targetStation = {Sector():getEntitiesByType(EntityType.Station)}
if #targetStation == 0 then -- always safe: targetStation is always a table
    ...
end
```

This is also why every other `EntityType`-scoped fetch across the codebase is written as `{sector:getEntitiesByType(...)}` (see `dreadnoughtboss.lua`, `siegeevent.lua`, `cw_blockade.lua`) and why `Stripping weapons` above wraps `ship:getTurrets()` in `{}` too — that's not a style preference, it's required to get a table at all. Once wrapped, the result is always a table, even when empty — but an empty table is still truthy in Lua 5.1, so a "no results" check still needs `#result == 0`, not `not result`.

### Loot drops: `dropCargo` takes the good directly

There is no `Sector:dropLoot` function and no `CargoLoot(good, amount)` constructor anywhere in the API — vanilla always calls `dropCargo` with the good passed straight through. The real signature is:

```lua
Sector:dropCargo(position, reservedFor, deniedFor, good, owner, amount)
```

`reservedFor` / `deniedFor` must be `nil` or a `Faction` object — never a raw number:

```lua
-- WRONG: raw integers where nil/Faction is expected, and owner/amount swapped
sector:dropCargo(pos, 0, 0, Good("Ascendant Matter"), n, 0)

-- CORRECT
sector:dropCargo(pos, nil, nil, Good("Ascendant Matter"), 0, n)
```

### Generating turrets and upgrades: pass real sector coordinates, and use the right library

`SectorTurretGenerator()` called with no arguments implicitly targets sector `(0, 0)` — the game's starting region — producing weak Titanium-tier weapons regardless of the `Rarity` you asked for. This mistake is easy to make invisibly, since nothing throws:

```lua
-- WRONG: defaults to (0,0), always Titanium/Naonite tier
local turret = SectorTurretGenerator():generateArmed(0, 0, 0, Rarity(RarityType.Legendary))

-- CORRECT: always pass the actual sector's coordinates
local cx, cy = Sector():getCoordinates()
local turretGen = SectorTurretGenerator(cx, cy)
local turret = turretGen:generateArmed(cx, cy, 0, Rarity(RarityType.Legendary))
```

The same rule applies to `SectorUpgradeGenerator` and anything else that takes coordinates — never hardcode `(0, 0)`.

Two real, separate libraries are relevant here and are easy to conflate:

- **`data/scripts/lib/weapongenerator.lua`** exports `WeaponGenerator`, which builds a raw `Weapon()` object's *stats* (damage, fire rate, appearance...). It's a real, vanilla-shipped library — don't assume `include("weapongenerator")` fails; it doesn't.
- **`data/scripts/lib/turretgenerator.lua`** exports a plain, non-constructible `TurretGenerator` table of helper functions (`.generateSeeded`, `.generateTurret`, ...) — it has no `generateArmed` and can't be called as `TurretGenerator(x, y)`. **`data/scripts/lib/sectorturretgenerator.lua`** is the one that builds the full, physical, lootable turret entity (and internally uses a weapon generator) — it's the constructible one, and it's the one you want for a droppable turret item:

```lua
local SectorTurretGenerator = include("sectorturretgenerator")
local turretGen = SectorTurretGenerator(x, y)
Sector():dropTurret(pos, nil, nil, turretGen:generateArmed(x, y, 0, lootRarity))
```

> [!NOTE]
> **Correction:** An earlier revision of this entry showed `local TurretGenerator = include("turretgenerator"); local turretGen = TurretGenerator(x, y)` as the droppable-turret pattern. That's wrong — `turretgenerator.lua`'s `TurretGenerator` is a plain static table (it ends in a bare `return TurretGenerator`, no `__call` metatable), not constructible, and has no `generateArmed` method at all; a workspace-wide grep for `TurretGenerator(` call-syntax turns up zero vanilla usages. `generateArmed` and the `(x, y)` constructor call syntax only exist on `SectorTurretGenerator`, which this entry already used correctly two paragraphs above — the code sample now matches that instead of the broken one.

For upgrade modules, `include("upgradegenerator")` and call `upgradeGen:generateSystem(rarity)` — not `:generate(x, y, seed, rarity)`, which is a `TurretGenerator`-shaped signature, not an `UpgradeGenerator` one.

### `Faction` objects don't run scripts — only `Player` and `Alliance` do

The base `Faction` object is a plain data structure with no script-attachment methods. A generic `killerFaction` handed to you by a kill callback might be an AI empire, not a player — calling `killerFaction:hasScript(...)` on it crashes the sector thread if it's not actually a `Player` or `Alliance`:

```lua
-- WRONG: crashes if killerFaction is an AI Empire
killerFaction:hasScript("bounty_tracker.lua")

-- CORRECT: check and recast first
if killerFaction.isPlayer or killerFaction.isAlliance then
    local entity = killerFaction.isPlayer and Player(killerFaction.index) or Alliance(killerFaction.index)
    if entity:hasScript("bounty_tracker.lua") then
        -- safe
    end
end
```

### Positional arguments: skipped middle parameters must be explicit `nil`

Lua binds arguments strictly by position. If a function's real signature has optional parameters in the *middle*, you cannot just omit them to reach a later one — every earlier slot has to be filled, even with `nil`:

```lua
-- Real signature: SectorGenerator:createWreckage(faction, plan, breaks, position)

-- WRONG: the Matrix lands in the `plan` slot (expected a BlockPlan) → crash
-- reading plan.numBlocks, because plan is actually a Matrix
generator:createWreckage(faction, matrix)

-- CORRECT: explicit nil placeholders preserve the real argument order
-- (10 is vanilla's own default fracture count)
generator:createWreckage(faction, nil, 10, matrix)
```

### Divide-by-zero blueprint scaling

The physics scaling engine doesn't sanitize `0` when you dynamically scale a blueprint. If `plan.radius == 0` or `turret.slots == 0` and you divide by it (`targetSize / plan.radius`), the result evaluates to `Infinity` and hard-crashes to desktop. Always clamp before dividing:

```lua
local safeRadius = math.max(plan.radius, 0.001)
local safeSlots  = math.max(turret.slots, 1)
```

### Matrix vs `vec3` arithmetic

`Matrix` and `vec3` are distinct types with no `Matrix + vec3` overload — adding a raw `vec3` straight to a `Matrix` object throws `invalid type 'Matrix' expected 'vec3'`. Extract a `vec3` position first; **both `.pos` and `.translation` are genuine `vec3` properties** on `Matrix` (confirmed against `Documentation/Matrix.html`), so either works:

```lua
-- WRONG: adding a vec3 to a Matrix directly crashes the engine
local spawnPos = matrix + vec3(100, 0, 0)

-- CORRECT: extract the vec3 position first (either property works)
local spawnPos = matrix.pos + vec3(100, 0, 0)
local spawnPos = matrix.translation + vec3(100, 0, 0)
```

`Matrix` also has no `.quaternion` property — to set a ship's `orientation`, construct a full `Matrix` (e.g. via `MatrixLookUp(dir, up)`) and assign it directly, not a sub-property of it.

### Custom sector generation templates need `contents(x, y)`

If you register a custom sector template into the generator pool, it **must** export `function contents(x, y)` at minimum (even if it just returns an empty table), or a vanilla background script that expects that shape — like the respawn/defender logic — crashes with `attempt to call field 'contents' (a nil value)` the first time it touches your template.

### Boarding isn't a station-only, invasion-only system

It's easy to assume boarding only exists as the vanilla station-invasion cinematic (troop transports grinding down a *station's* shields before capturing it), since that's the only place most modders see it in action. The API doesn't actually say that. `AIState.Boarding` is a genuine `ShipAI` order state — vanilla's own `entity/orderchain.lua` (`OrderChain.boardingOrderFinished`) handles it exactly like any other order in the fleet-order chain (`Attack`, `RepairTarget`, `FlyThroughWormhole`, ...), finishing when the `ShipAI` leaves that state. And the `Boarding` component itself (`Boarding.lua`) is generic: `boardable` (a settable bool), `applyBoardingSuccessful(attackingFaction)`, `getBoarders()`, `getBoarderPower()`/`getDefenderPower()`, etc. carry no `EntityType` restriction anywhere in their signatures or docs.

Confirmed from the stubs and vanilla source: the component and the order state are not hardcoded to `EntityType.Station`. **Not yet independently verified:** whether the underlying C++ implementation actually resolves a full boarding fight against a `Ship`-type target the same way it does for a `Station` (i.e. whether a Lua script ordering a `Boarding` state against a ship, then calling `applyBoardingSuccessful`, produces a real in-game capture) — that would need an actual in-sector test, not just a stub read. Treat "ship-to-ship capture" as plausible-and-worth-prototyping, not confirmed-working, until someone tests it live.

---

[⬆ Back to top](#-table-of-contents)

## 🖥️ UI Development

### `if onServer() then return end` — every time, at the top of every pure UI script

The `%_t` / `%_T` translation metatable only exists in the client-side Lua environment during startup. A dedicated server still has to parse every script file to build its VFS, and if it hits `%_t` in the **global scope** of a script (e.g. `locNames['combatgroup'] = 'Combat group'%_t`), it panics with a fatal syntax error, because the metatable simply isn't bound yet at that phase. Put `if onServer() then return end` at the very top of pure UI scripts.

`%_t`/`%_T` used **inside a function body** (e.g. inside `broadcastChatMessage`) on the server is completely safe — it's evaluated at runtime, and the engine forwards the localization hook to each connecting client to translate locally.

> [!NOTE]
> **Correction:** The original entry above called this a "fatal syntax error" during VFS parsing. That's wrong, and self-contradictory with the very next paragraph — a real syntax/parse error would fire regardless of scope (Lua compiles an entire chunk before executing any of it, including code inside a never-called function), which would make the documented "safe inside a function body" exception impossible. What's actually happening is a **runtime error**: `%_t`/`%_T` is ordinary Lua's `%` operator dispatching to a metamethod via a global `_t`/`_T` value that the server's Lua state never binds. The crash fires the instant that specific line *executes* — and Lua executes a chunk's top-level (global-scope) statements immediately as the file loads, which is exactly why global scope is dangerous: there's no way to defer or skip that execution. Inside a function, or inside an `if onClient() then ... end` branch, the line simply never runs on the server, so nothing ever dispatches the metamethod.
>
> This reframing also explains a second, previously undocumented safe pattern found in this codebase (`Cosmic Overhaul`'s `sector/managestationincomes.lua`, `Cosmic Starfall`'s `player/ui/alertCore.lua`/`auraCore.lua`/`combatGroup.lua` — all fixed as part of the same pass that found this): wrapping the offending assignment in `if onClient() then ... end`, or moving a whole table literal into a function called once from `initialize()`, is just as valid a fix as the `if onServer() then return end` early-return this section originally prescribed — pick whichever preserves the surrounding code's structure with the smallest diff.
>
> **Second confirmed exception: structured mission files.** `data/scripts/player/missions/bountyhuntmission.lua` and the rest of vanilla's `include("structuredmission")` mission definitions set `mission.data.title`, `.brief`, and `.description` fields using `%_T` at true top-level scope, with no guard of any kind, and this ships on every vanilla dedicated server. The engine evidently makes the localization metatable available specifically for the structured-mission loading pipeline (mission text is server-authoritative content that has to be translatable per-client by design), so this exception is intentional, not an oversight — don't "fix" a mission file that does this.
>
> **Do not confuse the two `onServer()` guards.** `if onServer() then return end` (the correct client-safety guard for this section) makes the *rest of the file* run client-only. `if not onServer() then return end` is the opposite — it forces the rest of the file to run **server-only**, which is exactly the wrong shape here and was the root cause in `managestationincomes.lua` (a legitimately server-only file that had unguarded `%_t` table keys sitting directly below that guard). If a file needs the inverted guard for its own reasons (server-authoritative logic, as in that case), any `%_t`/`%_T` inside it still needs its own `if onClient() then` wrap or function-scope deferral — the inverted guard provides zero protection against this crash.
>
> **Final correction — the real mechanism, found by reading `data/scripts/lib/stringutility.lua` directly.** Every theory above (global-vs-function scope, "content-definition pathway vs. ad-hoc attachment") was inferring the rule from *symptoms* without reading the file that actually implements `%_t`/`%_T`. Having now read it, the real mechanism is much simpler than any of the above, and it's pure Lua — not a C++ engine feature at all:
>
> ```lua
> _T = {}
> function interp(s, arguments)
>     if arguments == _T or arguments == _de then return s end  -- %_T: pass through, translate later client-side
>     if not arguments then return GetLocalizedString(s) end     -- %_t: resolve now (arguments is nil, since _t is never defined)
>     ...
> end
> getmetatable("").__mod = interp
> ```
>
> `%_t`/`%_T` are not special syntax. They're Lua's ordinary `%` (modulo) operator, and `"a string" % _t` only does anything translation-related because `stringutility.lua`'s **last line mutates the shared string metatable** (`getmetatable("")` is the same table for every string in the whole Lua state) to route `__mod` through `interp`. `_T` is a plain table (`{}`, matched by identity to mean "defer translation"); `_t` is **never defined anywhere** — it's simply `nil`, and `arguments == nil` is what routes `%_t` through the immediate `GetLocalizedString(s)` engine call instead.
>
> The consequence: **until `stringutility.lua`'s top level has executed at least once in a given Lua state — via a direct `include("stringutility")` or transitively through anything else that includes it — `%_t`/`%_T` is not installed at all**, function-scoped or not, guarded or not. Using it before that point doesn't hit the translation logic; it hits Lua's real `%` arithmetic operator, which can't coerce a string operand to a number, and throws `attempt to perform arithmetic on a string value`. This is a genuinely different, and more common, failure than the earlier scope-based crash class documented above — and it explains real crashes this codex's earlier theories didn't predict: `Cosmic Chronicles`' `entity/story/eclipseloredialog.lua` crashed with exactly this error from a `%_t` inside `function initialize() if onServer() then ... end end` — properly function-scoped, properly guarded, and it still crashed, because the file only had `include("callable")` and never reached `stringutility` at all.
>
> This also fully explains the "content-definition pathway" pattern the previous note could only observe, not explain: `structuredmission.lua`, `entity/merchants/consumer.lua` (the base every vanilla consumer/merchant script like `casino.lua` builds on), and `lib/utility.lua` (included by nearly everything) all `include("stringutility")` at their own top level. Anything that reaches one of those transitively gets the metamethod installed as a side effect — nothing to do with "registry pathways," just an ordinary include chain. A workspace-wide audit (per-file, plus a real transitive closure over every `include()` in both the vanilla tree and each mod) found **30 files across 6 mods** with no reachable path to `stringutility` despite using `%_t`/`%_T` — all fixed by adding `include("stringutility")` directly, the only fix that's correct regardless of load order.
>
> **The simple, complete, always-correct rule going forward:** any file that uses `%_t` or `%_T` should `include("stringutility")` itself, directly, near its other includes — regardless of scope, regardless of whether some other file in the load chain probably already includes it. Relying on transitive/incidental load order is exactly the bug class this section exists to prevent. The scope-based crash class from the original entry above is still real and still worth guarding against (`if onClient()`/function-scope deferral for content that's genuinely global at true top level) — but it's a *second*, independent precondition, not a substitute for this one.
>
> **Correction — the "all fixed" file list above was incomplete.** A later full-workspace sweep of `Cosmic Starfall` (the same mod the original three fixes came from) found the identical unguarded-`%_t`-at-module-scope bug still live in `entity/mainCaliber.lua` (reached server-side via `entity/init.lua`'s mod-wide `addScriptOnce`) and `lib/tooltipmaker.lua` (reached server-side via unconditional top-level `include("tooltipmaker")` in four separate "systems" item scripts: `overpoweredCore.lua`, `repairDrones.lua`, `pulseTractorBeamGenerator.lua`, `macrofieldProjector.lua`) — both fixed with the same `if onClient() then` wrap. The lesson: "we already swept this bug class in this mod" is not proof a specific file is clean — a prior pass's fix list documents what it found, not an exhaustive guarantee, and this exact bug pattern is easy to miss because each instance requires tracing that file's actual attach/include path to confirm server-side reachability, not just grepping for `%_t`.
>
> ⚠️ **Unverified — does "called unconditionally from module scope" actually defer past the dangerous window, or only genuine later-execution (e.g. from `initialize()`) does?** `Cosmic Starfall`'s `lib/Stations.lua` wraps its `%_t` calls in a `local function _buildStationText() ... end` and then calls that function immediately, unconditionally, on the very next line — still at module load time, just one stack frame deeper than an inline assignment. This differs from the `if onClient()`-wrap and from-`initialize()` patterns confirmed safe above, and from the correction's own emphasis that the danger is about *when* a line executes relative to the server's "initial script evaluation phase," not really about lexical function-scope alone. Whether merely being inside a function call — as opposed to genuinely being deferred to a later engine phase — is sufficient could not be confirmed by static analysis or by this mod's own shipped behavior (no crash reports on file, but absence of a report isn't proof either). If you need this exact shape (a value needed on both sides that also uses `%_t`), verify on a real dedicated server before trusting it, or prefer the confirmed-safe `initialize()`-deferral pattern instead.

### `NamedFormat` always needs its table argument, even an empty one

`NamedFormat(string, MapType)` (see the stub) takes two required arguments: the `%_T`-deferred format string, and a table of named substitution values for any `${...}` placeholders in it. Every vanilla call site passes that table — `NamedFormat("Shipyard"%_t, {})` in `sectorspecifics.lua`, `NamedFormat("${faction} Headquarters"%_T, {faction = faction.baseName})` in `reinforcementstransmitter.lua`/`equipmentmerchantcaller.lua` — including the plain-string cases with no placeholders to fill, which still pass `{}` rather than omitting the argument.

Calling it with only the string (`NamedFormat("Trade Rumor..."%_T)`) fails with `Error constructing NamedFormat: not enough arguments, expected a value of type 'table' at stack position 3`, logged server-side every time that line runs. This is a **soft failure, not a hard Lua error** — confirmed by a live case where the rest of the calling function kept running normally afterward (a payment, a sector lookup, and a follow-up chat message with correctly-computed values all completed on the same call), so don't assume everything after the bad `NamedFormat(...)` call was skipped just because an error was logged. What's actually lost is narrower: whatever value the construction was supposed to produce — here, `view.note` — never gets its intended content, since the call that would have built it failed. Always pass a table, `{}` at minimum, even when the string has no `${...}` placeholders.

### UI elements must be instantiated at load, not on demand

`PlayerWindow():createTab()` has to run inside the specific UI script's `initialize()` — you cannot create it later in response to an async event or a data callback; that either fails to render or conflicts with other mods' menus. Inject the script via `player:addScriptOnce("player/ui/myscript.lua")` from a central injector (typically `player/init.lua`), and let the engine natively fire `initialize()` client-side. You can toggle *visibility* later — the physical UI elements just have to exist from the start.

### `ScriptUI()` needs `initUI()`, not `initialize()`

`ScriptUI():registerInteraction()`, `:createWindow()`, `:registerWindow()` — anything that sets up an entity's player-facing interaction — belongs in a dedicated `initUI()` function, a separate engine-invoked lifecycle callback the engine calls automatically alongside `initialize()`, never inside `initialize()` itself. `ScriptUI` isn't bound yet during `initialize()`; calling it there crashes with `attempt to call global 'ScriptUI' (a nil value)`.

```lua
-- WRONG: crashes the instant this entity initializes, server-side
function MyShip.initialize(factionIndex)
    if onServer() then
        MyShip.factionIndex = factionIndex
        ScriptUI():registerInteraction("Pay the Toll"%_t, "payToll")
    end
end

-- CORRECT: ScriptUI setup moves to its own lifecycle callback
function MyShip.initialize(factionIndex)
    if onServer() then
        MyShip.factionIndex = factionIndex
    end
end

function MyShip.initUI()
    ScriptUI():registerInteraction("Pay the Toll"%_t, "payToll")
end
```

Every vanilla entity script that registers an interaction does it this way — `civilship.lua`, `crewtransport.lua`, `bulletinboard.lua`, `beacon.lua`, `cargostash.lua`, and dozens more, with zero exceptions found. `Cosmic Vault`'s own `cosmicvaultstation.lua` (`CosmicVaultStation.injectInteraction()`) confirms the mechanism directly in its own comment: *"Avorion automatically scans all scripts on an entity for 'interactionPossible' and 'initUI' methods."* — it works by capturing and wrapping the calling script's own `initUI` global rather than calling `ScriptUI()` itself, deferring the real call to when the engine actually invokes it.

> [!WARNING]
> **Confirmed real case.** `Cosmic War`'s v4.0.0 pass shipped this exact mistake in two new files, `cw_checkpoint_picket.lua` and `cw_defector_ship.lua` — both copy-pasted the same wrong shape into `initialize()`. Caught by the `cw_checkpoint_picket.lua` crash showing up in a live server log during playtesting; a same-pattern grep across the whole mod (and the rest of the Cosmic suite) then found the second instance in `cw_defector_ship.lua` before it ever shipped. Both fixed by moving the `ScriptUI():registerInteraction()` call into a new `initUI()` function.

### `ScriptUI:showDialog()` after a server round trip can silently show nothing

`ScriptUI:showDialog(dialog, closeable)` is documented as displaying a dialog "provided that the player is currently in interaction state with the entity" — a real precondition, not just a description of the common case. That state is reliably still active when a dialog is shown synchronously, in the same tick as the player's own interaction click (vanilla's `resistanceoutpost.lua` does exactly this: `onWhoAreYou(entityId)` calls `ScriptUI(entityId):showDialog(makeIntroDialog())` directly). It is **not** reliably still active once the click has round-tripped through the server first — `onClient()` guard → `invokeServerFunction` → server computes something → `invokeClientFunction` back to a client-side `showXDialog()` handler → *then* `ScriptUI():showDialog(...)`. By the time that reply lands, the player's interaction session with the entity may have already ended, and `showDialog()` then does nothing at all — no error, no log line, just silence. The one client-side symptom that does fire is the native interaction-menu click sound, since that's queued by the click itself, before the round trip even starts — so the bug reads as "I clicked it, heard the UI sound, and nothing else happened."

`ScriptUI:interactShowDialog(dialog, closeable)` is the round-trip-safe sibling: documented as "forces the player to interact" rather than requiring the interaction state to already hold. Vanilla's own `antismuggle.lua` confirms the convention directly — every one of its five dialogs shown after a client→server→client round trip (`onScrambleSuccessful`, `onBribeSuccessful`, `onBribeFailed`, `makeBribingDialog`, `startTalk`) calls `interactShowDialog()`, and none of them call plain `showDialog()`.

```lua
-- WRONG: shows nothing if the interaction-state window has already closed by the
-- time this reply lands, with no error and no way to tell from the caller's side
function TradingPost.showWarbondDialog(showBuy)
    if showBuy then
        ScriptUI():showDialog(TradingPost.makeBuyDialog())
    end
end

-- CORRECT: forces the interaction state instead of assuming it's still open
function TradingPost.showWarbondDialog(showBuy)
    if showBuy then
        ScriptUI():interactShowDialog(TradingPost.makeBuyDialog())
    end
end
```

> [!WARNING]
> **Confirmed real case.** `Cosmic War`'s Trading Post added four "instant transaction" interactions (Purchase Warbonds, Cash Out Warbonds Early, Broker Sanctions Relief, Send Diplomatic Aid Package), all following the server-round-trip shape above, all calling plain `showDialog()`. Reported specifically against two of the four (a UI click sound, then nothing) — but all four shared the identical defect; the other two were simply not separately reported, most likely because how long the interaction-state window survives a round trip isn't fixed. Fixed by switching all four to `interactShowDialog()`.
>
> **The sibling sweep for this one needed to look past the reported file.** A follow-up review, done specifically to check the fix before shipping, found the identical defect in the same mod's `militaryoutpost.lua` — two more interactions ("Enlist as Mercenary," "Request Emergency Repairs") built on the exact same round-trip shape, also calling plain `showDialog()`, never reported at all. The original fix's own sibling check only confirmed no *other mod* shared the fixed file's exact path — it never grepped the rest of the same mod for the same call shape in a *different* file. When a defect's signature is "an API call in a particular shape," the sweep has to search by shape across the whole codebase, not by filename across sibling mods.

**The rule of thumb:** if a dialog is the direct, synchronous result of the player's own click, `showDialog()` is fine. If anything — a server computation, a deferred callback, an async round trip of any kind — sits between the click and the dialog being shown, use `interactShowDialog()` instead.

### `Player():getValue()` / `setValue()` are server-only — never call them from the client

These are server-side, `Faction`-inherited API methods. Calling `Player()` from a UI script's `initialize()` on the client returns an invalid C++ userdata handle, and any method call on it crashes with `obj->valid() check failed`. The correct architecture to sync server-held config or state down to a UI is a three-layer pattern:

1. **Server stores values** via `Server():setValue("mymod_key", value)` — persists across reloads.
2. **Client requests on load** via `invokeServerFunction("requestSync", keys)`; the server reads `Server():getValue()` and replies via `invokeClientFunction(player, "receiveSync", dataTable)`.
3. **Client caches the payload** in a module-local Lua table. All subsequent reads go through this cache, falling back to schema defaults while the async round-trip is in flight.

> [!WARNING]
> **Confirmed real case, a genuine crash rather than a silent no-op.** `Cosmic War`'s `militaryoutpost.lua` registered "Enlist as Mercenary" as a `ScriptUI():registerInteraction()` interaction — which, like every other interaction entry point in this mod, executes client-side unless the handler itself starts a round trip. Its handler called `player:getValue("cw_mercenary_faction")` directly, with no `onClient()`/`onServer()` guard anywhere in the function, to decide which of two dialogs to show a player who'd already enlisted somewhere. Any player in that state crashed the instant they clicked the interaction a second time, at any Military Outpost. Fixed by moving the whole check into the existing server-side round trip that already handled this interaction's other branch (a War Heat check), so the client-side handler now does nothing but kick off `invokeServerFunction` — matching every other interaction entry point in the same file.

```lua
-- library.lua — client-side cache pattern
local clientCache = {}

function MyLib.setClientCache(data)
    if type(data) == "table" then clientCache = data end
end

function binding.get(key)
    if onServer() then
        local sv = Server()
        if sv then return sv:getValue("mymod_" .. key) end
    end
    if onClient() then
        return clientCache[key] -- fall back to a schema default if nil
    end
end
```

```lua
-- myui.lua — sync receiver
function MyUI.receiveSync(data)
    self.serverData = self.serverData or {}
    for k, v in pairs(data or {}) do
        if type(k) == "string" then self.serverData[k] = v end
    end
    MyLib.setClientCache(self.serverData)
    self.refreshUI()
end
```

Because each Lua VM is fully isolated, that `clientCache` table only exists inside the VM that included the library — a UI script has to call `setClientCache()` itself after every sync; it can't magically share state with another VM that also happens to include the same library.

> [!NOTE]
> `Server():getValue()`/`setValue()` **are** safe to call from server-side player scripts (`data/scripts/player/*.lua` executing on the server). The danger is specifically `Player():getValue()` called from a client-only context.

### A serialized-string custom value needs its own server-side cache, or every read re-parses it

Custom values (`Server():setValue()`/`getValue()`, and the entity/faction/player equivalents) only ever store primitives — there's no native table type. Any mod that needs to persist a *collection* (a list of active sieges, a set of contested zones, a per-pair scoreboard) ends up hand-rolling a delimiter-based serializer (`table.concat`/`string.split` over `;`/`,`/`|`) and storing the result as one string value. That's the correct, necessary workaround for the primitives-only constraint — the trap is on the *read* side, not the write side: a getter that deserializes the whole string fresh on every single call has no caching layer at all, so its cost scales with however often something calls the getter, not with how often the underlying data actually changes.

Confirmed in Cosmic Vault's `cosmicvaultterritory.lua`: `CosmicVaultTerritory.getContestedZones()` runs a full `string.split` + per-entry parse over its serialized zone list on every call, with no module-local cache and no dirty-tracking — and Cosmic War's `cw_battlefieldhud.lua` calls it once per player on every single `onSectorEntered`, plus once more on client `initialize()`. On a server with several concurrent contested zones and players jumping frequently, that's a full re-parse triggered by routine sector travel, not by the data changing.

> [!NOTE]
> **Correction:** An earlier revision recommended a module-local table as the general server-side cache for any serialized custom value. That is only safe when one VM is the sole writer, or when the cache is read-only and allowed to be stale. Avorion's separate script VMs each receive their own copy of a library's locals. If two entity/player/sector scripts both cache, modify, and rewrite the same `Server()` record, the later writer can serialize its stale copy and erase the first writer's newer fields. This was reproduced with two already-loaded library instances writing different entries to one JSON-backed queue and market-event record. Both records lost the first write until the mutators were changed to read the authoritative custom value immediately before every write.

```lua
-- WRONG: every script VM has a different copy of this table
local cache = decode(Server():getValue("shared_registry") or "{}")
function addEntry(id, entry)
    cache[id] = entry
    Server():setValue("shared_registry", encode(cache)) -- can erase another VM's write
end
```

```lua
-- CORRECT: re-read at the mutation boundary, or route all writes through one owner script
function addEntry(id, entry)
    local current = decode(Server():getValue("shared_registry") or "{}")
    current[id] = entry
    Server():setValue("shared_registry", encode(current))
end
```

> **Rule:** cache decoded custom values only inside a VM that is the record's sole writer. For a record mutated by several script VMs, route writes through one owner script or re-read the durable value at every mutation boundary. Read-only caches are fine when bounded staleness is acceptable. The persisted string exists for save/reload and cross-VM authority; a file-local table is never a shared lock or shared memory.

### A `double`-typed engine property serialized into a delimited string breaks an integer-only parse pattern

Building the same hand-rolled serializer the entry above describes, a value pulled straight from a `double`-typed engine property (`Server().unpausedRuntime`, any `getRelations()`/War-Heat-style float) and passed through `tostring()` does **not** reliably render as a clean, `%d+`-parseable integer — Lua's default number-to-string conversion picks whichever form is shortest/most natural for the actual value, and that form depends on magnitude, not on what the value conceptually represents:

- **Near zero:** renders in scientific notation (`1.2e-005`). A parse pattern anchored on `%d+` for that field stops at the `e`, silently mis-reading the value rather than failing loudly.
- **Anywhere else (the far more common case for something like `unpausedRuntime`, which only ever grows):** renders with a decimal point (`48291.734`). A parse pattern using `%d+` for that field doesn't match the `.` at all, so the entire anchored pattern fails and the whole read returns nothing — not just that one field.

Both are the same root mistake — assuming `tostring()` of a `double` produces something an integer-only regex can consume — surfacing as two different failure shapes depending on the value's magnitude. Confirmed twice independently in this codebase: `cosmicwarbridge.lua`'s War Heat snapshot (`publishWarHeatSnapshot`/`getWarHeatSnapshot`) hit the scientific-notation case for a heat value near zero, silently misreading it as maximum heat; `cosmicwarbridge.lua`'s Occupation marker (`getOccupationData`, storing `oldFactionIndex,newFactionIndex,endTime` with `endTime` derived from `unpausedRuntime + 21600`) hit the decimal-point case, and because the parse pattern anchored the whole three-field match with `^...$`, one bad field silently broke the read of the other two as well — the entire mechanic gated on this function was inert from the moment it shipped, with no error anywhere.

> **Rule:** before storing a `double`-typed value inside a delimited string meant for later regex parsing, either (a) `math.floor()`/`math.ceil()` it first if sub-integer precision was never meaningful for that field (a 6-hour expiry timestamp doesn't need sub-second precision), or (b) format it explicitly with `string.format("%.Nf", value)` and write a parse pattern that actually accounts for the decimal point (`%-?%d+%.?%d*`), the same fix already applied to the War Heat snapshot. Don't rely on plain `tostring()` producing a shape your parser happens to expect — check the property's documented type in the API stubs (`-- double` vs `-- int`) before assuming either.

### Visual effects (`createExplosion`, `createGlow`) are client-only

`Sector():createExplosion(...)` and `Sector():createGlow(...)` throw a fatal exception if called from a server-side event script — which also aborts any subsequent logic in that same call (loot drops, entity deletion, etc. never run). Route visual effects to the client with `broadcastInvokeClientFunction(...)`, adding a global wrapper function for the RPC hook if the script isn't namespaced.

### Escape and hotkeys

The engine natively intercepts `Escape` to force-close every active UI frame, with priority over any Lua callback — so if you let players bind "Clear Keybind" to `Escape`, the whole menu just vanishes the instant they press it instead. Reserve `KeyboardKey.Delete`/`Backspace` for "clear" actions, and block `Escape` from being assignable as a custom keybind at all.

> ⚠️ **Unverified:** a commonly repeated claim in Avorion modding notes is that `onKeyPress` fires even while the player is typing in chat or a coordinate field, and that a function called `checkInputFocus()` exists to guard against it. **No such function appears anywhere in `Avorion Stubs/` or the vanilla script source** — it could not be confirmed. If your hotkey handler is firing while the player is typing, don't assume `checkInputFocus()` is the fix; test what vanilla actually does in that situation before shipping a workaround built on an unconfirmed API.

### `onPostRenderHud`/`onPreRenderHud` are event callbacks — defining the function isn't enough

`initialize()`, `updateClient()`, `updateServer()` and a handful of others are lifecycle hooks the engine calls on every script automatically, just because the function exists on the namespace (or global scope). `onPostRenderHud`/`onPreRenderHud` are not in that set — they're **event callbacks**, the same family as `onSectorChanged`/`onShowWindow`, and they only fire once you've explicitly told the engine to route them:

```lua
function MyTab.initialize()
    Player():registerCallback("onPostRenderHud", "onPostRenderHud")
    -- ... build the tab ...
end

function MyTab.onPostRenderHud(state)
    -- runs every client frame, after the HUD renders -- but only now that it's registered
end
```

Confirmed against vanilla's own `structuredmission.lua`, which registers all six of its per-frame UI hooks the same way inside its client `initialize()` block (`onSectorChanged`, `onConfirmSectorArrival`, `onStartDialog`, `onPostRenderIndicators`, `onPostRenderHud`, `onPreRenderHud`), and matches how every existing Cosmic mod hotkey (Cosmic Vault's Cosmic Codex, Cosmic Overhaul's Bulletin Board and Resource Display) already does it.

**The failure mode is silent, not a crash.** A tab built without this line compiles clean, the linter has nothing to flag, and the tab itself works perfectly when opened normally — the hotkey handler is just dead code the engine never calls. Caught only by actually pressing the bound key in-game and noticing nothing happens; nothing in the file itself looks wrong.

### Scrollbars

- UI elements sized at or beyond their container's own width (roughly `-1px` of it) won't render at all.
- Labels resize themselves whenever their font or text changes — re-set their width *after* changing either.
- Scrollsteps across Avorion's own UI are consistently `35px` (or multiples: `70px`, `105px`...). Match that on your own elements, and set the `scrollstep` on the scrollbar itself too.

### Client time vs. app time

`ClientTime()` is not a real global function — calling it inside a per-frame hook like `onPreRenderHud` crashes the client every single frame. The real function for measuring client-side, unpaused up-time is `appTime()` (confirmed in the stub).

### There's no direct getter for a plotted jump route

There is no `getJumpDestination()` anywhere on `Player`, `ShipAI`, or `HyperspaceEngine`. To read where the player has currently selected on the Galaxy Map, query the map directly: `GalaxyMap():getSelectedCoordinates()`.

### A shared helper that already relays server→client can't be called from your own client-side relay too

`CosmicVaultUI.ShowCinematicBanner(player, text, color, soundPath, duration, theme)` is a **server-side entry point** — its own first line is `if not onServer() then return false end` — that already does its own complete relay internally (`player:invokeFunction()` into that player's own `cosmicvaultcinematic.lua` instance, which itself does `if onServer() then invokeClientFunction(...) end` to reach the actual client-side renderer). It is meant to be called directly from server-side code, with no extra plumbing.

`Cosmic Ascendancy`'s `ca_boss_audio_hook.lua` had a wrapper shaped like the three-layer client-cache pattern earlier in this section, but for a helper that didn't need one: a server-side `triggerCinematicBanner()` correctly guarded with `if onClient() then return end`, which called `invokeClientFunction(Player(), "showCinematicBanner", ...)` to relay to the client — and *then*, client-side, `showCinematicBanner()` called `CosmicVaultUI.ShowCinematicBanner(...)`. Since that call now executed on the client, `ShowCinematicBanner`'s own `if not onServer() then return false end` guard fired immediately and did nothing. The banner never rendered, for every single caller of that function across the mod — several major story/threat beats ("THE ECLIPSE AWAKENS", "DOOMSDAY EVENT" warnings) had silently never displayed anything.

> **Rule:** before wrapping a shared library call in your own server→client relay, check whether the library function's *own* first line already guards on `onServer()`/`onClient()` and does the relay itself. If it does, call it directly from server-side code — layering a second relay on top doesn't compound the effect, it just means the inner call executes on the wrong side of the boundary and no-ops. This is the mirror image of the three-layer client-cache pattern documented earlier in this section: that pattern is correct when *you* own both ends of the sync; it's wrong to reimplement when the library you're calling already owns both ends itself.

---

[⬆ Back to top](#-table-of-contents)

## 🌐 Multiplayer, Networking & Determinism

### `math.random()` is unsafe — use `random()`

Many scripts execute on **both** client and server. `math.random()` isn't seeded identically between them, so the two sides can disagree on the outcome — a classic source of UI/logic desync. Always use Avorion's deterministic `random()` object, or a seeded `Random(Seed(seedString))` when you need reproducibility.

Relatedly, `random():getInt()` called with **no bounds** is easy to reach for as a lazy "give me some big number" — but don't rely on it for a percentage multiplier or anything bounds-sensitive without checking what range you actually get: use `random():getFloat()` for a safe fractional multiplier, or always bound your integers explicitly: `random():getInt(1, 100)`.

> [!NOTE]
> **Correction:** An earlier revision of this entry claimed the no-bounds form "returns the platform's maximum integer, not a sane default." That's contradicted by vanilla's own usage: `data/scripts/lib/asyncshipgenerator.lua` (and the near-identical `asyncxsotangenerator.lua`/`asyncpirategenerator.lua`) call bare `random():getInt()` inside a collision-retry loop to mint unique generator IDs — `while generators[instance.generatorId] do instance.generatorId = random():getInt() end` — which only makes sense if it returns a *varying* pseudo-random integer each call, not a fixed max-int constant. Neither the stub nor the raw HTML docs document any no-argument behavior for `getInt()` at all. The practical advice (always bound your integers explicitly) still stands — just not for the reason originally given.

The global `random()` helper itself isn't automatically injected into every script's scope — if a script calls it and throws `attempt to call global 'random' (a nil value)`, add `include("randomext")` at the top; that's the library that provides it.

### Never send raw C++ userdata over the network

Sending a raw `Entity`/`Player`/`Sector` object inside a table passed to `invokeClientFunction`/`broadcastInvokeClientFunction` crashes the dedicated server with a fatal `SIGSEGV` the instant the engine tries to serialize it. Extract and send the UUID string instead, and re-resolve it on the receiving end:

```lua
-- WRONG: crashes on serialization
broadcastInvokeClientFunction("SyncToClient", { source = Entity() })

-- CORRECT: send the id string, resolve back into an entity on the client
broadcastInvokeClientFunction("SyncToClient", { source = Entity().id.string })
-- ...on the client: local entity = Entity(syncData.source)
```

The same rule applies to any ID you pull back out of persisted state: a `Uuid` you saved to the database comes back as a plain Lua **string** after a sector reload, not the original C++ `Uuid` object. Passing that raw string into an API that strictly expects a `Uuid` userdata (like `inflictDamage`'s inflictor argument) can hang the thread. Reconstruct it first: `if type(src) == "string" then src = Uuid(src) end`.

### Network spam: don't broadcast on every tick

A frequent RPC fired every frame inside `updateServer` is expensive and risks flooding the connection regardless of what you name it. Never fire one unthrottled — gate it behind a timer (a few seconds) or fire it strictly on-demand, and skip it entirely if no UI actually depends on that data.

> [!NOTE]
> **Correction:** An earlier revision of this entry named `UIsyncPosition` as if it were an engine primitive with its own built-in anti-flood security, quoting a specific log message ("Security: Ignored packet because queue is too full"). Neither holds up: `UIsyncPosition` is not part of the Avorion API at all — it only exists as a custom, mod-defined RPC function name inside the third-party `Starfall` reference mod (`Mods For Reference (Workshop)/Starfall/data/scripts/systems/overpoweredCore.lua`/`repairDrones.lua`), not vanilla or the engine. The quoted log string doesn't appear anywhere in vanilla source, patch notes, or localization files either. The only genuinely corroborated engine-level flood protection found anywhere in this workspace is *chat* flood protection (per `patchnotes0.14.3.txt`/`0.14.4.txt`), which is unrelated to RPC/UI-sync traffic. The underlying advice — don't fire any RPC unthrottled every tick — is sound engineering practice regardless of engine-level enforcement, so it's kept; the specific function name and log message have been removed.

The same principle applies to any completion broadcast inside a repeating loop: only send it at the exact moment the state actually transitions, not on every tick the state happens to still be active.

```lua
-- WRONG: fires every single tick the ability is active
if working > 0 then
    working = math.max(0, working - timePassed)
    broadcastInvokeClientFunction("onFinishWork", 0, 0)
end

-- CORRECT: fires exactly once, at the moment it actually finishes
if working > 0 then
    working = math.max(0, working - timePassed)
    if working == 0 then
        broadcastInvokeClientFunction("onFinishWork", 0, 0)
    end
end
```

### Time sync between client and server

`Server().unpausedRuntime` and `Client().unpausedRuntime` are **not** the same clock — a client's `unpausedRuntime` starts fresh at `0` the moment they join, while the server's has been running far longer. Sending a raw server timestamp to the client and subtracting the client's own runtime from it produces nonsense. Translate it into a *relative* delta on receipt, then re-anchor to the client's own timeline:

```lua
-- on the client, right when the payload arrives:
local remaining = serverEndTime - serverCurrentTime
local clientLocalEndTime = Client().unpausedRuntime + remaining
-- from then on, in the UI loop:
local display = clientLocalEndTime - Client().unpausedRuntime
```

If multiple clients can join a synchronized event at different times (a shared progress bar, a siege countdown), send **both** an absolute `startTime` and `endTime`, so every client can compute the same `totalTime = endTime - startTime` regardless of when they connected — rather than each client guessing the total from however much time happens to be left when they arrive.

Separately, `Server().unpausedRuntime` freezes completely whenever the server (or a solo save) is offline — so it's the *wrong* clock for any feature that needs to catch up players on time that passed while they were away (background mining, offline trade). Use `os.time()` (the real system clock) for that instead, with a one-time migration guard so players don't get an enormous, incorrect catch-up payout the first time you switch a feature over from `unpausedRuntime`.

And for any timer that should only advance while the game is actually being played, use `Server().unpausedRuntime` rather than a raw wall-clock-inclusive counter — comparing against the wrong clock lets a timer expire while the server was simply switched off.

> [!NOTE]
> **Correction:** An earlier revision of this entry named the wall-clock-inclusive counterpart as `Server().playtime`. No such property exists — the full `Server` stub has no `playtime` field at all. `playtime` is real, but it's a `Player`-only property (`Avorion Stubs/Player.lua`), unrelated to this comparison. `Server` does expose a `runtime` property alongside `unpausedRuntime` as the more plausible real counterpart, but neither the stub nor the raw HTML docs document the paused/unpaused distinction for it — verify in-game before relying on it, rather than trusting either name at face value.

### Global state can't hold nested tables

`Server():setValue(key, value)` / `Player():setValue(key, value)` cannot serialize a nested Lua table. Encode it yourself (`json.encode`, or a manual delimited string) before saving, and decode it on read.

### A `callable()`-registered debug RPC is reachable by ANY player — a client-side `if _debug then` gate protects nothing server-side

`callable(nil, "MyFunction")` (or `callable(Namespace, "MyFunction")`) registers `MyFunction` as a real RPC target the moment the script loads, regardless of any flag inside the function itself. If the *only* thing gating a dangerous server-side action is a client-side wrapper checking a debug flag —

```lua
-- Client-side wrapper, gated behind a compile-time-false flag:
function MyDebugAction()
    if _debug then invokeServerFunction('ServerDebugAction') end
end

-- Server-side handler, registered unconditionally:
function ServerDebugAction()
    Entity(tgtId).durability = Entity(tgtId).durability - 100000  -- no owner check!
end
callable(nil, "ServerDebugAction")
```

— that gate is cosmetic. Any connected player can call `invokeServerFunction('ServerDebugAction')` directly, bypassing the wrapper (and its `_debug` check) entirely, whether or not `_debug` is `true` anywhere in that client's own copy of the script. Confirmed real cases in `Cosmic Starfall`: a `DamageTarget()` function duplicated in two different "systems" item scripts (explicitly commented `--for debug`, dealing up to -100000 durability / -400000 shield to whatever the caller's target ship had selected, for free, no cooldown) and a `ServerDebugPurge()` in a Megacomplex station script (wiping all cargo of a given good from the station and everything docked to it) — all three had zero ownership check and were reachable by any player, not just the ship/station's own owner.

**Rule:** any `callable()`-registered function that performs a destructive or resource-affecting action (damage, cargo/resource removal, stat changes, anything beyond read-only debug logging) needs its own server-side ownership check, unconditionally, regardless of whether the client-side caller that's "supposed" to reach it is itself gated. The standard pattern already used correctly elsewhere in this codebase:

```lua
function ServerDebugAction()
    if callingPlayer then
        local player = Player(callingPlayer)
        local owner = Owner(Entity())
        if not player or not owner or (owner.factionIndex ~= player.index and owner.factionIndex ~= player.allianceIndex) then return end
    end
    -- ... the actual action, now safely gated ...
end
```

If a debug function is genuinely meant to never ship live, don't rely on a flag to neutralize it — either don't register it with `callable()` at all, or delete it before release.

---

[⬆ Back to top](#-table-of-contents)

## 🏛️ Factions, Alliances & Diplomacy

### Reading and paying resources

`Faction.money` is a direct readable property, but raw materials are **not** — `owner.iron` is `nil`, and comparing it to a number throws. Use the dedicated accessor and payment methods:

```lua
local iron, titanium, naonite, trinium, xanion, ogonite, avorion = owner:getResources()
owner:pay(money, iron, titanium, naonite, trinium, xanion, ogonite, avorion)
```

`Faction:receive(description, money, resources)` is a real, three-argument method — `description` (an optional string or `Format` object) genuinely comes first, followed by the money amount, followed by an optional resources table. Calling it with just a description and an amount (`owner:receive("Description", amount)`) is a perfectly valid, supported call with the trailing resources table simply omitted — this is **not** an invalid overload. For a silent transfer with no player notification popup, use `receiveWithoutNotify(description, money, resources)` instead — its description argument isn't optional.

### Never send a localized translation payload to an AI faction

`%_T` builds a deferred `NamedFormat` translation object meant to be delivered to a connected **player client** for local-language rendering. An AI faction has no network client — if the engine tries to deliver a `%_T` payload to one, it dereferences a null pointer and crashes with `EXCEPTION_ACCESS_VIOLATION`.

```lua
-- CRASHES: AI factions have no client to translate this for
a:pay("Diplomatic Sanctions"%_T, loss)

-- CORRECT: raw string, no notification plumbing needed
a:payWithoutNotify("Diplomatic Sanctions", loss)
```

> **Golden rule:** never pass `%_t`/`%_T` into any call that might target a non-player faction — `pay()`, `sendChatMessage()`, or anything else that could try to deliver a localized payload to an entity with no client. Use the `*WithoutNotify` variant for AI-faction economic transactions.

### Recast raw indices before touching properties

C++ methods that expect a `Faction`/`Alliance` userdata will crash if handed a raw integer index and then have a property read off it (`.isPlayer`, `.isAlliance`). Some functions do accept raw indices directly (`changeRelations()`), but property access always needs the real object — recast with `Faction(index)` (or the paired-lookup helper `getInteractingFactions(a, b)`, a real vanilla function distinct from the interaction-resolving `getInteractingFaction(callingPlayer, ...privileges)` used for station UIs) before reading properties off the result.

A faction that's been entirely eradicated returns `nil` from `Faction(index)` — always null-check both sides before calling relation APIs on them:

```lua
local f1, f2 = Faction(factionIndex1), Faction(factionIndex2)
if f1 and f2 then
    local relations = Galaxy():getFactionRelations(f1, f2)
end
```

`server:getValue("factions")` returns every faction index that has **ever** existed — including eradicated ones, preserved so IDs never reshuffle. Filter them out before iterating:

```lua
local FactionEradicationUtility = include("factioneradicationutility")
for _, index in pairs(factionIndices) do
    if not FactionEradicationUtility.isFactionEradicated(index) then
        -- safe to work with Faction(index) here
    end
end
```

### Relation values: `[-100000, 100000]` is the conventional range — clamp before writing anyway

`[-100000, 100000]` is the range Avorion's own systems treat relations as living in: the diplomacy UI's relation bar is built with `relationBar:setRange(-100000, 100000)`, several vanilla factions set `initialRelations`/`initialRelationsToPlayer` to exactly one of those two extremes, and pricing/reputation math throughout the game `lerp()`s across that same span. Adding a raw delta to a faction already at one boundary (e.g. `-100000 + -50000`) overflows that range — clamp every write regardless of whether the engine itself would reject an out-of-range value:

```lua
local current = f1:getRelations(factionIndex2) or 0
local newRelation = math.max(-100000, math.min(100000, current + delta))
Galaxy():setFactionRelations(f1, f2, newRelation)
```

If you're changing relations from more than one place in your mod, centralize this into one helper so the clamp can never be forgotten.

> [!NOTE]
> **Correction:** An earlier revision of this entry stated the range as a "hard-capped" engine enforcement and warned that skipping the clamp "risks destabilizing the backend." Neither claim could be confirmed — `data/scripts/lib/relations.lua` never clamps a relation value anywhere; every `-100000`/`100000` in it is a war-status *threshold comparison*, not a bound on the stored value, and `Galaxy():setFactionRelations`'s own doc comment (stub and raw HTML docs alike) documents no range at all. `[-100000, 100000]` is real, confirmed, conventional practice across vanilla's UI and pricing code — just not a proven engine-side clamp. Keep clamping defensively (it costs nothing and matches how the rest of the game treats the value), but don't assert it as an enforced hard limit.

### A stub's `[read-only]` tag can be a client-only artifact — verify against vanilla before trusting it

`Avorion Stubs/Faction.lua` marks `homeSectorUnknown` `[read-only] bool`. Taken at face value, `faction.homeSectorUnknown = true` looks like it should throw. It doesn't, and dozens of vanilla server-side scripts write to it directly (`data/scripts/lib/story/xsotan.lua`, `spawnbigai.lua`, `spawnlaserboss.lua`, `cultists.lua`, and many more).

The reason: the raw HTML docs the stub was converted from actually publish **two separate property tables for the same class** — `Faction [Server].html` (writable, no `[read-only]` tag) and `Faction [Client].html` (`[read-only]`, since a client only ever *observes* another faction's home-sector-known state, never sets it). The stub-conversion process flattened both into one `Faction.lua` file and kept the more restrictive of the two annotations, silently losing the server/client distinction in the process. Any property that exists on both a `[Server]` and `[Client]` variant of the same class in the raw HTML docs is a candidate for this — the stub's single merged annotation is only guaranteed accurate for whichever variant it happened to pick up.

**Before treating a stub's `[read-only]` tag as proof a write will crash**, especially on a property you're about to work around: grep the raw HTML docs (`search_html_api`) for both a `[Server]` and `[Client]` page for that class, and check whether they actually agree. If they don't, vanilla source is the tiebreaker — a real, unguarded `faction.propertyName = value` in a confirmed server-side vanilla script is definitive proof the write is legal there, regardless of what the merged stub says.

### Alliances are a separate faction layer from players

`galaxy:playerFactionExists(factionIndex)` does **not** cover Player Alliances — they're a distinct faction layer. A background system that only checks `playerFactionExists` when deciding what's safe to target will treat Alliance territory as unclaimed NPC space. Check both in parallel: `galaxy:playerFactionExists(factionIndex)` **and** `galaxy:allianceFactionExists(factionIndex)`.

### Alliance-owned stations: resolve the actual payer, not the station's owner

When a player interacts with an Alliance-owned station, the client-side inventory selection UI shows *the player's personal inventory* by default. If your server-side handler naively resolves the payer as `Faction(Entity().factionIndex)` (the station's owner), it deducts from the **Alliance's** funds/inventory regardless of what the player actually selected client-side — a desync that can look like theft from either direction. Resolve the real interacting party instead:

```lua
-- WRONG: assumes the station's owner is always who's paying
local owner = Faction(Entity().factionIndex)
local item = owner:getInventory():find(index)

-- CORRECT: resolves the actual player/alliance funding the transaction
local buyer, ship, player = getInteractingFaction(callingPlayer, AlliancePrivilege.SpendResources)
local item = buyer:getInventory():find(index)
```

### Only `Player` and `Alliance` support script attachment

The base `Faction` object can't run scripts. See "Entities, Components & Combat" above for the recast pattern.

### Per-actor state can land on either the Player or their Alliance — a later reader must check both

When a script attaches or updates state on "whichever faction actually performed the action" (a kill, a purchase, any attributable event), the real holder is decided by the *acting entity's* `factionIndex` at that moment, via the same `isPlayer`/`isAlliance` recast covered above — not by some identity you can assume ahead of time:

```lua
-- Attach/update side: the killing ship's owner decides the holder, not "the player who's online"
local actorFaction = Faction(entity.factionIndex)
local holder
if actorFaction.isPlayer then
    holder = Player(actorFaction.index)
elseif actorFaction.isAlliance then
    holder = Alliance(actorFaction.index)
else
    return -- an AI faction can't hold a script
end
holder:addScriptOnce("tracker.lua", ...)
```

Any later code that reads that same state back (a status command, a UI tab, a second system consuming it) has to check the *same two possible holders* — a player whose Alliance-mate's ship landed the kill has the state sitting on the **Alliance**, not on themselves:

```lua
-- WRONG: only checks the calling player, silently misses Alliance-attributed state
if player:hasScript("tracker.lua") then ... end

-- CORRECT: check both possible holders
local holders = { player }
if player.allianceIndex and player.allianceIndex > 0 then
    local alliance = Alliance(player.allianceIndex)
    if alliance then table.insert(holders, alliance) end
end
for _, holder in pairs(holders) do
    if holder:hasScript("tracker.lua") then
        -- found it
    end
end
```

> **Rule:** whenever "the actor" can resolve to either a `Player` or an `Alliance`, every downstream reader of that actor's per-actor state must check both possible holders — never assume the player who ran the command is always the one holding it.

Confirmed in Cosmic War's War Bounty License system: `cw_bountypayouts.lua` attaches the tracker to whichever of `Player`/`Alliance` actually landed the killing blow, and both `commands/cosmicwarbounties.lua` and `player/ui/galacticpolitics_tab.lua`'s `getMyLicense()` independently implement the same "check the player, then check their alliance" read-back — the pattern that keeps a shared War Bounty License visible to every member of an Alliance, not just whichever member happens to be looking it up.

### Renaming and the Galaxy Map ship list are locked out of Lua

`Alliance`/`Faction.name` is strictly read-only — there's no `setName()` exposed to Lua, and short of hand-editing `alliances.dat` while the server is offline, in-game renaming isn't reachable from a mod. The Galaxy Map's ship-list panel is likewise fully hardcoded in C++: the `GalaxyMap` Lua API can draw overlays, custom pins, and territory colors, but has zero hooks into that specific panel.

### `entity.factionIndex = 0` isn't a safe "don't care" value — it means unowned, and unowned means unenterable/undockable

`0` looks like an inert placeholder, so it's tempting to strip a scripted ship's faction to `0` after spawn once you no longer need it for anything gameplay-relevant — e.g. to sidestep a faction-relations side effect somewhere else in the mod. It isn't inert: `0` is vanilla's explicit **"no owner"** sentinel, checked by name in vanilla scripts (`entity/antismuggle.lua`'s `if ship.factionIndex == 0 then goto continue end`, `entity/claim.lua`'s `if self.factionIndex ~= 0 then return false end` gating whether an *asteroid* is even eligible to be claimed) and, more importantly, by several **native, non-Lua** ownership checks that gate basic player interaction with a craft:

- The enter-craft action refuses outright with the client-side string `"This craft has no owner."` — confirmed verbatim in the vanilla localization template (`data/localization/template.pot`), sourced there from `PlayerFlownShipMessageHandler.cpp` (an earlier revision of this entry cited `IShipOwner.cpp`; that's a real engine source file, but its own localized strings are about ship-count limits, not this message) — there is no faction to resolve as "you may pilot this."
- Docking-permission resolution needs a real owning faction to grant or deny permission against; with no faction to check relations to, nobody can be granted access.

Both failures look like generic, unrelated "the ship is broken" symptoms from a player's perspective (docking silently refused, "no owner" on enter) with no obvious link back to a `factionIndex = 0` line three files away — this is a silent-failure trap in the same family covered in "Start Here — Core Concepts" above, just surfacing through a native system instead of a Lua one.

```lua
-- WRONG: "I don't need this ship's faction for anything else, so zero it out"
diplomat.factionIndex = 0
-- ...ship is now permanently undockable and unenterable by anyone

-- CORRECT: leave real ownership in place; solve the actual side effect at its source
-- (e.g. remove the specific script/RPC that was worsening relations, not the ownership itself)
diplomat:removeScript("data/scripts/entity/civilship.lua")
```

> **Rule:** never assign `factionIndex = 0` to a ship a player is meant to interact with (dock, board, or take control of) — reserve it for enemies/hazards nobody should ever own or pilot (vanilla does exactly this for Xsotan bosses in `xsotantransformed.lua` and the Behemoth in `spawnbehemoth.lua`), or for objects using vanilla's own claim-to-acquire flow (`claim.lua`). If a scripted ship is misbehaving through some *other* system (relations, threaten/worsen-relations RPCs, competing interaction menus), fix that system directly instead of reaching for a faction-ownership workaround — removing a specific offending script is strictly more targeted than stripping the ship's ownership entirely, and doesn't collateral-damage every unrelated ownership-gated system on the entity.

---

[⬆ Back to top](#-table-of-contents)

## 🌌 Sectors, Galaxy & Missions

### Global database bloat: don't flag thousands of coordinates in `Server():setValue`

Flagging a permanent global key per generated coordinate (`Server():setValue("stronghold_" .. x .. "_" .. y, true)`) scales terribly — over a long playthrough this pumps tens of thousands of permanent keys into the central save file, degrading save times. Push the flag to the *sector's own* local data instead, injected via `runSectorCode` (remember: the sector must already be loaded for this to succeed):

```lua
runSectorCode(x, y, true, "function run() Sector():setValue('is_stronghold', true) end", "run")
```

### Progressive materialization: don't physically build things a player can't see

Physically spawning stations, asteroids, or ships in a background/unloaded sector stalls the main thread badly — Avorion's sector generation is effectively single-threaded per sector. Instead, write only a lightweight state change to the global database (`Server():setValue("sector_owner_x_y", factionIndex)`) and leave the sector itself empty. When a player actually jumps in, spawn the real content from an `onSectorEntered` hook, hiding the generation cost inside their existing hyperspace loading screen.

### One-time events need an explicit lock, not just a flag check

Major one-off galactic events (a boss's death triggering a follow-up invasion, for instance) need a hardened guard against firing again on a boss respawn or repeated trigger:

```lua
local unleashed = server:getValue("event_unleashed")
if not unleashed then
    if player:getValue("boss_destroyed") then
        server:setValue("event_unleashed", true)
        -- trigger the event here
    end
end
```

> [!NOTE]
> **Correction / expansion:** this pattern correctly stops the event from firing *twice*, but it has a sharper failure mode this entry didn't originally warn about: `event_unleashed` gets set to `true` in the same breath as "trigger the event here" — if that trigger step itself fails, throws, or is buggy in some *other* way (a typo, a missing include, an unrelated crash three lines into "the event"), the lock is already permanently on, and no future patch to the trigger logic can ever reach it again for that save. This is a real, repeated bug — see "🔄 Self-Healing Systems" below, which covers the general fix (verify the event actually happened, don't just trust the lock) and two real case studies of this exact shape.

### Mission completion conditions must check aliveness, not just script-value presence

Checking `#targets == 0` against `Sector():getEntitiesByScriptValue("target")` breaks if the target is *boarded/converted* rather than destroyed — the entity survives, keeps its script value, and the count never reaches zero, soft-locking the mission. Validate faction ownership and durability explicitly:

```lua
-- WRONG: boarded stations bypass this check entirely
if _t.type == EntityType.Station then table.insert(targets, _t) end

-- CORRECT: confirm it's still alive and still hostile
if valid(_t) and _t.type == EntityType.Station and _t.factionIndex == enemyIndex and _t.durability > 0 then
    table.insert(targets, _t)
end
```

### A `mission.<verb>` field is not a framework hook unless `structuredmission.lua` actually reads that name

It's natural to reach for `mission.abandon = function() ... end` to hang custom logic (a relations penalty, a warning chat message) off a mission being abandoned — the name reads correctly, and `mission` is the shared table every phase/hook lives on. But `structuredmission.lua`'s own dispatcher only ever calls `mission.currentPhase.onAbandon` and `mission.globalPhase.onAbandon` (from its global `onAbandon()`, itself called by the `abandon()` RPC target). A field named `mission.abandon` — without the phase table and the `on`-prefixed name — is not on that dispatch path at all. Lua doesn't error on setting or "overriding" a plain, previously-`nil` table field; it just silently creates one nobody ever reads.

```lua
-- WRONG: reads as "the abandon handler for this mission," but the framework
-- never looks at mission.abandon anywhere — this code never runs.
local original = mission.abandon
mission.abandon = function()
    CosmicVaultFaction.changeRelations(player.index, giverIndex, -20000)
    if original then original() end
end

-- CORRECT: matches the actual dispatch path onAbandon() reads.
-- globalPhase is right for logic that should fire regardless of which
-- phase is active; use mission.currentPhase.onAbandon instead if the
-- handler is genuinely phase-specific.
local original = mission.globalPhase.onAbandon
mission.globalPhase.onAbandon = function()
    CosmicVaultFaction.changeRelations(player.index, giverIndex, -20000)
    if original then original() end
end
```

The same check applies to every lifecycle hook this guide's mission framework exposes (`onFail`, `onFinish`, `onAccomplish`, `onReward`, `onPunish`, `onRestore`, `onSync` — all read from `mission.currentPhase.*` / `mission.globalPhase.*`, never from a bare `mission.<verb>`). Before wiring an override onto anything on the `mission` table that isn't `mission.data.*`, `mission.phases[N]`, `mission.globalPhase.*`, `mission.makeBulletin`, or `mission.getRewardedItems`, grep `structuredmission.lua` itself for the exact field name you're about to assign — a plausible-sounding name is not verification.

> [!WARNING]
> **Confirmed real case, and it shipped for a long time before anyone noticed.** Every War Contract mission file in Cosmic War used the `mission.abandon = function() ... end` pattern above to apply a relations penalty and a warning chat message when a player abandoned the contract — dozens of files, all copied from the same template, going back well before the v4.0.0 pass. None of it ever ran: the penalty never applied and the message never sent, for the entire life of the feature, because every file wired the override onto a field the framework never reads. It survived multiple prior line-by-line reviews because each file *looks* internally consistent — the "capture the original, then wrap it" chain (`local original = mission.abandon`, `if original then original() end`) is exactly the shape a real override takes, so nothing about the code in isolation looks wrong. The bug only surfaces by checking the framework's own dispatch code, not by re-reading the override site harder.

### A mission's `getBulletin()` reward struct silently wins over `initialize()`'s own inline formula

A War-Contract-style mission (the `structuredmission.lua` pattern this guide's own missions use) commonly computes its reward in **two places**: `getBulletin(station)` builds a `rewardStruct` to display and hand off to the mission board, and `initialize(factionIndex)` computes its own `baseReward` inline as a fallback. The wiring that connects them is easy to miss: vanilla's `bulletinboard.lua` accepts a mission via `player:addScript(bulletin.script, unpack(bulletin.arguments or {}))`, and a mission's own `arguments = { { giver = ..., reward = rewardStruct } }` means that single table becomes `initialize()`'s first parameter. Every mission in this pattern opens with:

```lua
local fIndex = factionIndex
local precomputedReward = nil
if type(factionIndex) == "table" then
    fIndex = factionIndex.giver or factionIndex[1]
    precomputedReward = factionIndex.reward
end
-- ...
mission.data.reward = precomputedReward or { credits = baseReward * ..., ... }
```

On the standard mission-board accept path, `factionIndex` **is always a table**, so `precomputedReward` is always truthy — meaning `getBulletin()`'s formula is what actually pays out, and `initialize()`'s own inline `baseReward` calculation is dead code that only runs if the mission is ever spawned directly with a bare faction index (a path that, for a board-only mission, may not exist anywhere in the codebase at all).

> [!WARNING]
> **This makes a rebalance patch easy to ship half-fixed.** If a formula is corrected in `initialize()` but the duplicate copy in `getBulletin()` is missed — an easy mistake, since the two are typically dozens of lines apart and look like restatements of each other — the fix will never reach a player who accepts the mission the normal way. A confirmed real-world instance: three War Contract missions in Cosmic War had a v4.0.0 changelog entry describing their reward formula as "realigned," with the corrected formula and an explanatory comment sitting in `initialize()` — but `getBulletin()`'s separate copy of the same formula was never touched, so every actual play-through kept paying the old, lower amount. **Whenever you change a reward/value formula in a mission file, grep the whole file for every occurrence of the changed constants before considering the fix complete — then confirm which occurrence the engine's own dispatch path (here, `getBulletin()`) actually feeds into `precomputedReward`, since that's the one that's live.**

### Give players a real HUD marker for in-sector coordinates

The engine doesn't expose raw X/Y/Z sector coordinates on the player HUD — a mission that just says "fly to (0,0,0)" is unnavigable without a visual aid. Use `SectorGenerator:createBeacon()` (or an empty waypoint entity) so the player actually has something to fly toward:

```lua
local beacon = generator:createBeacon(Matrix(), nil, "Mission Objective"%_T)
```

### Clean up your own dynamically-attached sector/event scripts

`Sector():addScriptOnce("event.lua")` re-fires `initialize()` **every time the sector reloads** — if your event script isn't removed after it resolves, a player can leave and re-enter the sector to farm a "one-time" event indefinitely. There are two distinct cleanup shapes here, and conflating them is an easy trap:

**Removing a *different* script** — a controller/dialog script cleaning up an event script it doesn't own, or an event script clearing out something unrelated it spawned (an environmental hazard, a weather controller) — `removeScript()` is the right and only tool, since you're not currently executing inside the script you're removing:

```lua
-- Called from OUTSIDE myevent.lua, e.g. a dialog or trigger script
Sector():removeScript("events/myevent.lua")
Sector():deleteEntity(entity)
```

**An event script terminating *itself*, from inside its own function** — call `terminate()` **only**. Per the engine's own doc comment on `terminate()`: *"The script will be removed from the entity on the next occasion."* `terminate()` already guarantees the calling script's removal — pairing it with a self-targeted `removeScript()` call is redundant dead code:

```lua
-- WRONG: redundant self-removal — terminate() already does this
function MyEvent.spawn()
    if invalidCondition then
        Sector():removeScript("events/myevent.lua")
        terminate()
        return
    end
end

-- CORRECT: terminate() alone is sufficient
function MyEvent.spawn()
    if invalidCondition then
        terminate()
        return
    end
end
```

> [!WARNING]
> This isn't just style cleanup — dropping the `terminate()` half of that pair is a live bug, not a dead one. A self-targeted `removeScript()` is deferred (see above) and is **not** a proven substitute for `terminate()`'s documented self-removal guarantee. If a script's only cleanup call on an exit path is a self-`removeScript()` — no `terminate()` anywhere in the file — and that script has a fast `getUpdateInterval()` (a detonation, a DOT tick, any periodic hazard), it can keep re-entering the same "finished" branch on every subsequent update instead of stopping. One real case: a 0.2-second AoE detonation script kept re-firing its blast indefinitely because its only cleanup call was a bare self-`removeScript()`. **Always call `terminate()` on every exit path of a script that is ending itself; treat a self-targeted `removeScript()` as unnecessary at best, and unreliable as your only cleanup at worst.**

The inverse leak is just as common: a generator script attached via `Sector():addScriptOnce` that hits an early `return` (a failure check, a random-chance roll) without calling `terminate()` stays permanently attached — silently ticking (or just sitting idle) as a memory leak across every sector a player visits. Guarantee `terminate()` fires on every path out, including early returns:

```lua
function initialize(...)
    if MyGenerator.initialize then
        MyGenerator.initialize(...)
    end
    -- fires no matter how the inner initialize() returned
    terminate()
end
```

### `onSectorGenerated` only fires on `Sector()` — not `Server()`/`Galaxy()`

Registering this callback anywhere other than the local `Sector()` context fails silently. To hook sector generation from a global perspective without touching vanilla generator files, move the logic to a `Player()` script on `onSectorEntered` instead — check whether the sector is unflagged on the player's first entry, validate against `SectorSpecifics`, and spawn what you need right before they finish loading in.

### `include("goods")` for dynamic goods

`data/scripts/lib/goods.lua` is what defines and populates the global `goods` table and `tableToGood()` — and it already `include("goodsindex")`s itself at its own top, so a plain `include("goods")` on its own is enough to safely index `goods["Some Good"]` or call `tableToGood()`. Interacting with either without *any* reachable include crashes with `attempt to index global 'goods' (a nil value)`. You don't need to hard-edit vanilla `goods.lua` to add new trade goods — dynamically injecting into `goodsArray`/`spawnableGoods` during a Galaxy script's `initialize()` works and stays compatible with other mods that do the same.

> [!NOTE]
> **Correction:** An earlier revision of this entry said both `include("goods")` and `include("goodsindex")` were required together. They aren't — `goods.lua` already includes `goodsindex` itself. Confirmed against every vanilla call site that references goods indexing (`smugglerretaliation.lua`, `turretbuilding.lua`, `mapcommands.lua`, `refineores.lua`, `factorymap.lua`, `factorypredictor.lua`, `supplycommand.lua`, `maproutes.lua`) — none of them includes both; each uses exactly one.

### Miscellaneous sector/mission notes

- `Sector():removeScript("sector/script.lua")` is fully supported for background hazards or environmental scripts (not just `Entity():removeScript`) — vanilla itself uses this pattern: `startsector.lua` and `neutralzone.lua` both call `Sector():removeScript("factionwar/initfactionwar.lua")`, and `investigatemissingfreighters.lua` calls `sector:removeScript("data/scripts/sector/background/warzonecheck.lua")`. (An earlier revision of this entry cited `initfactionwar.lua`/`warzonecheck.lua` themselves as the examples — those are the scripts being *removed*, not the ones calling `removeScript`.)
- `play3DSound(name, SoundType.Other, position, maxDistance, volume)` is available inside sector update loops for positional audio, distinct from UI sound calls.
- Global balancing functions are defined with underscore-style names (`Balancing_GetSectorRewardFactor(x, y)`, in `data/scripts/lib/galaxy.lua`) — but `galaxy.lua`'s own returned `Galaxy` table aliases them to matching dot-notation fields too, and vanilla's own dominant idiom is `local Balancing = include("galaxy")` followed by `Balancing.GetSectorRewardFactor(x, y)` (confirmed live in `clearpiratesector.lua`, `coverretreat.lua`, `clearxsotansector.lua`, `exploresector.lua`, `investigatemissingfreighters.lua`, `transfervessel.lua`, `hideevidence.lua`, `settlertreck.lua`, and more). Both forms work — match whichever convention the surrounding file already uses.
- To extend a closed vanilla background script (DLC content included) without overwriting the file outright, create a script at the *identical* mod-relative path and monkey-patch it: save the original function, redefine it to run your logic, then call the saved original so vanilla behavior is preserved.
- `getBulletin(station)`'s description text is evaluated the instant the player opens the Bulletin Board — before a mission that generates its target coordinates in `initialize()` (i.e. *after* acceptance) has any real data. Keep `getBulletin()` text generic; reserve dynamic interpolation for `mission.data.description`, which evaluates after `initialize()` has real values to work with.
- `ShipGenerator.createDefender(faction, matrix)` needs a real `Faction` object, not a raw index — recast first: `ShipGenerator.createDefender(Faction(enemyIndex), position)`.
- SFX volume above `1.0` spams the console (`Volume of sound effect is not between 0 and 1`) — hard-cap script-driven audio at `1.0`.
- Shipyard production timers live on the physical station entity via `Shipyard.secure()`/`Shipyard.restore()`, and vanilla itself already keeps a queued build progressing correctly across a sector unload/reload without any custom background-script plumbing: `shipyard.lua` registers `Sector():registerCallback("onRestoredFromDisk", "onRestoredFromDisk")`, and `Shipyard.onRestoredFromDisk(timeSinceLastSimulation)` simply calls `Shipyard.update(timeSinceLastSimulation)` — catching the job up in one lump call using the real elapsed time the moment the sector reloads. `respawndefenders.lua` uses the identical `secure()`/`restore()` + `onRestoredFromDisk` pattern, confirming it's vanilla's standard idiom for this exact problem.

> [!NOTE]
> **Correction (two entries above):** An earlier revision of the balancing-functions note claimed only the underscore form works and that `Balancing.GetSectorRewardFactor(x, y)` does not. That's wrong — `galaxy.lua` ends in `return Galaxy`, and the returned table's `GetSectorRewardFactor` field aliases the underscore function directly; dot-notation calls against a `local Balancing = include("galaxy")` alias are vanilla's own dominant usage pattern, confirmed live across eight-plus vanilla mission files.
>
> **Correction (shipyard entry above):** An earlier revision of this entry prescribed moving the build timer to a background `Player` script to keep it progressing while the sector is unloaded. That's not how vanilla actually solves this, and isn't necessary — `shipyard.lua`'s own `onRestoredFromDisk` catch-up (described above) already keeps the timer correct using only `secure()`/`restore()` plus a callback the entity itself registers, with no background script involved. `Shipyard.secure()`/`.restore()` are real (confirmed in `data/scripts/entity/merchants/shipyard.lua`); the recommended workaround was not.

---

[⬆ Back to top](#-table-of-contents)

## 🔄 Self-Healing Systems — Idempotent Triggers & Reconciliation

Every Avorion save is a long-running, ever-changing world: it survives server restarts, mods getting installed mid-playthrough, patches shipping over months, and players joining and leaving. Any system that says "run this important setup exactly once, and remember that with a flag" is making a bet that the setup step never fails and that everything it depends on already exists the moment it runs. Break either assumption once — a bug in the trigger, a mod added to an existing save, a crash mid-execution — and you get something worse than a crash: a **permanently, silently broken feature** that no future patch can ever reach again, because the flag that was supposed to mean "handled" got set before "handled" was actually true.

This section is about recognizing that shape of bug and designing triggers that repair themselves instead.

### The trap: a flag set before the action it guards is confirmed to have happened

The anti-pattern is everywhere in mission/event code because it reads so naturally:

```lua
-- WRONG: the flag is trusted as truth, but nothing ever confirms the action worked
if condition and not server:getValue("thing_done") then
    server:setValue("thing_done", true)
    doTheImportantThing()   -- if this throws, is buggy, or silently no-ops,
                             -- thing_done is STILL true forever
end
```

If `doTheImportantThing()` is ever broken — today, or in some version you shipped six months ago and have since fixed — every save that hit the broken window is stuck. Not crashing, not erroring in the log, just quietly never doing the thing again. Worse: **every later patch that fixes `doTheImportantThing()` is invisible to that save**, because the `if not server:getValue("thing_done")` guard skips the whole block before the fixed code ever runs. From the outside this looks exactly like "the fix didn't work," when the fix is actually fine — it's just unreachable.

The self-healing fix inverts what the guard trusts. Instead of asking "did I already flip this flag?", ask **"is the world actually in the state I want it to be?"** — and check that for real, every time you get the chance:

```lua
-- CORRECT: the flag is a hint, not the source of truth. Real state is what's checked.
local function thingIsActuallyDone()
    -- check something that can ONLY be true if doTheImportantThing() really ran and
    -- really succeeded -- a downstream flag, an attached script, an object that exists
    return server:getValue("thing_confirmed_downstream_effect") ~= nil
end

if condition and not thingIsActuallyDone() then
    server:setValue("thing_done", true) -- fine to keep as a hint/optimization
    doTheImportantThing()
end
```

Two ingredients make this work, and you need both:

1. **A recurring check, not a one-shot hook.** The verification above has to run on some kind of loop — a `updateServer(timeStep)` tick, a periodic poll, "check this every time a player enters a sector" — not just once at the moment a trigger condition first becomes true. A one-shot hook can only ever succeed or fail once; a recurring check gets infinitely many chances to notice something is wrong and fix it.
2. **Idempotent repair actions.** The "repair" step has to be safe to run redundantly, because a self-healing check will sometimes call it when the world already looks correct. Favor engine calls that are naturally idempotent — `galaxy:findFaction(name)` before `createFaction()`, `addScriptOnce()` instead of `addScript()` — and design your own repair functions the same way: check-then-act, never blind-act.

> **Rule:** if a one-shot flag gates something narratively or mechanically central — a main-quest beat, a core faction's existence, a background system the rest of your mod depends on — don't trust the flag alone. Verify against real, independently-checkable state, and prefer re-running naturally idempotent setup calls on every poll over trusting a single historical transition.

### Case study: a mail that stopped arriving, across several "fixes"

Cosmic Ascendancy's end-game hands off from killing the Wormhole Guardian to a new story NPC, Aegis, who contacts the player via in-game Mail. The trigger lived in `data/scripts/galaxy/eclipse_awakes.lua`:

```lua
-- THE ORIGINAL SHAPE OF THE BUG
if (player:getValue("wormhole_guardian_destroyed") or guardianConfirmedDead)
    and not player:getValue("ca_envoy_spawned") then
    player:setValue("ca_envoy_spawned", true)   -- set BEFORE anything below is confirmed to work
    player:sendChatMessage(...)
    player:addScriptOnce("data/scripts/player/ca_spawn_envoy.lua") -- this eventually sends the mail
end
```

`ca_envoy_spawned` is read and written in exactly this one place in the whole mod. The moment it's `true` on a player, this block will never run for them again — not on relog, not on warping away and back, not ever, regardless of whether the mail actually arrived. And the mod's own changelog shows this exact trigger going through multiple broken states across several versions (a polling-only check that once regressed back into the live file, a later missing-flag fallback for players who warped out right as the kill landed). Each of those was a real fix — but any player who got the flag stuck `true` during an earlier broken pass was permanently invisible to every fix that shipped afterward. A player reported the missing mail; waiting for updates and re-warping to trigger it again could never have worked, because the code path that would deliver it was gated shut for them specifically.

The self-healing fix replaces the single flag with a check for real evidence of progress — later mission flags, or the mission/envoy scripts actually attached to the player:

```lua
-- THE FIX: verify real progress instead of trusting one flag
local function playerHasAegisProgress(player)
    if player:getValue("ca_campaign_completed") then return true end -- finished the whole arc

    if player:getValue("ca_ready_for_debrief_intro")
        or player:getValue("ca_ready_for_debrief_1")
        or player:getValue("ca_ready_for_debrief_2")
        or player:getValue("ca_ready_for_debrief_3")
        or player:getValue("ca_ready_for_debrief_4")
        or player:getValue("ca_ready_for_debrief_5") then
        return true
    end

    local scripts = player:getScripts()
    for _, path in pairs(scripts) do
        if type(path) == "string" and (
            string.find(path, "ca_spawn_envoy.lua")
            or string.find(path, "ca_story0_meet_aegis.lua")
            or string.find(path, "ca_story1_awakening.lua")
            -- ...remaining story mission paths
        ) then
            return true
        end
    end

    return false
end

-- in the trigger:
if (player:getValue("wormhole_guardian_destroyed") or guardianConfirmedDead)
    and not playerHasAegisProgress(player) then
    -- ...same trigger as before...
end
```

Note the first check, `ca_campaign_completed` — a player who finished the *entire* five-mission arc has none of the in-progress debrief flags left set and no story scripts still attached (they all clear on completion), so without an explicit "fully done" marker checked first, a self-healing pass would misread "finished" as "never started" and re-send the whole intro forever. **A self-healing check needs a real "fully done" terminal state, not just "still in progress" markers** — this is the sharpest edge case in the whole pattern and the easiest one to miss.

### Case study: the same bug, but it took the entire end-game down with it

The higher-stakes version of the same bug was ten minutes later in the same file. Once the Eclipse is "fully awake," the mod is supposed to generate the Eclipse faction and register the two galaxy managers that run the actual end-game crisis:

```lua
-- THE ORIGINAL SHAPE OF THE BUG
server:setValue("eclipse_fully_awake", true)
local EclipseGenerator = include("eclipsegenerator")
EclipseGenerator.getFaction()
Galaxy():addScriptOnce("data/scripts/galaxy/eclipse_conquest_manager.lua")
Galaxy():addScriptOnce("data/scripts/galaxy/ca_world_eater_manager.lua")
```

If `eclipse_fully_awake` ever ended up `true` on a save without those three calls fully succeeding — a crash mid-block, an older buggy version of this exact file — the entire late-game (Eclipse territory conquest, the World-Eater boss) would be permanently absent, with the faction possibly not even existing. No error, no crash log entry pointing at it — just an end-game crisis mod whose crisis never happens.

The fix leans on the fact that both `EclipseGenerator.getFaction()` (it calls `galaxy:findFaction(name)` before creating one) and `Galaxy():addScriptOnce()` are already naturally idempotent — so instead of gating them behind the one-time flag *transition*, they were moved into the block that already runs on every tick once `eclipse_fully_awake` is true:

```lua
-- THE FIX: re-verify every tick instead of trusting the moment the flag first flipped
if server:getValue("eclipse_fully_awake") then
    local EclipseGenerator = include("eclipsegenerator")
    EclipseGenerator.getFaction()                                              -- looks up before creating
    Galaxy():addScriptOnce("data/scripts/galaxy/eclipse_conquest_manager.lua") -- refuses to double-attach
    Galaxy():addScriptOnce("data/scripts/galaxy/ca_world_eater_manager.lua")
end
```

No custom "did this actually work" check was even needed here — once the repair calls are already idempotent, self-healing is just a matter of *where* you call them from: every recurring tick, instead of once at a transition edge.

### Case study: a random rendezvous roll that could target the player's own sector

A third bug hid in the same Aegis/Eclipse chain, in a different failure shape entirely — not a stale flag, but a random fallback that could silently pick a target that can never be "arrived at."

Every one of Cosmic Ascendancy's five story missions (`ca_story1_awakening.lua` through `ca_story5_worldeater.lua`) sends the player to a random nearby sector via `MissionUT.getEmptySector(x, y, 5, 30, insideBarrier)`, with a manual fallback if that search fails:

```lua
-- THE ORIGINAL SHAPE OF THE BUG
if not targetX or not targetY then
    local random = Random()
    targetX = x + random:getInt(-30, 30)
    targetY = y + random:getInt(-30, 30)
end
```

`random:getInt(-30, 30)` can return `0` for both axes, which makes `targetX, targetY` equal to the player's *current* sector `x, y`. That looks harmless — worst case, the "rendezvous" is right where the player already is. It isn't harmless: `structuredmission.lua`'s `onSectorEntered` phase hook is wired to the player's engine-level `onSectorEntered` callback, which only fires on an actual sector-crossing transition. It is never invoked just because a phase began while the player already happens to be standing in the target sector. A same-sector roll means the phase's completion condition (`if x == mission.data.custom.targetX and y == mission.data.custom.targetY then ... end`) can never observe a matching transition — the player can't "arrive" at a sector they never left. The phase, and every phase after it, stalls forever with no error, no crash, and no log entry to point at why. This is a different failure shape from every other case study in this section (no flag was set early, nothing was gated behind a one-shot check) but the observable symptom is identical: "the questline just stopped."

```lua
-- THE FIX: reroll until the offset is guaranteed non-zero on at least one axis
local offsetX, offsetY
repeat
    offsetX = random:getInt(-30, 30)
    offsetY = random:getInt(-30, 30)
until offsetX ~= 0 or offsetY ~= 0
return x + offsetX, y + offsetY
```

> **Rule:** any random "go to sector X" target that's allowed to fall back to an offset from the player's *own current position* must exclude the zero offset explicitly. If completion is gated on a sector-*change* callback (`onSectorEntered`, `onSectorChanged`, or equivalent) rather than a sector-*state* poll, a target equal to the starting position is unreachable by definition, not just narratively awkward.

### Case study: an unchecked spawn return value ahead of the flag that gates retry

The same five story missions' boss-spawn phases share another bug shape: each one creates its ambush/boss ship(s) via `EclipseGenerator.createShip()`/`createStation()` and only *afterward* sets a `mission.data.custom.bossSpawned = true` flag that the phase's own `updateServer()` checks before doing anything else (`if not bossSpawned then return end`). None of the spawn calls checked their return value first:

```lua
-- THE ORIGINAL SHAPE OF THE BUG
local boss = EclipseGenerator.createWorldEater(position)
boss.title = "Eclipse World-Eater"          -- indexes boss unconditionally
boss:setValue("ca_eclipse_worldeater", true)
-- ...
mission.data.custom.bossSpawned = true      -- only reached if every line above didn't throw
```

Neither `Sector():createShip()`/`createStation()` nor this mod's own `EclipseGenerator.createShip()`/`createStation()` wrapper is documented as failure-proof — and this codebase already has a confirmed precedent of it returning `nil` under real conditions (see the `ca_ascendant_envoy.lua`/`ca_story0_meet_aegis.lua` Aegis-ship-spawn case in the changelog, triggered by `Galaxy():getNearestFaction()` returning `nil` for an unclaimed core sector). If a spawn call anywhere in this chain returns `nil`, the very next line indexing it (`boss.title = ...`) throws — and since the `bossSpawned = true` assignment sits *after* every spawn/tag line, the throw means it never runs. The phase's `updateServer()` guard then blocks that phase, and everything after it, permanently — with nothing in the log pointing at a spawn failure, because the error surfaces as an anonymous Lua exception inside `onBeginServer()`, not as a labeled "spawn failed" event.

> **Rule:** when a spawn call's success gates a flag that a recurring `updateServer()` depends on to proceed, guard the call (`if ship then ... end`) even when the spawn "always works in practice" — the cost of the guard is one `if`, and the cost of skipping it is a silent, permanent, unrecoverable stall exactly like a bad one-shot flag, just triggered by a crash instead of a bad boolean.

### Case study: a mod installed onto an existing save (Cosmic War)

> ⚠️ **Recalled from memory, not re-verified against current Cosmic War source** — the exact file/function has since changed enough that it couldn't be pinned down again while writing this entry. Included because the *shape* of the bug and fix is a genuinely useful second data point; treat the specifics as the author's own recollection, not a confirmed code citation like the two Ascendancy case studies above.

The same shape shows up outside mission triggers entirely. Cosmic War's faction diplomacy system (traits, War Heat) is meant to apply to every AI faction in the galaxy — but a player installing the mod mid-playthrough, onto a save with AI factions the vanilla engine had already generated (see "Lazy generation" above — factions are born on demand, not all at once), found that pre-existing factions never got proper traits or War Heat and simply never went to war like the mod intended. A setup pass that only ran once, for factions that existed *at that moment*, permanently missed every faction that existed before the mod was installed. This is the exact "Lazy generation" trap in different clothes: `Galaxy:onFactionCreated(index)` alone only catches factions born *after* your mod starts listening — it says nothing about the ones already sitting in `server:getValue("factions")` the moment your mod's `initialize()` runs. Treating faction setup as self-healing (periodically re-scan `server:getValue("factions")` — filtering out eradicated indices via `FactionEradicationUtility.isFactionEradicated()`, see "🏛️ Factions, Alliances & Diplomacy" above — or check each faction for the traits/War Heat state your mod expects and apply it if missing, rather than trusting a single "have I ever processed this galaxy" flag) closes that gap for every faction regardless of when it — or the mod — first appeared.

### The consumer-side trap: check who else reads the flag

Making a flag self-healing changes what its *absence* means — and that's easy to get only half-fixed. Before the fix, a flag that's always set unconditionally the moment some point in the code is reached has exactly one meaning when it's absent: "hasn't reached that point yet." A self-healing fix changes it to only set the flag once the real condition it represents is *confirmed* true — which gives the flag's absent state a **second**, indistinguishable cause: "reached that point, but the real condition hasn't succeeded yet (retry pending)." Any other code that was written back when absence had only one meaning — reading it as proof of one specific, narrower thing — silently breaks the moment that second cause becomes possible, because it can no longer tell the two apart.

This isn't hypothetical. Fixing Cosmic Ascendancy's Aegis rendezvous scenes (six near-identical `onSectorEntered` blocks, one per story mission) to only set `ca_ready_for_debrief_N` once Aegis's ship was confirmed to actually exist — instead of unconditionally, the exact self-healing fix this section recommends — quietly broke each mission's own `updateServer()`, which treats `getValue("ca_ready_for_debrief_N") == nil` as proof the player already talked to Aegis and calls `finish()`. That assumption was safe *before* the fix (the flag was always set the instant the rendezvous sector was entered, so `nil` could only mean "already cleared by a real conversation"). After the fix, `nil` could *also* mean "ship spawn is still pending a retry" — and `updateServer()` had no way to tell those apart, so it would have silently finished the mission (no reward, no real debrief) the moment a spawn retry was in flight. The fix for the fix: a second, narrower marker (`mission.data.custom.debriefReady`) set only alongside a *confirmed*-successful flag write, with the `finish()` check gated on that marker instead of the flag's raw nil-ness.

> **Rule:** before shipping a self-healing fix, `grep` every other read site of the flag being changed. For each one, ask: does this code treat "the flag is absent" as proof of one *specific* prior event, rather than merely "the flag hasn't been set, for any reason"? If yes, that consumer needs its own fix — a narrower, unambiguous marker — before the self-healing change is safe to ship. A self-healing fix is not done until every consumer of the flag has been re-verified, not just the site you changed. The failure mode here has no error, no crash, no log line — it fails by silently treating a pending retry as an already-completed action, which can be worse than the bug the fix was meant to solve.

### When *not* to bother

Not every one-shot flag deserves this treatment — over-applying it is its own kind of clutter. The tell is the blast radius of the flag getting stuck: a chat broadcast, an audio cinematic banner, or a flavor-text "warning" message that never fires again for a save that already missed its window is a shrug, not a softlock — nobody's progress depends on it, and re-triggering it retroactively would often be *more* jarring than just letting it go (a "MASSIVE HYPERSPACE ANOMALY" banner popping up long after the moment it describes has passed reads as a bug, not a fix). Reserve self-healing for flags that gate state a player can get permanently stuck behind or that another system depends on existing — missions, factions, spawned NPCs, registered background managers — not for one-time narrative flourish.

---

[⬆ Back to top](#-table-of-contents)

## 🧩 Cross-Mod Compatibility

### Soft-dependency: wrap optional includes in `pcall`

If your mod merely *benefits* from another mod being present (an optional add-on relying on a shared core library), wrap the include: `pcall(require, "module")` (or `pcall(include, ...)`) so a missing dependency doesn't crash your script outright.

### Hard-dependency: you don't need to wrap it, and don't hard-`include()` a sister mod either

For mods in a tightly-coupled *required* suite (all needing a shared core library), a `pcall` around the shared include isn't necessary — a broken installation is free to fail loudly instead of silently misbehaving. This isn't a ban on guards, though: if one genuinely simplifies a specific piece of logic, there's no harm in adding it. The point is that the *absence* of a guard around a library the whole suite requires is not itself a defect to flag.

> [!NOTE]
> **`modinfo.lua` can't express a mutual/circular dependency.** Declaring two mods as each other's required dependency throws a "loop dependency error" at load — Avorion's dependency resolver can't handle a cycle. If your suite has several sibling mods that genuinely require *each other* (not just a shared core library), you cannot state that relationship in `modinfo.lua` directly. The working pattern: every sibling declares only the shared, non-circular core library as its one `modinfo.lua` dependency (a hub every sibling needs, that itself needs none of them back — `Cosmic Vault` in this workspace), and the mutual sibling-to-sibling requirement is enforced one layer up, at the *distribution* level instead: Steam Workshop's own "Require Items" setting on each mod's page, which prompts a subscriber to also subscribe to everything else you've marked required there. `modinfo.lua` has no visibility into that setting — it's configured on the Workshop page, entirely separate from the mod's own declared dependencies. A missing sibling under this setup is the same class of "didn't meet the stated requirement" as a missing core library, guarded or not — not a case to code defensively around. (Confirmed real-world instance: this workspace's Core 4 — `Cosmic Overhaul`, `Cosmic War`, `Cosmic Chronicles`, `Cosmic Ascendancy` — all mutually require each other in practice, but only declare `Cosmic Vault` in `modinfo.lua`; the mutual requirement is enforced through each mod's Workshop "Require Items" list instead.)

But if two *sibling* mods in that suite need to share data with each other (not just the shared core), don't hard-`include()` one sibling's files from the other — even siblings that mutually require each other per the note above are still packaged, versioned, and distributed as separate mods, and a literal file-path `include()` into another mod's own folder creates a real physical coupling that breaks the moment that mod's internal file layout changes, regardless of whether the two are "optional" relative to each other. Instead, have the source mod serialize what it needs to share into a delimited string pushed to global state, and have the consumer parse it defensively:

```lua
-- Mod A publishes:
Server():setValue("moda_snapshot", "3:0.5,7:1.2,12:0.9")

-- Mod B reads, with zero dependency on Mod A's files:
local server = Server()
if server then
    local snapshot = server:getValue("moda_snapshot")
    if type(snapshot) == "string" and snapshot ~= "" then
        for pair in string.gmatch(snapshot, "([^,]+)") do
            local idxStr, valStr = string.match(pair, "(%d+):([%d%.]+)")
            if idxStr and tonumber(idxStr) == myIndex and valStr then
                local value = tonumber(valStr) or 0
                -- use it
            end
        end
    end
end
```

If Mod A isn't installed, `getValue` simply returns `nil` and the whole block gracefully no-ops — Mod B functions correctly standalone.

### A genuinely optional sibling is where the `pcall` guard actually belongs

Not every mod in a suite is mutually required the way the previous section describes. A suite can also ship a sibling that's a real, opt-in extra — needs the shared core library, but nothing in the core or the required siblings needs it back (an example from this workspace: `Cosmic Starfall`, which only depends on `Cosmic Vault` and adds its own optional content — news items, weapons, buffs — that other mods may reference but never require). Code in a required sibling that reaches into a genuinely optional one's content is exactly the "Soft-dependency" case from the top of this section, and belongs behind a real `pcall`/existence guard: that installation gap is a legitimate, by-design possibility, not the "didn't meet the stated requirement" case the NOTE above is about. Telling the two apart before choosing whether to guard: does the *suite's own Workshop "Require Items" list* pull this sibling in for every required mod, or is it genuinely left off some of them by design? The former is a hard dependency (guard optional, not needed); the latter is the case guards exist for.

### Always null-check a cross-mod library table before indexing into it

```lua
-- WRONG: crashes outright if the bridge library failed to load or isn't installed
local bridge = include("othermodbridge")
if bridge.getSomeValue then
    local v = bridge.getSomeValue(index)
end

-- CORRECT: check the table itself exists before checking for the method
if bridge and bridge.getSomeValue then
    local v = bridge.getSomeValue(index)
end
```

### Before modifying a shared piece of state, grep for who actually writes it — not just who reads it

A shared library table (Cosmic Vault's `CosmicVaultTerritory.getContestedZones()` is a real example) is easy to mistake for something *your* mod owns just because your mod is the one consuming it most visibly — running background timers off it, rendering its progress bar, resolving its outcome. None of that means your mod is the one that *creates* an entry in the first place. If a feature needs to modify that state (extend a timer, change a value already in flight), grep the whole workspace for the setter (`setContestedZone`, not `getContestedZones`) before writing code that assumes you can find and edit an existing call site — you may find zero call sites in your own mod, meaning a sibling mod is the sole writer and your own mod is a pure consumer.

That isn't a dead end. A shared library's setter is generally an upsert, safe to call a second time from a different mod entirely — reading the current value back, computing a new one, and writing it again through the same public API is standing on the same ground the original writer stood on, not reaching around it. What it does mean is you can't assume you already have the write call site to edit; you're adding a *new* one, from outside, through the library's own front door. Confirmed real-world instance: a "scale this siege's duration by distance" feature was planned assuming the consuming mod (Cosmic War) called `CosmicVaultTerritory.setContestedZone()` to start the siege it was already resolving and rendering the HUD for — it doesn't; Cosmic Ascendancy does, and Cosmic War only ever reads the zone back. The fix wasn't a redesign, just calling the same shared setter again, once, from the consuming side, with a recomputed duration — but assuming ownership without grepping for it first would have meant either inventing a parallel duration-tracking system or wrongly concluding the feature needed a change to a sibling mod's own files.

### Guard global engine objects inside shared libraries

A shared library function that unconditionally calls `Server()` will crash any client-side script that happens to `include()` the library purely for an unrelated helper function. Guard it:

```lua
if type(Server) == "function" then
    local server = Server()
    if server then
        -- safe to use server here
    end
end
```

`type(Server) == "function"` is a safe check because `type(nil)` evaluates to `"nil"`, never `"function"`.

### Background scripts must persist their own state

A background script tracking events in a plain local table (`local seenEvents = {}`) loses everything on server restart, causing it to re-fire "new" detections for things it already saw. Implement `secure()`/`restore()`:

```lua
function MyTracker.secure()
    return { seenEvents = seenEvents }
end

function MyTracker.restore(data)
    seenEvents = data.seenEvents or {}
end
```

### A shared library's `conditions`-style filter table is a closed set, not an open one

`CosmicVaultDialogue.registerLine(entry)` accepts an `entry.conditions` table meant to gate when a registered line is eligible — but reading `CosmicVaultDialogue.getValidLine()` directly shows it only ever checks a fixed, hardcoded list of keys (`minWarHeat`, `maxWarHeat`, `factionTrait`, `factionWealth`, `stationType`, `minDistanceToCenter`, `maxDistanceToCenter`, `minReputation`, `maxReputation`). Any other key you put in that table — say, `conditions = {eclipseAwake = true}` to gate a line on a mod-specific game-state flag — is silently ignored. The entry evaluates `isValid = true` and stays in the pool unconditionally; there's no error, no warning, just a line that shows up before the condition it was supposedly gated on is even true.

This generalizes past this one library: any shared helper whose config is "pass a table of options" rather than "pass explicit named parameters" is a closed enumeration on the *implementation's* terms, not an open one on the *caller's*. Before assuming a `conditions`/`options`/`config` table supports a key you need, read the function that actually consumes it (not just the one that stores it) and confirm that key is checked somewhere, not merely accepted.

`Cosmic Ascendancy`'s Choir feature needed lines that only exist once the Eclipse has actually reached a specific state (unleashed / fully awake / a Fallen Empire). The correct fix isn't a conditions key at all — it's to not call `registerLine()` for that tier until the state transition that tier represents has actually happened (called once from each one-shot transition block, the same place other one-time effects for that transition already live). A line that hasn't been registered yet can't be eligible; that's a stronger guarantee than any runtime condition check could provide, and it doesn't depend on the library supporting anything it doesn't.

### Splitting a `Shop` namespace into several sub-shop tabs orphans anything an outside script injects into the original by name

`ShopAPI.CreateNamespace()` (`lib/shop.lua`) is designed around ONE `Shop` instance per namespace: `initialize()` calls `shop:initialize()`, `initUI()` calls `shop:initUI()` (which builds that instance's own buy tab and, if `showSpecialOffer` isn't explicitly disabled, its own `specialOfferUI`), and external code can reach into the namespace by its script name — `entity:invokeFunction("equipmentdock", "setSpecialOffer", item, amount)` — to force an item into that specific `Shop` instance's `specialOffer.item` field, entirely independent of whatever the namespace's own generation code does. Vanilla itself relies on exactly this: `data/scripts/items/equipmentmerchantcaller.lua` (the "Trade Guild Beacon" item behind the main story's "buy an artifact from a Mobile Merchant" quest step) calls `ship:invokeFunction("equipmentdock", "setSpecialOffer", SystemUpgradeTemplate("teleporterkey4.lua", ...), 1)` on the ship it just spawned, to guarantee the quest item is buyable.

Splitting a single-tab `Shop` namespace into several category sub-shops (each its own `ShopAPI.CreateNamespace()` instance, e.g. Equipment Dock's Civilian/Military/Misc Upgrade tabs) commonly neuters the *original* namespace's `initUI()` to an empty function, since the new sub-shops now build the real tabs. That's correct for the sub-shops — but it silently strips the ORIGINAL namespace's `Shop` instance of any UI at all. Nothing calls `shop:initUI()` for it anymore, so `specialOfferUI` and `buyTab` are never created. `setSpecialOffer()` itself is untouched and still writes to `specialOffer.item` correctly — the data is there — but there is no longer any tab, anywhere, that ever renders it. The result: a vanilla (or another mod's) external `invokeFunction` call that used to force an item into the shop keeps "succeeding" with zero errors and zero log output, while the item it injects becomes permanently unbuyable. If that item happens to gate a main-story mission step, the quest silently soft-locks for every player who has the split-tab mod installed — no crash, no error, nothing in the changelog's own reviewed files to catch it (see the Cross-Mod Compatibility checklist item on grepping the whole workspace for external `invokeFunction` callers before treating a namespace split as complete).

```lua
-- WRONG: initUI() emptied out because "the sub-shops build the real tabs now" —
-- true for normal item generation, but this namespace is also an invokeFunction target
-- from OUTSIDE the mod (vanilla's equipmentmerchantcaller.lua calls setSpecialOffer on it directly).
function EquipmentDock.initUI()
end

-- CORRECT (one option): keep a minimal special-offer-only surface alive on the
-- original namespace so anything that injects state into it by name still has
-- somewhere to render — e.g. call shop:initUI(...) with the regular item rows
-- suppressed, or forward setSpecialOffer's payload into the correct category
-- sub-shop by its own CosmicVaultUpgradeCategories.getCategory(script) lookup.
```

Before emptying out a namespace's `initUI()`/UI-building function as part of a "split into several tabs" refactor, grep the whole workspace (vanilla included) for `invokeFunction("<that-namespace's-script-name>"` and `addFront`/`setSpecialOffer`/`setStaticSeed` calls against it. If anything external reaches in by name, the split needs to either keep a live surface for that injection or explicitly forward it into wherever the real UI moved to — it can't just be dropped.

### A registry's single-lookup fallback doesn't carry over to its own bulk/reverse-enumeration function

A category/tag registry commonly exposes two functions: a forward lookup (`getCategory(key) -> value`, often with a documented "unknown keys default to X" fallback) and a reverse/bulk enumerator (`getScriptsOfCategory(value) -> array of keys`) used by whatever actually builds a category-filtered list. These two are not automatically consistent just because they're declared next to each other and described by the same doc sentence. A reverse enumerator built the obvious way —

```lua
function Registry.getScriptsOfCategory(category)
    local result = {}
    for scriptPath, cat in pairs(categories) do
        if cat == category then table.insert(result, scriptPath) end
    end
    return result
end
```

— can **only** return keys that were explicitly written into `categories` via `registerCategory()`. It structurally cannot include an unregistered key, no matter what `getCategory(unregisteredKey)` would separately return for it. If the real consumer (a shop's item generator, in this case) calls `getScriptsOfCategory()` rather than `getCategory()` — which it usually does, since it needs "every script in category X," not "what category is script Y" — then the single-lookup fallback's safety promise ("an unrecognized script from another mod still shows up somewhere instead of vanishing") is simply not wired into the code path that matters, even though it's real, working code sitting right next to it. The practical effect: an external Workshop mod's own custom upgrade system, or any vanilla script not on the registry's pre-registered list, never appears in ANY category tab, permanently — the exact compatibility failure the registry's own docs claim it prevents.

Before trusting a "defaults unregistered entries to category X" claim about a registry, identify the specific function the real consumer actually calls and verify the fallback lives inside *that* function — not a same-purpose sibling with a similar name. If the consumer uses a reverse enumerator over the registry's own stored keys, the only real fixes are: register everything that needs to be found (impractical for external content), or have the enumerator/generator separately pull from the full universe of possible items (e.g. `UpgradeGenerator`'s own complete script list) and filter by `getCategory()` per item, rather than only walking the registry's own keys.

### A shared function declared *inside* `if onServer() then ... end` is `nil` on the client — not a safe no-op

There are two different ways a shared library can restrict a function to the server, and they fail completely differently when a client calls them anyway:

```lua
-- PATTERN A: the function always exists; its BODY guards. Safe to call unconditionally --
-- calling it client-side is a harmless no-op.
function MyLib.doServerThing(x)
    if not onServer() then return end
    -- ... real work ...
end

-- PATTERN B: the function only exists inside the onServer() block. On the client this
-- whole block never runs, so MyLib.doServerThing is nil -- not a function that no-ops,
-- a missing key. Calling it crashes with "attempt to call a nil value (field 'doServerThing')".
if onServer() then
    function MyLib.doServerThing(x)
        -- ... real work ...
    end
end
```

Both patterns look identical from the call site — `MyLib.doServerThing(x)` — until a client actually calls one. `Cosmic Vault`'s own `cosmicvaultterritory.lua` uses Pattern B: `getContestedZones()`, `setContestedZone()`, `removeContestedZone()`, `resolveSiege()`, `updateServer()` and `expandToSector()` are all declared inside a single top-level `if onServer() then ... end` block, so on the client `CosmicVaultTerritory` is an empty table with none of those keys.

This bit `Cosmic War`'s `siegeevent.lua` (**since fixed** — kept here as a case study, not a live pitfall in that file anymore): its `SiegeEvent.initialize()` had no `onServer()`/`onClient()` guard at all (unlike its own sibling event scripts — `cw_fleetclash.lua` and `cw_eclipse_vanguard.lua` both correctly open `initialize()` with `if onClient() then return end`), and per the "`update(timeStep)` is a real, third tick callback" section above, an unqualified `initialize()` on a `Sector()`-attached script fires on **every** side that has the script loaded — including a client physically present in the sector, which is exactly when `sector:addScriptOnce("events/siegeevent.lua")`-style dynamic attachment is used. The very first line of that `initialize()` called `CosmicVaultTerritory.getContestedZones()` unconditionally, so every client who entered a contested sector hit the nil-call crash immediately, before the function ever reached the entity-spawning code that genuinely does need to be server-only. `Cosmic War`'s own `Changelog.md` documents the fix (*"Siege Event Crashed Every Client Who Entered A Contested Sector... Added `if onClient() then return end` at the top of `initialize()`, matching the established sibling pattern"*) — current `siegeevent.lua` now opens exactly that way.

**The fix, and the general rule:** unless you've proven every call site is unreachable from the client, prefer Pattern A (function always defined, guards its own body) for anything in a shared library — it degrades to a harmless no-op instead of a hard crash when a caller gets the client/server split wrong. Reserve Pattern B for functions whose entire *closure* (locals captured from the `if onServer()` block, like `cosmicvaultterritory.lua`'s private `serializeZones`/`deserializeZones` helpers) genuinely cannot exist client-side — and even then, document loudly that the function is conditionally absent, not just conditionally inert.

### A `Player()`-targeted "push" API must be called *from the server* — never from inside the client handler it pushes to

Some shared UI/notification helpers take a `Player()` object and route a message down to that specific client via `player:invokeFunction(script, fn, ...)` — the standard server→client RPC pattern (see "Re-entrant VM deadlocks" above and `Player():getValue()`/`setValue()` further down for the same client/server asymmetry). `CosmicVaultUI.ShowCinematicBanner(player, text, color, soundPath, duration, theme)` (`cosmicvaultui.lua`) is exactly this shape: its very first line is `if not onServer() then return false end`, and its actual work is a `player:invokeFunction("cosmicvaultcinematic.lua", "showBanner", ...)` call that only makes sense as a server pushing to one client's own script instance.

`Cosmic War`'s `cw_eclipse_vanguard.lua` once called this function from the wrong side of that boundary (**since fixed** — current `spawn()` already matches the "CORRECT" version below; kept as a case study, not a live pitfall in that file anymore). The server-side `spawn()` correctly called the ENGINE'S OWN broadcast primitive, `broadcastInvokeClientFunction("showVanguardBanner")`, to tell every client to run `showVanguardBanner()` locally — but that client-side handler then tried to call the Vault helper *on itself*:

```lua
-- WRONG: showVanguardBanner() runs ON THE CLIENT (that's the whole point of
-- broadcastInvokeClientFunction) -- but ShowCinematicBanner's own onServer() guard
-- means it silently returns false and does nothing when called from there.
function CW_EclipseVanguardEvent.showVanguardBanner()
    if onClient() then
        CosmicVaultUI.ShowCinematicBanner(Player(), "ECLIPSE VANGUARD INBOUND", ...)
    end
end

-- CORRECT: call the server-only helper from the server, once, looping over the
-- players who need to see it -- let ITS OWN internal invokeFunction do the pushing,
-- rather than broadcasting first and trying to call a server-only helper on the far side.
function CW_EclipseVanguardEvent.spawn()
    -- ... server-side spawn logic ...
    for _, player in pairs({Sector():getPlayers()}) do
        CosmicVaultUI.ShowCinematicBanner(player, "ECLIPSE VANGUARD INBOUND", ...)
    end
end
```

The banner never rendered for any player — no error, no log line, because `if not onServer() then return false end` is a *quiet* guard, not a crash. Before wiring a shared helper into a `broadcastInvokeClientFunction`/RPC chain, check which side the helper's own top-level guard requires and call it from there directly, rather than assuming a function that accepts a `Player()` argument is safe to call from that same player's own client.

### `EntityType.WormHole` — capital H, not `Wormhole`

`EntityType`'s member for a wormhole entity is `WormHole` (confirmed in `Globals.lua`'s enum table). It's easy to write `EntityType.Wormhole` instead — the natural English capitalization — especially since a *different*, real enum in the same file (`SectorChangeType.Wormhole`) genuinely does use that exact lowercase-h spelling, so autocomplete or memory from one enum can plant the wrong casing in the other. `EntityType.Wormhole` isn't an error at the point of use — indexing a table with a key that isn't there just returns `nil` — so `sector:getEntitiesByType(EntityType.Wormhole)` silently becomes `sector:getEntitiesByType(nil)`, which either errors deeper in the engine or (worse) quietly returns nothing every time, so a "does a wormhole already exist here" check always reads false. Caught during self-review before ever running, not from a crash report — cross-check enum member spelling against `Globals.lua` directly rather than trusting the capitalization that reads naturally.

### Two different `createWormHole`s live on two different objects — don't reach for the generation-time one at runtime

`Sector:createWormHole(x, y, color, visualSize, passageSize)` — the real 5-argument signature, confirmed in the raw HTML docs (`Sector [Server].html`; `Avorion Stubs/Sector.lua`'s own hand-converted stub for this function is stale and only shows a simplified 4-argument version with no `visualSize`/`passageSize` split — check the HTML docs directly for this one, not the stub) — creates a real wormhole entity in the **currently loaded sector**, pointing at destination `(x, y)` — this is the one a live mod script calls to inject a wormhole during actual gameplay. `SectorGenerator:createWormHole(x, y, color, size)` is a **different function on a different object**, used internally by vanilla's own procedural galaxy generation (`lib/SectorGenerator.lua`) to build the initial wormhole network at map-creation time; it computes `from` as the generator's own `self.coordX/coordY`, which is meaningless once generation has finished. The two are easy to conflate since they share a name and a rough purpose. What IS safe and intended to reuse live, though, is `SectorGenerator:wormHoleAllowed(from, to)` — the barrier/passability check `SectorGenerator:createWormHole` calls internally — which works correctly when called on a freshly-constructed `SectorGenerator(x, y)` instance at any time (it lazily builds its own `PassageMap(Server().seed)` on first use), so a mod can gate a live `Sector():createWormHole()` call against the exact same passability rule vanilla's own generation uses, without needing to be inside a generation pass itself.

`passageSize` (`Sector:createWormHole`'s 5th argument) is documented as optional — "If nil max value will be used" — so a 4-argument call (`x, y, color, visualSize`) is intentional and complete, not a truncated call missing a required parameter.

---

[⬆ Back to top](#-table-of-contents)

## 💬 Community-Sourced Tips

> [!NOTE]
> The entries in this section come from Avorion's official Discord, specifically pinned messages in its modding channels — not from this Codex's own bug-fixing and API-verification process. They're still worth having in one place, but they carry a different kind of confidence than the rest of this guide: most are dev-tool/editor behaviors that live outside the Lua API surface, so there's no `Avorion Stubs` entry or vanilla script line to check them against. Treat them as reliable community knowledge, not independently re-verified facts — and if you can confirm one against a source, feel free to promote it into the relevant section above with a normal citation.

### Debug hotkeys: reloading scripts without restarting the game

You don't need to restart Avorion (or reconnect to a server) to pick up a script change. The client exposes dedicated reload hotkeys:

| Hotkey | Effect |
| --- | --- |
| `F5` | Reloads all scripts in the current sector |
| `F5` (with an object selected) | Reloads all scripts on that specific entity |
| `Shift + F5` | Reloads all scripts for the player |
| `Ctrl + F5` | Reloads every script (sector + entity + player) |
| `F6` | Same effect as toggling `DevMode` in Settings → Mods |
| `Ctrl + F6` | Clears the texture cache — useful specifically for shader/texture modding, where a stale cached texture can make a change look like it didn't take effect |

### Mod icons have a fixed spec

Workshop/mod icons are expected as **512×512, 24-bit color depth, `.png`**. An icon outside that spec is a common, easy-to-miss reason a mod's Workshop thumbnail looks wrong or fails to display as intended.

### Blocks themselves are not Lua-moddable

Custom block *shapes* and block *types* are not exposed to Lua modding, and per the Discord's own pinned guidance this isn't expected to change — stop looking for a hook to add one. This is a distinct limitation from everything modding *can* touch (stats, generation, UI, missions, entities); see [What's genuinely locked behind C++](#-appendix--engine-trivia--hard-limitations) in the Appendix for the rest of that list.

### Bump your dependency's `max`, remember to bump your own `modinfo.lua` too

If your mod declares a dependency on another mod using the `max = ...` version-ceiling parameter in `modinfo.lua`, remember to actually raise that ceiling when the dependency ships a new version you want to support — an unmodified `max` silently continues to cap compatibility at the old version, which reads to a subscriber as "these two mods don't work together yet" even after the dependency has moved on.

### Already covered elsewhere in this guide

A couple of tips from the same source restate lessons this Codex already documents in more depth — rather than duplicate them here, they're linked from their real home:

- **Matrix member access returns a copy, not a reference** (`matrix.look.x = 14` does nothing; `matrix.look = vec3(14, 5, 5)` is what actually writes) — see [🏁 Start Here — Core Concepts, #4](#-start-here--core-concepts).
- **Scrollbar sizing and scrollstep quirks** — see the [Scrollbars](#️-ui-development) entry under UI Development.

---

[⬆ Back to top](#-table-of-contents)

## ⚡ Quick-Reference: Common Crashes

| ⚠️ Pitfall | ❌ Wrong | ✅ Right |
| --- | --- | --- |
| Multiplayer RNG | `math.random()` | `random()` or `Random(seed)` |
| Library imports | `require("module")` | `include("module")` |
| Persistent timers | Storing a countdown in a `Sector()` script | Store it in `Galaxy()`, sync into the sector on entry |
| Removing a stat bonus | `entity:removeMultiplyableBias(stat, val)` | Store the `key` from `add*Bias`, call `entity:removeBonus(key)` |
| Calling back into an active VM | `player:invokeFunction(...)` from inside a callback | Set a flag, act on it from `updateServer()` |
| Library global callbacks | `function updateServer()` inside a `lib/` file | Export a namespace table; the *including* script owns the callback |
| Overriding a vanilla file | Ending your override with `return MyNamespace` | Omit the `return` — the VFS supplies the vanilla one |
| Sector access from a global script | `Sector()` inside `galaxy/server.lua` | `runSectorCode()` (sector must already be loaded) or a `Player()` script |
| Purging a script in a loop | `while entity:hasScript() do entity:removeScript() end` | A single `if` — `removeScript` is deferred |
| Ending a script from inside itself | Self-`removeScript()` + `terminate()`, or self-`removeScript()` alone | `terminate()` alone — it already removes the calling script |
| Unknown C++ properties | `entity.numFactions` | Use a real method, verify against the stub first |
| Registering a `ScriptUI` interaction | `ScriptUI():registerInteraction(...)` inside `initialize()` | Move it to its own `initUI()` — a separate, engine-invoked lifecycle callback |
| Showing a dialog after a server round trip | `ScriptUI():showDialog(dialog)` from a client handler invoked via `invokeClientFunction` | `ScriptUI():interactShowDialog(dialog)` — forces the interaction state instead of assuming it |
| Skipped positional arguments | `createWreckage(faction, matrix)` | `createWreckage(faction, nil, 10, matrix)` |
| Paying an AI faction | `faction:pay("text"%_T, amount)` | `faction:payWithoutNotify("text", amount)` |
| Holding userdata across a yield | `local ship = Entity(sid)` before `Yield()` | Store `id.string`, re-fetch after resuming |
| Iterating factions | Raw loop over `server:getValue("factions")` | Filter with `FactionEradicationUtility.isFactionEradicated(index)` |
| Component constructors | Assuming `Shield(id)`/`Durability(id)`/`Hangar(id)` don't exist | They're real — guard with `valid(...)`, not truthiness |
| Unproven stat levers | `entity.damageMultiplier = 1.5` (real property, unconfirmed effect) | `entity:addBaseMultiplier(StatsBonuses.FireRate, 0.5)` (proven DPS lever) |
| Loot/turret generator coordinates | `SectorTurretGenerator():generateArmed(0, 0, ...)` | Pass real `cx, cy = Sector():getCoordinates()` |
| `inflictDamage` argument order | `ship:inflictDamage(dmg, type, uuid)` | `(damage, damageSource, damageType, inflictorId, ...)` |
| Async writes to sector physics | Modifying entity stats mid-coroutine-yield | Keep physical writes synchronous |
| Client config reads | `Player():getValue("key")` in a client UI script | Server-only — use a client-cache table synced via `invokeClientFunction` |
| Loading an unloaded sector | Assuming `runSectorCode`'s 3rd arg loads it | It's `printErrors`; call `loadSector` + poll `sectorLoaded` first |
| Damage-type stat buffs | `StatsBonuses.EnergyDamage` / `.PhysicalDamage` | Don't exist — use `StatsBonuses.FireRate` as the DPS proxy |
| One-shot event/mission triggers | `setValue(flag, true)` right before the action it guards | Verify real downstream state on a recurring check; re-run idempotent setup every poll |
| Mod installed mid-save | A one-time setup pass at `initialize()` only touching factions/state that exist right then | Periodically re-scan (`onFactionCreated` + `server:getValue("factions")`), don't trust a single pass |
| `include error` from one mod's own folder in a player's log | Assuming your script is broken, OR assuming it's always a corrupted download | Check your own source first; if clean, verify the "corrupted download" theory survives a clean reinstall before trusting it — see the VFS section |
| `%_t`/`%_T` at global scope | `locLines.a = "Hi"%_t` at module top-level in an `addScriptOnce`'d file | Wrap in `if onClient() then ... end`, or move inside a function |
| Inverted server guard | `if not onServer() then return end` treated as a client-safety guard | It forces server-**only** execution — the opposite; still needs its own `%_t` protection inside |
| `attempt to perform arithmetic on a string value` from a `%_t`/`%_T` line | File never reaches `stringutility.lua` (no direct or transitive `include`) | `include("stringutility")` directly in the file, regardless of scope |
| `attempt to get length of a userdata value` | `local x = sector:getEntitiesByType(t)` | `local x = {sector:getEntitiesByType(t)}` — it returns multiple values, not a table |
| Unrestricted debug RPC | A `callable()`-registered function gated only by a client-side `if _debug then` wrapper | Add a server-side `Owner()`/`callingPlayer` ownership check inside the function itself |
| `restore()` silently doesn't restore anything | `local x = ...` inside `restore()`, shadowing a module-scope `local x` other functions read | `x = ...` (no `local`) to update the actual outer variable |
| `Error constructing NamedFormat: not enough arguments` | `NamedFormat("Trade Rumor..."%_T)` | `NamedFormat("Trade Rumor..."%_T, {})` — the table argument is required, even when empty |
| "This craft has no owner" / docking always denied | `entity.factionIndex = 0` on a ship players must dock/enter | Keep real faction ownership; fix the actual side effect at its source (e.g. remove the offending script) |
| Registry never cleans up a destroyed entity's entry | Cleanup logic hooked to `onRemove()` | Hook `onDelete()` — it's the one that fires when the object itself is deleted |
| `attempt to index local 'sector' (a nil value)` in `onDelete()`, logged during a sector save | `onDelete()` also fires on routine sector unload, when `Sector()` is already gone | Register `Entity():registerCallback("onDestroyed", ...)` and do destruction work there instead |
| Split-tab shop's externally-forced special offer never shows up | Emptying `Shop`'s `initUI()` without checking for outside `invokeFunction("<name>", "setSpecialOffer", ...)` callers | Grep the whole workspace for external callers of the namespace by name before removing its UI |
| "Unregistered items default to category X" claim | Verifying only the single-lookup `getCategory(key)` fallback | Check whether the real consumer instead calls a reverse enumerator (`getScriptsOfCategory`) — it can't surface unregistered keys at all |
| Shared function only defined inside `if onServer()` | Calling it unconditionally from a script whose `initialize()` also runs client-side | Either guard the call site, or have the library guard the function's own body instead of omitting it entirely |
| `Player()`-targeted push API called from the client | `if onClient() then MyLib.ShowThing(Player(), ...) end` inside a `broadcastInvokeClientFunction` handler | Call the server-only helper from the server, looping over target players — let its own `invokeFunction` do the pushing |
| Mission abandon penalty silently never fires | `mission.abandon = function() ... end` | `mission.globalPhase.onAbandon = function() ... end` — `structuredmission.lua` never reads `mission.abandon` |

---

[⬆ Back to top](#-table-of-contents)

## 📚 Appendix — Engine Trivia & Hard Limitations

### Source reliability hierarchy — where to verify an API claim

> [!TIP]
> **Both sources above are mirrored directly in this repository** — `Avorion Stubs/` and `Avorion API Indexes Documentation/` sit alongside `Codex Main/` at the repo root, so every `Avorion Stubs/<ClassName>.lua` and `search_html_api` reference throughout this guide can be opened locally without hunting them down elsewhere:
>
> - **`Avorion Stubs/`** — sourced from the community-maintained [riandrake/AvorionModTools](https://github.com/riandrake/AvorionModTools) project, which generates these per-class Lua stubs from Avorion's own API. Full credit to that project for the tooling; this repo just keeps a working copy so readers of this Codex don't have to set it up separately.
> - **`Avorion API Indexes Documentation/`** — the raw HTML API docs, shipped internally with the base game for modders' own reference. Included here for the same reason: so a claim in this Codex can be double-checked in two clicks instead of a scavenger hunt through your own game files.
>
> If either source ever falls out of date with a newer Avorion release, the upstream tool/game files are still the ground truth — treat the local copies here as a convenience mirror, not a replacement for regenerating them yourself if you suspect drift.

### What's genuinely locked behind C++ (can't be modded around)

1. **Physics & collision.** Mass-inertia, bounce, and block-by-block penetration are entirely C++. Lua can apply multipliers to the result, not replace the solver.
2. **True multithreading.** The sandboxed per-entity Lua VM model makes real cross-script multithreading impossible — no spawning native threads from Lua.
3. **Raw networking.** No sockets. All client-server communication is sanitized and routed through `invokeServerFunction`/`invokeClientFunction`; you cannot run your own network server from inside the client.
4. **Low-level UI/shaders.** UI is limited to the `UIContainer` primitives (buttons, labels, rectangles...). No arbitrary OpenGL calls, and no dynamically compiling/binding custom GLSL shaders from a script.
5. **The core server loop.** Tick rate, matchmaking, chunk (sector) loading, and base entity-component serialization are hardcoded — none of it lives in reachable Lua.
6. **Block shapes and block types.** Per Avorion's official Discord (modding channel, pinned): custom blocks aren't exposed to Lua, and there's no indication that's changing. Distinct from everything else modding *can* reach — stats, generation, UI, missions, entities — this one's just off the table.

### Loading screen tips can be hijacked, not extended

The list of loading-screen hint text is hardcoded client-side (`LoadingScreenTipSelector.cpp`) with no Lua-exposed array to append to. You can't add *new* tips, but you can override the text of an *existing* vanilla tip via a `.po` localization override, which lets you slip in custom lore or an easter egg wherever the engine happens to roll that particular vanilla tip.

### Sector material strength (balancing reference)

```lua
function Balancing_GetSectorMaterialStrength(x, y)
    local probabilities = Balancing_GetMaterialProbability(x, y)
    local strength, strengthSum = 0, 0
    for key, value in pairs(probabilities) do
        strength = strength + value * Material(key).strengthFactor
        strengthSum = strengthSum + value
    end
    return strength / strengthSum
end
```

This returns roughly `7.54` at the galactic core (⚠️ **Unverified:** per-material `strengthFactor` values are C++-side and aren't exposed as literal numbers anywhere in the available Lua/HTML sources, so this specific figure couldn't be independently re-confirmed — treat it as the original author's own measurement, not a re-checked fact). The result mostly governs the *appearance/spawn probability* of materials in a sector rather than being a direct HP source, though the game's own encounter balancing multiplies it against average ship volume to approximate a target time-to-kill for vanilla content.

> [!NOTE]
> **Correction:** An earlier revision of this entry additionally claimed "Avorion's own baseline material strength constant is `11.39` (see `Documentation/Material.html`)." That citation doesn't hold up — `Material.html` (real path: `Avorion API Indexes Documentation/Material.html`) is an auto-generated stub page listing only property *names* (`strengthFactor`, `density`, `value`, `costFactor`, ...) with no documented numeric values anywhere in the file, and a workspace-wide search for `11.39` found it nowhere outside unrelated ship-plan XML block coordinates and this Codex entry itself. The claim has been removed rather than corrected, since no real source for a baseline constant turned up — if you need this number, read `Material(type).strengthFactor` live in-game rather than trusting a hardcoded figure here.

> ⚠️ Hull penetration does not behave correctly against projectile weapons specifically — don't design boss mechanics that depend on it working for projectile-based attacks.

### Bulk inventory additions need a loop

`Inventory:add(item, recent)`'s second parameter isn't a count at all, despite how naturally `inventory:add(item, 500)` reads — `recent` is a flag/index (confirmed in `Avorion Stubs/Inventory.lua` and `Inventory.html:143`; real vanilla call sites pass a boolean or key there, e.g. `inventory:add(item, true)` in `simulation.lua`), not a quantity. There is no native bulk-add call — `inventory:add(item, 500)` always adds exactly **one** copy. Loop it yourself: `for i = 1, amount do inventory:add(item) end`.

> [!NOTE]
> **Correction:** An earlier revision of this entry described the second argument as "the count argument," implying `Inventory:add` has a quantity parameter that simply doesn't scale. It doesn't have one at all — the real second parameter is named `recent`, and it's a flag, not a quantity. The practical advice (loop the call yourself) was always correct; only the explanation of *why* was wrong.

### Economy multipliers compound fast — cap them

Several small, individually reasonable-looking multipliers stack multiplicatively far faster than they look on paper. A base price run through four modest-sounding modifiers in sequence can inflate 5x or more; drop that at scale (hundreds of copies from a boss loot table) and it can generate an economy-breaking amount of currency in one encounter. Hard-cap total compounding on any price path that a repeatable source can trigger.

### Sector save files — reverse-engineering notes (community-sourced, use with caution)

Sector files under a galaxy save's `sectors/` folder are standard **zlib**-compressed (DEFLATE) blobs. Per historical notes attributed to the developer, the actual compressed payload doesn't start at byte 0 — it's preceded by a **44-byte** uncompressed header believed to carry metadata (coordinates, versioning, or checksums; this hasn't been independently re-confirmed here). Because Avorion's serialization is a custom Entity-Component System, any engine update that changes serialization order can silently break an external parser built against the old layout — treat any third-party sector-file tooling as fragile and version-pinned.

### Enum reference used throughout this guide

```lua
DamageType = { Physical = 0, Energy = 1, AntiMatter = 2, Electric = 3, Plasma = 4, Fragments = 5, None = 6 }
DamageSource = { Energy = 0, Collision = 1, Decay = 2, Arbitrary = 3, Torpedo = 4, Invalid = 5 }
-- AlliancePrivilege (partial): Invite, Kick, Promote, Demote, EditRanks, EditMap, AddItems,
--   SpendItems, TakeItems, AddResources, SpendResources, TakeResources, FoundShips,
--   FoundStations, ManageStations, ManageShips, ...
```

---

*Cross-referenced against `Avorion Stubs/` (the authoritative per-class API reference), the vanilla script source (`Avorion_Vanilla_Copy` / `Vanilla_Reference`), and the official `Avorion API Indexes Documentation` HTML pages wherever a claim could be checked. If something here ever stops matching a future game update, trust the stubs over this document — and update this document to match.*


[⬆ Back to top](#-table-of-contents)

---

## 🤝 Contributing to This Codex

Found a mistake? Confirmed one of the ⚠️ **Unverified** entries one way or the other? Have a hard-won lesson of your own from modding Avorion?

Contributions are welcome — see **[CONTRIBUTING.md](../CONTRIBUTING.md)** for the ground rules (short version: verify against `Avorion Stubs`, vanilla source, or a live test before submitting; match the existing format; mark anything you can't independently confirm as ⚠️ **Unverified**).

## 📄 License & Attribution

This Codex is authored and maintained by **Stormbox**. See the repository's `LICENSE` file for terms. If you reference or adapt this guide elsewhere in the community, a credit back to this repository is appreciated.
