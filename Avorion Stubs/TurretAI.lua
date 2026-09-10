---@class TurretAI
TurretAI = {

	aimedPosition = vec3, -- vec3
	independentTargetingEnabled = true, -- [read-only] bool
	parentSaysShouldFire = true, -- [read-only] bool
	shouldFire = true, -- [read-only] bool
	targetedEntity = 0, -- Uuid

}

---@return TurretAI
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function TurretAI(id)
	return TurretAI
end

