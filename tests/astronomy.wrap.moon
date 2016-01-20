astronomy = require "astronomy"
cqueues   = require "cqueues"
Logger    = require "logger"

Logger.print "Test: astronomy.wrap"

base_table = {}

astronomy\wrap ->
	cqueues.sleep 0.005
	for i=1, 2 do
		table.insert base_table, 'A'
		cqueues.sleep 0.01

astronomy\wrap ->
	for i=1, 2 do
		table.insert base_table, 'B'
		cqueues.sleep 0.01

assert astronomy\loop!

result_table = {
	'B'
	'A'
	'B'
	'A'
}

for k, v in pairs base_table
	Logger.print "#{v} == #{result_table[k]}"
	assert v == result_table[k]
