---@class HighResolutionTimer
HighResolutionTimer = {

	microseconds = 0, -- [read-only] int
	milliseconds = 0, -- [read-only] int
	running = true, -- [read-only] bool
	seconds = 0.0, -- [read-only] double
	secondsStr = "", -- [read-only] string

}

---@return HighResolutionTimer
function HighResolutionTimer()
	return HighResolutionTimer
end

---@return any @nothing
function HighResolutionTimer:reset()
	return nil
end

---@return any @nothing
function HighResolutionTimer:restart()
	return nil
end

---@return any @nothing
function HighResolutionTimer:start()
	return nil
end

---@return any @nothing
function HighResolutionTimer:stop()
	return nil
end

