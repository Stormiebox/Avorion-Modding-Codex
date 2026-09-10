---@class TextField
TextField = {

	bold = true, -- bool
	center = vec2, -- vec2
	font = 0, -- int
	fontColor = Color, -- Color
	fontSize = 0, -- int
	height = 0.0, -- float
	index = 0, -- [read-only] int
	italic = true, -- bool
	layer = 0, -- int
	localCenter = vec2, -- [read-only] vec2
	localPosition = vec2, -- [read-only] vec2
	localRect = Rect, -- [read-only] Rect
	lower = vec2, -- vec2
	mouseOver = true, -- [read-only] bool
	outlined = true, -- bool
	padding = 0, -- int
	position = vec2, -- vec2
	rect = Rect, -- Rect
	scrollable = true, -- bool
	shadowed = true, -- bool
	size = vec2, -- vec2
	strikethrough = true, -- bool
	text = "", -- string
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	underlined = true, -- bool
	upper = vec2, -- vec2
	visible = true, -- bool
	width = 0.0, -- float

}

---@return TextField
---@param index number
function TextField(index)
	return TextField
end

--- Inherited from UIElement
---@return any @nothing
function TextField:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function TextField:isMouseOverAndUnobscured()
	return true
end

--- Inherited from UIElement
---@return any @nothing
function TextField:show()
	return nil
end

