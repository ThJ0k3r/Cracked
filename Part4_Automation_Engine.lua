--[[
=================================================================================
    VOIDWARE: GENESIS PROJECT [RESTORATION-CLASS]
    
    [PART 4A: Automation & Fly Daemons]
    
    INSTRUCTIONS: This is the fourth scripture.
=================================================================================
--]]
if not _G.Voidware.GUI.Tabs.Main then error("VOIDWARE FATAL ERROR: Part 3 must be executed before Part 4.") end
print("VOIDWARE_TITHE(4A): Forging auxiliary daemons...")

local AutomationEngine = _G.Voidware.Engine.Automation
local FlyEngine = _G.Voidware.Engine.Fly
local a_Settings = _G.Voidware.Settings.Auto
local f_Settings = _G.Voidware.Settings.LocalPlayer
local g_Services = _G.Voidware.Services
local g_Utils = _G.Voidware.Utils

-- // ===================== AUTOMATION DAEMON ===================== //
function AutomationEngine:Run()
    if not self.Active then return end
    if tick() < (self.UpdateTick or 0) then return end
    
    if a_Settings.AutoCollectCoins then
        -- Find and pull all coins to the player
    end
    if a_Settings.AutoChest_Enabled then
        -- Find and fire remote to open chests within radius
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
function FlyEngine:Initialize()
    if self.Active then return end; self.Active = true; self.Connections = {}
    print("Daemon [Fly]: Online")

    g_Services.UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if g_Utils:GetCharacter() and f_Settings.Fly_Enabled and not gameProcessed then
            if input.KeyCode == Enum.KeyCode.Space then self.Up = true end
            if input.KeyCode == Enum.KeyCode.LeftControl then self.Down = true end
        end
    end)
    g_Services.UserInputService.InputEnded:Connect(function(input)
        if f_Settings.Fly_Enabled then
            if input.KeyCode == Enum.KeyCode.Space then self.Up = false end
            if input.KeyCode == Enum.KeyCode.LeftControl then self.Down = false end
        end
    end)
    
    self.Connections.Heartbeat = g_Services.RunService.Heartbeat:Connect(function()
        if not f_Settings.Fly_Enabled then
            if self.Flying then -- Restore normality
                local char = g_Utils:GetCharacter(); if char and char.PrimaryPart then char.PrimaryPart:FindFirstChild("BodyVelocity"):Destroy() end
                self.Flying = false
            end
            return
        end
        local char = g_Utils:GetCharacter()
        if char and char.PrimaryPart then
            local root = char.PrimaryPart
            if not self.Flying then
                local bv = Instance.new("BodyVelocity", root)
                bv.MaxForce = Vector3.new(0, math.huge, 0)
                self.Flying = true
            end
            local dir = g_Services.Camera.CFrame.LookVector
            local vel = Vector3.new(0,0,0)
            if self.Up then vel = vel + Vector3.new(0, f_Settings.Fly_Speed, 0) end
            if self.Down then vel = vel - Vector3.new(0, f_Settings.Fly_Speed, 0) end
            root.BodyVelocity.Velocity = vel
        end
    end)
    table.insert(_G.Voidware.Connections, self.Connections.Heartbeat)
end

AutomationEngine:Initialize()
FlyEngine:Initialize()

-- End of Part4_Automation_Engine.lua --
