---@class ContextMenu
ContextMenu = {

	center = vec2, -- vec2
	height = 0.0, -- float
	index = 0, -- [read-only] int
	layer = 0, -- int
	localCenter = vec2, -- [read-only] vec2
	localPosition = vec2, -- [read-only] vec2
	localRect = Rect, -- [read-only] Rect
	lower = vec2, -- vec2
	mouseOver = true, -- [read-only] bool
	onEntryClickedFunction = "", -- string
	position = vec2, -- vec2
	rect = Rect, -- Rect
	size = vec2, -- vec2
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	upper = vec2, -- vec2
	visible = true, -- bool
	width = 0.0, -- float

}

---@return ContextMenu
---@param index number
function ContextMenu(index)
	return ContextMenu
end

---@param caption string
---@param id number
---@param onClickedFunction string
---@return any @nothing
function ContextMenu:addEntry(caption, id, onClickedFunction)
	return nil
end

---@return any @nothing
function ContextMenu:clear()
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function ContextMenu:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function ContextMenu:isMouseOverAndUnobscured()
	return true
end

--- Inherited from UIElement
---@return any @nothing
function ContextMenu:show()
	return nil
end

