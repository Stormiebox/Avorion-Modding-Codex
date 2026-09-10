# 🚀 Welcome to the Avorion Modding Codex

The **Avorion Modding Codex** is a practical, field-tested guide to Avorion's Lua modding API — written by a modder, for modders. It's not a copy of the official API documentation, and it's not a tutorial series. It's a collection of hard-won, verified lessons about how the engine actually behaves: the gotchas that don't show up in the docs, the silent failures that never throw an error, and the patterns that hold up once real players are hitting them on a live server.

**👉 Start reading: [`Avorion Modding Codex`](https://github.com/Stormiebox/Avorion-Modding-Codex/wiki)**

---

## 📖 What this is

Every entry in the Codex follows the same shape: what the engine actually does, why it surprises people, and the pattern that works instead. Where a claim can be checked against `Avorion Stubs` (the per-class Lua API reference), the raw HTML API docs, or Avorion's own vanilla script source, it was — and where an earlier version of an entry turned out to be wrong, you'll find a `> [!NOTE]` **Correction** callout explaining what changed and why, rather than a silent edit. A handful of entries that couldn't be independently confirmed are marked ⚠️ **Unverified**, so you know to test before relying on them.

This isn't a document that was written once and left alone — it's actively maintained, and its own mistakes are part of the record. That's deliberate: a modding reference that presents unchecked assumptions with the same confidence as verified facts is worse than no reference at all.

## 🎯 Who this is for

Aimed at **novice-to-intermediate Avorion modders** — if you already know some Lua and want to understand *why* Avorion's engine behaves the way it does, this is for you. Experienced modders will find a lot of it to be common sense, but there's still plenty here that only surfaced through real, in-production bugs across a full suite of shipped mods.

## 🧭 Why this exists

This Codex started as a personal development diary — a running record of every engine gotcha, crash cause, and silent-failure trap discovered while building and maintaining the **Cosmic** mod series (Cosmic Vault, Cosmic Overhaul, Cosmic War, Cosmic Chronicles, Cosmic Ascendancy, and Cosmic Starfall). That diary grew past 4,700 lines — and a lot of what filled it wasn't project-specific. It was the kind of thing *any* Avorion modder would eventually hit: a property that looks like it should exist but doesn't, a callback that silently never fires, a pattern that works in Lua generally but crashes specifically in Avorion's engine.

Avorion is a genuinely difficult game to mod — a lot of functionality is locked behind the C++ engine, the documentation doesn't always tell the whole story, and there's no substitute for someone having already hit the crash and traced it back to its actual cause. Keeping that knowledge locked in a private diary helps exactly one person. Compiling it, fact-checking it against real sources, and publishing it helps the whole modding community — including the next person who would otherwise burn a weekend rediscovering the same bug.

That's the whole reason this repository is public and open source: so the lessons don't have to be learned twice, and so other modders can contribute their own hard-won findings back into the same place, verified and cross-referenced the same way.

## 🤝 Get involved

Found something wrong, confirmed one of the ⚠️ **Unverified** entries, or have a lesson of your own worth sharing? See [CONTRIBUTING.md](https://github.com/Stormiebox/Avorion-Modding-Codex/blob/main/CONTRIBUTING.md) for how to propose an addition or correction.

---

## 🧰 Useful Avorion Modding Resources & Tools

- **[riandrake/AvorionModTools](https://github.com/riandrake/AvorionModTools)** — a script that monkey-patches the Avorion API documentation, replacing function definitions throughout with hyperlinks wherever an Avorion type (with documentation nearby) is found. This is also the source of the `Avorion Stubs/` mirror kept in this repository — full credit to that project.
- **[Avorion Modding Wiki](https://avorion.fandom.com/wiki/Modding)** (avorion.fandom.com) — the community wiki's modding landing page.
- **[Writing your own Mod](https://avorion.fandom.com/wiki/Writing_your_own_Mod)** — a walkthrough of the basics of putting a mod together.
- **[Mod Examples](https://avorion.fandom.com/wiki/Mod_Examples)** — several example and proof-of-concept mods uploaded by Boxelware themselves, meant as a stepping stone for new mods and a demonstration of how the modding API works.
- **[Your Music In-Game After Patch 0.21](https://community.boxelware.com/index.php?/topic/5284-avo-v138-bb-20-your-music-in-game-after-patch-021/)** (Boxelware's official forum) — an experienced modder's explanation of how modding audio files in Avorion works.
- **[Scripting API Requests](https://community.boxelware.com/index.php?/topic/4777-scripting-api-requests/)** (Boxelware's official forum) — the place to ask Boxelware to open up or change something for modding.

## 📘 Lua Resources & Guides

- **[Programming in Lua (first edition, online)](https://www.lua.org/pil/contents.html)** — the online version of *Programming in Lua*, a detailed and authoritative introduction to Lua written by Lua's chief architect. Aimed at Lua 5.0, but still largely relevant to later versions (including Avorion's Lua 5.1) — all corrections from the published errata have already been applied to the online text.
- **[lua-users wiki: LuaDirectory](http://lua-users.org/wiki/LuaDirectory)** — a top-level directory of all Lua-related content on the lua-users wiki, grouped by topic.

---

*This page is the home page for the [Avorion Modding Codex wiki](https://github.com/Stormiebox/Avorion-Modding-Codex/wiki). See the repository itself for the Codex document, contribution guidelines, and the bundled API reference sources.*
