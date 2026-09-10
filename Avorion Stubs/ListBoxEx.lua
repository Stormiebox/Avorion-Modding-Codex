---@class ListBoxEx
ListBoxEx = {

	center = vec2, -- vec2
	columns = 0, -- unsigned
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

---@return ListBoxEx
---@param index number
function ListBoxEx(index)
	return ListBoxEx
end

---@return any @nothing
function ListBoxEx:addRow()
	return nil
end

---@return any @nothing
function ListBoxEx:clampScrollPosition()
	return nil
end

---@return any @nothing
function ListBoxEx:clear()
	return nil
end

---@return any @nothing
function ListBoxEx:deselect()
	return nil
end

---@param index number
---@return number
function ListBoxEx:getColumnWidth(index)
	return 0
end

---@param column number
---@param row number
---@return string,boolean,boolean,Color,any
function ListBoxEx:getEntry(column, row)
	return "",true,true,Color,nil
end

--- Inherited from UIElement
---@return any @nothing
function ListBoxEx:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function ListBoxEx:isMouseOverAndUnobscured()
	return true
end

---@param index number
---@return any @nothing
function ListBoxEx:removeRow(index)
	return nil
end

---@param index number
---@return any @nothing
function ListBoxEx:select(index)
	return nil
end

---@param index number
---@return any @nothing
function ListBoxEx:selectNoCallback(index)
	return nil
end

---@param value any
---@return any @nothing
function ListBoxEx:selectValue(value)
	return nil
end

---@param value any
---@return any @nothing
function ListBoxEx:selectValueNoCallback(value)
	return nil
end

---@param index number
---@param width number
---@return any @nothing
function ListBoxEx:setColumnWidth(index, width)
	return nil
end

---@param column number
---@param row number
---@param text string
---@param bold boolean
---@param italic boolean
---@param color Color
---@param entryWidth any
---@param align any
---@return any @nothing
function ListBoxEx:setEntry(column, row, text, bold, italic, color, entryWidth, align)
	return nil
end

---@param column number
---@param row number
---@param text string
---@param bold boolean
---@param italic boolean
---@param color Color
---@param entryWidth any
---@param align any
---@return any @nothing
function ListBoxEx:setEntryNoCallback(column, row, text, bold, italic, color, entryWidth, align)
	return nil
end

---@param column number
---@param row number
---@param text string
---@return any @nothing
function ListBoxEx:setEntryTooltip(column, row, text)
	return nil
end

---@param column number
---@param row number
---@param type number
---@return any @nothing
function ListBoxEx:setEntryType(column, row, type)
	return nil
end

---@param column number
---@param row number
---@param value any
---@return any @nothing
function ListBoxEx:setEntryValue(column, row, value)
	return nil
end

---@param row number
---@param text string
---@return any @nothing
function ListBoxEx:setTooltip(row, text)
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function ListBoxEx:show()
	return nil
end

