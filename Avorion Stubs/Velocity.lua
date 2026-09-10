---@class Velocity
Velocity = {

	axis = vec3, -- [read-only] vec3
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	linear = 0.0, -- [read-only] double
	linear2 = 0.0, -- [read-only] double
	localAngular = vec3, -- [read-only] vec3
	rotationSpeed = 0.0, -- [read-only] float
	velocity = dvec3, -- dvec3
	velocityf = vec3, -- vec3

}

---@return Velocity
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function Velocity(id)
	return Velocity
end

---@param axis vec3
---@param angle number
---@return any @nothing
function Velocity:addRotation(axis, angle)
	return nil
end

---@param delta vec3
---@return any @nothing
function Velocity:addVelocity(delta)
	return nil
end

---@param axis vec3
---@param angle number
---@return any @nothing
function Velocity:setAngularVelocity(axis, angle)
	return nil
end

