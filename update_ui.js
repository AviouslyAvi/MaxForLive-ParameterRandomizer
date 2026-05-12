const fs = require('fs');

function processFile(filename) {
    if (!fs.existsSync(filename)) {
        console.log(`File not found: ${filename}`);
        return;
    }

    let buf = fs.readFileSync(filename);
    let jsonStr = buf.toString('utf-8');

    // Find first '{'
    const firstBraceIndex = jsonStr.indexOf('{');
    if (firstBraceIndex === -1) {
        console.log(`Could not find start brace in ${filename}`);
        return;
    }

    // Find last '}'
    const lastBraceIndex = jsonStr.lastIndexOf('}');
    if (lastBraceIndex === -1) {
        console.log(`Could not find end brace in ${filename}`);
        return;
    }

    let isAmxd = filename.endsWith('.amxd');

    let headerStr = jsonStr.slice(0, firstBraceIndex);
    let patcherStr = jsonStr.slice(firstBraceIndex, lastBraceIndex + 1);
    let tailStr = jsonStr.slice(lastBraceIndex + 1);

    let data;
    try {
        data = JSON.parse(patcherStr);
    } catch (e) {
        console.log(`Failed to parse JSON for ${filename}: ${e}`);
        return;
    }

    const boxes = data.patcher.boxes;
    let modified = 0;

    boxes.forEach(b => {
        let box = b.box;

        // 1. Auto toggle -> live.toggle
        if (box.maxclass === 'toggle') {
            box.maxclass = 'live.toggle';
            box.saved_attribute_attributes = {
                "valueof": {
                    "parameter_enum": ["off", "on"],
                    "parameter_longname": "Auto",
                    "parameter_mmax": 1,
                    "parameter_shortname": "Auto",
                    "parameter_type": 2
                }
            };
            if (box.checkedcolor) delete box.checkedcolor;
            if (box.bgcolor) delete box.bgcolor;
            if (box.bordercolor) delete box.bordercolor;
            modified++;
        }

        // 2. Interval ms -> live.numbox
        if (box.maxclass === 'number') {
            box.maxclass = 'live.numbox';
            box.saved_attribute_attributes = {
                "valueof": {
                    "parameter_longname": "Interval",
                    "parameter_shortname": "Interval",
                    "parameter_type": 0,
                    "parameter_mmin": 10,
                    "parameter_mmax": 10000,
                    "parameter_unitstyle": 2
                }
            };
            if (box.bgcolor) delete box.bgcolor;
            if (box.textcolor) delete box.textcolor;
            modified++;
        }

        // 3. Amount flonum -> live.dial
        // 4. Last Value flonum -> live.numbox
        if (box.maxclass === 'flonum') {
            if (box.maximum === 1.0) {
                box.maxclass = 'live.dial';
                box.saved_attribute_attributes = {
                    "valueof": {
                        "parameter_longname": "Amount",
                        "parameter_shortname": "Amount",
                        "parameter_type": 0,
                        "parameter_mmin": 0.0,
                        "parameter_mmax": 1.0,
                        "parameter_unitstyle": 1
                    }
                };
                if (box.bgcolor) delete box.bgcolor;
                if (box.textcolor) delete box.textcolor;
                if (box.accentcolor) delete box.accentcolor;
                if (box.patching_rect) {
                    box.patching_rect[2] = 44; // width
                    box.patching_rect[3] = 48; // height
                }
                if (box.presentation_rect) {
                    box.presentation_rect[2] = 44;
                    box.presentation_rect[3] = 48;
                }
                modified++;
            } else {
                box.maxclass = 'live.numbox';
                box.saved_attribute_attributes = {
                    "valueof": {
                        "parameter_longname": "LastVal",
                        "parameter_shortname": "LastVal",
                        "parameter_type": 0,
                        "parameter_mmin": -99999.0,
                        "parameter_mmax": 99999.0,
                        "parameter_unitstyle": 1
                    }
                };
                box.active = 0;
                if (box.bgcolor) delete box.bgcolor;
                if (box.textcolor) delete box.textcolor;
                if (box.accentcolor) delete box.accentcolor;
                modified++;
            }
        }
    });

    if (modified === 0) {
        console.log(`No changes needed for ${filename}`);
        return;
    }

    let newPatcherStr = JSON.stringify(data, null, 2);

    let headerBuf = buf.slice(0, buf.indexOf('{'));
    let tailBuf = buf.slice(buf.lastIndexOf('}') + 1);
    let patcherBuf = Buffer.from(newPatcherStr, 'utf-8');

    let finalBuf = Buffer.concat([headerBuf, patcherBuf, tailBuf]);

    fs.writeFileSync(filename, finalBuf);
    console.log(`Successfully updated ${filename}`);
}

const files = [
    'ParameterRandomizer.maxpat',
    'ParameterRandomizer.amxd',
    'ParameterRandomizer-Audio.amxd',
    'ParameterRandomizer-MIDI.amxd'
];

files.forEach(f => processFile(f));
