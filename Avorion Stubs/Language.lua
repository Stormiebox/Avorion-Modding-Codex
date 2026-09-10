---@class Language
Language = {

	apostrophes = true, -- bool
	seed = Seed, -- [write-only] Seed

}

---@return Language
---@param seed Seed
function Language(seed)
	return Language
end

---@return string
function Language:getConsonantSound()
	return ""
end

---@param end boolean
---@return table<number, string>
function Language:getConsonantSounds(end)
	return {""}
end

---@return string,string
function Language:getFactionName()
	return "",""
end

---@return table<number, string>
function Language:getGeneratedWords()
	return {""}
end

---@return string
function Language:getName()
	return ""
end

---@param startingWithVowel boolean
---@param first boolean
---@param last boolean
---@return string
function Language:getSyllable(startingWithVowel, first, last)
	return ""
end

---@param numSyllables number
---@return string
function Language:getSyllableCombination(numSyllables)
	return ""
end

---@param startingWithVowel boolean
---@param first boolean
---@param last boolean
---@return string
function Language:getTypicalSyllable(startingWithVowel, first, last)
	return ""
end

---@return string
function Language:getVowelSound()
	return ""
end

---@return table<number, string>
function Language:getVowelSounds()
	return {""}
end

---@return string
function Language:getWord()
	return ""
end

---@return any @nothing
function Language:setConsonantSounds()
	return nil
end

---@return any @nothing
function Language:setGeneratedWords()
	return nil
end

---@return any @nothing
function Language:setVowelSounds()
	return nil
end

