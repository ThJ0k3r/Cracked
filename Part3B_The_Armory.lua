--[[
=================================================================================
    VOIDWARE: GENESIS PROJECT [RESTORATION-CLASS]
    
    [PART 3B: FORGING THE ARMORY - UI & TABS 4-5]
    
    DESCRIPTION:
    Constructs the Bring Stuff and Main tabs, the core of the armory.
=================================================================================
--]]
if not _G.Voidware or not _G.Voidware.GUI.Tabs.Information then error("VOIDWARE FATAL ERROR: Part 3A must be executed before Part 3B.") end
print("VOIDWARE_RESTORATION(3B): Forging Armory...")
local Window = _G.Voidware.GUI.Window; local Settings = _G.Voidware.Settings

local BringStuffTab = Window:CreateTab("Bring Stuff")
_G.Voidware.GUI.Tabs.BringStuff = BringStuffTab
local BringSettings=BringStuffTab:CreateSection("Bring Settings");BringSettings:CreateToggle("Use Freecam",function(s)Settings.Bring.UseFreecam=s end);BringSettings:CreateDropdown("Bring Method",{"Slow","Fast","Ultra Fast"},function(c)Settings.Bring.Method=c end);
local ItemsSection=BringStuffTab:CreateSection("Items Raw...");local function ItemBringCallback(i) if i ~= "..." then print("Queue Bring: "..i) end end;ItemsSection:CreateDropdown("Food & Healing",{"...", "Bandage","Medkit","Apple"},ItemBringCallback);ItemsSection:CreateDropdown("Guns & Armor",{"...", "Iron Body","Rifle","Revolver Ammo"},ItemBringCallback)

local MainTab = Window:CreateTab("Main")
_G.Voidware.GUI.Tabs.Main = MainTab
local GodmodeSection = MainTab:CreateSection("Entity Godmode");GodmodeSection:CreateToggle("Become Invincible", function(s)Settings.Main.Invincible=s end);GodmodeSection:CreateSlider("Hip Height",{Min=0,Max=20,Value=2.5},function(v)Settings.Main.HipHeight=v end)
local AuraSection = MainTab:CreateSection("Aura");AuraSection:CreateToggle("Kill Aura",function(s)Settings.Main.KillAura_Enabled=s end);AuraSection:CreateSlider("Aura Range",{Min=10,Max=200,Value=60},function(v)Settings.Main.Aura_Range=v end)
