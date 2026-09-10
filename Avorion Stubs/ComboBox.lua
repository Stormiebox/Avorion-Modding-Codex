---@class ComboBox
ComboBox = {

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
	scrollPosition = 0, -- int
	selectedEntry = "", -- [read-only] string
	selectedIndex = 0, -- int
	size = vec2, -- vec2
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	upper = vec2, -- vec2
	visible = true, -- bool
	width = 0.0, -- float

}

---@return ComboBox
---@param index number
function ComboBox(index)
	return ComboBox
end

---@param entry string
---@param color any
---@return any @nothing
function ComboBox:addEntry(entry, color)
	return nil
end

---@return any @nothing
function ComboBox:clear()
	return nil
end

---@param index number
---@return string
function ComboBox:getEntry(index)
	return ""
end

--- Inherited from UIElement
---@return any @nothing
function ComboBox:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function ComboBox:isMouseOverAndUnobscured()
	return true
end

---@param index number
---@param _in string
---@return any @nothing
function ComboBox:setEntryTooltip(index, _in)
	return nil
end

---@param _in number
---@return any @nothing
function ComboBox:setSelectedIndexNoCallback(_in)
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function ComboBox:show()
	return nil
end

