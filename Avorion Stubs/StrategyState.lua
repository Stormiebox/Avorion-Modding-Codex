---@class StrategyState
StrategyState = {
}

---@return StrategyState
function StrategyState()
	return StrategyState
end

---@param entity any
---@return any @nothing
function StrategyState:addToSelection(entity)
	return nil
end

---@return any @nothing
function StrategyState:centerCameraOnSelection()
	return nil
end

---@return any @nothing
function StrategyState:clearSelection()
	return nil
end

---@return table<number, Uuid>
function StrategyState:getSelection()
	return {0}
end

---@param entity any
---@return any @nothing
function StrategyState:toggleSelect(entity)
	return nil
end

