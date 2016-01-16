cqueues = require 'cqueues'
Logger  = require 'logger'

old_functions = {}

for k, v in pairs {'loop', 'step', 'errors'}
	old_functions[v] = cqueues.interpose(v, ->)

class Astronomy
	new: (self)->
		@queue = cqueues.new!
	log: (message)-> Logger.print message
	wrap: (...)=> @queue\wrap ...
	attach: (...)=> @queue\attach ...
	loop: (self, break_on_error)->
		@.log '--- Starting loop'
		for err, _, thread in old_functions.errors self
			Logger.log '*** Error with <' .. tostring(thread) .. '>'
			Logger.log '*** ' .. err
			break if break_on_error

Astronomy!
