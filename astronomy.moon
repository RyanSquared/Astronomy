cqueues = require 'cqueues'
Logger  = require 'logger'

Logger.set_pretty!

class Astronomy
	new: (self)->
		@queue = cqueues.new!
	log: (message)-> Logger.print message
	wrap: (...)=> @queue\wrap ...
	attach: (...)=> @queue\attach ...
	loop: (self, break_on_error)->
		@.log '--- Starting loop'
		for err, _, thread in @queue\errors!
			@.log '*** Error with <' .. tostring(thread) .. '>'
			@.log '*** ' .. err
			break if break_on_error

Astronomy!
