---@class Mail
Mail = {

	empty = true, -- [read-only] bool
	header = Format, -- Format
	id = "", -- string
	money = 0, -- int
	numItems = 0, -- [read-only] unsigned
	read = true, -- bool
	receiver = PlayerId, -- [write-only] PlayerId
	sender = Format, -- Format
	text = Format, -- Format

}

---@return Mail
function Mail()
	return Mail
end

---@param item InventoryItem
---@return any @nothing
function Mail:addItem(item)
	return nil
end

---@param turret TurretTemplate
---@return any @nothing
function Mail:addTurret(turret)
	return nil
end

---@param turret TurretTemplate
---@return any @nothing
function Mail:addTurretBlueprint(turret)
	return nil
end

---@param index number
---@return InventoryItem
function Mail:getItem(index)
	return InventoryItem
end

---@return table<number, number>
function Mail:getResources()
	return {0}
end

---@return boolean
function Mail:hasAttachments()
	return true
end

---@param index number
---@return any @nothing
function Mail:removeItem(index)
	return nil
end

---@return any @nothing
function Mail:setResources()
	return nil
end

