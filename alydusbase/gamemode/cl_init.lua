include("shared.lua")

// Variables
local doConsoleMessages = true // Show include information on init?
local gamemodeFolderName = "alydusbase" // The gamemode folder name (do not use engine.ActiveGamemode)

local clientFiles, clientDirectories = file.Find(gamemodeFolderName .. "/gamemode/client/*", "LUA")
local sharedFiles, sharedDirectories = file.Find(gamemodeFolderName .. "/gamemode/shared/*", "LUA")
local autoFiles, autoDirectories = file.Find(gamemodeFolderName .. "/gamemode/auto/*", "LUA")

// Functions
local function includeFolder(side, folder)
	if side == "client" then
		for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/client/" .. folder .. "/cl_*.lua", "LUA")) do
			include("client/" .. folder .. "/" .. v)
			if doConsoleMessages then
				print("Including 'client/" .. folder.. "/" .. v .. "' in cl_init.lua")
			end
		end
	elseif side == "shared" then
		for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/shared/" .. folder .. "/sh_*.lua", "LUA")) do
			include("shared/" .. folder .. "/" .. v)
			if doConsoleMessages then
				print("Including 'shared/" .. folder.. "/" .. v .. "' in cl_init.lua")
			end
		end
	elseif side == "auto" then
		for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/auto/" .. folder .. "/sh_*.lua", "LUA")) do
			include("auto/" .. folder .. "/" .. v)
			if doConsoleMessages then
				print("Including 'auto/" .. folder.. "/" .. v .. "' in cl_init.lua")
			end
		end
		for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/auto/" .. folder .. "/cl_*.lua", "LUA")) do
			include("auto/" .. folder .. "/" .. v)
			if doConsoleMessages then
				print("Including 'auto/" .. folder.. "/" .. v .. "' in cl_init.lua")
			end
		end
	end
end

// Clientside
for k,v in pairs(clientDirectories) do
	includeFolder("client", v)
	if doConsoleMessages then
		print("Checking for files in auto directory 'client/" .. v .. "' in cl_init.lua")
	end
end

for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/client/cl_*.lua", "LUA")) do
	include("client/" .. v)
	if doConsoleMessages then
		print("Including 'client/" .. v .. "' in cl_init.lua")
	end
end

// Shared
for k,v in pairs(sharedDirectories) do
	includeFolder("shared", v)
	if doConsoleMessages then
		print("Checking for files in shared directory 'shared/" .. v .. "' in cl_init.lua")
	end
end

for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/shared/sh_*.lua", "LUA")) do
	include("shared/" .. v)
	if doConsoleMessages then
		print("Including 'shared/" .. v .. "' in cl_init.lua")
	end
end

// Auto Folder
for k,v in pairs(autoDirectories) do
	includeFolder("auto", v)
	if doConsoleMessages then
		print("Checking for files in auto directory 'auto/" .. v .. "' in cl_init.lua")
	end
end

for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/auto/cl_*.lua", "LUA")) do
	include("auto/" .. v)
	if doConsoleMessages then
		print("Including 'auto/" .. v .. "' in cl_init.lua")
	end
end

for k,v in pairs(file.Find(gamemodeFolderName .. "/gamemode/auto/sh_*.lua", "LUA")) do
	include("auto/" .. v)
	if doConsoleMessages then
		print("Including 'auto/" .. v .. "' in cl_init.lua")
	end
end

// Finish clientside init
if doConsoleMessages then
	print("Finished loading cl_init.lua")
end