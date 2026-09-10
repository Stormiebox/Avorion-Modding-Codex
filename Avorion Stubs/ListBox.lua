---@class ListBox
ListBox = {

	center = vec2, -- vec2
	empty = true, -- [read-only] bool
	entriesSelectable = true, -- bool
	font = 0, -- [write-only] int
	fontSize = 0, -- int
	headline = true, -- [write-only] bool
	height = 0.0, -- float
	index = 0, -- [read-only] int
	layer = 0, -- int
	localCenter = vec2, -- [read-only] vec2
	localPosition = vec2, -- [read-only] vec2
	localRect = Rect, -- [read-only] Rect
	lower = vec2, -- vec2
	mouseOver = true, -- [read-only] bool
	onAddedFunction = "", -- string
	onChangedFunction = "", -- string
	onClearFunction = "", -- string
	onRemoveFunction = "", -- string
	onSelectFunction = "", -- string
	position = vec2, -- vec2
	rect = Rect, -- Rect
	rowHeight = 0, -- int
	rows = 0, -- [read-only] int
	scrollPosition = 0, -- int
	selected = 0, -- [read-only] int
	selectedValue = nil, -- [read-only] var
	size = vec2, -- vec2
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	upper = vec2, -- vec2
	visible = true, -- bool
	width = 0.0, -- float

}

---@return ListBox
---@param index number
function ListBox(index)
	return ListBox
end

---@param str string
---@param value any
---@return any @nothing
function ListBox:addEntry(str, value)
	return nil
end

---@return any @nothing
function ListBox:clampScrollPosition()
	return nil
end

---@return any @nothing
function ListBox:clear()
	return nil
end

---@return any @nothing
function ListBox:deselect()
	return nil
end

---@param row number
---@return string,boolean,boolean,Color
function ListBox:getEntry(row)
	return "",true,true,Color
end

---@return string,boolean,boolean,table<number, Color>
function ListBox:getSelectedEntry()
	return "",true,true,{Color}
end

--- Inherited from UIElement
---@return any @nothing
function ListBox:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function ListBox:isMouseOverAndUnobscured()
	return true
end

---@param index number
---@return any @nothing
function ListBox:removeEntry(index)
	return nil
end

---@param index number
---@return any @nothing
function ListBox:select(index)
	return nil
end

---@param index number
---@return any @nothing
function ListBox:selectNoCallback(index)
	return nil
end

---@param value any
---@return any @nothing
function ListBox:selectValue(value)
	return nil
end

---@param value any
---@return any @nothing
function ListBox:selectValueNoCallback(value)
	return nil
end

---@param row number
---@param text string
---@param bold boolean
---@param italic boolean
---@param color Color
---@param entryWidth any
---@return any @nothing
function ListBox:setEntry(row, text, bold, italic, color, entryWidth)
	return nil
end

---@param row number
---@param type number
---@return any @nothing
function ListBox:setEntryType(row, type)
	return nil
end

---@param row number
---@param value any
---@return any @nothing
function ListBox:setEntryValue(row, value)
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function ListBox:show()
	return nil
end

