---@class UIHorizontalLister
UIHorizontalLister = {

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

---@return UIHorizontalLister
---@param rect Rect @The rect in which the lister aligns its elenents
---@param padding number @margin
---@param margin number
function UIHorizontalLister(rect, padding, margin)
	return UIHorizontalLister
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIHorizontalLister:getBottomLeftRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return Rect @A copy of the given rect, aligned to the specific side
function UIHorizontalLister:getBottomRect(rect)
	return Rect
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIHorizontalLister:getBottomRightRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIHorizontalLister:getCenterRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIHorizontalLister:getLeftRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIHorizontalLister:getRightRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIHorizontalLister:getTopLeftRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIHorizontalLister:getTopRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIHorizontalLister:getTopRightRect(rect)
	return nil
end

--- Checks if there is enough space to fit a rect with the given height into the lister's remaining rect
---@param vec number @The size of the rect to test for
---@return any @true if there's enough space, false if not
function UIHorizontalLister:hasEnoughSpace(vec)
	return nil
end

---@return Rect
function UIHorizontalLister:nextQuadraticRect()
	return Rect
end

--- Returns the next rect of a certain height that would be created. The rect will have the full width of the rect given to the lister.
---@param height number @The height of the rect
---@return Rect @The Rect
function UIHorizontalLister:nextRect(height)
	return Rect
end

--- Uses the given vector to create a Rect of size Rect(0, 0, vec.x, vec.y), places it in the list and aligns it to the right
---@param vec vec2 @The given size of the rect to align
---@return UIElement @The aligned rect
function UIHorizontalLister:placeBottom(vec)
	return UIElement
end

--- Uses the given vector to create a Rect of size Rect(0, 0, vec.x, vec.y), places it in the list and centers it
---@param vec vec2 @The given size of the rect to align
---@return UIElement @The aligned rect
function UIHorizontalLister:placeCenter(vec)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIHorizontalLister:placeElementBottom(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIHorizontalLister:placeElementBottomLeft(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIHorizontalLister:placeElementBottomRight(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIHorizontalLister:placeElementCenter(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIHorizontalLister:placeElementLeft(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIHorizontalLister:placeElementRight(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIHorizontalLister:placeElementTop(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIHorizontalLister:placeElementTopLeft(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIHorizontalLister:placeElementTopRight(element)
	return UIElement
end

--- Uses the given vector to create a Rect of size Rect(0, 0, vec.x, vec.y), places it in the list and aligns it to the left
---@param vec vec2 @The given size of the rect to align
---@return UIElement @The aligned rect
function UIHorizontalLister:placeTop(vec)
	return UIElement
end

---@param left number @margin on the left side
---@param right number @margin on the right side
---@param top number @margin on the top side
---@param bottom number @margin on the bottom side
---@return any @nothing
function UIHorizontalLister:setMargin(left, right, top, bottom)
	return nil
end

---@param left number @padding on the left side
---@param right number @padding on the right side
---@param top number @padding on the top side
---@param bottom number @padding on the bottom side
---@return any @nothing
function UIHorizontalLister:setPadding(left, right, top, bottom)
	return nil
end

