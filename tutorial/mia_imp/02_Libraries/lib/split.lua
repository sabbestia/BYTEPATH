function split(input_string, sep)
	-- Di default il separatore è spazio
	if sep == nil then sep = "%s" end
	local t = {}
	local pattern = string.format("([^%s]+)", sep)
	for str in string.gmatch(input_string,pattern) do
		table.insert(t,str)
	end
	return t
end

return split