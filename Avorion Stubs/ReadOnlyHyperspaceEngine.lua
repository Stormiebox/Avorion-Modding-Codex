---@class ReadOnlyHyperspaceEngine
ReadOnlyHyperspaceEngine = {

	blocked = true, -- [read-only] bool
	clearSpace = true, -- [read-only] bool
	consumerIcon = "", -- [read-only] string
	consumerName = "", -- [read-only] string
	cooldown = 0.0, -- [read-only] float
	cooldownSpeed = 0.0, -- [read-only] float
	currentCooldown = 0.0, -- [read-only] float
	defaultPriority = 0, -- [read-only] int
	displayedCooldown = true, -- [read-only] bool
	distorted = true, -- [read-only] bool
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	isSceneEmpty = true, -- [read-only] bool
	passBlocked = true, -- [read-only] bool
	range = 0.0, -- [read-only] float
	requiredEnergy = 0.0, -- [read-only] double
	requiredEnergyForJump = 0.0, -- [read-only] float

}

---@return ReadOnlyHyperspaceEngine
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyHyperspaceEngine(id)
	return ReadOnlyHyperspaceEngine
end

--- Checks if a hyperspace route would be valid.
---@param fromX number @X coordinate of the origin
---@param fromY number @Y coordinate of the origin
---@param toX number @X coordinate of the destination
---@param toY number @Y coordinate of the destination
---@return boolean,any @Returns a bool (true, false), and, if false, a string containing the reason why it's invalid
function ReadOnlyHyperspaceEngine:isJumpRouteValid(fromX, fromY, toX, toY)
	return true,nil
end

