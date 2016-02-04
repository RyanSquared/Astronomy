local astronomy = require("astronomy")
local cqueues = require("cqueues")
local Logger = require("logger")
Logger.print("Test: astronomy.break_on_loop")
local base_table = { }
astronomy:attach(coroutine.create(function()
  cqueues.sleep(0.005)
  for i = 66, 70, 2 do
    if i > 69 then
      error('Expected failure')
    end
    table.insert(base_table, string.char(i))
    cqueues.sleep(0.01)
  end
end))
astronomy:attach(coroutine.create(function()
  for i = 65, 70, 2 do
    table.insert(base_table, string.char(i))
    cqueues.sleep(0.01)
  end
end))
assert(astronomy:loop(true))
local result_table = {
  'A',
  'B',
  'C',
  'D',
  'E'
}
for k, v in pairs(base_table) do
  Logger.print(tostring(v) .. " == " .. tostring(result_table[k]))
  assert(v == result_table[k])
end
