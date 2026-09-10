---@class MapIcon
MapIcon = {

	center = vec2, -- vec2
	color = Color, -- [write-only] Color
	coordinates = ivec2, -- [write-only] ivec2
	height = 0.0, -- float
	icon = "", -- [write-only] string
	index = 0, -- [read-only] int
	layer = 0, -- int
	localCenter = vec2, -- [read-only] vec2
	localPosition = vec2, -- [read-only] vec2
	localRect = Rect, -- [read-only] Rect
	lower = vec2, -- vec2
	mouseOver = true, -- [read-only] bool
	offset = vec2, -- [write-only] vec2
	position = vec2, -- vec2
	rect = Rect, -- Rect
	size = vec2, -- vec2
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	upper = vec2, -- vec2
	visible = true, -- bool
	width = 0.0, -- float

}

---@return MapIcon
---@param index number
function MapIcon(index)
	return MapIcon
end

--- Inherited from UIElement
---@return any @nothing
function MapIcon:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function MapIcon:isMouseOverAndUnobscured()
	return true
end

--- Inherited from UIElement
---@return any @nothing
function MapIcon:show()
	return nil
end

