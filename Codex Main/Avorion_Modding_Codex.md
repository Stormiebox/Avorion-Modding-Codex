# 🚀 The Avorion Modding Codex

## Author: Stormbox

*A practical field guide to Avorion's Lua scripting API — written for modders, by a modder, Stormbox (stormiebox), from hard-won lessons across the development of the **Cosmic** mod series (Cosmic Vault, Cosmic Overhaul, Cosmic War, Cosmic Chronicles, Cosmic Ascendancy, and Cosmic Starfall).*

> [!NOTE]
> This is a *guide*. Every rule below is written as a standalone lesson — what the engine actually does, why it surprises people, and the pattern that works. Where a claim could be checked against the `Avorion Stubs` folder (the authoritative per-class API reference — see below) or the vanilla script source, it was; a handful of entries that could **not** be confirmed against any source are clearly marked ⚠️ **Unverified** so you know to test before relying on them.
---
> Highly recommended to setup `Avorion Stubs` in your workspace. Alongside `Avorion Vanilla` resources like a copy of the game resources as well.
---
> This version is a highly compacted version from my now 4738+ lines of development diary I had previously.
> Mentions of `Avorion_Mega_Stub.lua` are mostly from me. As it is a mega stub compacted from `Avorion Stubs` for ease of access with VS Code.
> There may be other mentions to files or directories you do not own. This is normal. Mostly aimed at me (Stormbox). As I often use this codex for my own references.
---
> This document will also mention MCP and Python content quite often. That is more aimed at myself (Stormbox). As I do run a local MCP server on an old PC which helps immensely when I'm scrounging through Avorion resources.
> Python scripts I utilize to quickly help me find certain snippets, functions, etc. And it's very helpful with compiling mods and other stuff too.

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
12. [⚡ Quick-Reference: Common Crashes](#-quick-reference-common-crashes)
13. [📚 Appendix — Engine Trivia & Hard Limitations](#-appendix--engine-trivia--hard-limitations)

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

---

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

Avorion mods often wrap heavy background work (faction diplomacy, reputation decay, bounty generation) in a coroutine-based async task helper. Two failure modes recur constantly:

1. **Unpumped coroutines leak C++ references.** An async task only advances if something explicitly resumes it on every `updateServer()` tick. If nothing pumps it, the coroutine sits there forever holding references to C++ objects (like a captured `Galaxy()` handle). When the owning script eventually stops or its VM gets garbage-collected, the engine forcibly destroys those objects out from under the dangling coroutine, causing an out-of-bounds memory violation. **Only use an async/coroutine wrapper for genuinely large loops in a script that explicitly pumps its own scheduler every tick** — for anything cheap enough to finish in one frame, just run it synchronously.
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

Also never use an async wrapper to *write* to sector-physics-relevant properties (`entity.durability = ...` and similar). Sector physics run on parallel worker threads; if your coroutine resumes and writes to a C++ property at the same instant a physics worker is calculating collision/damage for that entity, you get real heap corruption and a `SIGSEGV`. Keep physical write-operations synchronous, and do cheap distance/math filtering *before* touching the expensive C++ calls to keep your synchronous loop fast.

### Lazy generation: the galaxy starts (almost) empty

Avorion doesn't generate the whole galaxy up front. On a new save there are no pre-existing AI factions or populated sectors — the engine instantiates territory and factions **on demand** as players physically explore. If you're building any kind of background simulation (war heat, famine tracking, dynamic reputation), `server:getFactions()` returns nothing at the start of a save. Your background systems must tolerate an empty roster and pick up new factions as they're born — either via the `Galaxy:onFactionCreated(index)` callback, or by periodically polling `server:getFactions()`.

This isn't just about *new* factions born after your mod is already running — it's the same failure mode as a mod being **installed mid-playthrough**, onto a save where plenty of factions already exist. A one-time "generate my custom faction data" pass that only runs at your mod's own `initialize()` never revisits factions that existed before that pass ran, or that get created afterward through a code path you didn't anticipate. See "🔄 Self-Healing Systems" below for the general pattern (periodic reconciliation instead of a one-shot pass) and a real case study of exactly this happening.

---

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
- A namespaced script that fails to actually declare `-- namespace X` at the top but still relies on `X.updateServer` being called will silently fall back to the engine's default **15-second** background update interval instead of whatever `getUpdateInterval()` was supposed to return — a subtle source of "why is this so laggy" bugs.

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
---
> **Rule:** don't stop at "the file exists in my shipped source, so it must be the player's environment" — that explanation must survive a controlled retest (clean reinstall) before you treat it as the diagnosis. If it doesn't survive, the next thing to check is what's structurally different about *how* the failing script gets loaded (bootstrap-list vs. dynamically `addScript()`/`addScriptOnce()`-attached) rather than assuming file corruption a second time.
---
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

## 📊 The Stat Modifier System

This is the part of the API with the worst naming in the entire engine. Get comfortable with the underlying equation and the four functions stop being confusing.

### The equation

```LUA
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

### `entity.damageMultiplier` is real, but doesn't reliably move the needle on DPS

> [!NOTE]
> **Correction:** An earlier revision of this entry claimed `damageMultiplier` "isn't a property the C++ engine exposes for writing" and that assignments to it are silently discarded. That's wrong — `damageMultiplier = 0.0, -- float` is genuinely listed as a writable property on `Entity` in `Avorion Stubs/Entity.lua` (it's only `[read-only]` on the `ReadOnlyEntity`/`Turret` wrapper classes, not on `Entity` itself). This was found by grepping the per-class stub directly — the earlier check apparently never actually searched for this specific property name and just carried forward an unverified claim, which is exactly the failure mode that motivated retiring the old single-file `Avorion_Mega_Stub.lua` in favor of always searching `Avorion Stubs/` directly (see the Appendix).

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

`Sector:getEntitiesByType(type)` is documented in the vanilla API as `function Entity... getEntitiesByType(int type)` — that `Entity...` is Lua's vararg notation. The function returns one `Entity` per match as **separate return values**, not a single Lua table. `Sector:getTurrets()` and any other function whose signature ends in `...` follow the same rule.

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
- **`data/scripts/lib/turretgenerator.lua`** and **`sectorturretgenerator.lua`** build the full, physical, lootable turret entity (which internally uses a weapon generator). If you want a droppable turret item, this is the one you want:

```lua
local TurretGenerator = include("turretgenerator")
local turretGen = TurretGenerator(x, y)
Sector():dropTurret(pos, nil, nil, turretGen:generateArmed(x, y, 0, lootRarity))
```

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

---

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

### UI elements must be instantiated at load, not on demand

`PlayerWindow():createTab()` has to run inside the specific UI script's `initialize()` — you cannot create it later in response to an async event or a data callback; that either fails to render or conflicts with other mods' menus. Inject the script via `player:addScriptOnce("player/ui/myscript.lua")` from a central injector (typically `player/init.lua`), and let the engine natively fire `initialize()` client-side. You can toggle *visibility* later — the physical UI elements just have to exist from the start.

### `Player():getValue()` / `setValue()` are server-only — never call them from the client

These are server-side, `Faction`-inherited API methods. Calling `Player()` from a UI script's `initialize()` on the client returns an invalid C++ userdata handle, and any method call on it crashes with `obj->valid() check failed`. The correct architecture to sync server-held config or state down to a UI is a three-layer pattern:

1. **Server stores values** via `Server():setValue("mymod_key", value)` — persists across reloads.
2. **Client requests on load** via `invokeServerFunction("requestSync", keys)`; the server reads `Server():getValue()` and replies via `invokeClientFunction(player, "receiveSync", dataTable)`.
3. **Client caches the payload** in a module-local Lua table. All subsequent reads go through this cache, falling back to schema defaults while the async round-trip is in flight.

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

### Visual effects (`createExplosion`, `createGlow`) are client-only

`Sector():createExplosion(...)` and `Sector():createGlow(...)` throw a fatal exception if called from a server-side event script — which also aborts any subsequent logic in that same call (loot drops, entity deletion, etc. never run). Route visual effects to the client with `broadcastInvokeClientFunction(...)`, adding a global wrapper function for the RPC hook if the script isn't namespaced.

### Escape and hotkeys

The engine natively intercepts `Escape` to force-close every active UI frame, with priority over any Lua callback — so if you let players bind "Clear Keybind" to `Escape`, the whole menu just vanishes the instant they press it instead. Reserve `KeyboardKey.Delete`/`Backspace` for "clear" actions, and block `Escape` from being assignable as a custom keybind at all.

> ⚠️ **Unverified:** a commonly repeated claim in Avorion modding notes is that `onKeyPress` fires even while the player is typing in chat or a coordinate field, and that a function called `checkInputFocus()` exists to guard against it. **No such function appears anywhere in `Avorion Stubs/` or the vanilla script source** — it could not be confirmed. If your hotkey handler is firing while the player is typing, don't assume `checkInputFocus()` is the fix; test what vanilla actually does in that situation before shipping a workaround built on an unconfirmed API.

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

## 🌐 Multiplayer, Networking & Determinism

### `math.random()` is unsafe — use `random()`

Many scripts execute on **both** client and server. `math.random()` isn't seeded identically between them, so the two sides can disagree on the outcome — a classic source of UI/logic desync. Always use Avorion's deterministic `random()` object, or a seeded `Random(Seed(seedString))` when you need reproducibility.

Relatedly, `random():getInt()` called with **no bounds** returns the platform's maximum integer, not a sane default — multiplying a percentage by that spikes straight to effective infinity (instant invincible shields, timers scheduled millennia out). Use `random():getFloat()` for a safe fractional multiplier, or always bound your integers explicitly: `random():getInt(1, 100)`.

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

`UIsyncPosition` is expensive and will trip the engine's own anti-flood security ("Security: Ignored packet because queue is too full") if fired every frame inside `updateServer`. Never fire it unthrottled — gate it behind a timer (a few seconds) or fire it strictly on-demand, and skip it entirely if no UI actually depends on that position.

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

And for any timer that should only advance while the game is actually being played, use `Server().unpausedRuntime` rather than `Server().playtime` — `playtime` counts total wall-clock time including paused/offline periods, so a timer compared against it can expire while the server was simply switched off.

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

### Relation values are hard-capped — clamp before writing

Avorion's relation system is bounded to `[-100000, 100000]`. Adding a raw delta to a faction already at the boundary (e.g. `-100000 + -50000`) overflows that range, and passing the overflowed value straight into `Galaxy():setFactionRelations(f1, f2, value)` risks destabilizing the backend. Clamp every write:

```lua
local current = f1:getRelations(factionIndex2) or 0
local newRelation = math.max(-100000, math.min(100000, current + delta))
Galaxy():setFactionRelations(f1, f2, newRelation)
```

If you're changing relations from more than one place in your mod, centralize this into one helper so the clamp can never be forgotten.

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

### Renaming and the Galaxy Map ship list are locked out of Lua

`Alliance`/`Faction.name` is strictly read-only — there's no `setName()` exposed to Lua, and short of hand-editing `alliances.dat` while the server is offline, in-game renaming isn't reachable from a mod. The Galaxy Map's ship-list panel is likewise fully hardcoded in C++: the `GalaxyMap` Lua API can draw overlays, custom pins, and territory colors, but has zero hooks into that specific panel.

---

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

### `include("goods")` + `include("goodsindex")` for dynamic goods

Interacting with `goods["Some Good"]` or `tableToGood()` without both includes crashes with `attempt to index global 'goods' (a nil value)`. You don't need to hard-edit vanilla `goods.lua` to add new trade goods — dynamically injecting into `goodsArray`/`spawnableGoods` during a Galaxy script's `initialize()` works and stays compatible with other mods that do the same.

### Miscellaneous sector/mission notes

- `Sector():removeScript("sector/script.lua")` is fully supported for background hazards or environmental scripts (not just `Entity():removeScript`) — vanilla itself uses this pattern (`initfactionwar.lua`, `warzonecheck.lua`).
- `play3DSound(name, SoundType.Other, position, maxDistance, volume)` is available inside sector update loops for positional audio, distinct from UI sound calls.
- Global balancing functions use underscore-style names, not OO dot-notation: `Balancing_GetSectorRewardFactor(x, y)`, not `Balancing.GetSectorRewardFactor(x, y)`.
- To extend a closed vanilla background script (DLC content included) without overwriting the file outright, create a script at the *identical* mod-relative path and monkey-patch it: save the original function, redefine it to run your logic, then call the saved original so vanilla behavior is preserved.
- `getBulletin(station)`'s description text is evaluated the instant the player opens the Bulletin Board — before a mission that generates its target coordinates in `initialize()` (i.e. *after* acceptance) has any real data. Keep `getBulletin()` text generic; reserve dynamic interpolation for `mission.data.description`, which evaluates after `initialize()` has real values to work with.
- `ShipGenerator.createDefender(faction, matrix)` needs a real `Faction` object, not a raw index — recast first: `ShipGenerator.createDefender(Faction(enemyIndex), position)`.
- SFX volume above `1.0` spams the console (`Volume of sound effect is not between 0 and 1`) — hard-cap script-driven audio at `1.0`.
- Shipyard production timers live on the physical station entity and stop ticking the moment its sector unloads. To let a queued build keep progressing while the player is elsewhere, move the timer to a background `Player` script: pull the job data out via `Shipyard.secure()`, tick it in the background, and materialize the finished ship via progressive materialization (or `Sector():createShip()` if the player happens to be present when it completes).

---

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

> ⚠️ **Recalled from memory and logs, not re-verified against current Cosmic War source** — the exact file/function has since changed enough that it couldn't be pinned down again while writing this entry. Included because the *shape* of the bug and fix is a genuinely useful second data point; treat the specifics as per my own recollection, not a confirmed code citation like the two Ascendancy case studies above.

The same shape shows up outside mission triggers entirely. Cosmic War's faction diplomacy system (traits, War Heat) is meant to apply to every AI faction in the galaxy — but a player installing the mod mid-playthrough, onto a save with AI factions the vanilla engine had already generated (see "Lazy generation" above — factions are born on demand, not all at once), found that pre-existing factions never got proper traits or War Heat and simply never went to war like the mod intended. A setup pass that only ran once, for factions that existed *at that moment*, permanently missed every faction that existed before the mod was installed. This is the exact "Lazy generation" trap in different clothes: `Galaxy:onFactionCreated(index)` alone only catches factions born *after* your mod starts listening — it says nothing about the ones already sitting in `server:getFactions()` the moment your mod's `initialize()` runs. Treating faction setup as self-healing (periodically re-scan `server:getFactions()`, or check each faction for the traits/War Heat state your mod expects and apply it if missing, rather than trusting a single "have I ever processed this galaxy" flag) closes that gap for every faction regardless of when it — or the mod — first appeared.

### The consumer-side trap: check who else reads the flag

Making a flag self-healing changes what its *absence* means — and that's easy to get only half-fixed. Before the fix, a flag that's always set unconditionally the moment some point in the code is reached has exactly one meaning when it's absent: "hasn't reached that point yet." A self-healing fix changes it to only set the flag once the real condition it represents is *confirmed* true — which gives the flag's absent state a **second**, indistinguishable cause: "reached that point, but the real condition hasn't succeeded yet (retry pending)." Any other code that was written back when absence had only one meaning — reading it as proof of one specific, narrower thing — silently breaks the moment that second cause becomes possible, because it can no longer tell the two apart.

This isn't hypothetical. Fixing Cosmic Ascendancy's Aegis rendezvous scenes (six near-identical `onSectorEntered` blocks, one per story mission) to only set `ca_ready_for_debrief_N` once Aegis's ship was confirmed to actually exist — instead of unconditionally, the exact self-healing fix this section recommends — quietly broke each mission's own `updateServer()`, which treats `getValue("ca_ready_for_debrief_N") == nil` as proof the player already talked to Aegis and calls `finish()`. That assumption was safe *before* the fix (the flag was always set the instant the rendezvous sector was entered, so `nil` could only mean "already cleared by a real conversation"). After the fix, `nil` could *also* mean "ship spawn is still pending a retry" — and `updateServer()` had no way to tell those apart, so it would have silently finished the mission (no reward, no real debrief) the moment a spawn retry was in flight. The fix for the fix: a second, narrower marker (`mission.data.custom.debriefReady`) set only alongside a *confirmed*-successful flag write, with the `finish()` check gated on that marker instead of the flag's raw nil-ness.

> **Rule:** before shipping a self-healing fix, `grep` every other read site of the flag being changed. For each one, ask: does this code treat "the flag is absent" as proof of one *specific* prior event, rather than merely "the flag hasn't been set, for any reason"? If yes, that consumer needs its own fix — a narrower, unambiguous marker — before the self-healing change is safe to ship. A self-healing fix is not done until every consumer of the flag has been re-verified, not just the site you changed. The failure mode here has no error, no crash, no log line — it fails by silently treating a pending retry as an already-completed action, which can be worse than the bug the fix was meant to solve.

### When *not* to bother

Not every one-shot flag deserves this treatment — over-applying it is its own kind of clutter. The tell is the blast radius of the flag getting stuck: a chat broadcast, an audio cinematic banner, or a flavor-text "warning" message that never fires again for a save that already missed its window is a shrug, not a softlock — nobody's progress depends on it, and re-triggering it retroactively would often be *more* jarring than just letting it go (a "MASSIVE HYPERSPACE ANOMALY" banner popping up long after the moment it describes has passed reads as a bug, not a fix). Reserve self-healing for flags that gate state a player can get permanently stuck behind or that another system depends on existing — missions, factions, spawned NPCs, registered background managers — not for one-time narrative flourish.

---

## 🧩 Cross-Mod Compatibility

### Soft-dependency: wrap optional includes in `pcall`

If your mod merely *benefits* from another mod being present (an optional add-on relying on a shared core library), wrap the include: `pcall(require, "module")` (or `pcall(include, ...)`) so a missing dependency doesn't crash your script outright.

### Hard-dependency: don't wrap it, and don't hard-`include()` a sister mod either

For mods in a tightly-coupled *required* suite (all needing a shared core library), don't wrap the shared include in `pcall` — let a broken installation fail loudly instead of silently misbehaving.

But if two *sibling* mods in that suite need to share data with each other (not just the shared core), don't hard-`include()` one sibling's files from the other — that creates a real physical dependency between mods that are supposed to be independently optional. Instead, have the source mod serialize what it needs to share into a delimited string pushed to global state, and have the consumer parse it defensively:

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

---

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
| Mod installed mid-save | A one-time setup pass at `initialize()` only touching factions/state that exist right then | Periodically re-scan (`onFactionCreated` + polling `getFactions()`), don't trust a single pass |
| `include error` from one mod's own folder in a player's log | Assuming your script is broken, OR assuming it's always a corrupted download | Check your own source first; if clean, verify the "corrupted download" theory survives a clean reinstall before trusting it — see the VFS section |
| `%_t`/`%_T` at global scope | `locLines.a = "Hi"%_t` at module top-level in an `addScriptOnce`'d file | Wrap in `if onClient() then ... end`, or move inside a function |
| Inverted server guard | `if not onServer() then return end` treated as a client-safety guard | It forces server-**only** execution — the opposite; still needs its own `%_t` protection inside |
| `attempt to perform arithmetic on a string value` from a `%_t`/`%_T` line | File never reaches `stringutility.lua` (no direct or transitive `include`) | `include("stringutility")` directly in the file, regardless of scope |
| `attempt to get length of a userdata value` | `local x = sector:getEntitiesByType(t)` | `local x = {sector:getEntitiesByType(t)}` — it returns multiple values, not a table |
| Unrestricted debug RPC | A `callable()`-registered function gated only by a client-side `if _debug then` wrapper | Add a server-side `Owner()`/`callingPlayer` ownership check inside the function itself |
| `restore()` silently doesn't restore anything | `local x = ...` inside `restore()`, shadowing a module-scope `local x` other functions read | `x = ...` (no `local`) to update the actual outer variable |

---

## 📚 Appendix — Engine Trivia & Hard Limitations

### What's genuinely locked behind C++ (can't be modded around)

1. **Physics & collision.** Mass-inertia, bounce, and block-by-block penetration are entirely C++. Lua can apply multipliers to the result, not replace the solver.
2. **True multithreading.** The sandboxed per-entity Lua VM model makes real cross-script multithreading impossible — no spawning native threads from Lua.
3. **Raw networking.** No sockets. All client-server communication is sanitized and routed through `invokeServerFunction`/`invokeClientFunction`; you cannot run your own network server from inside the client.
4. **Low-level UI/shaders.** UI is limited to the `UIContainer` primitives (buttons, labels, rectangles...). No arbitrary OpenGL calls, and no dynamically compiling/binding custom GLSL shaders from a script.
5. **The core server loop.** Tick rate, matchmaking, chunk (sector) loading, and base entity-component serialization are hardcoded — none of it lives in reachable Lua.

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

This returns roughly `7.54` at the galactic core. Avorion's own baseline material strength constant is `11.39` (see `Documentation/Material.html`) — it isn't sector-dependent. The result mostly governs the *appearance/spawn probability* of materials in a sector rather than being a direct HP source, though the game's own encounter balancing multiplies it against average ship volume to approximate a target time-to-kill for vanilla content.

> ⚠️ Hull penetration does not behave correctly against projectile weapons specifically — don't design boss mechanics that depend on it working for projectile-based attacks.

### Bulk inventory additions need a loop

`inventory:add(item, 500)` adds **one** copy of the item, not 500 — the count argument isn't a bulk multiplier. Loop it yourself: `for i = 1, amount do inventory:add(item) end`.

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
