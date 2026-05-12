# Max for Live Parameter Randomizer

**Location:** `Projects/Ableton/MaxForLive-ParameterRandomizer/`
**Type:** Max for Live device (`.amxd`) for Ableton Live
**Language:** Max patch + JavaScript via Max's `js` object

---

## What it is

A Max for Live device that **randomizes any Ableton Live parameter you select and map** to it. Useful for sound design, performance chaos, and exploring plugin parameter spaces quickly.

## Features

- **Map any parameter** — click a parameter in Ableton, then click `map_selected` in the device to lock it in.
- **Randomize on demand** — single-click randomization.
- **Auto-randomize** — internal `metro` object fires randomization at a user-set interval (ms).
- **Amount control** — a `0..1` blend between the current value and a random target, so you can nudge toward chaos rather than jumping to it.
- **Quantized parameters** (selector-style ones) are rounded to integers automatically.

## Beginner context

- **Max for Live** is a version of Cycling '74's Max patching environment that embeds inside Ableton Live. You build devices visually by connecting objects.
- **`.amxd`** is Ableton's device file format (the exported Max patch).
- **Live API** is Max's bridge into Ableton — it's how this device reads the "currently selected parameter" and writes new values.

## Files in this folder

- `ParameterRandomizer.maxpat` — the raw Max patch (open this in Max to edit)
- `ParameterRandomizer.amxd` — exported generic device
- `ParameterRandomizer-Audio.amxd` / `-MIDI.amxd` — Audio Effect and MIDI Effect exports (for drag-into-Live use)
- `m4l_param_randomizer.js` — the JS that does the actual randomization
- `update_ui.js`, `parse_boxes.js`, `test.js` — helper scripts

## How to use in Ableton

1. Open Max (with Max for Live installed).
2. Open `ParameterRandomizer.maxpat`.
3. **File → Save As…** and pick the appropriate device type (MIDI or Audio Effect — either works for parameter control).
4. Drag the saved `.amxd` onto a track in Live.
5. In Live, click the parameter you want to randomize so it becomes the selected parameter.
6. In the device UI, click `map_selected`.
7. Click `randomize` — or enable `Auto` and set an interval in ms.

## Gotchas

- Some parameters are unavailable depending on device state, automation lock, or whether Live permits remote setting at that moment.
- If the mapped parameter disappears (device removed/reloaded), click `map_selected` again to remap.
