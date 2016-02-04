local cqueues = require('cqueues')
local Logger = require('logger')
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
    while not self.queue:empty() do
      local ok, err, _, thread = self.queue:step()
      if not ok then
        Logger.print('*** Error with <' .. tostring(thread) .. '>')
        Logger.print('*** ' .. tostring(err))
        if break_on_error then
          break
        end
      end
    end
    Logger.print('--- Loop ended')
    return true
  end
}
return astronomy
