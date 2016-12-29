// Draw Gamemode HUD

// Hide default HL2 HUD element(s)
// https://wiki.garrysmod.com/page/HUD_Element_List
local elementsToHide = {
	CHudHealth = true,
	CHudBattery = true,
	CHudAmmo = true,
	CHudSecondaryAmmo = true
}

hook.Add("HUDShouldDraw", "HideHUD", function(name)
	if (elementsToHide[ name ]) then return false end
end)