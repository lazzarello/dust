engine.name = "Filterbank"

local ControlSpec = require "controlspec"
function init()
  -- param/controlspec pairs
  db1_spec = ControlSpec.new(-90, 24, "db", 1, 0, "db")
  params:add{type = "control", id = "db1", name = "Band 1 gain", controlspec = db1_spec, action = engine.db1}
  db2_spec = ControlSpec.new(-90, 24, "db", 1, 0, "db")
  params:add{type = "control", id = "db2", name = "Band 2 gain", controlspec = db2_spec, action = engine.db2}
  db3_spec = ControlSpec.new(-90, 24, "db", 1, 0, "db")
  params:add{type = "control", id = "db3", name = "Band 3 gain", controlspec = db3_spec, action = engine.db3}
  db4_spec = ControlSpec.new(-90, 24, "db", 1, 0, "db")
  params:add{type = "control", id = "db4", name = "Band 4 gain", controlspec = db4_spec, action = engine.db4}

  freq1_spec = ControlSpec.new(20, 300 , "lin", 1, 150, "hz")
  params:add{type = "control", id = "freq1", name = "Band 1 frequency", controlspec = freq1_spec, action = engine.freq1}
  freq2_spec = ControlSpec.new(280, 800 , "lin", 1, 440, "hz")
  params:add{type = "control", id = "freq2", name = "Band 2 frequency", controlspec = freq2_spec, action = engine.freq2}
  freq3_spec = ControlSpec.new(780, 3333 , "lin", 1, 1500, "hz")
  params:add{type = "control", id = "freq3", name = "Band 3 frequency", controlspec = freq3_spec, action = engine.freq3}
  freq4_spec = ControlSpec.new(3000, 20000 , "lin", 1, 5000, "hz")
  params:add{type = "control", id = "freq4", name = "Band 4 frequency", controlspec = freq4_spec, action = engine.freq4}

  rq1_spec = ControlSpec.new(0.1, 4, "lin", 0.1, 1, "q")
  params:add{type = "control", id = "rq1", name = "Band 1 resonance", controlspec = rq1_spec, action = engine.rq1}
  rq2_spec = ControlSpec.new(0.1, 4, "lin", 0.1, 1, "q")
  params:add{type = "control", id = "rq2", name = "Band 2 resonance", controlspec = rq2_spec, action = engine.rq2}
  rq3_spec = ControlSpec.new(0.1, 4, "lin", 0.1, 1, "q")
  params:add{type = "control", id = "rq3", name = "Band 3 resonance", controlspec = rq3_spec, action = engine.rq3}
  rq4_spec = ControlSpec.new(0.1, 4, "lin", 0.1, 1, "q")
  params:add{type = "control", id = "rq4", name = "Band 4 resonance", controlspec = rq4_spec, action = engine.rq4}
  params:bang()
end
