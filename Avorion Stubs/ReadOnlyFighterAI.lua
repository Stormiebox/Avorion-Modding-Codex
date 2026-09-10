---@class ReadOnlyFighterAI
ReadOnlyFighterAI = {

	circling = true, -- [read-only] bool
	clearFeedbackEachTick = true, -- [read-only] bool
	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	evading = true, -- [read-only] bool
	ignoreMothershipOrders = true, -- [read-only] bool
	mothershipId = 0, -- [read-only] Uuid
	orders = FighterOrders.Attack, -- [read-only] FighterOrders
	reachedTarget = true, -- [read-only] bool
	squad = 0, -- [read-only] unsigned
	target = 0, -- [read-only] uuid

}

---@return ReadOnlyFighterAI
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyFighterAI(id)
	return ReadOnlyFighterAI
end

