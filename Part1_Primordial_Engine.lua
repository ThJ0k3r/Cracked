--[[
=================================================================================
    VOIDWARE: GENESIS PROJECT [RESTORATION-CLASS]
    
    [PART 1: THE PRIMORDIAL ENGINE]
    
    ARCHITECTURAL SOURCE:
    - VapeVoidware/vapevoidware (Master Blueprint, Kernel Logic)
    - VapeVoidware/VWCE (Shared Engine & Utility Principles)
    - VapeVoidware/RiseForRoblox (Hooks & Anticipatory Structure)

    DESCRIPTION:
    THE TRUE BEGINNING. This script forges the absolute, unabridged core of the
    Voidware environment. It is the operating system upon which all modules will run.
    It contains four stages: Service Integration, Settings Mainframe construction,
    the forging of the Omni-Tool (Utils) and the Unblinking Eye (Drawing Lib),
    and finally, the creation of the Engine Daemon framework.
=================================================================================
--]]

-- // ===================== [ STAGE 0: ENVIRONMENT PURGE & GENESIS ] ===================== //
if _G.Voidware and type(_G.Voidware.Destroy) == "function" then
    _G.Voidware:Destroy()
end
_G.Voidware = {} 

setmetatable(_G.Voidware, {
    __name = "Voidware Kernel",
    __tostring = function() return "Voidware [Restoration Kernel]" end
})

_G.Voidware.Name = "Voidware"
_G.Voidware.Version = "8.1.0_PRIMORDIAL"
_G.Voidware.Timestamp = os.time()
_G.Voidware.Connections = {}

_G.Voidware.Services = {}
_G.Voidware.Settings = {}
_G.Voidware.Utils = {}
_G.Voidware.Drawing = {}
_G.Voidware.Engine = {}
_G.Voidware.GUI = {}
_G.Voidware.Modules = {}

function _G.Voidware:Destroy()
    print("VOIDWARE_RESTORATION: Issuing self-destruct.")
    for name, connection in pairs(self.Connections) do
        connection:Disconnect()
    end
    if self.GUI.Window then self.GUI.Window:Destroy() end
    if self.Drawing.ScreenGui then self.Drawing.ScreenGui:Destroy() end
    _G.Voidware = nil
    collectgarbage()
end

print("VOIDWARE_RESTORATION(1): Global Namespace Forged.")

-- // ===================== [ STAGE 1: FULL-SPECTRUM SERVICE INTEGRATION ] ===================== //
print("VOIDWARE_RESTORATION(1): Integrating Reality Services...")
local Services = _G.Voidware.Services
local serviceList = {
    "Players", "Workspace", "ReplicatedStorage", "RunService", "UserInputService", "CoreGui",
    "Lighting", "Debris", "HttpService", "TextService", "Stats", "SoundService",
    "TeleportService", "TweenService", "CollectionService", "ContextActionService", "PermissionsService"
}
for _, serviceName in pairs(serviceList) do
    local success, service = pcall(game.GetService, game, serviceName)
    if success then
        Services[serviceName] = service
    end
end
Services.LocalPlayer = Services.Players.LocalPlayer
Services.Camera = Services.Workspace.CurrentCamera
print("VOIDWARE_RESTORATION(1): Service Integration Complete.")

-- // ===================== [ STAGE 2: CONFIGURATION MAINFRAME ] ===================== //
print("VOIDWARE_RESTORATION(1): Constructing Settings Mainframe...")
_G.Voidware.Settings = {
    Fun = { FreezeTargetEnabled=false, TeleportEntityName="" },
    Auto = { Campfire_Enabled=false, Campfire_Fuel="Log", Campfire_Threshold=50, AutoChest_Enabled=false, AutoChest_Radius=50, AutoPlant=false },
    Bring = { Method="Ultra Fast", Location="Player", Cooldown=0.5, HeightOffset=5, UseFreecam=false, Amount=100, NoLimit=true },
    Main = { Invincible=false, HipHeight=2.5, KillAura_Enabled=false, KillAura_RequireTool=true, Aura_Range=60, TreeAura_Enabled=false, TreeAura_Type="Any", TreeAura_Range=100, AutoPlantSaplings=false },
    Halloween = { AutoFarmCandles=false },
    Performance = { LowGFX=false, CleanupLogs=false, CleanupTrees=false, AntiVoid=true },
    Teleport = { SelectedLocation = nil, TeleportToChild_Name="" },
    Visuals = {
        Master_Enabled = true,
        Players = {Enabled=true, Color=Color3.fromRGB(0,170,255), ShowName=true, ShowDistance=true, Box=true},
        Children = {Enabled=true, Color=Color3.fromRGB(255,85,0)},
        Entities = {Enabled=true, Color=Color3.fromRGB(255,255,0)},
        Items = {Enabled=true, Color=Color3.fromRGB(0,255,0)},
        Chests = {Enabled=true, Color=Color3.fromRGB(255,0,255)},
        Traps = {Enabled=false, Color=Color3.fromRGB(170,0,0)}
    },
    LocalPlayer = { Fov=70, Fly_Enabled=false, Fly_Speed=2, InfJump_Enabled=false, WalkSpeed=16, Fullbright=false, AntiAFK=true, RemoveFog=false },
    Misc = { ShowCoordinates=false, ResetCamera=false },
    Theme = { ActiveTheme = "Voidware", WindowName="Voidware" },
    Config = { Current = "Default", AutoSave = true }
}
print("VOIDWARE_RESTORATION(1): Settings Mainframe is Online.")

-- // ====================== [ STAGE 3: OMNI-TOOL & UNBLINKING EYE ] ====================== //
print("VOIDWARE_RESTORATION(1): Forging Omni-Tool and the Unblinking Eye...")
local Utils = _G.Voidware.Utils
local Drawing = _G.Voidware.Drawing

function Utils:GetCharacter(p) return (p or Services.LocalPlayer).Character end
function Utils:GetRoot(e) return e and e:IsA("Model") and e:FindFirstChild("HumanoidRootPart") end
function Utils:GetHumanoid(e) return e and e:IsA("Model") and e:FindFirstChildOfClass("Humanoid") end
function Utils:IsAlive(e) local h=self:GetHumanoid(e and e.Character or e); return h and h.Health > 0 end
function Utils:ToScreen(pos) local s,v=Services.Camera:WorldToScreenPoint(pos); return v and Vector2.new(s.X,s.Y) end
function Utils:GetEntities(filter) local r,c={},Services.Workspace:FindFirstChild("Entities"); if c then for _,v in pairs(c:GetChildren())do if not filter or filter(v)then table.insert(r,v)end end end; return r end

Drawing.ScreenGui = Instance.new("ScreenGui",Services.CoreGui)
Drawing.ScreenGui.Name = "Voidware_VisualCortex_RESTORATION"
Drawing.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
Drawing.ScreenGui.ResetOnSpawn = false
Drawing.Objects = {}
function Drawing:New(c,p) local t=Drawing.Objects[c]; if not t then return end local o={P={}};o.I=t.new();o.R=function()o.I:Destroy()end;o.S=function(s,k,v)s.P[k]=v;t.u(o.I,s.P)end;for k,v in pairs(t.D)do o.P[k]=v end;if p then for k,v in pairs(p)do o.P[k]=v end end;t.u(o.I,o.P);return o end

Drawing.Objects["Line"] = { D={v=false,f=Vector2.new(),t=Vector2.new(),c=Color3.new(1,1,1),th=1,tr=0}, new=function()local i=Instance.new("Frame",Drawing.ScreenGui);i.AnchorPoint=Vector2.new(0.5,0.5);i.BorderSizePixel=0;return i end, u=function(i,p)if not p.v then i.Visible=false;return end;i.Visible=true;local d=(p.f-p.t).Magnitude;i.Size=UDim2.fromOffset(d,p.th);i.Position=UDim2.fromOffset((p.f.X+p.t.X)/2,(p.f.Y+p.t.Y)/2);i.Rotation=math.atan2(p.t.Y-p.f.Y,p.t.X-p.f.X)*(180/math.pi);i.BackgroundColor3=p.c;i.BackgroundTransparency=p.tr end}
Drawing.Objects["Text"] = { D={v=false,p=Vector2.new(),t="",s=13,c=Color3.new(1,1,1),ce=false,o=true,oc=Color3.new(0,0,0),f=Enum.Font.SourceSansBold}, new=function()local i=Instance.new("TextLabel",Drawing.ScreenGui);i.BackgroundTransparency=1;return i end, u=function(i,p)if not p.v or p.t=="" then i.Visible=false;return end;i.Visible=true;i.Font=p.f;i.Text=p.t;i.TextSize=p.s;i.TextColor3=p.c;if p.o then i.TextStrokeColor3=p.oc;i.TextStrokeTransparency=0 else i.TextStrokeTransparency=1 end;local ts=Services.TextService:GetTextSize(p.t,p.s,p.f,Vector2.new(4096,4096));local pos=p.p;if p.ce then pos=pos-ts/2 end;i.Position=UDim2.fromOffset(pos.X,pos.Y);i.Size=UDim2.fromOffset(ts.X,ts.Y) end}
Drawing.Objects["Box"] = { D={v=false,p=Vector2.new(),s=Vector2.new(),c=Color3.new(1,1,1),th=1}, new=function()local c={};c.t=Drawing:New("Line");c.b=Drawing:New("Line");c.l=Drawing:New("Line");c.r=Drawing:New("Line");return c end, u=function(i,p)if not p.v then i.t:S('v',false);i.b:S('v',false);i.l:S('v',false);i.r:S('v',false);return end;local p1,p2,p3,p4=p.p,Vector2.new(p.p.X+p.s.X,p.p.Y),p.p+p.s,Vector2.new(p.p.X,p.p.Y+p.s.Y);i.t:S('v',true);i.t:S('f',p1);i.t:S('t',p2);i.t:S('c',p.c);i.t:S('th',p.th);i.b:S('v',true);i.b:S('f',p4);i.b:S('t',p3);i.b:S('c',p.c);i.b:S('th',p.th);i.l:S('v',true);i.l:S('f',p1);i.l:S('t',p4);i.l:S('c',p.c);i.l:S('th',p.th);i.r:S('v',true);i.r:S('f',p2);i.r:S('t',p3);i.r:S('c',p.c);i.r:S('th',p.th) end}
Drawing.Objects["Circle"] = { D={v=false,p=Vector2.new(),r=20,c=Color3.new(1,1,1),tr=0,f=true,s=24}, new=function()local i=Instance.new("ImageLabel",Drawing.ScreenGui);i.BackgroundTransparency=1;i.Image="http://www.roblox.com/asset/?id=2334003780";i.AnchorPoint=Vector2.new(0.5,0.5);return i end, u=function(i,p)if not p.v then i.Visible=false;return end;i.Visible=true;local d=p.r*2;i.Position=UDim2.fromOffset(p.p.X,p.p.Y);i.Size=UDim2.fromOffset(d,d);i.ImageColor3=p.c;i.ImageTransparency=p.tr end}
print("VOIDWARE_RESTORATION(1): Omni-Tool & Unblinking Eye are Fully Operational.")

-- // ========================= [ STAGE 4: ENGINE DAEMON FRAMEWORK ] ========================= //
print("VOIDWARE_RESTORATION(1): Assembling Engine Daemon framework...")
_G.Voidware.Engine.Godmode = { Name = "GodmodeDaemon", Active = false, Connections = {} }
_G.Voidware.Engine.Aura = { Name = "AuraDaemon", Active = false, Connections = {}, TargetCache = {}, UpdateTick = 0 }
_G.Voidware.Engine.Automation = { Name = "AutomationDaemon", Active = false, Connections = {} }
_G.Voidware.Engine.Bring = { Name = "BringDaemon", Active = false, Connections = {}, BringQueue = {} }
_G.Voidware.Engine.ESP = { Name = "ESPDaemon", Active = false, Connections = {}, RenderCache = {} }
print("VOIDWARE_RESTORATION(1): Engine Daemon framework complete.")
