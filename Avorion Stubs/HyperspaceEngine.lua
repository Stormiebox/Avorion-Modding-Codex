---@class HyperspaceEngine
HyperspaceEngine = {

	blocked = true, -- [read-only] bool
	clearSpace = true, -- bool
	consumerIcon = "", -- [read-only] string
	consumerName = "", -- [read-only] string
	cooldown = 0.0, -- float
	cooldownSpeed = 0.0, -- [read-only] float
	currentCooldown = 0.0, -- float
	defaultPriority = 0, -- [read-only] int
	displayedCooldown = true, -- [read-only] bool
	distorted = true, -- [read-only] bool
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	isSceneEmpty = true, -- [read-only] bool
	passBlocked = true, -- bool
	range = 0.0, -- float
	requiredEnergy = 0.0, -- [read-only] double
	requiredEnergyForJump = 0.0, -- [read-only] float

}

---@return HyperspaceEngine
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function HyperspaceEngine(id)
	return HyperspaceEngine
end

--- Blocks the hyperspace engine for a certain time. While the hyperspace engine is blocked, it can't jump. For safety reasons, the hyperspace engine can only be blocked for a limited amount of time. You should only block it for a few seconds and then reblock it. Also sets the "clear space" property to false.
---@param time number @The amount of time the engine will be blocked. Doesn't accumulate, overrides previous blocks
---@return any @nothing
function HyperspaceEngine:block(time)
	return nil
end

--- Distorts the hyperspace engine for a certain time. While the hyperspace engine is distorted, it takes 4x as long to recharge. For safety reasons, the hyperspace engine can only be distorted for a limited amount of time. You should only distort it for a few seconds and then redistort it. Also sets the "clear space" property to false.
---@param time number @The amount of time the engine will be distorted. Doesn't accumulate, overrides previous distorts
---@return any @nothing
function HyperspaceEngine:distort(time)
	return nil
end

--- Exhausts the hyperspace engine as if when a jump happens.
---@return any @nothing
function HyperspaceEngine:exhaust()
	return nil
end

--- Checks if a hyperspace route would be valid.
---@param fromX number @X coordinate of the origin
---@param fromY number @Y coordinate of the origin
---@param toX number @X coordinate of the destination
---@param toY number @Y coordinate of the destination
---@return boolean,any @Returns a bool (true, false), and, if false, a string containing the reason why it's invalid
function HyperspaceEngine:isJumpRouteValid(fromX, fromY, toX, toY)
	return true,nil
end

--- Initiates a hyperspace jump. This is what happens when the player presses space. This will always do the jump, no matter what.
---@param x number @X coordinate of the destination
---@param y number @Y coordinate of the destination
---@return any @nothing
function HyperspaceEngine:jump(x, y)
	return nil
end

--- Checks if a jump to a sector would be possible.
---@param x number @X coordinate of the destination
---@param y number @Y coordinate of the destination
---@return number @a JumpError code containing the reason why the jump failed
function HyperspaceEngine:jumpPossible(x, y)
	return 0
end

--- Tries to initiate a hyperspace jump. This is what happens when the player presses space. On failure, this will return a JumpError code with the reason.
---@param x number @X coordinate of the destination
---@param y number @Y coordinate of the destination
---@return number @a JumpError code containing the reason why the jump failed
function HyperspaceEngine:tryJump(x, y)
	return 0
end

