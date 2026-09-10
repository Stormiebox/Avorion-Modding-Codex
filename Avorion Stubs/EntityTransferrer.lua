---@class EntityTransferrer
EntityTransferrer = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid
	sectorReady = true, -- [read-only] bool

}

---@return EntityTransferrer
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function EntityTransferrer(id)
	return EntityTransferrer
end

---@param faction number
---@return any @nothing
function EntityTransferrer:addWhitelistedFaction(faction)
	return nil
end

---@param faction number
---@return boolean
function EntityTransferrer:isFactionOnWhitelist(faction)
	return true
end

---@param faction number
---@return any @nothing
function EntityTransferrer:removeWhitelistedFaction(faction)
	return nil
end

