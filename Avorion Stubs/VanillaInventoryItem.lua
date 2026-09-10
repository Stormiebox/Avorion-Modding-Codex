---@class VanillaInventoryItem
VanillaInventoryItem = {

	boundFaction = 0, -- int
	droppable = true, -- bool
	favorite = true, -- bool
	icon = "", -- string
	iconColor = Color, -- Color
	itemType = InventoryItemType.Turret, -- [read-only] InventoryItemType
	name = "", -- string
	price = 0, -- int
	rarity = Rarity, -- Rarity
	recent = true, -- bool
	stackable = true, -- bool
	tradeable = true, -- bool
	trash = true, -- bool

}

---@return VanillaInventoryItem
function VanillaInventoryItem()
	return VanillaInventoryItem
end

---@param other any
---@return boolean
function VanillaInventoryItem:__eq(other)
	return true
end

--- Removes all custom values of the object
---@return any @nothing
function VanillaInventoryItem:clearValues()
	return nil
end

---@return Tooltip
function VanillaInventoryItem:getTooltip()
	return Tooltip
end

--- Retrieves a custom value saved in the entity with the given key
---@param key string @A string that serves as the name of the value
---@return any @The value if the key exists, otherwise nil
function VanillaInventoryItem:getValue(key)
	return nil
end

--- Retrieves all key-value pairs of custom values of the entity
---@return table<string,any> @A table containing all custom key-value pairs
function VanillaInventoryItem:getValues()
	return {"",nil}
end

---@param tooltip Tooltip
---@return any @nothing
function VanillaInventoryItem:setTooltip(tooltip)
	return nil
end

--- Sets a custom value
---@param key string @A string that serves as the name of the value
---@param value any @The value to save. Must be bool, number, string or nil. If nil is given, the value will be deleted.
---@return any
function VanillaInventoryItem:setValue(key, value)
	return nil
end

