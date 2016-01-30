cqueues = require 'cqueues'
Logger  = require 'logger'

astronomy = {
	queue: cqueues.new!
	wrap: (...)=> @queue\wrap ...
	attach: (...)=> @queue\attach ...
	loop: (self, break_on_error)->
		Logger.print '--- Starting loop'
		while not @queue\empty! do
			ok, err, _, thread = @queue\step!
			if not ok
				Logger.print '*** Error with <' .. tostring(thread) .. '>'
				Logger.print '*** ' .. tostring(err)
				break if on_error
		Logger.print '--- Loop ended'
		return true
}

return astronomy
