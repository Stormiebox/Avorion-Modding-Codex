---@class DockingClamps
DockingClamps = {

	numDocks = 0, -- [read-only] int

}

---@return DockingClamps
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function DockingClamps(id)
	return DockingClamps
end

--- Docks an Entity (dockee) to this Entity (parent), if the given dock is free. Note: This function doesn't dock the entity immediately, but during the upcoming update tick. If during the same tick another parent wants to dock the same dockee, the result which of the parents will actually dock the dockee is random. The dockee must be in position to be docked, otherwise this won't work.
---@param dockee Entity @The entity that is to be docked
---@param dockIndex any @The index of the dock that is to be used. Use nil to use the first free dock.
---@return boolean @true if the given dock is free (or a free dock was found), false otherwise.
function DockingClamps:dock(dockee, dockIndex)
	return true
end

--- Docks an Entity (dockee) to this Entity (parent), if the given dock is free. Note: This function doesn't dock the entity immediately, but during the upcoming update tick. If during the same tick another parent wants to dock the same dockee, the result which of the parents will actually dock the dockee is random.
---@param dockee Entity @The entity that is to be docked
---@param dockIndex any @The index of the dock that is to be used. Use nil to use the first free dock. @The index of the block on the other ship that is to be docked. If nil, uses the outermost block on the side that will be docked.
---@param dockIndex any
---@param look any @The look direction of the object to dock. If nil, will use the parent's direction. This direction must be in local space of the parent object. You can either use a vec3, an ivec3, or a string indicating the direction, such as "x" or "-y".
---@param up any @The up direction of the object to dock. If nil, will use the parent's direction. This direction must be in local space of the parent object. You can either use a vec3, an ivec3, or a string indicating the direction, such as "x" or "-y".
---@return boolean @true if the given dock is free (or a free dock was found), false otherwise.
function DockingClamps:forceDock(dockee, dockIndex, dockIndex, look, up)
	return true
end

---@return table<number, Uuid>
function DockingClamps:getDockedEntities()
	return {0}
end

---@return table_t
function DockingClamps:getDocks()
	return table_t
end

--- Checks if another entity is physically docked.
---@param entity any @The entity to check. Can be a Uuid, (uuid-)string or Entity.
---@return boolean @true if physically docked, false otherwise.
function DockingClamps:isDocked(entity)
	return true
end

--- Undocks an Entity (dockee) from this Entity (parent), if docked. Note: This function doesn't undock the entity immediately, but during the upcoming update tick.
---@param dockee Entity @The entity that is to be undocked
---@return boolean
function DockingClamps:undock(dockee)
	return true
end

