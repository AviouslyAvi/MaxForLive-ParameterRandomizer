# MaxForLive-ParameterRandomizer — Router

A Max for Live device for Ableton Live. Maps the currently-selected Live parameter and randomizes it (one-shot or auto via `metro`). Implemented as a Max patch (`.maxpat`) plus JS scripts run by Max's `js` object.

## Folder structure

This is a flat project — no subfolders. Files at the root are grouped by role:

| File | Role |
|---|---|
| `ParameterRandomizer.maxpat` | Source Max patch (edit this in Max) |
| `ParameterRandomizer.amxd` | Exported generic Max for Live device |
| `ParameterRandomizer-Audio.amxd` | Audio Effect export (drag into Live audio tracks) |
| `ParameterRandomizer-MIDI.amxd` | MIDI Effect export (drag into Live MIDI tracks) |
| `m4l_param_randomizer.js` | Core randomization logic (Live API bindings) |
| `update_ui.js` | UI sync helper |
| `parse_boxes.js` | Patch object parsing helper |
| `test.js` | Manual JS sanity check |
| `README.md` | User-facing install/usage guide |
| `MaxForLive-ParameterRandomizer.md` | Internal project description |

## Naming conventions

- `.maxpat` — Max source patch (JSON). Edit in Max.
- `.amxd` — Ableton Max for Live device (binary; exported from a `.maxpat` via File → Save As).
- `.js` — runs inside Max's `js` object. Filename lowercase-with-underscores. Helper scripts are small and single-purpose.
- Three `.amxd` exports kept in sync with the same source `.maxpat`. Re-export all three after meaningful patch changes.

## Where to go for which task

| Task | File(s) |
|---|---|
| Edit the patch UI / object graph | `ParameterRandomizer.maxpat` (open in Max) |
| Fix or extend randomization logic | `m4l_param_randomizer.js` |
| Fix UI sync glitches | `update_ui.js` |
| Sanity-check JS or test in isolation | `test.js` |
| Update user docs | `README.md` |

## Workflow

1. Open `ParameterRandomizer.maxpat` in Max.
2. Edit patch or JS.
3. Save the `.maxpat`.
4. **Re-export all three `.amxd`s** via File → Save As (Audio Effect, MIDI Effect, generic) — otherwise installed copies in Live won't see the change.
5. Reload the device in Live to pick up changes.

## Gotchas

- Live API blocks some parameters from being set remotely depending on device state, automation lock, or current focus.
- Quantized parameters auto-round to integers.
- If the mapped parameter disappears (device removed/reloaded), click `map_selected` again in the device UI.

## Confidentiality

Code-only project. No credentials, no PII. `.gitignore` is minimal (just `.DS_Store`).
