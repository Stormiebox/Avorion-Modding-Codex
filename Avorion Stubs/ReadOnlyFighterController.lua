---@class ReadOnlyFighterController
ReadOnlyFighterController = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid

}

---@return ReadOnlyFighterController
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyFighterController(id)
	return ReadOnlyFighterController
end

---@param squad any
---@return table<number, Entity>
function ReadOnlyFighterController:getDeployedFighters(squad)
	return {Entity}
end

