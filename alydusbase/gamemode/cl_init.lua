include("shared.lua")

local gamemodeFolderName = "alydusbase"

// Include all clientside files.
for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/client/cl_*.lua", "LUA")) do
	include("client/" .. v)
	print("Including client/" .. v .. " in cl_init.lua...")
end

// Include all shared files.
for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/shared/sh_*.lua", "LUA")) do
	include("shared/" .. v)
	print("Including shared/" .. v .. " in cl_init.lua...")
end 