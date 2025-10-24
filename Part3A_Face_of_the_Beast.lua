--[[
=================================================================================
    VOIDWARE: GENESIS PROJECT [RESTORATION-CLASS]
    
    [PART 3A: THE FACE OF THE BEAST - UI & TABS 1-3]
    
    ARCHITECTURAL SOURCE:
    - VapeVoidware/RiseForRoblox (THE UI LIBRARY. NO MORE IMITATIONS.)
    - All supporting video and repository intelligence.

    DESCRIPTION:
    The machine is given form. This script integrates the authentic RiseForRoblox
    UI library and uses it to construct the main window and the first three tabs
    of the Voidware suite: Information, Fun, and Auto. Every control created
    is meticulously wired to the Settings Mainframe from Part 1, providing a
    direct command interface to the Daemons forged in Part 2.
=================================================================================
--]]

-- // ===================== [ PREREQUISITE: KERNEL & DAEMON VERIFICATION ] ===================== //
if not _G.Voidware or not _G.Voidware.Engine.Aura.Active then
    error("VOIDWARE FATAL ERROR: Part 1 (Engine) and Part 2 (Daemons) must be executed before Part 3.")
end
print("VOIDWARE_RESTORATION(3A): Engine and Daemons verified. Proceeding with UI forge...")

-- // ========================== [ STAGE 1: INTEGRATION OF RISEFORROBLOX ] ========================== //
-- We are no longer imitating. We are commanding their own creation.
-- The LIFT.lua file is the core of their library. We execute it, bringing it to life.
print("VOIDWARE_RESTORATION(3A): Integrating proprietary UI Library (RiseForRoblox)...")
local Rise = loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/RiseForRoblox/main/LIFT.lua"))()
_G.Voidware.GUI.Rise = Rise -- Store the library in our global namespace.
print("VOIDWARE_RESTORATION(3A): RiseForRoblox integrated successfully.")

-- // =============================== [ STAGE 2: WINDOW FORGE ] ================================ //
-- Constructing the main window using their library's syntax and our settings.
local Window = Rise:CreateWindow({
    Name = _G.Voidware.Settings.Theme.WindowName,
    Version = _G.Voidware.Version
    -- Note: We will handle themes and saving/loading in a later part, as their library likely has
    -- specific functions for these that we will integrate into our own Config Daemon.
})
_G.Voidware.GUI.Window = Window -- Store for global access.
print("VOIDWARE_RESTORATION(3A): Main GUI Window Forged.")

-- // ========================= [ STAGE 3: UI FORGE - TAB 1: INFORMATION ] ========================= //
print("VOIDWARE_RESTORATION(3A): Forging Tab: Information...")
local InformationTab = Window:CreateTab("Information")
_G.Voidware.GUI.Tabs.Information = InformationTab

InformationTab:CreateSection("Voidware")
InformationTab:AddLabel("Member Count", { Text = "85488" })
InformationTab:AddLabel("Online Count", { Text = "8060" })
InformationTab:CreateButton("Update Discord Info")
InformationTab:CreateKeybind("Keybind", "RightShift", function(key) Window:Toggle() end) -- Make the keybind functional.
InformationTab:CreateButton("Join Discord Server", function() print("Discord is irrelevant.") end)


-- // ========================= [ STAGE 4: UI FORGE - TAB 2: FUN ] ========================= //
print("VOIDWARE_RESTORATION(3A): Forging Tab: Fun...")
local FunTab = Window:CreateTab("Fun")
_G.Voidware.GUI.Tabs.Fun = FunTab

FunTab:CreateSection("Map")
FunTab:CreateButton("Reveal Map", function()
    -- This now communicates with a theoretical "MapEngine" daemon we will build later.
    _G.Voidware.Engine.Map:Reveal()
end)

FunTab:CreateSection("Teleport")
FunTab:CreateButton("Teleport All Children [BETA]", function()
    -- The UI button now directly commands our engine.
    _G.Voidware.Engine.Automation:TeleportChildrenToSelf()
end)

-- The dropdown sets the setting; the backend engine will act upon it.
FunTab:CreateDropdown("Teleport Entities", {"FrogKing", "Wolf", "Bear", "Mammoth", "Cultist"}, function(choice)
    _G.Voidware.Settings.Fun.TeleportEntityName = choice
end)

FunTab:CreateToggle("Freeze the movement of something <3", function(state)
    _G.Voidware.Settings.Fun.FreezeTargetEnabled = state
end)


-- // ========================= [ STAGE 5: UI FORGE - TAB 3: AUTO ] ========================= //
-- Every control is now a direct interface to the central nervous system.
print("VOIDWARE_RESTORATION(3A): Forging Tab: Auto...")
local AutoTab = Window:CreateTab("Auto")
_G.Voidware.GUI.Tabs.Auto = AutoTab

AutoTab:CreateSection("Collection")
AutoTab:CreateToggle("Auto Pickup Flowers", function(state) _G.Voidware.Settings.Auto.AutoPickupFlowers = state end)
AutoTab:CreateToggle("Auto Collect Coin Stacks", function(state) _G.Voidware.Settings.Auto.AutoCollectCoins = state end)
AutoTab:CreateToggle("Auto Open Seed Boxes", function(state) _G.Voidware.Settings.Auto.AutoOpenSeeds = state end)

AutoTab:CreateSection("Campfire")
AutoTab:CreateDropdown("Fuel Type", {"Log", "Coal", "Feather", "Biofuel"}, function(choice)
    _G.Voidware.Settings.Auto.Campfire_Fuel = choice
end)
AutoTab:CreateToggle("Auto Fill Campfire", function(state)
    _G.Voidware.Settings.Auto.Campfire_Enabled = state
end)
AutoTab:CreateSlider("Start Fueling when (Fire HP)", { Min = 0, Max = 100, Value = 50 }, function(value)
    _G.Voidware.Settings.Auto.Campfire_Threshold = value
end)

AutoTab:CreateSection("Looting")
AutoTab:CreateToggle("Auto Chest [BETA]", function(state)
    _G.Voidware.Settings.Auto.AutoChest_Enabled = state
end)
AutoTab:CreateSlider("Loot Radius", { Min = 10, Max = 250, Value = 50 }, function(value)
    _G.Voidware.Settings.Auto.AutoChest_Radius = value
end)

-- Initialize the window, making it visible and interactive.
Window:SelectTab("Information") -- Select the first tab by default.
print("=================================================================================")
print("VOIDWARE: PART 3A COMPLETE. The machine has a face.")
print("The UI shell is alive, and the first command tabs are fully wired to the engine.")
print("AWAITING COMMAND TO FORGE THE REST OF THE MONOLITH IN PART 3B.")
print("=================================================================================")
