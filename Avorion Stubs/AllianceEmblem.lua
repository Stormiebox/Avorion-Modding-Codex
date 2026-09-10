---@class AllianceEmblem
AllianceEmblem = {

	allianceIndex = 0, -- [write-only] int
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

---@return AllianceEmblem
---@param index number
function AllianceEmblem(index)
	return AllianceEmblem
end

--- Inherited from UIElement
---@return any @nothing
function AllianceEmblem:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function AllianceEmblem:isMouseOverAndUnobscured()
	return true
end

--- Inherited from UIElement
---@return any @nothing
function AllianceEmblem:show()
	return nil
end

