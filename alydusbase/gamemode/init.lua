AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

// Variables
local doConsoleMessages = true // Show include information on init?
local gamemodeFolderName = "alydusbase" // The gamemode folder name (do not use engine.ActiveGamemode)

local clientFiles, clientDirectories = file.Find(gamemodeFolderName .. "/gamemode/client/*", "LUA")
local sharedFiles, sharedDirectories = file.Find(gamemodeFolderName .. "/gamemode/shared/*", "LUA")
local serverFiles, serverDirectories = file.Find(gamemodeFolderName .. "/gamemode/server/*", "LUA")
local autoFiles, autoDirectories = file.Find(gamemodeFolderName .. "/gamemode/auto/*", "LUA")

if doConsoleMessages then
	print("Loading init.lua")
end

// Functions
local function includeFolder(side, folder)
	if side == "server" then
		for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/server/" .. folder .. "/sv_*.lua", "LUA")) do
			include("server/" .. folder .. "/" .. v)
			if doConsoleMessages then
				print("Including 'server/" .. folder.. "/" .. v .. "' in init.lua")
			end
		end
	elseif side == "client" then
		for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/client/" .. folder .. "/cl_*.lua", "LUA")) do
			AddCSLuaFile("client/" .. folder .. "/" .. v)
			if doConsoleMessages then
				print("Making 'client/" .. folder.. "/" .. v .. "' avaliable for client in init.lua")
			end
		end
	elseif side == "shared" then
		for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/shared/" .. folder .. "/sh_*.lua", "LUA")) do
			AddCSLuaFile("shared/" .. folder .. "/" .. v)
			include("shared/" .. folder .. "/" .. v)
			if doConsoleMessages then
				print("Making 'shared/" .. folder.. "/" .. v .. "' avaliable for client in init.lua")
				print("Including 'shared/" .. folder.. "/" .. v .. "' in init.lua")
			end
		end
	elseif side == "auto" then
		for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/auto/" .. folder .. "/sh_*.lua", "LUA")) do
			AddCSLuaFile("auto/" .. folder .. "/" .. v)
			include("auto/" .. folder .. "/" .. v)
			if doConsoleMessages then
				print("Making 'auto/" .. folder.. "/" .. v .. "' avaliable for client in init.lua")
				print("Including 'auto/" .. folder.. "/" .. v .. "' in init.lua")
			end
		end
		for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/auto/" .. folder .. "/cl_*.lua", "LUA")) do
			AddCSLuaFile("auto/" .. folder .. "/" .. v)
			if doConsoleMessages then
				print("Making 'auto/" .. folder.. "/" .. v .. "' avaliable for client in init.lua")
			end
		end
		for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/auto/" .. folder .. "/sv_*.lua", "LUA")) do
			include("auto/" .. folder .. "/" .. v)
			if doConsoleMessages then
				print("Including 'auto/" .. folder.. "/" .. v .. "' in init.lua")
			end
		end
	end
end

// Clientside
for k,v in pairs(clientDirectories) do
	includeFolder("client", v)
	if doConsoleMessages then
		print("Checking for files in client directory 'client/" .. v .. "'")
	end
end

for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/client/cl_*.lua", "LUA")) do
	AddCSLuaFile("client/" .. v)
	if doConsoleMessages then
		print("Making 'client/" .. v .. "' avaliable for client in init.lua")
	end
end

// Shared
for k,v in pairs(sharedDirectories) do
	includeFolder("shared", v)
	if doConsoleMessages then
		print("Checking for files in shared directory 'shared/" .. v .. "' in init.lua")
	end
end

for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/shared/sh_*.lua", "LUA")) do
	AddCSLuaFile("shared/" .. v)
	include("shared/" .. v)
	if doConsoleMessages then
		print("Making 'shared/" .. v .."' avaliable for client in init.lua")
		print("Including 'shared/" .. v .. "' in init.lua")
	end
end

// Serverside
for k,v in pairs(serverDirectories) do
	includeFolder("server", v)
	if doConsoleMessages then
		print("Checking for files in server directory 'server/" .. v .."' in init.lua")
	end
end

for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/server/sv_*.lua", "LUA")) do
	include("server/" .. v)
	if doConsoleMessages then
		print("Including 'server/" .. v .. "' in init.lua")
	end
end

// Auto Folder
for k,v in pairs(autoDirectories) do
	includeFolder("auto", v)
	if doConsoleMessages then
		print("Checking for files in auto directory 'auto/" .. v .. "' in init.lua")
	end
end

for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/auto/sv_*.lua", "LUA")) do
	include("auto/" .. v)
	if doConsoleMessages then
		print("Including 'auto/" .. v .. "' in init.lua")
	end
end

for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/auto/cl_*.lua", "LUA")) do
	AddCSLuaFile("auto/" .. v)
	if doConsoleMessages then
		print("Making 'auto/" .. v .. "' avaliable for client in init.lua")
	end
end

for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/auto/sh_*.lua", "LUA")) do
	include("auto/" .. v)
	AddCSLuaFile("auto/" .. v)
	if doConsoleMessages then
		print("Including 'auto/" .. v .. "' in init.lua")
		print("Making 'auto/" .. v .. "' avaliable for client in init.lua")
	end
end

// Finish serverside init
if doConsoleMessages then
	print("Finished loading init.lua")
end
