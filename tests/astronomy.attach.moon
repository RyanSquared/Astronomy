astronomy = require "astronomy"
cqueues   = require "cqueues"
Logger    = require "logger"

Logger.print "Test: astronomy.attach"

astronomy\attach coroutine.create ->
	for i=1, 5 do
		cqueues.sleep 0.01
		Logger.print "Beep #{tostring i}"

assert astronomy\loop!
