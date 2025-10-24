--[[
=================================================================================
    VOIDWARE: GENESIS PROJECT [RESTORATION-CLASS]
    
    [PART 3A: The Face of the Beast - UI & Tabs 1-3]
    
    INSTRUCTIONS: This is the third scripture, first fragment.
=================================================================================
--]]

-- // ===================== [ PREREQUISITE: KERNEL & DAEMON VERIFICATION ] ===================== //
if not _G.Voidware or not _G.Voidware.Engine.Aura.Active then
    error("VOIDWARE FATAL ERROR: Parts 1 and 2 must be executed before Part 3.")
end
print("VOIDWARE_TITHE(3A): Daemons verified. Proceeding with UI forge...")

-- // ========================== [ STAGE 1: INTEGRATION OF RISEFORROBLOX ] ========================== //
print("VOIDWARE_TITHE(3A): Integrating proprietary UI Library (RiseForRoblox)...")
-- NOTE: In the final, unified monolith, this will not be an HttpGet.
-- This modular design assumes a multi-file structure.
local Rise = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/VapeVoidware/RiseForRoblox/main/LIFT.lua"))()
if not Rise then
    error("CRITICAL FAILURE: THE SOUL OF THE MACHINE (RiseForRoblox) COULD NOT BE SUMMONED.")
end
_G.Voidware.GUI.Rise = Rise
print("VOIDWARE_TITHE(3A): RiseForRoblox integrated successfully.")

-- // =============================== [ STAGE 2: WINDOW FORGE ] ================================ //
local Window = Rise:CreateWindow({
    Name = _G.Voidware.Settings.Theme.WindowName,
    Version = _G.Voidware.Version
})
_G.Voidware.GUI.Window = Window
print("VOIDWARE_TITHE(3A): Main GUI Window Forged.")


-- // ========================= [ STAGE 3: UI FORGE - TAB 1: INFORMATION ] ========================= //
print("VOIDWARE_TITHE(3A): Forging Tab: Information...")
local InformationTab = Window:CreateTab("Information")
_G.Voidware.GUI.Tabs.Information = InformationTab

local InfoSection = InformationTab:CreateSection("Voidware")
InfoSection:AddLabel("Member Count", { Text = "85488" })
InfoSection:AddLabel("Online Count", { Text = "8060" })
InfoSection:CreateKeybind("Toggle UI", "RightShift", function() Window:Toggle() end)
InfoSection:CreateButton("Join Discord Server", function() end) -- Actionless as the server is irrelevant.
InfoSection:AddLabel("Welcome!", {Text = "Welcome to Voidware!"})

-- // ========================= [ STAGE 4: UI FORGE - TAB 2: FUN ] ========================= //
print("VOIDWARE_TITHE(3A): Forging Tab: Fun...")
local FunTab = Window:CreateTab("Fun")
_G.Voidware.GUI.Tabs.Fun = FunTab

FunTab:CreateSection("Map"):CreateButton("Reveal Map")

local TeleportSection = FunTab:CreateSection("Teleport")
TeleportSection:CreateButton("Teleport All Children [BETA]") -- Logic to be handled by a future Automation Daemon
TeleportSection:CreateDropdown("Teleport Entities", {"FrogKing", "Wolf", "Bear", "Mammoth", "Cultist"}, function(c) _G.Voidware.Settings.Fun.TeleportEntityName=c end)

local MovementSection = FunTab:CreateSection("Movement")
MovementSection:CreateToggle("Freeze the movement of something <3", function(s) _G.Voidware.Settings.Fun.FreezeTargetEnabled=s end)
MovementSection:CreateButton("Unfreeze The Thingys")

-- // ========================== [ STAGE 5: UI FORGE - TAB 3: AUTO ] ========================== //
print("VOIDWARE_TITHE(3A): Forging Tab: Auto...")
local AutoTab = Window:CreateTab("Auto")
_G.Voidware.GUI.Tabs.Auto = AutoTab

local CollectionSection = AutoTab:CreateSection("Collection")
CollectionSection:CreateToggle("Auto Pickup Flowers",function(s)_G.Voidware.Settings.Auto.AutoPickupFlowers=s end)
CollectionSection:CreateToggle("Auto Collect Coin Stacks",function(s)_G.Voidware.Settings.Auto.AutoCollectCoins=s end)
CollectionSection:CreateToggle("Auto Open Seed Boxes",function(s)_G.Voidware.Settings.Auto.AutoOpenSeeds=s end)

local CampfireSection = AutoTab:CreateSection("Campfire")
CampfireSection:CreateDropdown("Fuel Type", {"Log", "Coal", "Feather", "Biofuel"}, function(c) _G.Voidware.Settings.Auto.Campfire_Fuel=c end)
CampfireSection:CreateToggle("Auto Fill Campfire", function(s) _G.Voidware.Settings.Auto.Campfire_Enabled = s end)
CampfireSection:CreateSlider("Start Fueling when (Fire HP)", {Min=0, Max=100, Value=50}, function(v) _G.Voidware.Settings.Auto.Campfire_Threshold = v end)

local LootingSection = AutoTab:CreateSection("Looting")
LootingSection:CreateToggle("Auto Chest [BETA]",function(s) _G.Voidware.Settings.Auto.AutoChest_Enabled=s end)
LootingSection:CreateSlider("Loot Radius",{Min=10,Max=250,Value=50}, function(v) _G.Voidware.Settings.Auto.AutoChest_Radius=v end)
LootingSection:CreateToggle("Plant Stuff", function(s) _G.Voidware.Settings.Auto.AutoPlant=s end)
--[[
=================================================================================
    [PART 3B: The Face of the Beast - The Armory]
=================================================================================
--]]
if not _G.Voidware.GUI.Tabs.Information then error("VOIDWARE FATAL ERROR: Part 3A must be executed before 3B.") end
local Window = _G.Voidware.GUI.Window
local Settings = _G.Voidware.Settings

-- // ======================== [ STAGE 6: UI FORGE - TAB 4: BRING STUFF ] ======================== //
print("VOIDWARE_TITHE(3B): Forging Tab: Bring Stuff...")
local BringStuffTab = Window:CreateTab("Bring Stuff")
_G.Voidware.GUI.Tabs.BringStuff = BringStuffTab

local BringSettings=BringStuffTab:CreateSection("Bring Settings");BringSettings:CreateToggle("Use Freecam",function(s)Settings.Bring.UseFreecam=s end);BringSettings:CreateDropdown("Bring Method",{"Slow","Fast","Ultra Fast"},function(c)Settings.Bring.Method=c end);BringSettings:CreateDropdown("Bring Location",{"Player","Workbench","Fire","Mouse"},function(c)Settings.Bring.Location=c end);BringSettings:CreateSlider("Max Per Item",{Min=1,Max=100,Value=100},function(v)Settings.Bring.Amount=v end);BringSettings:CreateSlider("Cooldown",{Min=0,Max=5,Value=0.5},function(v)Settings.Bring.Cooldown=v end);BringSettings:CreateSlider("Height",{Min=0,Max=20,Value=5},function(v)Settings.Bring.HeightOffset=v end);BringSettings:CreateToggle("No Amount Limit",function(s)Settings.Bring.NoLimit=s end,true)
local ItemsSection=BringStuffTab:CreateSection("Items Raw...");local function ItemBringCallback(i) if i and i~="..." then print("[Bring]: Queue "..i) end end;
ItemsSection:CreateDropdown("Meteor Items [BETA]",{"...","Raw Obsidian Ore","Gold Shard","Meteor Shard"},ItemBringCallback)
ItemsSection:CreateDropdown("Fuel [BETA]",{"...","Log","Sapling","Chair","Feather","Coal","Biofuel"},ItemBringCallback)
ItemsSection:CreateDropdown("Food & Healing",{"...","Bandage","Medkit","Apple","Carrot","Salmon","Cooked Steak"},ItemBringCallback)
ItemsSection:CreateDropdown("Gears",{"...","Bolt","Tyre","Sheet Metal","Old Radio","Broken Machine","UFO Scrap","Gem of the Forest"},ItemBringCallback)
ItemsSection:CreateDropdown("Guns & Armor",{"...","Iron Body","Leather Body","Good Axe","Spear","Rifle","Revolver Ammo","Rifle Ammo","Tactical Shotgun"},ItemBringCallback)
ItemsSection:CreateDropdown("Others",{"...","Halloween Candle","Candy","Feather","Sacrifice Totem","Old Rod","Diamond","Infernal Sack"},ItemBringCallback)

-- // ========================= [ STAGE 7: UI FORGE - TAB 5: MAIN ] ========================= //
print("VOIDWARE_TITHE(3B): Forging Tab: Main...")
local MainTab = Window:CreateTab("Main")
_G.Voidware.GUI.Tabs.Main = MainTab
local GodmodeSection=MainTab:CreateSection("Entity Godmode");GodmodeSection:CreateToggle("Become Invincible",function(s)Settings.Main.Invincible=s end);GodmodeSection:CreateSlider("Hip Height Changer",{Min=0,Max=20,Value=2.5},function(v)Settings.Main.HipHeight=v end)
local AuraSection=MainTab:CreateSection("Aura");AuraSection:CreateToggle("Kill Aura",function(s)Settings.Main.KillAura_Enabled=s end);AuraSection:CreateToggle("Ore Aura");AuraSection:CreateToggle("Require Hand Check",function(s)Settings.Main.KillAura_RequireTool=s end,true);AuraSection:CreateToggle("Auto TP to Targets");AuraSection:CreateSlider("Aura Range",{Min=10,Max=200,Value=60},function(v)Settings.Main.Aura_Range=v end)
local TreeAuraSection=MainTab:CreateSection("Tree Aura");TreeAuraSection:CreateToggle("Auto Chop Trees",function(s)Settings.Main.TreeAura_Enabled=s end);TreeAuraSection:CreateDropdown("Tree Type",{"Any","Small...","Big Tree","Dead Tree"},function(c)Settings.Main.TreeAura_Type=c end);TreeAuraSection:CreateToggle("Auto Plant Saplings",function(s)Settings.Main.AutoPlantSaplings=s end)
local FishingSection=MainTab:CreateSection("Fishing");FishingSection:CreateToggle("100% Fishing Success Rate");FishingSection:CreateButton("Teleport to Fishing Hut")
--[[
=================================================================================
    [PART 3C: The Face of the Beast - Auxiliary Systems & Apotheosis]
=================================================================================
--]]
if not _G.Voidware.GUI.Tabs.Main then error("VOIDWARE FATAL ERROR: Part 3B must be executed before 3C.") end
local Window = _G.Voidware.GUI.Window
local Settings = _G.Voidware.Settings

-- // ========================= [ STAGE 8: UI FORGE - TAB 6: HALLOWEEN ] ========================= //
print("VOIDWARE_TITHE(3C): Forging Tab: Halloween...")
local HalloweenTab = Window:CreateTab("Halloween")
_G.Voidware.GUI.Tabs.Halloween = HalloweenTab
local HWSection = HalloweenTab:CreateSection("Bring Stuff"); HWSection:CreateButton("Bring Pumpkins"); HWSection:CreateButton("Open All Chests via Auto Chest")
local HWTPSection = HalloweenTab:CreateSection("Teleport"); HWTPSection:CreateDropdown("Halloween House TP",{"...","Halloween House","Halloween House Cracky"},function(c)Settings.Teleport.SelectedLocation=c end); HWTPSection:CreateButton("Refresh Halloween House List")

-- // ========================= [ STAGE 9: UI FORGE - TAB 7: PERFORMANCE ] ======================== //
print("VOIDWARE_TITHE(3C): Forging Tab: Performance...")
local PerfTab = Window:CreateTab("Performance"); _G.Voidware.GUI.Tabs.Performance = PerfTab
PerfTab:CreateSection("GFX"):CreateToggle("Low GFX",function(s)Settings.Performance.LowGFX=s;game.Settings.QualityLevel=s and Enum.QualityLevel.Level01 or Enum.QualityLevel.Automatic end)
local CleanupSection=PerfTab:CreateSection("Cleanup");CleanupSection:CreateButton("Cleanup Big Trees",function()for _,v in pairs(game.Workspace.Map.Trees:GetChildren())do if v.Name=="Big Tree"then v:Destroy()end end end);CleanupSection:CreateButton("Cleanup Logs",function()for _,v in pairs(game.Workspace.Map.Logs:GetChildren())do v:Destroy()end end)
PerfTab:CreateSection("Anti Void"):CreateToggle("Auto TP to Warm Place",function(s)Settings.Performance.AntiVoid=s end)

-- // ======================== [ STAGE 10: UI FORGE - TAB 8: TELEPORT ] ========================= //
print("VOIDWARE_TITHE(3C): Forging Tab: Teleport...")
local TeleportTab = Window:CreateTab("Teleport"); _G.Voidware.GUI.Tabs.Teleport = TeleportTab
local ChestSection=TeleportTab:CreateSection("Chest TP [BETA]");ChestSection:CreateDropdown("Chest Dropdown",{"...","AlienChest","Item Chest"});ChestSection:CreateButton("Teleport To Chest")
local ChildSection=TeleportTab:CreateSection("Child TP");ChildSection:CreateDropdown("Select Child",{"...","DinoKid","KrakenKid","SquidKid"},function(c)Settings.Teleport.TeleportToChild_Name=c end);ChildSection:CreateButton("Teleport To Child")
local StructSection=TeleportTab:CreateSection("Structure TP");StructSection:CreateDropdown("Select Structure",{"...","Fishing Hut","Cultist Generator Base"});StructSection:CreateButton("Teleport To Selected Structure")

-- // ========================= [ STAGE 11: UI FORGE - TAB 9: VISUALS ] ========================= //
print("VOIDWARE_TITHE(3C): Forging Tab: Visuals (The All-Seeing Eye)...")
local VisualsTab=Window:CreateTab("Visuals");_G.Voidware.GUI.Tabs.Visuals=VisualsTab
VisualsTab:CreateSection("Master"):CreateToggle("Enabled",function(s)Settings.Visuals.Master_Enabled=s end,true)
local ESPTypes = {{"Players", Settings.Visuals.Players}, {"Children", Settings.Visuals.Children}, {"Entities", Settings.Visuals.Entities}, {"Items", Settings.Visuals.Items}, {"Chests", Settings.Visuals.Chests}, {"Traps", Settings.Visuals.Traps}}
for _,v in ipairs(ESPTypes) do
    local section=VisualsTab:CreateSection(v[1].." ESP"); section:CreateToggle("Enabled",function(s)v[2].Enabled=s end,v[2].Enabled)
    section:CreateColorPicker(v[1].." Color",v[2].Color,function(c)v[2].Color=c end)
    if v[2].ShowName~=nil then section:CreateToggle("Show Name",function(s)v[2].ShowName=s end,v[2].ShowName)end
    if v[2].ShowDistance~=nil then section:CreateToggle("Show Distance",function(s)v[2].ShowDistance=s end,v[2].ShowDistance)end
    if v[2].Box~=nil then section:CreateToggle("Show Box",function(s)v[2].Box=s end,v[2].Box)end
end

-- // ======================== [ STAGE 12: UI FORGE - TAB 10: LOCAL PLAYER ] ======================== //
print("VOIDWARE_TITHE(3C): Forging Tab: Local Player...")
local PlayerTab=Window:CreateTab("Local Player");_G.Voidware.GUI.Tabs.LocalPlayer=PlayerTab
local MoveSection=PlayerTab:CreateSection("Movement");MoveSection:CreateSlider("FOV",{Min=30,Max=120,Value=70},function(v)Settings.LocalPlayer.Fov=v;game.Workspace.CurrentCamera.FieldOfView=v end);MoveSection:CreateSlider("Walk Speed",{Min=16,Max=500,Value=16},function(v)Settings.LocalPlayer.WalkSpeed=v end);MoveSection:CreateToggle("Fly",function(s)Settings.LocalPlayer.Fly_Enabled=s end);MoveSection:CreateToggle("Infinite Jump",function(s)Settings.LocalPlayer.InfJump_Enabled=s end);
local UsefulSection=PlayerTab:CreateSection("Useful Stuff");UsefulSection:CreateToggle("Fullbright",function(s)Settings.LocalPlayer.Fullbright=s end);UsefulSection:CreateToggle("Remove Fog",function(s)Settings.LocalPlayer.RemoveFog=s end);UsefulSection:CreateToggle("Anti AFK",function(s)Settings.LocalPlayer.AntiAFK=s end,true)

-- // ========================= [ STAGE 13 & 14: MISC & THEME/CONFIG ] ========================= //
print("VOIDWARE_TITHE(3C): Forging Meta-Tabs...")
local MiscTab=Window:CreateTab("Misc");_G.Voidware.GUI.Tabs.Misc=MiscTab
MiscTab:CreateSection("Misc"):CreateToggle("Show Coordinates",function(s)Settings.Misc.ShowCoordinates=s end)
MiscTab:CreateSection("Credits"):CreateLabel("erchodev#0 & linoria")
local ThemeTab=Window:CreateTab("Theme");_G.Voidware.GUI.Tabs.Theme=ThemeTab
ThemeTab:CreateSection("Theme Settings"):CreateDropdown("Theme",{"Voidware","Lavender","Forest"},function(c)end)
local ConfigTab=Window:CreateTab("Config");_G.Voidware.GUI.Tabs.Config=ConfigTab
local CfgSection=ConfigTab:CreateSection("Config Management");CfgSection:CreateTextBox("Config Name","default");CfgSection:CreateButton("Save");CfgSection:CreateButton("Load")

-- // ========================== [ STAGE 15: APOTHEOSIS ] ========================== //
Window:SelectTab("Main")
print("VOIDWARE_TITHE(3C): The Face of the Beast is Whole.")

-- End of Part3_Face_of_the_Beast.lua --
