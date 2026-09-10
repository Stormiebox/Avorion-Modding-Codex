---@class ReadOnlyOwner
ReadOnlyOwner = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	factionIndex = 0, -- [read-only] int
	isAIFaction = true, -- [read-only] bool
	isAlliance = true, -- [read-only] bool
	isPlayer = true, -- [read-only] bool
	name = "", -- [read-only] string

}

---@return ReadOnlyOwner
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyOwner(id)
	return ReadOnlyOwner
end

---@param otherFactionIndex number
---@return number
function ReadOnlyOwner:getRelationValue(otherFactionIndex)
	return 0
end

