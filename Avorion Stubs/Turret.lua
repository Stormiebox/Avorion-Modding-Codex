---@class Turret
Turret = {

	activated = true, -- bool
	attachedBlock = 0, -- int
	automatic = true, -- bool
	coaxial = true, -- bool
	craftPlayerPiloted = true, -- [read-only] bool
	damageMultiplier = 0.0, -- [read-only] float
	enabledByAI = true, -- [read-only] bool
	favorite = true, -- bool
	group = 0, -- int
	horizontalRotation = true, -- [read-only] bool
	lookingAtTarget = true, -- [read-only] bool
	rigin = true, -- [read-only] bool
	selected = true, -- bool
	shootingCraft = 0, -- [read-only] uuid
	shootingFaction = 0, -- [read-only] int
	shotCollisionException = 0, -- [read-only] uuid
	size = 0.0, -- [read-only] float
	targetedObject = 0, -- [read-only] uuid
	templateSize = 0.0, -- float
	trash = true, -- bool
	turningSpeed = 0.0, -- float
	usedSlots = 0, -- int
	verticalRotation = true, -- [read-only] bool
	weaponsPlayerControlled = true, -- [read-only] bool

}

---@return Turret
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function Turret(id)
	return Turret
end

---@param amount number
---@return any @nothing
function Turret:consumeEnergyForShot(amount)
	return nil
end

---@return vec3
function Turret:getCurrentVelocity()
	return vec3
end

---@return Matrix
function Turret:getLookingPosition()
	return Matrix
end

---@param amount number
---@return boolean
function Turret:hasEnergyForShot(amount)
	return true
end

---@param rotationVertical number
---@param rotationHorizontal number
---@param lookingAtTarget boolean
---@return any @nothing
function Turret:setOrientation(rotationVertical, rotationHorizontal, lookingAtTarget)
	return nil
end

---@param ray any
---@return boolean
function Turret:shootingVectorOk(ray)
	return true
end

