---@class ValueComboBox
ValueComboBox = {

	active = true, -- bool
	center = vec2, -- vec2
	clampTextAtArrow = true, -- [write-only] bool
	entriesPerPage = 0, -- [write-only] int
	height = 0.0, -- float
	index = 0, -- [read-only] int
	layer = 0, -- int
	localCenter = vec2, -- [read-only] vec2
	localPosition = vec2, -- [read-only] vec2
	localRect = Rect, -- [read-only] Rect
	lower = vec2, -- vec2
	mouseOver = true, -- [read-only] bool
	onSelectedFunction = "", -- [write-only] string
	position = vec2, -- vec2
	rect = Rect, -- Rect
	selectedEntry = "", -- [read-only] string
	selectedIndex = 0, -- int
	selectedValue = nil, -- var
	size = vec2, -- vec2
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	upper = vec2, -- vec2
	visible = true, -- bool
	width = 0.0, -- float

}

---@return ValueComboBox
---@param index number
function ValueComboBox(index)
	return ValueComboBox
end

---@param value any
---@param entry string
---@param color any
---@return any @nothing
function ValueComboBox:addEntry(value, entry, color)
	return nil
end

---@return any @nothing
function ValueComboBox:clear()
	return nil
end

---@param index number
---@return string
function ValueComboBox:getEntry(index)
	return ""
end

---@param index number
---@return any
function ValueComboBox:getValue(index)
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function ValueComboBox:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function ValueComboBox:isMouseOverAndUnobscured()
	return true
end

---@param index number
---@param _in string
---@return any @nothing
function ValueComboBox:setEntryTooltip(index, _in)
	return nil
end

---@param _in number
---@return any @nothing
function ValueComboBox:setSelectedIndexNoCallback(_in)
	return nil
end

---@param value any
---@return any @nothing
function ValueComboBox:setSelectedValueNoCallback(value)
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function ValueComboBox:show()
	return nil
end

