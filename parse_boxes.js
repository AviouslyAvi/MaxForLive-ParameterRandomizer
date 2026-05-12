const fs = require('fs');

const data = JSON.parse(fs.readFileSync('ParameterRandomizer.maxpat'));
const boxes = data.patcher.boxes;
boxes.forEach(b => {
    if (b.box.maxclass === 'message') {
        console.log(b.box.id, b.box.text);
    }
});
