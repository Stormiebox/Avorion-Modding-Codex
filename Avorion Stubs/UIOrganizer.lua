---@class UIOrganizer
UIOrganizer = {

	inner = Rect, -- [read-only] Rect
	margin = 0, -- [write-only] int
	marginBottom = 0, -- int
	marginLeft = 0, -- int
	marginRight = 0, -- int
	marginTop = 0, -- int
	padding = 0, -- [write-only] int
	paddingBottom = 0, -- int
	paddingLeft = 0, -- int
	paddingRight = 0, -- int
	paddingTop = 0, -- int
	rect = Rect, -- Rect

}

---@return UIOrganizer
---@param a any @Either a Rect and b is nil, or a vec2 and b is a vec2, too @Nil if a is a Rect, or a vec2 if a is a vec2
---@param b any
function UIOrganizer(a, b)
	return UIOrganizer
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIOrganizer:getBottomLeftRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return Rect @A copy of the given rect, aligned to the specific side
function UIOrganizer:getBottomRect(rect)
	return Rect
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIOrganizer:getBottomRightRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIOrganizer:getCenterRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIOrganizer:getLeftRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIOrganizer:getRightRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIOrganizer:getTopLeftRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIOrganizer:getTopRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIOrganizer:getTopRightRect(rect)
	return nil
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIOrganizer:placeElementBottom(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIOrganizer:placeElementBottomLeft(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIOrganizer:placeElementBottomRight(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIOrganizer:placeElementCenter(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIOrganizer:placeElementLeft(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIOrganizer:placeElementRight(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIOrganizer:placeElementTop(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIOrganizer:placeElementTopLeft(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIOrganizer:placeElementTopRight(element)
	return UIElement
end

---@param left number @margin on the left side
---@param right number @margin on the right side
---@param top number @margin on the top side
---@param bottom number @margin on the bottom side
---@return any @nothing
function UIOrganizer:setMargin(left, right, top, bottom)
	return nil
end

---@param left number @padding on the left side
---@param right number @padding on the right side
---@param top number @padding on the top side
---@param bottom number @padding on the bottom side
---@return any @nothing
function UIOrganizer:setPadding(left, right, top, bottom)
	return nil
end

