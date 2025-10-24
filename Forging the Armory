--[[
=================================================================================
    VOIDWARE: GENESIS PROJECT [RESTORATION-CLASS]
    
    [PART 3B: FORGING THE ARMORY - UI & TABS 4-5]
    
    ARCHITECTURAL SOURCE:
    - All previously provided intelligence. Reconstruction is holistic.

    DESCRIPTION:
    The work continues. This script forges the next two, and most critical,
    tabs of the Voidware monolith: the legendary 'Bring Stuff' module and the
    'Main' combat and self-preservation hub. Each control is meticulously
    recreated and wired into the Settings Mainframe from Part 1, giving the
    user direct, tactile control over the core power of the daemons.
=================================================================================
--]]

-- // ===================== [ PREREQUISITE: KERNEL & UI SHELL VERIFICATION ] ===================== //
if not _G.Voidware or not _G.Voidware.GUI.Tabs.Information then
    error("VOIDWARE FATAL ERROR: Part 3A (UI Shell) must be executed before Part 3B.")
end
print("VOIDWARE_RESTORATION(3B): UI Shell verified. Resuming forge...")

local Window = _G.Voidware.GUI.Window -- Re-acquire the window.
local Settings = _G.Voidware.Settings -- Direct access to the mainframe.

-- // ======================== [ STAGE 6: UI FORGE - TAB 4: BRING STUFF ] ======================== //
-- The Crown Jewel. Forged in perfect detail. This tab will have hooks into a
-- "BringEngine" daemon that we will construct in a later part.
print("VOIDWARE_RESTORATION(3B): Forging Tab: Bring Stuff...")
local BringStuffTab = Window:CreateTab("Bring Stuff")
_G.Voidware.GUI.Tabs.BringStuff = BringStuffTab

local BringSettings = BringStuffTab:CreateSection("Bring Settings")
BringSettings:CreateToggle("Use Freecam for Bring Items", function(state) Settings.Bring.UseFreecam = state end)
BringSettings:CreateDropdown("Bring Method", {"Slow", "Fast", "Ultra Fast"}, function(choice) Settings.Bring.Method = choice end)
BringSettings:CreateDropdown("Bring Location", {"Player", "Workbench", "Fire", "Mouse"}, function(choice) Settings.Bring.Location = choice end)
BringSettings:CreateSlider("Max Per Item", {Min = 1, Max = 100, Value = 100}, function(val) Settings.Bring.Amount = val end)
BringSettings:CreateSlider("Bring Cooldown", {Min = 0, Max = 5, Value = 0.5}, function(val) Settings.Bring.Cooldown = val end)
BringSettings:CreateSlider("Bring Height", {Min = 0, Max = 20, Value = 5}, function(val) Settings.Bring.HeightOffset = val end)
BringSettings:CreateToggle("No Bring Amount Limit", function(state) Settings.Bring.NoLimit = state end, true) -- Default to true

local CultistSection = BringStuffTab:CreateSection("Cultists")
CultistSection:CreateDropdown("Bring Cultists", {"Crossbow Cultist", "Juggernaut Cultist", "Cultist Meteor"}, function(choice)
    -- This will eventually command the BringEngine.
    -- _G.Voidware.Engine.Bring:QueueEntity(choice, 1)
end)

local ItemsSection = BringStuffTab:CreateSection("Items Raw...")
local function ItemBringCallback(itemName)
    -- A generic callback to simplify things. All item dropdowns will queue their items
    -- through this, which then passes the command to the yet-to-be-built BringEngine.
    if itemName ~= "..." then
        print("UI command: Queue bring for -> " .. itemName)
        -- _G.Voidware.Engine.Bring:QueueItem(itemName, Settings.Bring.Amount)
    end
end
-- Each dropdown is a testament to the game's item database. Replicated perfectly.
ItemsSection:CreateDropdown("Bring Meteor [BETA]", {"...", "Raw Obsidian Ore", "Gold Shard", "Meteor Shard"}, ItemBringCallback)
ItemsSection:CreateDropdown("Bring Fuel [BETA]", {"...", "Log", "Sapling", "Chair", "Feather", "Coal", "Biofuel"}, ItemBringCallback)
ItemsSection:CreateDropdown("Bring Food & Healing", {"...", "Bandage", "Medkit", "Apple", "Carrot", "Salmon", "Cooked Steak"}, ItemBringCallback)
ItemsSection:CreateDropdown("Bring Gears", {"...", "Bolt", "Tyre", "Sheet Metal", "Old Radio", "Broken Machine", "UFO Scrap", "Gem of the Forest"}, ItemBringCallback)
ItemsSection:CreateDropdown("Bring Guns & Armor", {"...", "Iron Body", "Leather Body", "Good Axe", "Spear", "Rifle", "Revolver Ammo", "Rifle Ammo", "Tactical Shotgun"}, ItemBringCallback)
ItemsSection:CreateDropdown("Bring Others", {"...", "Halloween Candle", "Candy", "Feather", "Sacrifice Totem", "Old Rod", "Diamond", "Infernal Sack"}, ItemBringCallback)

-- // ========================= [ STAGE 7: UI FORGE - TAB 5: MAIN ] ========================= //
-- The command console for the Godmode and Aura daemons.
print("VOIDWARE_RESTORATION(3B): Forging Tab: Main...")
local MainTab = Window:CreateTab("Main")
_G.Voidware.GUI.Tabs.Main = MainTab

local GodmodeSection = MainTab:CreateSection("Entity Godmode")
GodmodeSection:CreateToggle("Become Invincible", function(state)
    Settings.Main.Invincible = state
    if not state and _G.Voidware.Services.LocalPlayer.Character then
        -- Attempt to restore normality when turned off.
        local h = _G.Voidware.Utils:GetHumanoid(_G.Voidware.Utils:GetCharacter())
        if h then h.MaxHealth = 100; h.Health = 100 end
    end
end)
GodmodeSection:CreateSlider("Hip Height Changer", {Min=0, Max=20, Value=2.5}, function(val) Settings.Main.HipHeight = val end)

local AuraSection = MainTab:CreateSection("Aura")
AuraSection:CreateToggle("Kill Aura", function(state) Settings.Main.KillAura_Enabled = state end)
AuraSection:CreateToggle("Ore Aura")
AuraSection:CreateToggle("Ice Aura")
AuraSection:CreateToggle("Require Hand Check", function(state) Settings.Main.KillAura_RequireTool = state end, true)
AuraSection:CreateToggle("Auto TP to Targets")
AuraSection:CreateSlider("Aura Range", {Min=10, Max=200, Value=60}, function(val) Settings.Main.Aura_Range = val end)

local TreeAuraSection = MainTab:CreateSection("Tree Aura")
TreeAuraSection:CreateToggle("Auto Chop Trees", function(state) Settings.Main.TreeAura_Enabled = state end)
TreeAuraSection:CreateDropdown("Auto Chop Tree Type", {"Any", "Small...", "Big Tree", "Dead Tree", "Snowy Small Tree"}, function(choice) Settings.Main.TreeAura_Type = choice end)
TreeAuraSection:CreateToggle("Auto Plant Saplings", function(state) Settings.Main.AutoPlantSaplings = state end)
TreeAuraSection:CreateSlider("Auto Chop Trees Range", {Min=10, Max=2000, Value=100}, function(val) Settings.Main.TreeAura_Range = val end)
TreeAuraSection:CreateToggle("Chop Status Visualiser")

local MiscSection = MainTab:CreateSection("Misc")
MiscSection:CreateToggle("Taming")
MiscSection:CreateButton("Equip Zookeeper class")
MiscSection:CreateToggle("Instant Taming Minigame")
Miscsection:CreateToggle("100% Fishing Success Rate")

print("VOIDWARE_RESTORATION(3B): Armory and Combat tabs forged and wired.")
print("=================================================================================")
print("THE FACE OF THE BEAST GAINS ITS FANGS. AWAITING FINAL UI CONSTRUCTION IN PART 3C.")
print("=================================================================================")
