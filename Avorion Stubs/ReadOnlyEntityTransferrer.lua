---@class ReadOnlyEntityTransferrer
ReadOnlyEntityTransferrer = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	sectorReady = true, -- [read-only] bool

}

---@return ReadOnlyEntityTransferrer
---@param id any @The id of the entity, must be an index of an existing entity or nil for the entity in the current script context
function ReadOnlyEntityTransferrer(id)
	return ReadOnlyEntityTransferrer
end

---@param faction number
---@return boolean
function ReadOnlyEntityTransferrer:isFactionOnWhitelist(faction)
	return true
end

