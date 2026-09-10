# Contributing to the Avorion Modding Codex

Thanks for wanting to add to this. The Codex only stays useful if every entry in it is actually true — so the bar for a contribution is **"can this be checked against something real,"** not just "this sounds right." Here's how to make a PR that's easy to accept.

## 📄 Licensing a contribution

By submitting a pull request, you confirm that you have the right to submit the material you are
adding or changing. If an original contribution is accepted into the Codex, it will be distributed
under the repository's [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) license unless
another arrangement is agreed with the maintainer before acceptance. You keep copyright in your own
contribution; acceptance gives the project permission to distribute it under that license.

Do not submit copied or derived material unless its source license permits redistribution and the
required attribution is included. See [`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md) for the
repository's known third-party and derived material.

---

## 🧭 Before you start

- **Read a couple of existing entries first.** The Codex has a consistent voice and structure (see [Match the format](#-match-the-existing-format) below) — skim [🏁 Start Here](Codex%20Main/Avorion_Modding_Codex.md#-start-here--core-concepts) to get a feel for it before writing your own.
- **Search first.** If your lesson might already be covered (even partially), extend or correct that entry instead of creating a near-duplicate. Use your editor's search across `Codex Main/Avorion_Modding_Codex.md`, or check the Table of Contents.
- **One topic per PR** where reasonably possible. Small, focused PRs get reviewed and merged faster than a single PR that touches five unrelated sections.

## ✅ What makes a good addition

A new entry (or a correction to an existing one) should be **verifiable**, in one of these ways:

1. **Checked against `Avorion Stubs`** — the per-class Lua API reference converted from the game's own HTML docs. If a property/method genuinely exists (or doesn't), this is how you prove it. A copy lives right in this repo at [`Avorion Stubs/`](Avorion%20Stubs/) (mirrored from [riandrake/AvorionModTools](https://github.com/riandrake/AvorionModTools)) — no separate setup needed.
2. **Checked against the raw HTML API docs** — the ground-truth source the stubs were generated from. Useful when a stub lookup comes back empty, since the stub conversion has occasionally dropped a real property. Also mirrored here, at [`Avorion API Indexes Documentation/`](Avorion%20API%20Indexes%20Documentation/).
3. **Checked against vanilla script source** — proof by actual, shipping usage. If a vanilla file does something a certain way on every dedicated server that's ever run the game, that's strong evidence. (Not bundled in this repo — pull it from your own game install.)
4. **A confirmed, reproducible bug or crash** — something you hit in your own mod, with the actual error message and enough context (file, function, call shape) for someone else to recognize the same failure if they hit it.

> If you suspect either mirrored source (`Avorion Stubs/` or the HTML docs) has drifted out of date against a newer Avorion release, say so in your PR — regenerating them is out of scope for a typical Codex contribution, but flagging it helps a maintainer catch it.

**If you can't independently confirm something** — a claim from memory, something you read elsewhere, a pattern that *seems* to work but you haven't stress-tested — that's still worth submitting, but mark it clearly:

```markdown
> ⚠️ **Unverified:** <your claim, and why you believe it, and what would confirm or deny it>
```

Don't present a guess with the same confidence as a checked fact. The Codex has a track record of catching its own past mistakes this way (see the `> [!NOTE]` **Correction** callouts scattered throughout) — that's a feature of the format, not a flaw to avoid mentioning.

## 📐 Match the existing format

Every addition should look like it belongs in the document, not like it was pasted in from somewhere else:

- **Section structure:** numbered `##` sections with an emoji, listed in the Table of Contents; `###` sub-lessons within them. If you're adding an entirely new top-level section, update the TOC and renumber what follows.
- **Callouts:** `> [!NOTE]`, `> [!WARNING]`, `> [!TIP]`, `> **Rule:**`, `> ⚠️ **Unverified**` — used the same way they're already used elsewhere in the document. Don't invent a new callout style.
- **Code examples:** paired ` ```lua ` blocks labeled `-- WRONG:` / `-- CORRECT:` (or `-- THE ORIGINAL SHAPE OF THE BUG` / `-- THE FIX:` for a longer case-study), matching the terse, comment-annotated style already in use.
- **Voice:** first-person, modder-to-modder, practical, no filler. Explain *why* the engine surprises people, not just *that* it does.
- **Cross-reference, don't repeat.** If a related lesson lives elsewhere in the Codex, link to it (`see "🔄 Self-Healing Systems" below`) rather than re-explaining it.
- **The Quick-Reference table.** If your addition is the kind of at-a-glance lookup that section is for, add a row to it too.

## 🔍 Correcting something that's wrong

Found an existing entry that's outdated, incomplete, or flat-out wrong? Don't silently delete or rewrite it — use the Codex's own self-correction convention so future readers can see *what* changed and *why*:

```markdown
> [!NOTE]
> **Correction:** This entry previously claimed X. That's wrong — <what's actually true, and the source that confirms it>.
```

This preserves the paper trail. A reader should be able to trust that the current text is correct *and* understand that this document is actively maintained, not something to take on faith forever.

## 🚀 Making the PR

1. Fork the repo and branch off `main`.
2. Make your change to `Codex Main/Avorion_Modding_Codex.md` (or the relevant file).
3. Open a pull request using the PR template — it'll ask you what you're adding/changing and how you verified it.
4. Be ready for a follow-up question or two if the verification isn't clear from the PR description — that's normal, not a rejection.

If you're not sure whether something belongs, or you want a sanity check before writing it up, feel free to open an issue first and describe what you found.

Thanks for helping keep this accurate — that's the entire point of it existing.
