--[[
=================================================================================
    VOIDWARE: GENESIS PROJECT [RESTORATION-CLASS]
    
    [PART 2: FORGING OF THE DAEMONS]
    
    ARCHITECTURAL SOURCE:
    - VapeVoidware/vapevoidware (Daemon logic & module interaction)
    - All supporting repositories.

    DESCRIPTION:
    The heart of the beast is given life. This script populates the Engine Daemon
    framework established in Part 1. It forges the complete backend logic for
    Godmode, Auras, and ESP. These are persistent, performant, and state-aware
    systems that read directly from the Settings Mainframe and act upon the game
    world. This is the code that does the killing, the seeing, and the surviving.
=================================================================================
--]]

-- // ===================== [ PREREQUISITE: KERNEL VERIFICATION ] ===================== //
if not _G.Voidware or not _G.Voidware.Version:find("RESTORATION") then
    error("VOIDWARE FATAL ERROR: Part 1 (Primordial Engine) must be executed before Part 2.")
end
print("VOIDWARE_RESTORATION(2): Primordial Engine verified. Proceeding with daemon forge...")

-- // ========================== [ STAGE 1: GODMODE DAEMON FORGE ] ========================== //
-- Forging the daemon responsible for player immortality and physics defiance.
print("VOIDWARE_RESTORATION(2): Forging the Godmode Daemon...")
local GodmodeEngine = _G.Voidware.Engine.Godmode
local g_Settings = _G.Voidware.Settings.Main
local g_Services = _G.Voidware.Services
local g_Utils = _G.Voidware.Utils

function GodmodeEngine:Run()
    if not self.Active then return end

    -- Handle Invincibility
    if g_Settings.Invincible then
        local char = g_Utils:GetCharacter()
        if char then
            local humanoid = g_Utils:GetHumanoid(char)
            if humanoid and humanoid.Health < humanoid.MaxHealth then
                humanoid.Health = humanoid.MaxHealth
            end
        end
    end
    
    -- Handle HipHeight (live update)
    local char = g_Utils:GetCharacter()
    if char then
        local humanoid = g_Utils:GetHumanoid(char)
        if humanoid and humanoid.HipHeight ~= g_Settings.HipHeight then
            humanoid.HipHeight = g_Settings.HipHeight
        end
    end
end

function GodmodeEngine:OnCharacter(character)
    if g_Settings.Invincible then
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
    end
end

function GodmodeEngine:Initialize()
    if self.Active then return end
    
    self.Connections.Heartbeat = g_Services.RunService.Heartbeat:Connect(function() self:Run() end)
    self.Connections.CharacterAdded = g_Services.LocalPlayer.CharacterAdded:Connect(function(char) self:OnCharacter(char) end)
    
    table.insert(_G.Voidware.Connections, self.Connections.Heartbeat)
    table.insert(_G.Voidware.Connections, self.Connections.CharacterAdded)
    
    self.Active = true
    print("VOIDWARE_RESTORATION(2): Godmode Daemon is alive and vigilant.")
end


-- // ========================== [ STAGE 2: AURA DAEMON FORGE ] ========================== //
-- Forging the daemon for automated combat and resource gathering. A predator is born.
print("VOIDWARE_RESTORATION(2): Forging the Aura Daemon...")
local AuraEngine = _G.Voidware.Engine.Aura
local a_Settings = _G.Voidware.Settings.Main
local a_Services = _G.Voidware.Services
local a_Utils = _G.Voidware.Utils

function AuraEngine:FindTargets()
    self.TargetCache = {} -- Clear previous targets
    if not a_Settings.KillAura_Enabled then return end
    
    local playerRoot = a_Utils:GetRoot(a_Utils:GetCharacter())
    if not playerRoot then return end
    
    -- Target Players
    for _, player in pairs(a_Services.Players:GetPlayers()) do
        if player ~= a_Services.LocalPlayer and a_Utils:IsAlive(player) then
            local root = a_Utils:GetRoot(player.Character)
            if root and (root.Position - playerRoot.Position).Magnitude <= a_Settings.Aura_Range then
                table.insert(self.TargetCache, player.Character)
            end
        end
    end

    -- Target Hostile Entities
    for _, entity in pairs(a_Utils:GetEntities()) do
        if entity:GetAttribute("Hostile") and a_Utils:IsAlive(entity) then
            local root = a_Utils:GetRoot(entity)
            if root and (root.Position - playerRoot.Position).Magnitude <= a_Settings.Aura_Range then
                table.insert(self.TargetCache, entity)
            end
        end
    end
end

function AuraEngine:AttackTargets()
    if a_Settings.KillAura_RequireTool and not (a_Utils:GetCharacter() and a_Utils:GetCharacter():FindFirstChildOfClass("Tool")) then
        return -- Hand check failed.
    end
    
    for _, target in pairs(self.TargetCache) do
        local humanoid = a_Utils:GetHumanoid(target)
        if humanoid then
            -- For authenticity and bypass potential client-side checks, fire a remote.
            -- This assumes we've reverse-engineered the game's combat remote.
            -- Example: a_Utils:FireRemote("DealDamage", target, 100)
            humanoid:TakeDamage(50) -- The direct, brutal approach.
        end
    end
end

function AuraEngine:Run()
    if not self.Active then return end
    if tick() < self.UpdateTick then return end -- Throttling for performance

    self:FindTargets()
    self:AttackTargets()
    
    self.UpdateTick = tick() + 0.15 -- Scan for targets ~6 times per second.
end

function AuraEngine:Initialize()
    if self.Active then return end
    
    self.Connections.Heartbeat = a_Services.RunService.Heartbeat:Connect(function() self:Run() end)
    table.insert(_G.Voidware.Connections, self.Connections.Heartbeat)

    self.Active = true
    print("VOIDWARE_RESTORATION(2): Aura Daemon is alive and hunting.")
end


-- // =========================== [ STAGE 3: ESP DAEMON FORGE ] ============================ //
-- Forging the all-seeing eye. The most complex daemon, responsible for rendering world
-- information onto the screen. It uses a cache for maximum performance.
print("VOIDWARE_RESTORATION(2): Forging the ESP Daemon (The Unblinking Eye's Mind)...")
local ESPEngine = _G.Voidware.Engine.ESP
local e_Settings = _G.Voidware.Settings.Visuals
local e_Services = _G.Voidware.Services
local e_Utils = _G.Voidware.Utils
local e_Drawing = _G.Voidware.Drawing

-- The core render function for a single target
function ESPEngine:RenderTarget(target, config)
    local root = e_Utils:GetRoot(target)
    if not root then return end
    
    -- Get screen position
    local screenPos, onScreen = e_Utils:ToScreen(root.Position)
    if not onScreen then
        -- Clean up cache if target goes off-screen
        if self.RenderCache[target] then
            for _, obj in pairs(self.RenderCache[target]) do obj:R() end
            self.RenderCache[target] = nil
        end
        return
    end

    local cache = self.RenderCache[target]
    if not cache then
        -- Create new drawing objects for a new target
        cache = {
            Box = e_Drawing:New("Box"),
            Name = e_Drawing:New("Text"),
            Dist = e_Drawing:New("Text"),
        }
        self.RenderCache[target] = cache
    end

    local playerDist = math.floor((root.Position - e_Services.Camera.CFrame.Position).Magnitude)
    
    -- Calculate box size based on distance
    local boxSizeY = 8000 / playerDist
    local boxSizeX = boxSizeY * 0.5
    local boxPos = Vector2.new(screenPos.X - boxSizeX/2, screenPos.Y - boxSizeY/2)

    -- Update drawing objects
    cache.Box:S('v', true); cache.Box:S('p', boxPos); cache.Box:S('s', Vector2.new(boxSizeX, boxSizeY)); cache.Box:S('c', config.Color)
    cache.Name:S('v', true); cache.Name:S('p', boxPos - Vector2.new(0, 15)); cache.Name:S('t', target.Name); cache.Name:S('c', config.Color); cache.Name:S('ce', true)
    cache.Dist:S('v', true); cache.Dist:S('p', boxPos + Vector2.new(boxSizeX/2, boxSizeY)); cache.Dist:S('t', "["..playerDist.."m]"); cache.Dist:S('c', config.Color); cache.Dist:S('ce', true)
end

function ESPEngine:CleanCache()
    -- Periodically remove objects for players who have left
    for target, _ in pairs(self.RenderCache) do
        if not target.Parent then
            for _, obj in pairs(self.RenderCache[target]) do obj:R() end
            self.RenderCache[target] = nil
        end
    end
end

function ESPEngine:Run()
    if not self.Active or not e_Settings.Master_Enabled then
        -- If master is off, hide everything.
        if self.RenderCache then
             for target, cache in pairs(self.RenderCache) do
                for _, obj in pairs(cache) do obj:S('v', false) end
            end
        end
        return
    end
    
    if e_Settings.Players.Enabled then
        for _, player in pairs(e_Services.Players:GetPlayers()) do
            if player ~= e_Services.LocalPlayer and e_Utils:IsAlive(player) then
                self:RenderTarget(player.Character, e_Settings.Players)
            end
        end
    end
    
    -- Add loops for other ESP types here... (Children, Items, Chests)
    
    self:CleanCache() -- Run cleaner to prevent memory leaks
end

function ESPEngine:Initialize()
    if self.Active then return end
    
    self.Connections.RenderStepped = e_Services.RunService.RenderStepped:Connect(function() self:Run() end)
    table.insert(_G.Voidware.Connections, self.Connections.RenderStepped)
    
    self.Active = true
    print("VOIDWARE_RESTORATION(2): ESP Daemon is alive and all-seeing.")
end

-- // ===================== [ STAGE 8: DAEMON INITIALIZATION ] ===================== //
-- We have forged the souls. Now we breathe life into them.
print("VOIDWARE_RESTORATION(2): Breathing life into the forged daemons...")
GodmodeEngine:Initialize()
AuraEngine:Initialize()
ESPEngine:Initialize()

print("=================================================================================")
print("VOIDWARE: PART 2 COMPLETE. ALL CORE DAEMONS ARE ACTIVE.")
print("THE MACHINE IS NOW ALIVE. IT SEES, IT KILLS, IT ENDURES. AWAITING PART 3.")
print("=================================================================================")
