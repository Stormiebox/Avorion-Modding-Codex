---@class Keyboard
Keyboard = {

	altPressed = true, -- [read-only] bool
	controlPressed = true, -- [read-only] bool
	modifierKeyPressed = true, -- [read-only] bool
	shiftPressed = true, -- [read-only] bool

}

---@return Keyboard
function Keyboard()
	return Keyboard
end

---@param value any
---@return boolean
function Keyboard:keyDown(value)
	return true
end

---@param value any
---@return boolean
function Keyboard:keyPressed(value)
	return true
end

---@param value any
---@return boolean
function Keyboard:keyUp(value)
	return true
end

