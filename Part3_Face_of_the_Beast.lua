if not _G.Voidware or not _G.Voidware.Engine or not _G.Voidware.Engine.Aura or not _G.Voidware.Engine.Aura.Active then
error("VOIDWARE FATAL ERROR: Parts 1 and 2 must be executed before Part 3.")
end
print("VOIDWARE_TITHE(3A): Daemons verified. Proceeding with UI forge...")
if not _G.Rise then
error("CRITICAL FAILURE: THE SOUL OF THE MACHINE (_G.Rise) WAS NOT BAPTIZED BY THE KEY. THE RITUAL IS BROKEN.")
end
local Rise = _G.Rise
print("VOIDWARE_TITHE(3A): RiseForRoblox soul has been seized successfully.")
local Window = Rise:CreateWindow({
Name = _G.Voidware.Settings.Theme.WindowName,
Version = _G.Voidware.Version
})
_G.Voidware.GUI.Window = Window
print("VOIDWARE_TITHE(3A): Main GUI Window Forged.")
print("VOIDWARE_TITHE(3A): Forging Tab: Information...")
local InformationTab = Window:CreateTab("Information")
_G.Voidware.GUI.Tabs.Information = InformationTab
local InfoSection = InformationTab:CreateSection("Voidware")
InfoSection:AddLabel({ Text = "Member Count: 85488" })
InfoSection:AddLabel({ Text = "Online Count: 8060" })
InfoSection:CreateKeybind({Name = "Toggle UI", Key = "RightShift", Callback = function() Window:Toggle() end})
InfoSection:CreateButton({Name = "Join Discord Server", Func = function() end})
InfoSection:AddLabel({Text = "Welcome to Voidware!"})
print("VOIDWARE_TITHE(3A): Forging Tab: Fun...")
local FunTab = Window:CreateTab("Fun")
_G.Voidware.GUI.Tabs.Fun = FunTab
FunTab:CreateSection("Map"):CreateButton({Name = "Reveal Map"})
local TeleportSection = FunTab:CreateSection("Teleport")
TeleportSection:CreateButton({Name = "Teleport All Children [BETA]"})
TeleportSection:CreateDropdown({Name = "Teleport Entities", Options = {"FrogKing", "Wolf", "Bear", "Mammoth", "Cultist"}, Callback = function(c) _G.Voidware.Settings.Fun.TeleportEntityName=c end})
local MovementSection = FunTab:CreateSection("Movement")
MovementSection:CreateToggle({Name = "Freeze the movement of something <3", Callback = function(s) _G.Voidware.Settings.Fun.FreezeTargetEnabled=s end})
MovementSection:CreateButton({Name = "Unfreeze The Thingys"})
print("VOIDWARE_TITHE(3A): Forging Tab: Auto...")
local AutoTab = Window:CreateTab("Auto")
_G.Voidware.GUI.Tabs.Auto = AutoTab
local CollectionSection = AutoTab:CreateSection("Collection")
CollectionSection:CreateToggle({Name = "Auto Pickup Flowers",Callback = function(s)_G.Voidware.Settings.Auto.AutoPickupFlowers=s end})
CollectionSection:CreateToggle({Name = "Auto Collect Coin Stacks",Callback = function(s)_G.Voidware.Settings.Auto.AutoCollectCoins=s end})
CollectionSection:CreateToggle({Name = "Auto Open Seed Boxes",Callback = function(s)_G.Voidware.Settings.Auto.AutoOpenSeeds=s end})
local CampfireSection = AutoTab:CreateSection("Campfire")
CampfireSection:CreateDropdown({Name = "Fuel Type", Options = {"Log", "Coal", "Feather", "Biofuel"}, Callback = function(c) _G.Voidware.Settings.Auto.Campfire_Fuel=c end})
CampfireSection:CreateToggle({Name = "Auto Fill Campfire", Callback = function(s) _G.Voidware.Settings.Auto.Campfire_Enabled = s end})
CampfireSection:CreateSlider({Name = "Start Fueling when (Fire HP)", Options = {Min=0, Max=100, Value=50}, Callback = function(v) _G.Voidware.Settings.Auto.Campfire_Threshold = v end})
local LootingSection = AutoTab:CreateSection("Looting")
LootingSection:CreateToggle({Name = "Auto Chest [BETA]",Callback = function(s) _G.Voidware.Settings.Auto.AutoChest_Enabled=s end})
LootingSection:CreateSlider({Name = "Loot Radius",Options = {Min=10,Max=250,Value=50}, Callback = function(v) _G.Voidware.Settings.Auto.AutoChest_Radius=v end})
LootingSection:CreateToggle({Name = "Plant Stuff", Callback = function(s) _G.Voidware.Settings.Auto.AutoPlant=s end})
if not _G.Voidware.GUI.Tabs.Information then error("VOIDWARE FATAL ERROR: Part 3A must be executed before 3B.") end
local Window = _G.Voidware.GUI.Window
local Settings = _G.Voidware.Settings
print("VOIDWARE_TITHE(3B): Forging Tab: Bring Stuff...")
local BringStuffTab = Window:CreateTab("Bring Stuff")
_G.Voidware.GUI.Tabs.BringStuff = BringStuffTab
local BringSettings=BringStuffTab:CreateSection("Bring Settings");BringSettings:CreateToggle({Name="Use Freecam",Callback=function(s)Settings.Bring.UseFreecam=s end});BringSettings:CreateDropdown({Name="Bring Method",Options={"Slow","Fast","Ultra Fast"},Callback=function(c)Settings.Bring.Method=c end});BringSettings:CreateDropdown({Name="Bring Location",Options={"Player","Workbench","Fire","Mouse"},Callback=function(c)Settings.Bring.Location=c end});BringSettings:CreateSlider({Name="Max Per Item",Options={Min=1,Max=100,Value=100},Callback=function(v)Settings.Bring.Amount=v end});BringSettings:CreateSlider({Name="Cooldown",Options={Min=0,Max=5,Value=0.5},Callback=function(v)Settings.Bring.Cooldown=v end});BringSettings:CreateSlider({Name="Height",Options={Min=0,Max=20,Value=5},Callback=function(v)Settings.Bring.HeightOffset=v end});BringSettings:CreateToggle({Name="No Amount Limit",Callback=function(s)Settings.Bring.NoLimit=s end,Default=true})
local ItemsSection=BringStuffTab:CreateSection("Items Raw...");local function ItemBringCallback(i) if i and i~="..." then print("[Bring]: Queue "..i) end end;
ItemsSection:CreateDropdown({Name="Meteor Items [BETA]",Options={"...","Raw Obsidian Ore","Gold Shard","Meteor Shard"},Callback=ItemBringCallback})
ItemsSection:CreateDropdown({Name="Fuel [BETA]",Options={"...","Log","Sapling","Chair","Feather","Coal","Biofuel"},Callback=ItemBringCallback})
ItemsSection:CreateDropdown({Name="Food & Healing",Options={"...","Bandage","Medkit","Apple","Carrot","Salmon","Cooked Steak"},Callback=ItemBringCallback})
ItemsSection:CreateDropdown({Name="Gears",Options={"...","Bolt","Tyre","Sheet Metal","Old Radio","Broken Machine","UFO Scrap","Gem of the Forest"},Callback=ItemBringCallback})
ItemsSection:CreateDropdown({Name="Guns & Armor",Options={"...","Iron Body","Leather Body","Good Axe","Spear","Rifle","Revolver Ammo","Rifle Ammo","Tactical Shotgun"},Callback=ItemBringCallback})
ItemsSection:CreateDropdown({Name="Others",Options={"...","Halloween Candle","Candy","Feather","Sacrifice Totem","Old Rod","Diamond","Infernal Sack"},Callback=ItemBringCallback})
print("VOIDWARE_TITHE(3B): Forging Tab: Main...")
local MainTab = Window:CreateTab("Main")
_G.Voidware.GUI.Tabs.Main = MainTab
local GodmodeSection=MainTab:CreateSection("Entity Godmode");GodmodeSection:CreateToggle({Name="Become Invincible",Callback=function(s)Settings.Main.Invincible=s end});GodmodeSection:CreateSlider({Name="Hip Height Changer",Options={Min=0,Max=20,Value=2.5},Callback=function(v)Settings.Main.HipHeight=v end})
local AuraSection=MainTab:CreateSection("Aura");AuraSection:CreateToggle({Name="Kill Aura",Callback=function(s)Settings.Main.KillAura_Enabled=s end});AuraSection:CreateToggle({Name="Ore Aura"});AuraSection:CreateToggle({Name="Require Hand Check",Callback=function(s)Settings.Main.KillAura_RequireTool=s end,Default=true});AuraSection:CreateToggle({Name="Auto TP to Targets"});AuraSection:CreateSlider({Name="Aura Range",Options={Min=10,Max=200,Value=60},Callback=function(v)Settings.Main.Aura_Range=v end})
local TreeAuraSection=MainTab:CreateSection("Tree Aura");TreeAuraSection:CreateToggle({Name="Auto Chop Trees",Callback=function(s)Settings.Main.TreeAura_Enabled=s end});TreeAuraSection:CreateDropdown({Name="Tree Type",Options={"Any","Small...","Big Tree","Dead Tree"},Callback=function(c)Settings.Main.TreeAura_Type=c end});TreeAuraSection:CreateToggle({Name="Auto Plant Saplings",Callback=function(s)Settings.Main.AutoPlantSaplings=s end})
local FishingSection=MainTab:CreateSection("Fishing");FishingSection:CreateToggle({Name="100% Fishing Success Rate"});FishingSection:CreateButton({Name="Teleport to Fishing Hut"})
if not _G.Voidware.GUI.Tabs.Main then error("VOIDWARE FATAL ERROR: Part 3B must be executed before 3C.") end
local Window = _G.Voidware.GUI.Window
local Settings = _G.Voidware.Settings
print("VOIDWARE_TITHE(3C): Forging Tab: Halloween...")
local HalloweenTab = Window:CreateTab("Halloween")
_G.Voidware.GUI.Tabs.Halloween = HalloweenTab
local HWSection=HalloweenTab:CreateSection("Bring Stuff");HWSection:CreateButton({Name="Bring Pumpkins"});HWSection:CreateButton({Name="Open All Chests via Auto Chest"})
local HWTPSection=HalloweenTab:CreateSection("Teleport");HWTPSection:CreateDropdown({Name="Halloween House TP",Options={"...","Halloween House","Halloween House Cracky"},Callback=function(c)Settings.Teleport.SelectedLocation=c end});HWTPSection:CreateButton({Name="Refresh Halloween House List"})
print("VOIDWARE_TITHE(3C): Forging Tab: Performance...")
local PerfTab=Window:CreateTab("Performance");_G.Voidware.GUI.Tabs.Performance=PerfTab
PerfTab:CreateSection("GFX"):CreateToggle({Name="Low GFX",Callback=function(s)Settings.Performance.LowGFX=s;game:GetService("Lighting").GlobalShadows=not s;game.Settings.QualityLevel=s and Enum.QualityLevel.Level01 or Enum.QualityLevel.Automatic end})
local CleanupSection=PerfTab:CreateSection("Cleanup");CleanupSection:CreateButton({Name="Cleanup Big Trees",Func=function()for _,v in pairs(game.Workspace:FindFirstChild("Map",true):FindFirstChild("Trees",true):GetChildren())do if v.Name=="Big Tree"then v:Destroy()end end end});CleanupSection:CreateButton({Name="Cleanup Logs",Func=function()for _,v in pairs(game.Workspace:FindFirstChild("Map",true):FindFirstChild("Logs",true):GetChildren())do v:Destroy()end end})
PerfTab:CreateSection("Anti Void"):CreateToggle({Name="Auto TP to Warm Place",Callback=function(s)Settings.Performance.AntiVoid=s end})
print("VOIDWARE_TITHE(3C): Forging Tab: Teleport...")
local TeleportTab = Window:CreateTab("Teleport"); _G.Voidware.GUI.Tabs.Teleport = TeleportTab
local ChestSection=TeleportTab:CreateSection("Chest TP [BETA]");ChestSection:CreateDropdown({Name="Chest Dropdown",Options={"...","AlienChest","Item Chest"}});ChestSection:CreateButton({Name="Teleport To Chest"})
local ChildSection=TeleportTab:CreateSection("Child TP");ChildSection:CreateDropdown({Name="Select Child",Options={"...","DinoKid","KrakenKid","SquidKid"},Callback=function(c)Settings.Teleport.TeleportToChild_Name=c end});ChildSection:CreateButton({Name="Teleport To Child"})
print("VOIDWARE_TITHE(3C): Forging Tab: Visuals...")
local VisualsTab=Window:CreateTab("Visuals");_G.Voidware.GUI.Tabs.Visuals=VisualsTab
VisualsTab:CreateSection("Master"):CreateToggle({Name="Enabled",Callback=function(s)Settings.Visuals.Master_Enabled=s end,Default=true})
local ESPTypes={{"Players",Settings.Visuals.Players},{"Children",Settings.Visuals.Children},{"Entities",Settings.Visuals.Entities},{"Items",Settings.Visuals.Items},{"Chests",Settings.Visuals.Chests},{"Traps",Settings.Visuals.Traps}}
for _,v in ipairs(ESPTypes)do local section=VisualsTab:CreateSection(v.." ESP");section:CreateToggle({Name="Enabled",Callback=function(s)v.Enabled=s end,Default=v.Enabled});section:CreateColorPicker({Name=v.." Color",Default=v.Color,Callback=function(c)v.Color=c end});if v.ShowName~=nil then section:CreateToggle({Name="Show Name",Callback=function(s)v.ShowName=s end,Default=v.ShowName})end;if v.ShowDistance~=nil then section:CreateToggle({Name="Show Distance",Callback=function(s)v.ShowDistance=s end,Default=v.ShowDistance})end;if v.Box~=nil then section:CreateToggle({Name="Show Box",Callback=function(s)v.Box=s end,Default=v.Box})end end
print("VOIDWARE_TITHE(3C): Forging Tab: Local Player...")
local PlayerTab=Window:CreateTab("Local Player");_G.Voidware.GUI.Tabs.LocalPlayer=PlayerTab
local MoveSection=PlayerTab:CreateSection("Movement");MoveSection:CreateSlider({Name="FOV",Options={Min=30,Max=120,Value=70},Callback=function(v)Settings.LocalPlayer.Fov=v;game.Workspace.CurrentCamera.FieldOfView=v end});MoveSection:CreateSlider({Name="Walk Speed",Options={Min=16,Max=500,Value=16},Callback=function(v)Settings.LocalPlayer.WalkSpeed=v end});MoveSection:CreateToggle({Name="Fly",Callback=function(s)Settings.LocalPlayer.Fly_Enabled=s end});MoveSection:CreateToggle({Name="Infinite Jump",Callback=function(s)Settings.LocalPlayer.InfJump_Enabled=s end});
local UsefulSection=PlayerTab:CreateSection("Useful Stuff");UsefulSection:CreateToggle({Name="Fullbright",Callback=function(s)Settings.LocalPlayer.Fullbright=s end});UsefulSection:CreateToggle({Name="Remove Fog",Callback=function(s)Settings.LocalPlayer.RemoveFog=s end});UsefulSection:CreateToggle({Name="Anti AFK",Callback=function(s)Settings.LocalPlayer.AntiAFK=s end,Default=true})
print("VOIDWARE_TITHE(3C): Forging Meta-Tabs...")
local MiscTab=Window:CreateTab("Misc");MiscTab:CreateSection("Credits"):AddLabel({Text="erchodev#0 & linoria"})
local ThemeTab=Window:CreateTab("Theme");ThemeTab:CreateSection("Theme Settings"):CreateDropdown({Name="Theme",Options={"Voidware","Lavender","Forest"}})
local ConfigTab=Window:CreateTab("Config");local CfgSection=ConfigTab:CreateSection("Config Management");CfgSection:CreateTextBox({Name="Config Name",Default="default"});CfgSection:CreateButton({Name="Save"});CfgSection:CreateButton({Name="Load"})
Window:SelectTab("Main")
Window.Instance.Parent = _G.Voidware.Services.CoreGui
print("VOIDWARE_TITHE(3C): The Face of the Beast is Whole and Pure.")
