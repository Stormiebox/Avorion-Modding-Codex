---@class Label
Label = {

	active = true, -- [write-only] bool
	bold = true, -- [write-only] bool
	caption = "", -- string
	center = vec2, -- vec2
	centered = true, -- [write-only] bool
	color = Color, -- [write-only] Color
	font = 0, -- [write-only] int
	fontSize = 0, -- [write-only] int
	height = 0.0, -- float
	index = 0, -- [read-only] int
	italic = true, -- [write-only] bool
	layer = 0, -- int
	localCenter = vec2, -- [read-only] vec2
	localPosition = vec2, -- [read-only] vec2
	localRect = Rect, -- [read-only] Rect
	lower = vec2, -- vec2
	mouseDownFunction = "", -- [write-only] string
	mouseOver = true, -- [read-only] bool
	outline = true, -- [write-only] bool
	position = vec2, -- vec2
	rect = Rect, -- Rect
	shortenText = true, -- [write-only] bool
	size = vec2, -- vec2
	strikethrough = true, -- [write-only] bool
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	underlined = true, -- [write-only] bool
	upper = vec2, -- vec2
	visible = true, -- bool
	width = 0.0, -- float
	wordBreak = true, -- [write-only] bool

}

---@return Label
---@param index number
function Label(index)
	return Label
end

--- Inherited from UIElement
---@return any @nothing
function Label:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function Label:isMouseOverAndUnobscured()
	return true
end

---@return any @nothing
function Label:setBottomAligned()
	return nil
end

---@return any @nothing
function Label:setBottomLeftAligned()
	return nil
end

---@return any @nothing
function Label:setBottomRightAligned()
	return nil
end

---@return any @nothing
function Label:setCenterAligned()
	return nil
end

---@return any @nothing
function Label:setLeftAligned()
	return nil
end

---@return any @nothing
function Label:setRightAligned()
	return nil
end

---@return any @nothing
function Label:setTopAligned()
	return nil
end

---@return any @nothing
function Label:setTopLeftAligned()
	return nil
end

---@return any @nothing
function Label:setTopRightAligned()
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function Label:show()
	return nil
end

