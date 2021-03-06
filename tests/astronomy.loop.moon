astronomy = require "astronomy"
cqueues   = require "cqueues"
Logger    = require "logger"

Logger.print "Test: astronomy.break_on_loop"

do
	base_table = {}

	astronomy\attach coroutine.create ->
		cqueues.sleep 0.005
		for i=66, 72, 2
			error 'Expected failure' if i > 69
			table.insert base_table, string.char i
			cqueues.sleep 0.01

	astronomy\attach coroutine.create ->
		for i=65, 72, 2
			table.insert base_table, string.char i
			cqueues.sleep 0.01

	assert astronomy\loop true

	result_table = {
		'A'
		'B'
		'C'
		'D'
		'E'
	}

	for k, v in pairs base_table
		Logger.print "#{v} == #{result_table[k]}"
		assert v == result_table[k]

do
	base_table = {}

	astronomy\attach coroutine.create ->
		cqueues.sleep 0.005
		for i=66, 72, 2
			error 'Expected failure' if i > 69
			table.insert base_table, string.char i
			cqueues.sleep 0.01

	astronomy\attach coroutine.create ->
		for i=65, 72, 2
			table.insert base_table, string.char i
			cqueues.sleep 0.01

	assert astronomy\loop!

	result_table = {
		'A'
		'B'
		'C'
		'D'
		'E'
		'G'
	}

	for k, v in pairs base_table
		Logger.print "#{v} == #{result_table[k]}"
		assert v == result_table[k]
