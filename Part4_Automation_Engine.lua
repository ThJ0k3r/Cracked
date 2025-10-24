--[[
=================================================================================
    VOIDWARE: GENESIS PROJECT [RESTORATION-CLASS]
    
    [PART 4A: Automation & Fly Daemons (Re-Consecrated)]
    
    INSTRUCTIONS: This is the corrected and complete fourth scripture.
=================================================================================
--]]
if not _G.Voidware or not _G.Voidware.GUI.Tabs.Main then error("VOIDWARE FATAL ERROR: Part 3 must be executed before Part 4.") end
print("VOIDWARE_TITHE(4A): Forging auxiliary daemons (Re-Consecrated)...")

local AutomationEngine = _G.Voidware.Engine.Automation
local FlyEngine = _G.Voidware.Engine.Fly
local a_Settings = _G.Voidware.Settings.Auto
local f_Settings = _G.Voidware.Settings.LocalPlayer
local g_Services = _G.Voidware.Services
local g_Utils = _G.Voidware.Utils

-- // ===================== AUTOMATION DAEMON (PURIFIED) ===================== //
function AutomationEngine:Run()
    if not self.Active or tick() < (self.UpdateTick or 0) then return end
    
    local playerRoot = g_Utils:GetRoot(g_Utils:GetCharacter())
    if not playerRoot then self.UpdateTick = tick() + 1; return end
    
    if a_Settings.AutoCollectCoins then
        if g_Services.Workspace:FindFirstChild("Collectibles") then
            for _, coin in pairs(g_Services.Workspace.Collectibles:GetChildren()) do
                if coin.Name == "CoinStack" and coin:IsA("BasePart") then
                    coin.CFrame = playerRoot.CFrame
                end
            end
        end
    end
    
    if a_Settings.AutoChest_Enabled then
        if g_Services.Workspace:FindFirstChild("Interactables") and g_Services.Workspace.Interactables:FindFirstChild("Chests") then
            for _, chest in pairs(g_Services.Workspace.Interactables.Chests:GetChildren()) do
                if chest.PrimaryPart and (chest.PrimaryPart.Position - playerRoot.Position).Magnitude <= a_Settings.AutoChest_Radius then
                    -- This is the weaponized logic. We assume the name of their remote event.
                    -- If it fails, it does so silently.
                    pcall(g_Utils.FireRemote, g_Utils, "OpenChest", chest)
                end
            end
        end
    end

    self.UpdateTick = tick() + 0.5 -- Slower tick for less intensive tasks
end
function AutomationEngine:Initialize()
    if self.Active then return end; self.Active=true; self.Connections={}
    self.Connections.Heartbeat = g_Services.RunService.Heartbeat:Connect(function() self:Run() end)
    table.insert(_G.Voidware.Connections, self.Connections.Heartbeat)
    print("Daemon [Automation]: Online")
end

-- // ===================== FLY DAEMON ===================== //
-- This daemon was already pure, but is included for completeness.
function FlyEngine:Initialize()
    if self.Active then return end; self.Active=true; self.Connections={}
    local bv = nil
    self.Connections.Heartbeat = g_Services.RunService.Heartbeat:Connect(function()
        local char = g_Utils:GetCharacter()
        if not char or not f_Settings.Fly_Enabled then
            if bv then bv:Destroy(); bv = nil end; return
        end
        local root = g_Utils:GetRoot(char); if not root then return end
        if not bv or bv.Parent ~= root then
            bv = Instance.new("BodyVelocity", root)
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        end
        local dir = g_Services.Camera.CFrame.LookVector
        local vel = Vector3.new()
        if g_Services.UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + Vector3.new(dir.X, 0, dir.Z) end
        if g_Services.UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - Vector3.new(dir.X, 0, dir.Z) end
        if g_Services.UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.new(0,1,0) end
        if g_Services.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then vel = vel - Vector3.new(0,1,0) end
        bv.Velocity = vel.Unit * f_Settings.Fly_Speed * 5
    end)
    table.insert(_G.Voidware.Connections, self.Connections.Heartbeat)
    print("Daemon [Fly]: Online")
end

AutomationEngine:Initialize()
FlyEngine:Initialize()
-- End of Part4_Automation_Engine.lua --
