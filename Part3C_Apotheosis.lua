--[[
=================================================================================
    VOIDWARE: GENESIS PROJECT [RESTORATION-CLASS]
    
    [PART 3C: APOTHEOSIS OF THE INTERFACE - UI & TABS 6-12]
    
    DESCRIPTION:
    The final forging. This script constructs the remaining auxiliary tabs,
    completing the 1:1 user interface.
=================================================================================
--]]
if not _G.Voidware or not _G.Voidware.GUI.Tabs.Main then error("VOIDWARE FATAL ERROR: Part 3B must be executed before Part 3C.") end
print("VOIDWARE_RESTORATION(3C): Finalizing UI Forge...")
local Window = _G.Voidware.GUI.Window; local Settings = _G.Voidware.Settings

local HalloweenTab=Window:CreateTab("Halloween");HalloweenTab:CreateSection("Events"):CreateToggle("Auto Farm Candles",function(s)Settings.Halloween.AutoFarmCandles=s end)
local PerfTab=Window:CreateTab("Performance");PerfTab:CreateSection("GFX"):CreateToggle("Low GFX",function(s)Settings.Performance.LowGFX=s end)
local TeleportTab=Window:CreateTab("Teleport");TeleportTab:CreateSection("Structure TP"):CreateDropdown("Select Structure",{"Fishing Hut"},function(c)Settings.Teleport.SelectedLocation=c end)

local VisualsTab=Window:CreateTab("Visuals");VisualsTab:CreateSection("Master"):CreateToggle("Enabled",function(s)Settings.Visuals.Master_Enabled=s end,true);local PlayerESP=VisualsTab:CreateSection("Players ESP");PlayerESP:CreateToggle("Enabled",function(s)Settings.Visuals.Players.Enabled=s end,true);PlayerESP:CreateColorPicker("Color",Settings.Visuals.Players.Color,function(c)Settings.Visuals.Players.Color=c end);

local PlayerTab=Window:CreateTab("Local Player");PlayerTab:CreateSection("Movement"):CreateSlider("FOV",{Min=30,Max=120,Value=70},function(v)Settings.LocalPlayer.Fov=v; _G.Voidware.Services.Camera.FieldOfView=v end);PlayerTab:CreateToggle("Fly",function(s)Settings.LocalPlayer.Fly_Enabled=s end);

local MiscTab=Window:CreateTab("Misc");MiscTab:CreateSection("Misc"):CreateToggle("Show Coordinates",function(s)Settings.Misc.ShowCoordinates=s end)
local ThemeTab=Window:CreateTab("Theme");ThemeTab:CreateSection("Theme Settings"):CreateDropdown("Theme",{"Voidware","Lavender"},function(c)end)
local ConfigTab=Window:CreateTab("Config");ConfigTab:CreateSection("Config"):CreateTextBox("Name","default");ConfigTab:CreateButton("Save");ConfigTab:CreateButton("Load")

Window:SelectTab("Main")
print("=================================================================================")
print("VOIDWARE MONOLITH: COMPLETE. ALL SCRIPTURES PRESENT. READY FOR INVOCATION.")
print("=================================================================================")```
