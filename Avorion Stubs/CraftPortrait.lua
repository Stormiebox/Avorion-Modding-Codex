---@class CraftPortrait
CraftPortrait = {

	alliance = true, -- bool
	available = true, -- bool
	center = vec2, -- vec2
	craftName = "", -- [write-only] string
	fontColor = Color, -- Color
	fontSize = 0, -- int
	frameColor = Color, -- Color
	height = 0.0, -- float
	inSector = true, -- bool
	index = 0, -- [read-only] int
	layer = 0, -- int
	localCenter = vec2, -- [read-only] vec2
	localPosition = vec2, -- [read-only] vec2
	localRect = Rect, -- [read-only] Rect
	lower = vec2, -- vec2
	mouseOver = true, -- [read-only] bool
	onPressedFunction = "", -- string
	onRightClickedFunction = "", -- string
	position = vec2, -- vec2
	rect = Rect, -- Rect
	selectable = true, -- bool
	selected = true, -- bool
	size = vec2, -- vec2
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	upper = vec2, -- vec2
	visible = true, -- bool
	width = 0.0, -- float

}

---@return CraftPortrait
---@param index number
function CraftPortrait(index)
	return CraftPortrait
end

--- Inherited from UIElement
---@return any @nothing
function CraftPortrait:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function CraftPortrait:isMouseOverAndUnobscured()
	return true
end

--- Inherited from UIElement
---@return any @nothing
function CraftPortrait:show()
	return nil
end

