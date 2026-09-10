---@class UIElement
UIElement = {

	center = vec2, -- vec2
	height = 0.0, -- float
	index = 0, -- [read-only] int
	layer = 0, -- int
	localCenter = vec2, -- [read-only] vec2
	localPosition = vec2, -- [read-only] vec2
	localRect = Rect, -- [read-only] Rect
	lower = vec2, -- vec2
	mouseOver = true, -- [read-only] bool
	position = vec2, -- vec2
	rect = Rect, -- Rect
	size = vec2, -- vec2
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	upper = vec2, -- vec2
	visible = true, -- bool
	width = 0.0, -- float

}

---@return UIElement
---@param index number
function UIElement(index)
	return UIElement
end

---@return any @nothing
function UIElement:hide()
	return nil
end

---@return boolean
function UIElement:isMouseOverAndUnobscured()
	return true
end

---@return any @nothing
function UIElement:show()
	return nil
end

