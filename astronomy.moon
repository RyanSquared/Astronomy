cqueues = require 'cqueues'
Logger  = require 'logger'

proxy = (proxy_function)-> (...)=> proxy_function(@_queue, ...)

class Queue
	new: (self)->
		@_queue = cqueues.new!
	attach: proxy cqueues.attach
	wrap: proxy cqueues.wrap

class Astronomy extends Queue
	new: (self)->
		super self
	log: (message)-> Logger.print message
	loop: (self, break_on_error)->
		for err, _, thread in @queue.__queue\errors!
			Logger.log '*** Error with <' .. tostring(thread) .. '>'
			Logger.log '*** ' .. err
			break if break_on_error

Astronomy!
