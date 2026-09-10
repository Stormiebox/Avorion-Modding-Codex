---@class Physics
Physics = {

	centerOfMass = vec3, -- [read-only] vec3
	centerOfRotation = vec3, -- [read-only] vec3
	driftDecrease = 0.0, -- double
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	invMass = 0.0, -- [read-only] double
	kineticEnergy = 0.0, -- [read-only] double
	mass = 0.0, -- [read-only] double
	rotationDecrease = 0.0, -- double
	rotationalEnergy = 0.0, -- [read-only] double

}

---@return Physics
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function Physics(id)
	return Physics
end

---@param position vec3
---@param direction vec3
---@param size number
---@param time number
---@return any @nothing
function Physics:applyGlobalForce(position, direction, size, time)
	return nil
end

---@param position dvec3
---@param direction vec3
---@param size number
---@return any @nothing
function Physics:applyImpulse(position, direction, size)
	return nil
end

---@param position vec3
---@param force vec3
---@param size number
---@param time number
---@return any @nothing
function Physics:applyLocalForce(position, force, size, time)
	return nil
end

---@param timeStep number
---@return any @nothing
function Physics:lerpPositions(timeStep)
	return nil
end

