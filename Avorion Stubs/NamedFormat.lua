---@class NamedFormat
NamedFormat = {

	text = "", -- [read-only] string

}

---@return NamedFormat
function NamedFormat(string, MapType)
	return NamedFormat
end

---@return table<string,PluralForm>
function NamedFormat:arguments()
	return {"",PluralForm}
end

---@return boolean
function NamedFormat:empty()
	return true
end

---@return string
function NamedFormat:evaluate()
	return ""
end

---@return string
function NamedFormat:translated()
	return ""
end

