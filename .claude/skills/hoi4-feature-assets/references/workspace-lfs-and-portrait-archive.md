# HOI4 Feature Assets: Workspace, Git LFS and portrait archive

Part of the [hoi4-feature-assets](../SKILL.md) skill. Read before creating or cleaning up a feature asset workspace, hydrating Git LFS asset files or archiving a sourced portrait.

## 2.3 Temporary feature-workspace lifecycle

Treat project-root `docs/assets/<feature_slug>/` as temporary evidence and working material, except for explicitly durable archives such as the portrait source archive described below. Keep source files, previews, contact sheets, manifests, provenance, research notes, and handoffs while work is active, blocked, awaiting review, or undergoing acceptance scenarios.

Before declaring the feature fully complete:

1. Promote durable provenance, licensing, attribution, requirement-to-runtime crosswalks, review results, accepted handoff facts, and blocker or exception notes into permanent feature, plan, spec, super-event, or system documentation.
2. Move final runtime assets into engine-facing folders and verify every `.gfx`, `.gui`, audio, or gameplay reference.
3. Verify that no runtime reference points into `docs/assets/`.
4. Delete the complete feature-scoped temporary workspace, including empty subfolders, and verify that it is absent. Never delete a separately designated durable archive as part of this cleanup.

An absent temporary workspace is expected after a fully complete goal. If the feature is incomplete or blocked, retain it and report the blocker. Never delete skill-local reference libraries or another feature's workspace.

## 2.4 Asset repository preflight and Git LFS hydration

Before processing a large asset set, classify paths by role: `.gfx` files are text registries, while `.png`, `.dds`, `.wav`, and other artwork or audio paths are binary candidates, and modified files outside the requested scope must remain untouched.

- Detect Git LFS pointer stubs from the exact pointer signature, not byte size: the first line is exactly `version https://git-lfs.github.com/spec/v1`, followed by `oid sha256:<hex>` and `size <integer>` lines.
- File size alone is not validity evidence; legitimate tiny images such as 10x7 flags may be under 1 KB.
- If the required objects are present in `.git/lfs/objects`, run a scoped `git lfs checkout <paths>` first, limited to the requested binary paths; `git lfs checkout` preserves modified files.
- Use `git lfs fetch` or `git pull` only when objects are missing and the task explicitly authorizes network or repository updates; never broaden the scope or discard local edits.
- For every expected LFS path, compare the working file's SHA-256 to its index OID from `git lfs ls-files -l`, then confirm zero remaining pointer stubs.
- If checkout reports an index-refresh warning after writing real content, retain the content/OID verification as authoritative and record the warning in the handoff.
- After hydration, validate image and audio containers with format-aware decoders or parsers, such as DDS header and pixel checks or WAV metadata checks, rather than size heuristics.



