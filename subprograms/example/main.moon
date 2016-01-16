astronomy = require 'astronomy'
cqueues   = require 'cqueues'

astronomy\wrap ->
	while true
		for i=1, 10 do
			cqueues.sleep 0.05
			astronomy.log 'Yay, astronomy!'
		error 'Example error'
