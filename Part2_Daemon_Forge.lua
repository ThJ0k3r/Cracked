if not _G.Voidware or not _G.Voidware.Version:find("TITHE") then error("VOIDWARE FATAL ERROR: Part 1 must be executed before Part 2.") end
print("VOIDWARE_TITHE(2A): Primordial Engine verified. Proceeding with daemon forge...")
local GodmodeEngine = _G.Voidware.Engine.Godmode
local g_Settings = _G.Voidware.Settings.Main
local g_LPSettings = _G.Voidware.Settings.LocalPlayer
local g_Services = _G.Voidware.Services
local g_Utils = _G.Voidware.Utils
function GodmodeEngine:Run()
if not self.Active then return end
local char = g_Utils:GetCharacter()
if not char then return end
local humanoid = g_Utils:GetHumanoid(char)
if not humanoid then return end
if g_Settings.Invincible and humanoid.Health < humanoid.MaxHealth then
humanoid.Health = humanoid.MaxHealth
end
if humanoid.HipHeight ~= g_Settings.HipHeight then
humanoid.HipHeight = g_Settings.HipHeight
end
humanoid.WalkSpeed = g_LPSettings.WalkSpeed
end
function GodmodeEngine:OnCharacter(character) if g_Settings.Invincible then local humanoid = character:WaitForChild("Humanoid"); humanoid.MaxHealth = math.huge; humanoid.Health = math.huge end end
function GodmodeEngine:Initialize()
if self.Active then return end; self.Active=true; self.Connections={}
self.Connections.Heartbeat = g_Services.RunService.Heartbeat:Connect(function() self:Run() end)
self.Connections.CharacterAdded = g_Services.LocalPlayer.CharacterAdded:Connect(function(char) self:OnCharacter(char) end)
table.insert(_G.Voidware.Connections, self.Connections.Heartbeat); table.insert(_G.Voidware.Connections, self.Connections.CharacterAdded)
print("Daemon [Godmode]: Online")
end
local AuraEngine = _G.Voidware.Engine.Aura
local a_Settings = _G.Voidware.Settings.Main
function AuraEngine:FindAndAttack()
if not a_Settings.KillAura_Enabled then return end
if a_Settings.KillAura_RequireTool and not (g_Utils:GetCharacter() and g_Utils:GetCharacter():FindFirstChildOfClass("Tool")) then return end
local playerRoot = g_Utils:GetRoot(g_Utils:GetCharacter())
if not playerRoot then return end
for _, player in pairs(g_Services.Players:GetPlayers()) do
if player = g_Services.LocalPlayer and g_Utils:IsAlive(player) then
local root = g_Utils:GetRoot(player.Character)
if root and (root.Position - playerRoot.Position).Magnitude <= a_Settings.Aura_Range then g_Utils:GetHumanoid(player.Character):TakeDamage(50) end
end
end
for _, entity in pairs(g_Utils:GetEntities()) do
if entity:GetAttribute("Hostile") and g_Utils:IsAlive(entity) then
local root = g_Utils:GetRoot(entity)
if root and (root.Position - playerRoot.Position).Magnitude <= a_Settings.Aura_Range then g_Utils:GetHumanoid(entity):TakeDamage(50) end
end
end
end
function AuraEngine:Run() if not self.Active or tick() < (self.UpdateTick or 0) then return end; self:FindAndAttack(); self.UpdateTick = tick() + 0.1 end
function AuraEngine:Initialize() if self.Active then return end; self.Active=true; self.Connections={}; self.Connections.Heartbeat = g_Services.RunService.Heartbeat:Connect(function() self:Run() end); table.insert(_G.Voidware.Connections, self.Connections.Heartbeat); print("Daemon [Aura]: Online") end
local ESPEngine = _G.Voidware.Engine.ESP
local e_Settings = _G.Voidware.Settings.Visuals
function ESPEngine:RenderTarget(target, config, nameOverride)
local root = target.PrimaryPart or g_Utils:GetRoot(target); if not root then return end
local screenPos, onScreen = g_Utils:ToScreen(root.Position); if not onScreen then if self.RenderCache[target] then for _, obj in pairs(self.RenderCache[target]) do obj:R() end; self.RenderCache[target] = nil end; return end
local cache = self.RenderCache[target]; if not cache then cache = {Box = _G.Voidware.Drawing:New("Box"), Name = _G.Voidware.Drawing:New("Text"), Dist = _G.Voidware.Drawing:New("Text")}; self.RenderCache[target] = cache end
local playerDist = math.floor((root.Position - g_Services.Camera.CFrame.Position).Magnitude)
local boxSizeY = math.min(500, 9000 / playerDist); local boxSizeX = boxSizeY * 0.6
local boxPos = Vector2.new(screenPos.X - boxSizeX/2, screenPos.Y - boxSizeY/2)
if config.Box then cache.Box:S('v',true); cache.Box:S('p',boxPos); cache.Box:S('s',Vector2.new(boxSizeX,boxSizeY)); cache.Box:S('c',config.Color) else cache.Box:S('v', false) end
if config.ShowName then cache.Name:S('v',true); cache.Name:S('p',boxPos-Vector2.new(0,15)); cache.Name:S('t',nameOverride or target.Name); cache.Name:S('c',config.Color); cache.Name:S('ce',true) else cache.Name:S('v',false) end
if config.ShowDistance then cache.Dist:S('v',true); cache.Dist:S('p',boxPos+Vector2.new(boxSizeX/2,boxSizeY)); cache.Dist:S('t',"["..playerDist.."m]"); cache.Dist:S('c',config.Color); cache.Dist:S('ce',true) else cache.Dist:S('v',false) end
end
function ESPEngine:CleanCache() for target, cache in pairs(self.RenderCache) do if not target or not target.Parent then for _, obj in pairs(cache) do obj:R() end; self.RenderCache[target] = nil end end end
function ESPEngine:Run()
if not self.Active or not e_Settings.Master_Enabled then
if self.IsHiding then return end
for _, cache in pairs(self.RenderCache) do for _, obj in pairs(cache) do obj:S('v', false) end end; self.IsHiding = true; return
end; self.IsHiding = false
if e_Settings.Players.Enabled then for _, player in pairs(g_Services.Players:GetPlayers()) do if player=g_Services.LocalPlayer and g_Utils:IsAlive(player) then self:RenderTarget(player.Character, e_Settings.Players) end end end
if e_Settings.Children.Enabled then for _, entity in pairs(g_Utils:GetEntities()) do if entity.Name:find("Kid") then self:RenderTarget(entity, e_Settings.Children, entity.Name) end end end
if e_Settings.Entities.Enabled then for _, entity in pairs(g_Utils:GetEntities()) do self:RenderTarget(entity, e_Settings.Entities) end end
if e_Settings.Items.Enabled then if g_Services.Workspace:FindFirstChild("Items") then for _, item in pairs(g_Services.Workspace.Items:GetChildren()) do if item:IsA("BasePart") then self:RenderTarget(item, e_Settings.Items) end end end end
if e_Settings.Chests.Enabled then if g_Services.Workspace:FindFirstChild("Interactables") and g_Services.Workspace.Interactables:FindFirstChild("Chests") then for _, chest in pairs(g_Services.Workspace.Interactables.Chests:GetChildren()) do self:RenderTarget(chest, e_Settings.Chests) end end end
if e_Settings.Traps.Enabled then if g_Services.Workspace:FindFirstChild("Traps") then for _, trap in pairs(g_Services.Workspace.Traps:GetChildren()) do self:RenderTarget(trap, e_Settings.Traps) end end end
self:CleanCache()
end
function ESPEngine:Initialize() if self.Active then return end; self.Active=true; self.RenderCache={}; self.Connections={}; self.Connections.RenderStepped = g_Services.RunService.RenderStepped:Connect(function() self:Run() end); table.insert(_G.Voidware.Connections, self.Connections.RenderStepped); print("Daemon [ESP]: Online (Unabridged)") end
GodmodeEngine:Initialize()
AuraEngine:Initialize()
ESPEngine:Initialize()
