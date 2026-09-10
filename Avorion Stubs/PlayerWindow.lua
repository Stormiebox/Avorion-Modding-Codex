---@class PlayerWindow
PlayerWindow = {

	onSelectedFunction = "", -- string

}

---@return PlayerWindow
function PlayerWindow()
	return PlayerWindow
end

---@return any @nothing
function PlayerWindow:activateAllTabs()
	return nil
end

---@param tab Tab
---@return any @nothing
function PlayerWindow:activateTab(tab)
	return nil
end

---@param name string
---@param icon string
---@param description string
---@return Tab
function PlayerWindow:createTab(name, icon, description)
	return Tab
end

---@param tab Tab
---@return any @nothing
function PlayerWindow:deactivateTab(tab)
	return nil
end

---@return Tab
function PlayerWindow:getActiveTab()
	return Tab
end

---@param name string
---@return Tab
function PlayerWindow:getTab(name)
	return Tab
end

---@return any @nothing
function PlayerWindow:hide()
	return nil
end

---@param tab Tab
---@param pos number
---@return any @nothing
function PlayerWindow:moveTabToPosition(tab, pos)
	return nil
end

---@param tab Tab
---@return any @nothing
function PlayerWindow:moveTabToTheRight(tab)
	return nil
end

---@param val any
---@return any @nothing
function PlayerWindow:selectTab(val)
	return nil
end

---@return any @nothing
function PlayerWindow:show()
	return nil
end

