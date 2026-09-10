---@class ScriptUI
ScriptUI = {

	entity = Entity, -- [read-only] Entity
	entityId = 0, -- [read-only] uuid

}

---@return ScriptUI
---@param id any @The id of the entity this component belongs to, or the entity itself, must be an id of an existing entity or nil for the entity in the current script context
function ScriptUI(id)
	return ScriptUI
end

--- Adds a new dialog option to a dialog that is currently in construction. Dialogs are only in construction during the entity or player callback "onStartDialog". Invoking this function at any other point will do nothing.
---@param text string @The text that will be displayed as a chooseable option in the dialog
---@param _function string @The function that will be called when the dialog option is selected.
---@return number
function ScriptUI:addDialogOption(text, _function)
	return 0
end

---@param rect Rect
---@return Window
function ScriptUI:createWindow(rect)
	return Window
end

--- Shows a dialog, and forces the player to interact with the entity. This will close and override the currently displayed dialog. A dialog table looks like this: local dialog = {text = "What's up?", textItalic = true/false, textColor = "0f0", talker = "Random Merchant", talkerItalic = true/false, talkerColor = "f00", onStart = "onStartFunctionCall", onEnd = "onEndFunctionCall", followUp = anotherDialogTable, answers = {{...}, {...}, {...}, ...}} Most of these table values are optional and will be filled in with default values if not present. The anwers table looks like this: local answers = {{answer = "Not much.", color = "ff0", italic = true/false, onSelect = "onThisAnswerWasSelectedFunction", followUp = dialogFollowingThisAnswer}, {text = "The Sky.", ...}, ...} Most of these table values are optional and will be filled in with default values if not present. You should check the scripts that come with the game for dialogs to get more info on how to structure them.
---@param dialog Dialog @A table containing the dialog that will be displayed
---@param closeable any @A value indicating if the dialog can be closed with the Escape key. Disable only with caution! Your dialog must be able to be terminated through every possible answer-way or the player can get stuck. Can be omitted, default is true.
---@return any @nothing
function ScriptUI:interactShowDialog(dialog, closeable)
	return nil
end

---@param caption string
---@param _function string
---@param priority any
---@return any @nothing
function ScriptUI:registerInteraction(caption, _function, priority)
	return nil
end

---@param window Window
---@param caption string
---@param priority any
---@return any @nothing
function ScriptUI:registerWindow(window, caption, priority)
	return nil
end

---@return any @nothing
function ScriptUI:restartInteraction()
	return nil
end

--- Shows a dialog, provided that the player is currently in interaction state with the entity. This will close and override the currently displayed dialog. A dialog table looks like this: local dialog = {text = "What's up?", textItalic = true/false, textColor = "0f0", talker = "Random Merchant", talkerItalic = true/false, talkerColor = "f00", onStart = "onStartFunctionCall", onEnd = "onEndFunctionCall", followUp = anotherDialogTable, answers = {{...}, {...}, {...}, ...}} Most of these table values are optional and will be filled in with default values if not present. The anwers table looks like this: local answers = {{answer = "Not much.", color = "ff0", italic = true/false, onSelect = "onThisAnswerWasSelectedFunction", followUp = dialogFollowingThisAnswer}, {text = "The Sky.", ...}, ...} Most of these table values are optional and will be filled in with default values if not present. You should check the scripts that come with the game for dialogs to get more info on how to structure them.
---@param dialog Dialog @A table containing the dialog that will be displayed
---@param closeable any @A value indicating if the dialog can be closed with the Escape key. Disable only with caution! Your dialog must be able to be terminated through every possible answer-way or the player can get stuck. Can be omitted, default is true.
---@return boolean
function ScriptUI:showDialog(dialog, closeable)
	return true
end

--- Have the ship start hailing the player on the client. The player can then accept the hail or reject it. If there is already a hail going on, this function will replace the current hail.
---@param acceptCallback string @The callback that will be called in case the player accepts the hail (dialogs should go in here)
---@param rejectCallback string @The callback that will be called in case the player rejects the hail (you should avoid putting dialogs in here, since the player doesn't want to communicate)
---@return any @nothing
function ScriptUI:startHailing(acceptCallback, rejectCallback)
	return nil
end

--- Stop the current hailing.
---@return any @nothing
function ScriptUI:stopHailing()
	return nil
end

---@return any @nothing
function ScriptUI:stopInteraction()
	return nil
end

