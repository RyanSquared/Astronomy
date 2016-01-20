local astronomy = require("astronomy")
local cqueues = require("cqueues")
local Logger = require("logger")
Logger.print("Test: astronomy.wrap")
local base_table = { }
astronomy:wrap(function()
  cqueues.sleep(0.005)
  for i = 1, 2 do
    table.insert(base_table, 'A')
    cqueues.sleep(0.01)
  end
end)
astronomy:wrap(function()
  for i = 1, 2 do
    table.insert(base_table, 'B')
    cqueues.sleep(0.01)
  end
end)
assert(astronomy:loop())
local result_table = {
  'B',
  'A',
  'B',
  'A'
}
for k, v in pairs(base_table) do
  Logger.print(tostring(v) .. " == " .. tostring(result_table[k]))
  assert(v == result_table[k])
end
