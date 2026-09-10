---@class Torpedo
Torpedo = {

	collisionWithParentEnabled = true, -- bool
	firedByAIControlledPlayerShip = true, -- bool
	intendedTargetFaction = 0, -- int
	shootingCraft = 0, -- Uuid

}

---@return Torpedo
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function Torpedo(id)
	return Torpedo
end

---@return TorpedoTemplate
function Torpedo:getTemplate()
	return TorpedoTemplate
end

---@param torpedo TorpedoTemplate
---@return any @nothing
function Torpedo:setTemplate(torpedo)
	return nil
end

---@return any @nothing
function Torpedo:startDetonation()
	return nil
end

