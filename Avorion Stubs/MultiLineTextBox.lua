---@class MultiLineTextBox
MultiLineTextBox = {

	active = true, -- [write-only] bool
	center = vec2, -- vec2
	clearOnClick = true, -- [write-only] bool
	editable = true, -- [write-only] bool
	getNumberCharacters = 0, -- [read-only] unsigned
	height = 0.0, -- float
	index = 0, -- [read-only] int
	isTypingActive = true, -- [read-only] bool
	layer = 0, -- int
	localCenter = vec2, -- [read-only] vec2
	localPosition = vec2, -- [read-only] vec2
	localRect = Rect, -- [read-only] Rect
	lower = vec2, -- vec2
	maxCharacters = 0, -- [write-only] unsigned
	mouseOver = true, -- [read-only] bool
	position = vec2, -- vec2
	rect = Rect, -- Rect
	setFontSize = 0, -- [write-only] int
	size = vec2, -- vec2
	text = "", -- string
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	upper = vec2, -- vec2
	visible = true, -- bool
	width = 0.0, -- float

}

---@return MultiLineTextBox
---@param index number
function MultiLineTextBox(index)
	return MultiLineTextBox
end

---@return any @nothing
function MultiLineTextBox:clear()
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function MultiLineTextBox:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function MultiLineTextBox:isMouseOverAndUnobscured()
	return true
end

---@return any @nothing
function MultiLineTextBox:moveCursorDown()
	return nil
end

---@return any @nothing
function MultiLineTextBox:moveCursorLeft()
	return nil
end

---@return any @nothing
function MultiLineTextBox:moveCursorLeftCtrl()
	return nil
end

---@return any @nothing
function MultiLineTextBox:moveCursorRight()
	return nil
end

---@return any @nothing
function MultiLineTextBox:moveCursorRightCtrl()
	return nil
end

---@return any @nothing
function MultiLineTextBox:moveCursorUp()
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function MultiLineTextBox:show()
	return nil
end

