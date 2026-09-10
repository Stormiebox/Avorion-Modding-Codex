---@class Hud
Hud = {

	buildingUIVisible = true, -- [read-only] bool
	center = vec2, -- vec2
	height = 0.0, -- float
	index = 0, -- [read-only] int
	layer = 0, -- int
	localCenter = vec2, -- [read-only] vec2
	localPosition = vec2, -- [read-only] vec2
	localRect = Rect, -- [read-only] Rect
	lower = vec2, -- vec2
	mailWindowVisible = true, -- [read-only] bool
	mouseOver = true, -- [read-only] bool
	mouseOverSecondaryWindow = true, -- [read-only] bool
	notificationsVisible = true, -- bool
	playerTradeWindowVisible = true, -- [read-only] bool
	playerWindowVisible = true, -- [read-only] bool
	position = vec2, -- vec2
	rect = Rect, -- Rect
	resourcesVisible = true, -- [read-only] bool
	shipWindowVisible = true, -- [read-only] bool
	size = vec2, -- vec2
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	tutorialActive = true, -- [read-only] bool
	upper = vec2, -- vec2
	visible = true, -- bool
	width = 0.0, -- float

}

---@return Hud
function Hud()
	return Hud
end

---@param rect Rect
---@return UIContainer
function Hud:createContainer(rect)
	return UIContainer
end

---@param rect Rect
---@return Window
function Hud:createWindow(rect)
	return Window
end

--- Displays a prioritized hint with the given text. The hint won't have a 'Don't show again' field, and it will override all other hints while its active. Hint will be removed when no more objects can be highlighted (which will only happen in case of passing ids of entities that then are deleted or destroyed), or when it's overridden by another call to 'displayHint', or when the player clicks on the 'X', or when the script that did the call was deleted.
---@param text string @Text that will be shown in the hint. Passing "" will disable the hint.
---@param highlights table<number, any> @Objects that should be highlighted. Can be any number of vec3, Rect, ids (string, Uuid) or Entity. Passing 0 objects will disable the hint.
---@return any @nothing
function Hud:displayHint(text, highlights)
	return nil
end

--- Displays a notification on the right hand side, similar to warnings or error messages.
---@param text string @The text of the notifiction
---@param textColor Color @Color of the text
---@param icon string @Path to the icon that should be shown
---@param iconColor nil | Color @Color of the icon
---@param alliance any @If the notification is meant for the alliance (will show a small alliance banner next to the icon)
---@param size any @Height of the notification in pixels
---@param iconPadding any @Padding around the icon image (in percent from 0 to 1)
---@return any @nothing
function Hud:displayNotification(text, textColor, icon, iconColor, alliance, size, iconPadding)
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function Hud:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function Hud:isMouseOverAndUnobscured()
	return true
end

--- Changes the cursor to another cursor. You should be very careful using this function and make sure that the cursor is always returned to what it was before once you don't need a special one any more. Passing nil as icon path will reset the cursor to default.
---@param icon any @path to the icon that should be used as the cursor @Y coordinate in pixels of the center of the cursor in the icon
---@param x any @X coordinate in pixels of the center of the cursor in the icon
---@param y any
---@return any @nothing
function Hud:setCursor(icon, x, y)
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function Hud:show()
	return nil
end

