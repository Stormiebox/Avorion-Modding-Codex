---@class Server
Server = {

	accessMode = 0, -- [read-only] int
	collisionDamage = 0.0, -- [read-only] float
	description = "", -- [read-only] string
	difficulty = 0, -- [read-only] int
	folder = "", -- [read-only] string
	gamePort = 0, -- [read-only] int
	generatorThreads = 0, -- [read-only] int
	infiniteResources = true, -- [read-only] bool
	maxPlayers = 0, -- [read-only] int
	name = "", -- [read-only] string
	paused = 0.0, -- [read-only] double
	playerToPlayerDamage = true, -- bool
	players = 0, -- [read-only] int
	rconPort = 0, -- [read-only] int
	runtime = 0.0, -- [read-only] double
	sameStartSector = true, -- [read-only] bool
	scriptThreads = 0, -- [read-only] int
	seed = Seed, -- [read-only] Seed
	sessionId = nil, -- [read-only] var
	steamMasterPort = 0, -- [read-only] int
	steamQueryPort = 0, -- [read-only] int
	udpPollingPort = 0, -- [read-only] int
	unpausedRuntime = 0.0, -- [read-only] double
	workerThreads = 0, -- [read-only] int
	xsotanInvasionSectors = 0, -- [read-only] int

}

---@return Server
function Server()
	return Server
end

---@param sender Player
---@param command string
---@return any @nothing
function Server:addChatCommand(sender, command)
	return nil
end

--- Broadcast a chat message to all players on the server. Supports sending of format arguments so that the message can be translated on the client.
---@param sender any @The sender that will be displayed for the chat message
---@param messageType number @The type of chat message, 0 = Normal, 1 = Error, 2 = Warning, 3 = Info
---@param message string @The message that will be sent
---@param args table<number, PluralForm> @The format arguments that will be sent
---@return any @nothing
function Server:broadcastChatMessage(sender, messageType, message, args)
	return nil
end

--- Check how many functions are registered to a callback from the current script VM.
---@param callbackName string @The name of the callback
---@param functionName any @The name of the function for which to check. If nil, will count all functions that are registered to this callback.
---@return number @The amount of functions registered to the callback. -1 if an error occurred.
function Server:callbacksRegistered(callbackName, functionName)
	return 0
end

---@return table<number, string>
function Server:getBlackList()
	return {""}
end

---@return table<number, string>
function Server:getIpBlackList()
	return {""}
end

---@return table<number, Player>
function Server:getOnlinePlayers()
	return {Player}
end

---@return table<number, Player>
function Server:getPlayers()
	return {Player}
end

--- Retrieves a custom value saved in the entity with the given key
---@param key string @A string that serves as the name of the value
---@return any @The value if the key exists, otherwise nil
function Server:getValue(key)
	return nil
end

--- Retrieves all key-value pairs of custom values of the entity
---@return table<string,any> @A table containing all custom key-value pairs
function Server:getValues()
	return {"",nil}
end

---@return table<number, string>
function Server:getWhiteList()
	return {""}
end

---@param player Player
---@return boolean
function Server:hasAdminPrivileges(player)
	return true
end

--- Checks if the player or the alliance with the given index is currently online. An alliance counts as online if at least one member is online.
---@param index number @The index of the player or alliance
---@return boolean @true if online, false otherwise
function Server:isOnline(index)
	return true
end

--- @callback
--- Executed whenever the player sent a chat message to the server. Only called if the chat message is valid and the player doesn't have a chat ban.
function Server:onChatMessage(playerIndex, text, channel)
end

--- @callback
--- Executed whenever a player was logged in
function Server:onPlayerLogIn(playerIndex)
end

--- @callback
--- Executed whenever a player was logged off
function Server:onPlayerLogOff(playerIndex)
end

--- Register a callback in the server. The callback may arrive with a delay. Double registration of callbacks doesn't work. When the same callback to the same callback of the same script instance is registered twice, it will still only be called once.
---@param callbackName string @The name of the callback
---@param functionName string @The name of the function that will be executed in the script when the callback happens
---@return number @0 on success, 1 if the registration failed
function Server:registerCallback(callbackName, functionName)
	return 0
end

---@param ip string
---@return any @nothing
function Server:removeBlacklistedIp(ip)
	return nil
end

---@param name string
---@return any @nothing
function Server:removeBlacklistedName(name)
	return nil
end

---@param name string
---@return any @nothing
function Server:removeWhitelistedName(name)
	return nil
end

---@return any @nothing
function Server:save()
	return nil
end

---@return any @nothing
function Server:sendCallback()
	return nil
end

--- Sets a custom value
---@param key string @A string that serves as the name of the value
---@param value any @The value to save. Must be bool, number, string or nil. If nil is given, the value will be deleted.
---@return any
function Server:setValue(key, value)
	return nil
end

---@return any @nothing
function Server:stop()
	return nil
end

---@param callbackName string
---@param functionName string
---@return number
function Server:unregisterCallback(callbackName, functionName)
	return 0
end

