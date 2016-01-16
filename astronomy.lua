local cqueues = require('cqueues')
local Logger = require('logger')
local proxy
proxy = function(proxy_function)
  return function(self, ...)
    return proxy_function(self._queue, ...)
  end
end
local Queue
do
  local _class_0
  local _base_0 = {
    attach = proxy(cqueues.attach),
    wrap = proxy(cqueues.wrap)
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self)
      self._queue = cqueues.new()
    end,
    __base = _base_0,
    __name = "Queue"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Queue = _class_0
end
local Astronomy
do
  local _class_0
  local _parent_0 = Queue
  local _base_0 = {
    log = function(message)
      return Logger.print(message)
    end,
    loop = function(self, break_on_error)
      for err, _, thread in self.queue.__queue:errors() do
        Logger.log('*** Error with <' .. tostring(thread) .. '>')
        Logger.log('*** ' .. err)
        if break_on_error then
          break
        end
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self)
      return _class_0.__parent.__init(self, self)
    end,
    __base = _base_0,
    __name = "Astronomy",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Astronomy = _class_0
end
return Astronomy()
