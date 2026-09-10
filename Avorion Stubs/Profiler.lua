---@class Profiler
Profiler = {

	printedSections = 0, -- int
	started = true, -- [read-only] bool

}

---@return Profiler
---@param str string
function Profiler(str)
	return Profiler
end

---@return string
function Profiler:__tostring()
	return ""
end

---@param name string
---@param duration number
---@return any @nothing
function Profiler:addSection(name, duration)
	return nil
end

---@return number
function Profiler:done()
	return 0.0
end

---@return any @nothing
function Profiler:print()
	return nil
end

---@param name string
---@return any @nothing
function Profiler:reenter(name)
	return nil
end

---@return any @nothing
function Profiler:reset()
	return nil
end

---@param name string
---@return any @nothing
function Profiler:section(name)
	return nil
end

