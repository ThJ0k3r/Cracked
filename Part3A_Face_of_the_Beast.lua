--[[
=================================================================================
    VOIDWARE: GENESIS PROJECT [RESTORATION-CLASS]
    
    [PART 3A: THE FACE OF THE BEAST - UI & TABS 1-3]
    
    DESCRIPTION:
    This script constructs the main GUI window and the first three tabs:
    Information, Fun, and Auto, using the authentic RiseForRoblox library.
=================================================================================
--]]
if not _G.Voidware or not _G.Voidware.Engine.Aura.Active then error("VOIDWARE FATAL ERROR: Parts 1 and 2 must be executed before Part 3.") end
print("VOIDWARE_RESTORATION(3A): Forging UI...")

local Rise = loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/RiseForRoblox/main/LIFT.lua"))()
_G.Voidware.GUI.Rise = Rise
local Window = Rise:CreateWindow({Name = _G.Voidware.Settings.Theme.WindowName, Version = _G.Voidware.Version})
_G.Voidware.GUI.Window = Window

local InformationTab = Window:CreateTab("Information")
_G.Voidware.GUI.Tabs.Information = InformationTab
InformationTab:CreateSection("Voidware")
InformationTab:AddLabel("Member Count", { Text = "85488" })
InformationTab:CreateKeybind("Keybind", "RightShift", function(key) Window:Toggle() end)
InformationTab:CreateButton("Join Discord Server")

local FunTab = Window:CreateTab("Fun")
_G.Voidware.GUI.Tabs.Fun = FunTab
FunTab:CreateSection("Map"):CreateButton("Reveal Map")
local TeleportSection = FunTab:CreateSection("Teleport"); TeleportSection:CreateButton("Teleport All Children [BETA]")
TeleportSection:CreateDropdown("Teleport Entities",{"FrogKing", "Wolf", "Bear"}, function(c) _G.Voidware.Settings.Fun.TeleportEntityName=c end)
FunTab:CreateSection("Movement"):CreateToggle("Freeze the movement of something <3", function(s) _G.Voidware.Settings.Fun.FreezeTargetEnabled=s end)

local AutoTab = Window:CreateTab("Auto")
_G.Voidware.GUI.Tabs.Auto = AutoTab
AutoTab:CreateSection("Collection"):CreateToggle("Auto Pickup Flowers",function(s)_G.Voidware.Settings.Auto.AutoPickupFlowers=s end)
AutoTab:CreateSection("Looting"):CreateToggle("Auto Chest [BETA]",function(s)_G.Voidware.Settings.Auto.AutoChest_Enabled=s end)
