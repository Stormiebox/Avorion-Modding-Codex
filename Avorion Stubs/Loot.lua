---@class Loot
Loot = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid

}

---@return Loot
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function Loot(id)
	return Loot
end

---@param item InventoryItem
---@return any @nothing
function Loot:insert(item)
	return nil
end

