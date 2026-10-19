function recursiveEnumerate(folder, file_list)
	local items = love.filesystem.getDirectoryItems(folder)
	for _,item in ipairs(items) do
		local file = folder .. "/" .. item
		local info = love.filesystem.getInfo(file)
		if info then
			if info.type == "file" then
				table.insert(file_list, file)
			elseif info.type == "directory" then
				recursiveEnumerate(file, file_list)
			end
		end
	end
end

return recursiveEnumerate