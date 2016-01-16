local cqueues = require('cqueues')
local Logger = require('logger')
local Astronomy
do
  local _class_0
  local _base_0 = {
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
        self.log('*** ' .. err)
        if break_on_error then
          break
        end
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self)
      self.queue = cqueues.new()
    end,
    __base = _base_0,
    __name = "Astronomy"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Astronomy = _class_0
end
return Astronomy()
