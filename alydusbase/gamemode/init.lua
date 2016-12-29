AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

print("Loading init.lua...")

local gamemodeFolderName = "alydusbase"

// AddCSLuaFile all clientside files.
for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/client/cl_*.lua", "LUA")) do
	AddCSLuaFile("client/" .. v)
	print("Making client/" .. v .. " avaliable for client download...")
end

// AddCSLuaFile all shared files.
for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/shared/sh_*.lua", "LUA")) do
	AddCSLuaFile("shared/" .. v)
	print("Making shared/" .. v .. " avaliable for client download...")
end

// Include all serverside files
for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/server/sv_*.lua", "LUA")) do
	include("server/" .. v)
	print("Including server/" .. v .. " in init.lua...")
end

// Include all shared files.
for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/shared/sh_*.lua", "LUA")) do
	include("shared/" .. v)
	print("Including shared/" .. v .. " in init.lua...")
end