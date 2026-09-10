---@class DockingPositions
DockingPositions = {

	alwaysDocked = true, -- bool
	docksEnabled = true, -- bool
	numDockingPositions = 0, -- [read-only] int

}

---@return DockingPositions
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function DockingPositions(id)
	return DockingPositions
end

---@return any @nothing
function DockingPositions:deleteRemovableObstacles()
	return nil
end

---@param i number
---@return any
function DockingPositions:getDockingPosition(i)
	return nil
end

---@return table_t
function DockingPositions:getDockingPositions()
	return table_t
end

---@param exception nil | Entity
---@return any
function DockingPositions:getFreeDock(exception)
	return nil
end

---@param other Entity
---@param dockIndex any
---@return boolean
function DockingPositions:inLightArea(other, dockIndex)
	return true
end

---@param other Entity
---@return boolean
function DockingPositions:isInDockingArea(other)
	return true
end

---@param i number
---@param exception nil | Entity
---@return boolean
function DockingPositions:isLightLineFree(i, exception)
	return true
end

---@param other Entity
---@return boolean
function DockingPositions:isPulling(other)
	return true
end

---@param other Entity
---@return boolean
function DockingPositions:isPushing(other)
	return true
end

---@param other Entity
---@return boolean
function DockingPositions:isTractoring(other)
	return true
end

---@param other Entity
---@param dockIndex any
---@return boolean
function DockingPositions:startPulling(other, dockIndex)
	return true
end

---@param other Entity
---@param dockIndex any
---@return boolean
function DockingPositions:startPushing(other, dockIndex)
	return true
end

---@param other Entity
---@return any @nothing
function DockingPositions:stopPulling(other)
	return nil
end

---@param other Entity
---@return any @nothing
function DockingPositions:stopPushing(other)
	return nil
end

