---@class AllianceTab
AllianceTab = {

	center = vec2, -- vec2
	height = 0.0, -- float
	index = 0, -- [read-only] int
	layer = 0, -- int
	localCenter = vec2, -- [read-only] vec2
	localPosition = vec2, -- [read-only] vec2
	localRect = Rect, -- [read-only] Rect
	lower = vec2, -- vec2
	mouseOver = true, -- [read-only] bool
	onSelectedFunction = "", -- string
	position = vec2, -- vec2
	rect = Rect, -- Rect
	size = vec2, -- vec2
	tooltip = nil, -- var
	tooltipWidth = 0, -- [write-only] int
	upper = vec2, -- vec2
	visible = true, -- bool
	width = 0.0, -- float

}

---@return AllianceTab
function AllianceTab()
	return AllianceTab
end

---@return any @nothing
function AllianceTab:activateAllTabs()
	return nil
end

---@param tab Tab
---@return any @nothing
function AllianceTab:activateTab(tab)
	return nil
end

---@param name string
---@param icon string
---@param description string
---@return Tab
function AllianceTab:createTab(name, icon, description)
	return Tab
end

---@param tab Tab
---@return any @nothing
function AllianceTab:deactivateTab(tab)
	return nil
end

---@return Tab
function AllianceTab:getActiveTab()
	return Tab
end

---@param name string
---@return Tab
function AllianceTab:getTab(name)
	return Tab
end

--- Inherited from UIElement
---@return any @nothing
function AllianceTab:hide()
	return nil
end

--- Inherited from UIElement
---@return boolean
function AllianceTab:isMouseOverAndUnobscured()
	return true
end

---@param tab Tab
---@param pos number
---@return any @nothing
function AllianceTab:moveTabToPosition(tab, pos)
	return nil
end

---@param tab Tab
---@return any @nothing
function AllianceTab:moveTabToTheRight(tab)
	return nil
end

---@param val any
---@return any @nothing
function AllianceTab:selectTab(val)
	return nil
end

--- Inherited from UIElement
---@return any @nothing
function AllianceTab:show()
	return nil
end

