---@class Music
Music = {

	autoPlay = true, -- bool
	currentTrack = nil, -- [read-only] var
	isPlaying = true, -- [read-only] bool

}

---@return Music
function Music()
	return Music
end

---@param time number
---@return any @nothing
function Music:fadeOut(time)
	return nil
end

---@param time number
---@return any @nothing
function Music:playSilence(time)
	return nil
end

---@param path string
---@param loop boolean
---@param volume any
---@return any @nothing
function Music:playTrack(path, loop, volume)
	return nil
end

---@return any @nothing
function Music:setAmbientTrackLists()
	return nil
end

---@return any @nothing
function Music:stop()
	return nil
end

