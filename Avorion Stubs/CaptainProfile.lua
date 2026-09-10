---@class CaptainProfile
CaptainProfile = {

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

---@return CaptainProfile
---@param index number
function CaptainProfile(index)
	return CaptainProfile
end

---@return Captain
function CaptainProfile:getCaptain()
	return Captain
end

--- Inherited from UIElement
---@return any @nothing
function CaptainProfile:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function CaptainProfile:isMouseOverAndUnobscured()
	return true
end

---@param captain nil | Captain
---@return any @nothing
function CaptainProfile:setCaptain(captain)
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function CaptainProfile:show()
	return nil
end

