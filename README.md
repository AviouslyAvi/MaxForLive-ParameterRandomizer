# Max for Live Parameter Randomizer

This folder contains a Max patch (`ParameterRandomizer.maxpat`) plus a JS script (`m4l_param_randomizer.js`) that randomizes whatever Ableton Live parameter you select and map.

## What it does

- Maps the currently selected Ableton parameter (using Live API)
- Randomizes that parameter on demand
- Supports auto-randomizing with a `metro` interval
- Supports an `Amount` control (`0..1`) to blend from current value toward a random target

## How to use in Ableton Live / Max for Live

1. Open Max (with Max for Live installed).
2. Open `ParameterRandomizer.maxpat`.
3. Save it as a Max for Live device (`.amxd`) using Max's **File -> Save As...** and choose the appropriate device type (MIDI or Audio Effect; either works for parameter control usage).
4. Drop the saved device onto a track in Ableton Live.
5. In Ableton, click any device parameter you want to randomize (so it becomes the selected parameter).
6. In the M4L patch UI, click `map_selected`.
7. Click `randomize` (or enable `Auto` and set an interval in ms).

## Notes

- Some parameters may be unavailable depending on device state, automation lock, or whether Live allows remote setting at that moment.
- Quantized parameters (e.g. selector-style params) are rounded to integer values automatically.
- If the mapped parameter disappears (device removed/reloaded), click `map_selected` again.

## Pre-built devices

Three `.amxd` exports are checked in for convenience — drop the one you need straight onto a Live track:

| File | Drop onto |
|---|---|
| `ParameterRandomizer-Audio.amxd` | Audio tracks |
| `ParameterRandomizer-MIDI.amxd` | MIDI tracks |
| `ParameterRandomizer.amxd` | Generic Max for Live device |

All three are exported from the same source patch (`ParameterRandomizer.maxpat`). If you edit the patch, re-export all three from Max via **File → Save As...** so installed copies in Live pick up the change.

## Files

```
ParameterRandomizer.maxpat       Source Max patch — edit this in Max
ParameterRandomizer*.amxd        Exported Max for Live devices (Audio / MIDI / generic)
m4l_param_randomizer.js          Core randomization logic (Live API bindings)
update_ui.js                     UI sync helper
parse_boxes.js                   Patch object parsing helper
test.js                          Manual JS sanity check
CLAUDE.md                        Root router for AI-assisted contributors
MaxForLive-ParameterRandomizer.md   Internal project description
```

## Requirements

- **Ableton Live** with **Max for Live** (Live 10+ / Max 8+ recommended).
- macOS or Windows — runs anywhere Live + Max for Live runs.

## Status

Working prototype. No automated tests; sanity-check via `test.js` and manual use in Live.

## Contributor / AI routing

See [CLAUDE.md](CLAUDE.md) for the routing map and editing workflow (re-export the three `.amxd`s after any patch change).
