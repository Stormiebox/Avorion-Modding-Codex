---@class DockingParent
DockingParent = {

	dockable = true, -- bool
	hasLastDockingInfo = true, -- [read-only] bool
	id = 0, -- [read-only] Uuid
	lastDockingByAIFaction = nil, -- [read-only] var
	lastDockingByAlliance = nil, -- [read-only] var
	lastDockingByPlayer = nil, -- [read-only] var
	lastDockingFaction = nil, -- [read-only] var
	lastDockingParent = 0, -- [read-only] Uuid
	localOrientation = Matrix, -- [read-only] Matrix
	localPosition = vec3, -- [read-only] vec3
	localWorld = Matrix, -- [read-only] Matrix

}

---@return DockingParent
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function DockingParent(id)
	return DockingParent
end

---@param entityType number
---@return any @nothing
function DockingParent:addAutoUndockException(entityType)
	return nil
end

---@return table<number, number>
function DockingParent:getAutoUndockExceptions()
	return {0}
end

---@param entityType number
---@return boolean
function DockingParent:hasAutoUndockException(entityType)
	return true
end

---@param entityType number
---@return any @nothing
function DockingParent:removeAutoUndockException(entityType)
	return nil
end

--- Undocks the Entity (dockee) from its parent.
---@return boolean @true if it was docked, false otherwise
function DockingParent:undock()
	return true
end

