autowatch = 1;
inlets = 1;
outlets = 3; // 0=status text, 1=current value, 2=debug

var paramApi = null;
var mappedId = 0;
var amount = 1.0; // 0..1 blend between current and random target

function loadbang() {
  _status("Ready. Select a parameter in Live, then click Map Selected.");
  outlet(1, 0);
}

function bang() {
  randomize();
}

function map_selected() {
  try {
    var selected = new LiveAPI(null, "live_set view selected_parameter");
    if (!selected || !selected.id || selected.id === 0) {
      _status("No selectable Live parameter is currently selected.");
      return;
    }

    mappedId = selected.id;
    paramApi = new LiveAPI(null, "id " + mappedId);

    var name = _stringProp(paramApi, "name");
    var min = _numProp(paramApi, "min", 0);
    var max = _numProp(paramApi, "max", 1);
    var current = _numProp(paramApi, "value", min);

    _status("Mapped: " + name + " (" + _fmt(min) + " .. " + _fmt(max) + ")");
    outlet(1, current);
  } catch (e) {
    _status("Map failed: " + e);
    outlet(2, "map_selected error", String(e));
  }
}

function clear_map() {
  mappedId = 0;
  paramApi = null;
  _status("Mapping cleared.");
}

function set_amount(v) {
  var n = parseFloat(v);
  if (isNaN(n)) return;
  amount = _clamp(n, 0, 1);
  _status("Amount: " + _fmt(amount * 100) + "%");
}

function randomize() {
  if (!paramApi || !mappedId) {
    _status("Nothing mapped. Select a parameter in Live and click Map Selected.");
    return;
  }

  try {
    // Refresh the handle from the stored id in case the object reference went stale.
    paramApi = new LiveAPI(null, "id " + mappedId);
    if (!paramApi || !paramApi.id || paramApi.id === 0) {
      _status("Mapped parameter is no longer available.");
      return;
    }

    var min = _numProp(paramApi, "min", 0);
    var max = _numProp(paramApi, "max", 1);
    var current = _numProp(paramApi, "value", min);
    var isQuantized = _numProp(paramApi, "is_quantized", 0) ? 1 : 0;

    var target = min + Math.random() * (max - min);
    var next = current + (target - current) * amount;

    if (isQuantized) {
      next = Math.round(next);
    }

    next = _clamp(next, min, max);
    paramApi.set("value", next);

    var name = _stringProp(paramApi, "name");
    _status("Randomized " + name + " -> " + _fmt(next));
    outlet(1, next);
  } catch (e) {
    _status("Randomize failed: " + e);
    outlet(2, "randomize error", String(e));
  }
}

function _getProp(api, prop) {
  var raw = api.get(prop);
  if (raw === null || typeof raw === "undefined") return null;

  // LiveAPI often returns arrays like ["value", 0.5] or ["name", "Filter Freq"].
  if (raw instanceof Array) {
    if (raw.length === 0) return null;
    if (raw[0] === prop) {
      if (raw.length === 2) return raw[1];
      return raw.slice(1);
    }
    if (raw.length === 1) return raw[0];
    return raw;
  }
  return raw;
}

function _numProp(api, prop, fallback) {
  var v = _getProp(api, prop);
  if (v instanceof Array) v = v[0];
  var n = parseFloat(v);
  return isNaN(n) ? fallback : n;
}

function _stringProp(api, prop) {
  var v = _getProp(api, prop);
  if (v === null || typeof v === "undefined") return prop;
  if (v instanceof Array) return v.join(" ");
  return String(v);
}

function _status(msg) {
  outlet(0, msg);
}

function _clamp(v, lo, hi) {
  return Math.max(lo, Math.min(hi, v));
}

function _fmt(n) {
  return (Math.round(n * 1000) / 1000).toString();
}

