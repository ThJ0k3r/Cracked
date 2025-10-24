--[[
=================================================================================
    VOIDWARE: GENESIS PROJECT [RESTORATION-CLASS]
    
    [PART 2: FORGING OF THE DAEMONS]
    
    DESCRIPTION:
    The heart of the beast is given life. This script populates the Engine Daemon
    framework established in Part 1. It forges the complete backend logic for
    Godmode, Auras, and ESP. These are persistent, performant, and state-aware
    systems that read directly from the Settings Mainframe and act upon the game
    world.
=================================================================================
--]]

if not _G.Voidware or not _G.Voidware.Version:find("RESTORATION") then error("VOIDWARE FATAL ERROR: Part 1 must be executed before Part 2.") end
print("VOIDWARE_RESTORATION(2): Proceeding with daemon forge...")

-- [GODMODE DAEMON FORGE]
local GodmodeEngine = _G.Voidware.Engine.Godmode
local g_Settings = _G.Voidware.Settings.Main
local g_Services = _G.Voidware.Services
local g_Utils = _G.Voidware.Utils

function GodmodeEngine:Run()
    if not self.Active then return end
    if g_Settings.Invincible then
        local char = g_Utils:GetCharacter(); if char then local humanoid = g_Utils:GetHumanoid(char); if humanoid and humanoid.Health < humanoid.MaxHealth then humanoid.Health = humanoid.MaxHealth end end
    end
    local char = g_Utils:GetCharacter(); if char then local humanoid = g_Utils:GetHumanoid(char); if humanoid and humanoid.HipHeight ~= g_Settings.HipHeight then humanoid.HipHeight = g_Settings.HipHeight end end
end
function GodmodeEngine:OnCharacter(character) if g_Settings.Invincible then local humanoid = character:WaitForChild("Humanoid"); humanoid.MaxHealth = math.huge; humanoid.Health = math.huge end end
function GodmodeEngine:Initialize()
    if self.Active then return end
    self.Connections.Heartbeat = g_Services.RunService.Heartbeat:Connect(function() self:Run() end)
    self.Connections.CharacterAdded = g_Services.LocalPlayer.CharacterAdded:Connect(function(char) self:OnCharacter(char) end)
    table.insert(_G.Voidware.Connections, self.Connections.Heartbeat); table.insert(_G.Voidware.Connections, self.Connections.CharacterAdded)
    self.Active = true; print("Daemon [Godmode]: Online")
end

-- [AURA DAEMON FORGE]
local AuraEngine = _G.Voidware.Engine.Aura
local a_Settings = _G.Voidware.Settings.Main
function AuraEngine:FindTargets()
    self.TargetCache = {}; if not a_Settings.KillAura_Enabled then return end; local playerRoot = g_Utils:GetRoot(g_Utils:GetCharacter()); if not playerRoot then return end
    for _, player in pairs(g_Services.Players:GetPlayers()) do
        if player ~= g_Services.LocalPlayer and g_Utils:IsAlive(player) then
            local root = g_Utils:GetRoot(player.Character); if root and (root.Position - playerRoot.Position).Magnitude <= a_Settings.Aura_Range then table.insert(self.TargetCache, player.Character) end
        end
    end
    for _, entity in pairs(g_Utils:GetEntities()) do
        if entity:GetAttribute("Hostile") and g_Utils:IsAlive(entity) then
            local root = g_Utils:GetRoot(entity); if root and (root.Position - playerRoot.Position).Magnitude <= a_Settings.Aura_Range then table.insert(self.TargetCache, entity) end
        end
    end
end
function AuraEngine:AttackTargets()
    if a_Settings.KillAura_RequireTool and not (g_Utils:GetCharacter() and g_Utils:GetCharacter():FindFirstChildOfClass("Tool")) then return end
    for _, target in pairs(self.TargetCache) do local humanoid = g_Utils:GetHumanoid(target); if humanoid then humanoid:TakeDamage(50) end end
end
function AuraEngine:Run() if not self.Active or tick() < self.UpdateTick then return end; self:FindTargets(); self:AttackTargets(); self.UpdateTick = tick() + 0.15 end
function AuraEngine:Initialize() if self.Active then return end; self.Connections.Heartbeat = g_Services.RunService.Heartbeat:Connect(function() self:Run() end); table.insert(_G.Voidware.Connections, self.Connections.Heartbeat); self.Active = true; print("Daemon [Aura]: Online") end

-- [ESP DAEMON FORGE]
local ESPEngine = _G.Voidware.Engine.ESP
local e_Settings = _G.Voidware.Settings.Visuals
function ESPEngine:RenderTarget(target, config)
    local root = g_Utils:GetRoot(target); if not root then return end
    local screenPos, onScreen = g_Utils:ToScreen(root.Position); if not onScreen then if self.RenderCache[target] then for _, obj in pairs(self.RenderCache[target]) do obj:R() end; self.RenderCache[target] = nil end; return end
    local cache = self.RenderCache[target]; if not cache then cache = {Box = g_Voidware.Drawing:New("Box"), Name = g_Voidware.Drawing:New("Text"), Dist = g_Voidware.Drawing:New("Text")}; self.RenderCache[target] = cache end
    local playerDist = math.floor((root.Position - g_Services.Camera.CFrame.Position).Magnitude); local boxSizeY = 8000 / playerDist; local boxSizeX = boxSizeY * 0.5; local boxPos = Vector2.new(screenPos.X - boxSizeX/2, screenPos.Y - boxSizeY/2)
    if config.Box then cache.Box:S('v',true); cache.Box:S('p',boxPos); cache.Box:S('s',Vector2.new(boxSizeX, boxSizeY)); cache.Box:S('c',config.Color) else cache.Box:S('v', false) end
    if config.ShowName then cache.Name:S('v',true); cache.Name:S('p',boxPos-Vector2.new(0,15)); cache.Name:S('t',target.Name); cache.Name:S('c',config.Color); cache.Name:S('ce',true) else cache.Name:S('v', false) end
    if config.ShowDistance then cache.Dist:S('v',true); cache.Dist:S('p',boxPos+Vector2.new(boxSizeX/2, boxSizeY)); cache.Dist:S('t',"["..playerDist.."m]"); cache.Dist:S('c',config.Color); cache.Dist:S('ce',true) else cache.Dist:S('v', false) end
end
function ESPEngine:CleanCache() for target, _ in pairs(self.RenderCache) do if not target.Parent then for _, obj in pairs(self.RenderCache[target]) do obj:R() end; self.RenderCache[target] = nil end end end
function ESPEngine:Run()
    if not self.Active or not e_Settings.Master_Enabled then
        if self.RenderCache then for _, cache in pairs(self.RenderCache) do for _, obj in pairs(cache) do obj:S('v', false) end end end; return
    end
    if e_Settings.Players.Enabled then for _, player in pairs(g_Services.Players:GetPlayers()) do if player ~= g_Services.LocalPlayer and g_Utils:IsAlive(player) then self:RenderTarget(player.Character, e_Settings.Players) end end end
    self:CleanCache()
end
function ESPEngine:Initialize() if self.Active then return end; self.RenderCache={}; self.Connections.RenderStepped = g_Services.RunService.RenderStepped:Connect(function() self:Run() end); table.insert(_G.Voidware.Connections, self.Connections.RenderStepped); self.Active = true; print("Daemon [ESP]: Online") end

GodmodeEngine:Initialize()
AuraEngine:Initialize()
ESPEngine:Initialize()
