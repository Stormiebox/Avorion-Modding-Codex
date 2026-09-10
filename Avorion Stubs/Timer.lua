---@class Timer
Timer = {

	milliseconds = 0, -- [read-only] int
	running = true, -- [read-only] bool
	seconds = 0.0, -- [read-only] double
	secondsStr = "", -- [read-only] string

}

---@return Timer
function Timer()
	return Timer
end

---@return any @nothing
function Timer:reset()
	return nil
end

---@return any @nothing
function Timer:restart()
	return nil
end

---@return any @nothing
function Timer:start()
	return nil
end

---@return any @nothing
function Timer:stop()
	return nil
end

