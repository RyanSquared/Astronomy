local astronomy = require("astronomy")
local cqueues = require("cqueues")
local Logger = require("logger")
Logger.print("Test: astronomy.attach")
astronomy:attach(coroutine.create(function()
  for i = 1, 5 do
    cqueues.sleep(0.01)
    Logger.print("Beep " .. tostring(tostring(i)))
  end
end))
return assert(astronomy:loop())
