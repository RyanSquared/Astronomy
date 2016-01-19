local cqueues = require('cqueues')
local Logger = require('lib.logger.logger')
local fifo = require('lib.fifo.cqueues')
local new_fifo = fifo()
Logger.set_pretty()
Logger.set_fifo(new_fifo)
local astronomy = {
  queue = cqueues.new(),
  wrap = function(self, ...)
    return self.queue:wrap(...)
  end,
  attach = function(self, ...)
    return self.queue:attach(...)
  end,
  loop = function(self, break_on_error)
    Logger.print('--- Starting loop')
    for err, _, thread in self.queue:errors() do
      Logger._print('*** Error with <' .. tostring(thread) .. '>')
      Logger._print('*** ' .. tostring(err))
      if break_on_error then
        break
      end
    end
  end
}
astronomy:wrap(function()
  for line in new_fifo do
    Logger._print(line)
  end
end)
return astronomy
