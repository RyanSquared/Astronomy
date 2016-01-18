cqueues = require 'cqueues'
Logger  = require 'logger'
--fifo    = require 'fifo/cqueues'

--new_fifo = fifo!

Logger.set_pretty!
--Logger.set_fifo new_fifo

astronomy = {
	queue: cqueues.new!
	log: (message)-> Logger.print message
	wrap: (...)=> @queue\wrap ...
	attach: (...)=> @queue\attach ...
	loop: (self, break_on_error)->
		@.log '--- Starting loop'
		for err, _, thread in @queue\errors!
			@.log '*** Error with <' .. tostring(thread) .. '>'
			@.log '*** ' .. tostring(err)
			break if break_on_error
}

--astronomy\wrap ->
--	for line in fifo
--		Logger._print line

return astronomy
