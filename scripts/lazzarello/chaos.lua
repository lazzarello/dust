engine.name = "Chaos"

local hid = require 'hid'
local ControlSpec = require "controlspec"

function init()
  print("I'm loud")
  params:add{type="control", id="hz", name= "Sine Freqency",
    controlspec=ControlSpec.new(10,10000,"exp",10,3000,"hz"),
    action = engine.hz
  }
  params:add{type="control", id="amp", name= "Sine Amplitude",
    controlspec=ControlSpec.new(0.1,100.0,"lin",0,10,"db"),
    action = engine.amp
  }
end

local tablet = nil
--tablet = hid.findDeviceSuporting('ABS_PRESSURE')
--tablet.print()