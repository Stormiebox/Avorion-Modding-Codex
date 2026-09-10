---@class TorpedoAI
TorpedoAI = {

	desiredVelocity = 0.0, -- float
	dotLastFrame = 0.0, -- [read-only] float
	driftTime = 0.0, -- float
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	flightTime = 0.0, -- float
	missedTargetCounter = 0.0, -- float
	originalDriftTime = 0.0, -- float
	target = 0, -- Uuid

}

---@return TorpedoAI
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function TorpedoAI(id)
	return TorpedoAI
end

