# 🚀 Avorion Modding Codex

[Avorion Modding Codex Wiki Page](https://github.com/Stormiebox/Avorion-Modding-Codex/wiki)

[![Original documentation: CC BY-SA 4.0](https://img.shields.io/badge/Original%20documentation-CC%20BY--SA%204.0-brightgreen.svg)](https://creativecommons.org/licenses/by-sa/4.0/)

A practical, field-tested guide to Avorion's Lua modding API — written by a modder, for modders. It compiles hard-won lessons learned throughout Stormbox's own modding journey, especially across the **Cosmic Series** of Avorion mods.

**👉 Read the guide: [`Avorion Modding Codex (Wiki)`](https://github.com/Stormiebox/Avorion-Modding-Codex/wiki/Avorion-Modding-Codex)**

Aimed at novice-to-intermediate Avorion modders — if you already know Lua and want to understand *why* the engine behaves the way it does, this is for you.

> [!NOTE]
> The document and Wiki are updated continuously as information is fact-checked against Avorion's own game assets and community resources. A lot of it will already be common sense to the most experienced Avorion modders — but there's still plenty in here that took real, in-production bugs to uncover.

## 📁 What's in this repository

| Path | What it is |
|---|---|
| [`Codex Main/Avorion_Modding_Codex.md`](Codex%20Main/Avorion_Modding_Codex.md) | The Codex itself — start here. |
| [`Avorion Stubs/`](Avorion%20Stubs/) | Per-class Lua API stubs for Avorion, mirrored here for convenience. Sourced from [riandrake/AvorionModTools](https://github.com/riandrake/AvorionModTools) — full credit to that project for the generation tooling. |
| [`Avorion API Indexes Documentation/`](Avorion%20API%20Indexes%20Documentation/) | The raw HTML API docs Avorion ships internally for modders, mirrored here so Codex references can be checked without digging through your own game files. |
| [`Miscallenous Documents/`](Miscallenous%20Documents/) | Supplementary write-ups on specific systems (e.g. how Avorion's in-game Mail system works). |
| [`CONTRIBUTING.md`](CONTRIBUTING.md) | How to propose an addition or correction — verification standards, format, PR process. |
| [`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md) | Attribution and licensing boundaries for copied or derived reference material. |

> [!NOTE]
> `Avorion Stubs/` and `Avorion API Indexes Documentation/` are convenience mirrors, not the canonical source — if either ever looks out of date against a newer Avorion release, the upstream tool/game files are the ground truth to regenerate from.

## 🤝 Contributing

This project is open source and welcomes pull requests from the Avorion modding community — corrections, confirmations of the entries marked ⚠️ **Unverified**, and new findings of your own. See **[CONTRIBUTING.md](CONTRIBUTING.md)** for the ground rules.

## 📄 License

Unless otherwise stated, original documentation in this repository is licensed under
[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

Third-party and derived material is not automatically covered by that license. See
[`LICENSE`](LICENSE) and [`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md) for the full scope,
attribution, and licensing boundaries.
