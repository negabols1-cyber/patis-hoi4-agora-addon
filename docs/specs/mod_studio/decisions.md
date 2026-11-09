# Mod Studio decisions

Consultation held on 2026-11-08 for a local modding suite modelled on Nova Modding Suite (Ultra-XT/HOI4-Modding-Suite) and the previews of HOI4 Mod Utilities.
The user answered "katılıyorum yap" and added that the AI support of the focus editor (sending a selection to Claude) must stay.

Status on 2026-11-08: stage 1 and the country part of stage 2 (countries and characters) are implemented in `.tools/mod_studio/` (described in `.tools/README.md`); the technology part of stage 2 waits for the user's go-ahead (D-11), and stage 3 is deferred.

| ID | Item | Decision | Origin | Date | Basis |
| --- | --- | --- | --- | --- | --- |
| D-01 | Reference tool | "HOI4 Modding (Edge)" is read as HOI4 Mod Utilities (VS Code); its previews and Nova's module set are the references | user | 2026-11-08 | Consultation answer (suggestion accepted) |
| D-02 | Application type | Grow the existing local browser editor into a multi-module "HOI4 Mod Stüdyosu"; no desktop shell | user | 2026-11-08 | Consultation answer (suggestion accepted) |
| D-03 | Stages | Stage 1: shared shell (navigation, global search, Claude box everywhere) + national spirits + decisions + events (window preview, chain graph) + Mod Health. Stage 2: country setup (politics, popularities, leaders and portraits, starting technologies, flag, new country) + technology trees. Stage 3: map | user | 2026-11-08 | Consultation answer (suggestion accepted); Mod Health placed in stage 1 by agent |
| D-04 | Map scope | State level: owner, controller, cores, claims, manpower, category, buildings, resources, victory points, brush painting of ownership. No province shape painting in provinces.bmp | user | 2026-11-08 | Consultation answer (suggestion accepted) |
| D-05 | Vanilla content | Editing content that exists only in vanilla copies the file into the mod first, and the page says so | user | 2026-11-08 | Consultation answer (suggestion accepted) |
| D-06 | Mod Health | A page runs the repository checks and links each finding to the right editor | user | 2026-11-08 | Consultation answer (suggestion accepted) |
| D-07 | Event preview | A close HOI4-style window (picture, title, text, option buttons); the exact game GUI and fonts may come later | user | 2026-11-08 | Consultation answer (suggestion accepted) |
| D-08 | AI support | Every module keeps the "Claude'a gönder" box with the selected element as context, through the same bridge as the focus editor | user | 2026-11-08 | User addition to the consultation answer |
| D-09 | Structure | The focus editor becomes a module of the studio; one server, one desktop shortcut, one bridge | agent default | 2026-11-08 | Avoid two tools doing the same thing |
| D-10 | Editing model | Only changed keys or blocks are rewritten, every save is backed up, English localisation only, local-only tool without publishing-grade hardening | established | 2026-11-08 | Focus editor behaviour and recorded user preferences |
| D-11 | Stage 2 scope | Build the country setup now, with a Characters module for leaders and portraits; the map (stage 3) is deferred; the technology part of stage 2 is asked about after countries | user | 2026-11-08 | "2.aşamaya geçelim (harita kısmı hariç ...) ama ülkeler kısmını yapabiliriz" |
| D-12 | Overriding game text | A localisation key the game also defines is written to `localisation/english/replace/` unless the mod already overrides it there | agent default | 2026-11-08 | Wiki `localisation.md`, "Replacing": duplicates outside a `replace` folder tend to lose to the game's files |
| D-13 | History statements in DLC branches | Widgets edit the history file's top level; a setup written only inside `if` blocks is shown in the overview from the first branch and edited as text | agent default | 2026-11-08 | 3 of 382 history files (AFG, BUL, DEN) keep politics only in DLC branches; nested editing is not needed for the rest |
| D-14 | Image generation in the icon picker | Every icon picker can send a description to Claude (bridge kind `image`, with the picker's hoi4-imagegen family); Claude runs the full hoi4-imagegen loop and registers the sprite, never edits the element, and the picker lists the new sprites first for the user to pick | user | 2026-11-08 | "icon seçerken icon generation seçeneğimiz olsun"; the hoi4-imagegen skill forbids a second image pipeline and needs an agent review before install |
