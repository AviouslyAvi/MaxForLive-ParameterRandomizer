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
