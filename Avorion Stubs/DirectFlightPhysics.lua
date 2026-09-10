---@class DirectFlightPhysics
DirectFlightPhysics = {

	drifting = true, -- bool
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	maxVelocity = 0.0, -- float
	turningSpeed = 0.0, -- float

}

---@return DirectFlightPhysics
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function DirectFlightPhysics(id)
	return DirectFlightPhysics
end

