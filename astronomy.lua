local cqueues = require('cqueues')
local Logger = require('logger')
Logger.set_pretty()
local astronomy = {
  queue = cqueues.new(),
  log = function(message)
    return Logger.print(message)
  end,
  wrap = function(self, ...)
    return self.queue:wrap(...)
  end,
  attach = function(self, ...)
    return self.queue:attach(...)
  end,
  loop = function(self, break_on_error)
    self.log('--- Starting loop')
    for err, _, thread in self.queue:errors() do
      self.log('*** Error with <' .. tostring(thread) .. '>')
      self.log('*** ' .. tostring(err))
      if break_on_error then
        break
      end
    end
  end
}
return astronomy