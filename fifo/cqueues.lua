local new_fifo = require "fifo"
local cqueues = require "cqueues"
local cc = require "cqueues.condition"

local methods = {}
local mt = {
	__index = methods;
}
function methods.new(...)
	local cond = cc.new();
	local fifo = new_fifo(...)
	fifo:setempty(function(self)
		cond:wait()
		return fifo:pop()
	end)
	return setmetatable({
		fifo = fifo;
		--[[ From cqueues docs:
		Alternatively, :pollfd may return a condition variable object,
		or the member field may itself be a condition variable instead of a function.
		This permits user code to create ad hoc pollable objects.]]
		pollfd = cond;
	}, mt)
end

-- Ensure we return immediately if we're polled and have something in the fifo
function methods:timeout()
	if self:length() ~= 0 then
		return 0
	else
		return nil
	end
end

function methods:push(...)
	self.fifo:push(...)
	self.pollfd:signal(1)
end

function methods:insert(...)
	self.fifo:insert(...)
	self.pollfd:signal(1)
end

--- Simple wrappers

function methods:pop(...)
	return self.fifo:pop(...)
end

function methods:remove(...)
	return self.fifo:remove(...)
end

function methods:length(...)
	return self.fifo:length(...)
end
mt.__length = methods.length

function methods:peek(...)
	return self.fifo:peek(...)
end


--- Utility functions

-- Allows `for item in fifo do`
-- will stop at the first `nil`
mt.__call = methods.pop

return methods.new
