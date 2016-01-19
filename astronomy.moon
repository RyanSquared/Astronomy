cqueues = require 'cqueues'
Logger  = require 'lib.logger.logger'

astronomy = {
	queue: cqueues.new!
	wrap: (...)=> @queue\wrap ...
	attach: (...)=> @queue\attach ...
	loop: (self, break_on_error)->
		Logger.print '--- Starting loop'
		for err, _, thread in @queue\errors!
			-- Safe to use here as it can't resume the other logging
			Logger._print '*** Error with <' .. tostring(thread) .. '>'
			Logger._print '*** ' .. tostring(err)
			break if break_on_error
}

return astronomy
