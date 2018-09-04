engine.name = 'TestSine'

local g = grid.connect()

function init()
  sound = 1
  level = 1
  octave = 1
  f = 100
  position = 0
  engine.hz(f)
  engine.amp(0)
  g.all(0)
  g.all(5)
  g.refresh()
  -- print out the keys in the grid table
  for key, val in pairs(g) do
    print(key, val)
  end
end

--[[ The gridkey() function is overridden here. It's defined internally and implements
     the g.all and g.led functions this explains the unusual syntax errors when using 
     the g:led() versus g.led() functions --]]
function gridkey(x, y, state)
  g.all(0)
  if state > 0 then
    -- turn on led
    g.led(x, y, 5)
    engine.amp(0.5)
    col = x
    row = y * 5
    freq = f*2^((col+row)/12)
    --print("frequency: " .. freq)
    engine.hz(freq)
  else
    -- turn off led
    g.led(x, y, 0)
    engine.amp(0.0)
  end
  -- refresh grid leds
  g.refresh()
end

function g.event(x, y, z)
  --print("got event from grid: row: " .. y .. ", col: " .. x .. ", state: " .. z)
  gridkey(x,y,z)
end
