const fs = require('fs');
const buf = fs.readFileSync('ParameterRandomizer.amxd');
const str = buf.slice(0, 100).toString('utf-8');
console.log(str.replace(/\n/g, '\\n').replace(/\r/g, '\\r'));
