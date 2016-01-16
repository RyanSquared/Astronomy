local astronomy = require('astronomy')
local cqueues = require('cqueues')
return astronomy:wrap(function()
  while true do
    for i = 1, 10 do
      cqueues.sleep(0.05)
      astronomy.log('Yay, astronomy!')
    end
    error('Example error')
  end
end)
