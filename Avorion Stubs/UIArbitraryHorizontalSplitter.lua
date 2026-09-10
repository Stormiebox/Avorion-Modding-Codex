---@class UIArbitraryHorizontalSplitter
UIArbitraryHorizontalSplitter = {

	inner = Rect, -- [read-only] Rect
	margin = 0, -- [write-only] int
	marginBottom = 0, -- int
	marginLeft = 0, -- int
	marginRight = 0, -- int
	marginTop = 0, -- int
	padding = 0, -- [write-only] int
	paddingBottom = 0, -- int
	paddingInside = 0, -- int
	paddingLeft = 0, -- int
	paddingRight = 0, -- int
	paddingTop = 0, -- int
	rect = Rect, -- Rect

}

---@return UIArbitraryHorizontalSplitter
---@param rect Rect @The rect to split
---@param padding number @margin
---@param margin number
---@param splits table<number, number> @The y coordinates of the splits in pixels
function UIArbitraryHorizontalSplitter(rect, padding, margin, splits)
	return UIArbitraryHorizontalSplitter
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIArbitraryHorizontalSplitter:getBottomLeftRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return Rect @A copy of the given rect, aligned to the specific side
function UIArbitraryHorizontalSplitter:getBottomRect(rect)
	return Rect
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIArbitraryHorizontalSplitter:getBottomRightRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIArbitraryHorizontalSplitter:getCenterRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIArbitraryHorizontalSplitter:getLeftRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIArbitraryHorizontalSplitter:getRightRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIArbitraryHorizontalSplitter:getTopLeftRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIArbitraryHorizontalSplitter:getTopRect(rect)
	return nil
end

--- Aligns the given rect to a specific side
---@param rect Rect @The given rect
---@return any @nothing
function UIArbitraryHorizontalSplitter:getTopRightRect(rect)
	return nil
end

--- Retrieves one of the new created rects
---@param index number @The index of the retrieved rect, from 0 to splits
---@return Rect @A new rect, size was determined by splitting
function UIArbitraryHorizontalSplitter:partition(index)
	return Rect
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIArbitraryHorizontalSplitter:placeElementBottom(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIArbitraryHorizontalSplitter:placeElementBottomLeft(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIArbitraryHorizontalSplitter:placeElementBottomRight(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIArbitraryHorizontalSplitter:placeElementCenter(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIArbitraryHorizontalSplitter:placeElementLeft(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIArbitraryHorizontalSplitter:placeElementRight(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIArbitraryHorizontalSplitter:placeElementTop(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIArbitraryHorizontalSplitter:placeElementTopLeft(element)
	return UIElement
end

--- Aligns the given UI element to a specific side
---@param element UIElement @The given UI element
---@return UIElement @A reference to the given UI element
function UIArbitraryHorizontalSplitter:placeElementTopRight(element)
	return UIElement
end

---@param left number @margin on the left side
---@param right number @margin on the right side
---@param top number @margin on the top side
---@param bottom number @margin on the bottom side
---@return any @nothing
function UIArbitraryHorizontalSplitter:setMargin(left, right, top, bottom)
	return nil
end

---@param left number @padding on the left side
---@param right number @padding on the right side
---@param top number @padding on the top side
---@param bottom number @padding on the bottom side
---@return any @nothing
function UIArbitraryHorizontalSplitter:setPadding(left, right, top, bottom)
	return nil
end

