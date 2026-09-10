---@class CaptainSelectionItem
CaptainSelectionItem = {

	passengerIndex = 0, -- int

}

---@return CaptainSelectionItem
---@param other Captain
function CaptainSelectionItem(other)
	return CaptainSelectionItem
end

---@return Captain
function CaptainSelectionItem:getCaptain()
	return Captain
end

---@param captain Captain
---@return any @nothing
function CaptainSelectionItem:setCaptain(captain)
	return nil
end

