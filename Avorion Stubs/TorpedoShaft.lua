---@class TorpedoShaft
TorpedoShaft = {

	enabled = true, -- [read-only] bool
	freeSpace = nil, -- [read-only] var
	index = 0, -- [read-only] unsigned
	obstructed = true, -- [read-only] bool
	occupiedSpace = 0.0, -- [read-only] double
	space = 0.0, -- [read-only] double

}

---@return TorpedoShaft
function TorpedoShaft()
	return TorpedoShaft
end

---@return table<number, TorpedoTemplate>
function TorpedoShaft:getTorpedoes()
	return {TorpedoTemplate}
end

---@return any @nothing
function TorpedoShaft:setTorpedoes()
	return nil
end

