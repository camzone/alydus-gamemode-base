# Alydus's Gamemode Base
A nice base for GMod gamemodes.

# Features
- Dynamically includes all shared, serverside and clientside files. (init.lua & cl_init.lua)
- A clean file setup for good merit.
- Fully commented for easy understanding.
- Basic HUD setup that hides default HL2 HUD elements. (client/cl_hud.lua)

# Usage
Rename the folder "alydusbase" to your new gamemode name. Change the variable 'gamemodeFolderName' in init.lua & cl_init.lua to the gamemode folder name. New files should be created within client, server, shared, or auto folders with the appropriate prefix. For example:

  * client/cl_hud.lua
  * client/clientfolder/cl_hud2.lua
  * server/sv_test.lua
  * server/serverfolder/sv_test2.lua
  * shared/sh_template.lua
  * auto/cl_example.lua
  * auto/sv_example.lua
  * auto/sh_example.lua
