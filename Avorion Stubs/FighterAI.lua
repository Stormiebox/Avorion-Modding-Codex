---@class FighterAI
FighterAI = {

	circling = true, -- [read-only] bool
	clearFeedbackEachTick = true, -- bool
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	evading = true, -- [read-only] bool
	ignoreMothershipOrders = true, -- bool
	mothershipId = 0, -- [read-only] Uuid
	orders = FighterOrders.Attack, -- [read-only] FighterOrders
	reachedTarget = true, -- [read-only] bool
	squad = 0, -- [read-only] unsigned
	target = 0, -- [read-only] uuid

}

---@return FighterAI
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function FighterAI(id)
	return FighterAI
end

---@return any @nothing
function FighterAI:clearFeedback()
	return nil
end

---@return Entity
function FighterAI:getMothership()
	return Entity
end

---@param orders FighterOrders
---@param target Uuid
---@return any @nothing
function FighterAI:setOrders(orders, target)
	return nil
end

