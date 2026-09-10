---@class DebugInfo
DebugInfo = {
}

---@return DebugInfo
function DebugInfo()
	return DebugInfo
end

---@return string
function DebugInfo:getEndingLog()
	return ""
end

---@return string
function DebugInfo:getStartingLog()
	return ""
end

---@return any @nothing
function DebugInfo:log()
	return nil
end

---@param key string
---@param value string
---@return any @nothing
function DebugInfo:set(key, value)
	return nil
end

---@param key string
---@param value string
---@return any @nothing
function DebugInfo:threadSet(key, value)
	return nil
end

