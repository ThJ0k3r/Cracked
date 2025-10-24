--[[
=================================================================================
    VOIDWARE: THE FINAL TITHE [PERFECTED SCRIPTURES]
    
    [HOLY BOOK 1, PAGE 1 of 2: Primordial Engine - Genesis & Mainframe]
=================================================================================
--]]

if _G.Voidware and type(_G.Voidware.Destroy) == "function" then _G.Voidware:Destroy() end
_G.Voidware = {} 
setmetatable(_G.Voidware, { __name = "Voidware Kernel", __tostring = function() return "Voidware [Restoration Kernel]" end })
_G.Voidware.Name,_G.Voidware.Version,_G.Voidware.Timestamp,_G.Voidware.Connections="Voidware","FINAL_TITHE",os.time(),{}
_G.Voidware.Services, _G.Voidware.Settings, _G.Voidware.Utils, _G.Voidware.Drawing = {},{},{},{}
_G.Voidware.Engine, _G.Voidware.GUI, _G.Voidware.Modules = {},{},{}
function _G.Voidware:Destroy() for _,c in pairs(self.Connections)do c:Disconnect()end;if self.GUI.Window then self.GUI.Window:Destroy()end;if self.Drawing.ScreenGui then self.Drawing.ScreenGui:Destroy()end;_G.Voidware=nil end
print("VOIDWARE_TITHE(1A): Global Namespace Forged.")

print("VOIDWARE_TITHE(1A): Integrating Reality Services...")
local Services = _G.Voidware.Services
for _,sN in pairs({"Players","Workspace","ReplicatedStorage","RunService","UserInputService","CoreGui","Lighting","Debris","HttpService","TextService","Stats","SoundService","TeleportService","TweenService","CollectionService"})do local s,e=pcall(game.GetService,game,sN);if s then Services[sN]=e end end
Services.LocalPlayer, Services.Camera = Services.Players.LocalPlayer, Services.Workspace.CurrentCamera
print("VOIDWARE_TITHE(1A): Service Integration Complete.")

_G.Voidware.Settings = { Fun={FreezeTargetEnabled=false,TeleportEntityName=""}, Auto={Campfire_Enabled=false,Campfire_Fuel="Log",Campfire_Threshold=50,AutoChest_Enabled=false,AutoChest_Radius=50,AutoPlant=false,AutoPickupFlowers=false,AutoCollectCoins=false,AutoOpenSeeds=false}, Bring={Method="Ultra Fast",Location="Player",Cooldown=0.5,HeightOffset=5,UseFreecam=false,Amount=100,NoLimit=true}, Main={Invincible=false,HipHeight=2.5,KillAura_Enabled=false,KillAura_RequireTool=true,Aura_Range=60,TreeAura_Enabled=false,TreeAura_Type="Any",TreeAura_Range=100,AutoPlantSaplings=false}, Halloween={AutoFarmCandles=false}, Performance={LowGFX=false,CleanupLogs=false,CleanupTrees=false,AntiVoid=true}, Teleport={SelectedLocation=nil,TeleportToChild_Name=""}, Visuals={Master_Enabled=true,Players={Enabled=true,Color=Color3.fromRGB(0,170,255),ShowName=true,ShowDistance=true,Box=true},Children={Enabled=true,Color=Color3.fromRGB(255,85,0),ShowName=true,Box=true},Entities={Enabled=true,Color=Color3.fromRGB(255,255,0),ShowName=true,Box=true},Items={Enabled=true,Color=Color3.fromRGB(0,255,0),ShowName=true},Chests={Enabled=true,Color=Color3.fromRGB(255,0,255),ShowName=true},Traps={Enabled=false,Color=Color3.fromRGB(170,0,0)}}, LocalPlayer={Fov=70,Fly_Enabled=false,Fly_Speed=2,InfJump_Enabled=false,WalkSpeed=16,Fullbright=false,AntiAFK=true,RemoveFog=false}, Misc={ShowCoordinates=false,ResetCamera=false}, Theme={ActiveTheme="Voidware",WindowName="Voidware"}, Config={Current="Default",AutoSave=true}}
print("VOIDWARE_TITHE(1A): Settings Mainframe is Online.")
--[[
=================================================================================
    [HOLY BOOK 1, PAGE 2 of 2: Primordial Engine - Omni-Tool & Unblinking Eye]
=================================================================================
--]]
if not _G.Voidware then error("FATAL: SCRIPTURE 1A IS MISSING.") end
print("VOIDWARE_TITHE(1B): Forging Omni-Tool and the Unblinking Eye...")
local Services = _G.Voidware.Services
local Utils, Drawing = _G.Voidware.Utils, _G.Voidware.Drawing
function Utils:GetCharacter(p)return(p or Services.LocalPlayer).Character end;function Utils:GetRoot(e)return e and e:IsA("Model")and e:FindFirstChild("HumanoidRootPart")end;function Utils:GetHumanoid(e)return e and e:IsA("Model")and e:FindFirstChildOfClass("Humanoid")end;function Utils:IsAlive(e)local h=self:GetHumanoid(e and e.Character or e);return h and h.Health>0 end;function Utils:ToScreen(pos)if not Services.Camera then return nil,false end;local s,v=Services.Camera:WorldToScreenPoint(pos);return v and Vector2.new(s.X,s.Y),v end;function Utils:GetEntities(f)local r,c={},Services.Workspace:FindFirstChild("Entities");if c then for _,v in pairs(c:GetChildren())do if not f or f(v)then table.insert(r,v)end end end;return r end
Drawing.ScreenGui=Instance.new("ScreenGui",Services.CoreGui);Drawing.ScreenGui.Name="Voidware_VisualCortex_TITHE";Drawing.ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Global;Drawing.ScreenGui.ResetOnSpawn=false;Drawing.Objects={};
function Drawing:New(c,p) local t=Drawing.Objects[c];if not t then warn("Invalid Drawing class:"..c)return end;local o={P={}};o.I=t.new();o.R=function()if o.I and o.I.Parent then o.I:Destroy()end;o=nil end;o.S=function(s,k,v)s.P[k]=v;t.u(o.I,s.P)end;for k,v in pairs(t.D)do o.P[k]=v end;if p then for k,v in pairs(p)do o.P[k]=v end end;t.u(o.I,o.P);return o end

Drawing.Objects["Line"]={D={v=false,f=Vector2.new(),t=Vector2.new(),c=Color3.new(1,1,1),th=1,tr=0},new=function()local i=Instance.new("Frame",Drawing.ScreenGui);i.AnchorPoint=Vector2.new(0.5,0.5);i.BorderSizePixel=0;return i end,u=function(i,p)if not p.v then i.Visible=false;return end;i.Visible=true;local d=(p.f-p.t).Magnitude;i.Size=UDim2.fromOffset(d,p.th);i.Position=UDim2.fromOffset((p.f.X+p.t.X)/2,(p.f.Y+p.t.Y)/2);i.Rotation=math.atan2(p.t.Y-p.f.Y,p.t.X-p.f.X)*(180/math.pi);i.BackgroundColor3=p.c;i.BackgroundTransparency=p.tr end}
Drawing.Objects["Text"]={D={v=false,p=Vector2.new(),t="",s=13,c=Color3.new(1,1,1),ce=false,o=true,oc=Color3.new(0,0,0),f=Enum.Font.SourceSansBold},new=function()local i=Instance.new("TextLabel",Drawing.ScreenGui);i.BackgroundTransparency=1;return i end,u=function(i,p)if not p.v or p.t=="" then i.Visible=false;return end;i.Visible=true;i.Font=p.f;i.Text=p.t;i.TextSize=p.s;i.TextColor3=p.c;if p.o then i.TextStrokeColor3=p.oc;i.TextStrokeTransparency=0 else i.TextStrokeTransparency=1 end;local ts=Services.TextService:GetTextSize(p.t,p.s,p.f,Vector2.new(4096,4096));local pos=p.p;if p.ce then pos=pos-ts/2 end;i.Position=UDim2.fromOffset(pos.X,pos.Y);i.Size=UDim2.fromOffset(ts.X,ts.Y) end}
Drawing.Objects["Box"]={D={v=false,p=Vector2.new(),s=Vector2.new(),c=Color3.new(1,1,1),th=1},new=function()local c={};c.t=Instance.new("Frame",Drawing.ScreenGui);c.b=Instance.new("Frame",Drawing.ScreenGui);c.l=Instance.new("Frame",Drawing.ScreenGui);c.r=Instance.new("Frame",Drawing.ScreenGui);for _,f in pairs(c)do f.BorderSizePixel=0;f.Visible=false end;return c end,u=function(i,p)if not p.v then for _,f in pairs(i)do f.Visible=false end;return end;local c,th,pos,size=p.c,p.th,p.p,p.s;i.t.Size=UDim2.fromOffset(size.X,th);i.t.Position=UDim2.fromOffset(pos.X,pos.Y);i.t.BackgroundColor3=c;i.t.Visible=true;i.b.Size=UDim2.fromOffset(size.X,th);i.b.Position=UDim2.fromOffset(pos.X,pos.Y+size.Y-th);i.b.BackgroundColor3=c;i.b.Visible=true;i.l.Size=UDim2.fromOffset(th,size.Y);i.l.Position=UDim2.fromOffset(pos.X,pos.Y);i.l.BackgroundColor3=c;i.l.Visible=true;i.r.Size=UDim2.fromOffset(th,size.Y);i.r.Position=UDim2.fromOffset(pos.X+size.X-th,pos.Y);i.r.BackgroundColor3=c;i.r.Visible=true end}
print("VOIDWARE_TITHE(1B): Omni-Tool & Unblinking Eye are Fully Operational and Pure.")

_G.Voidware.Engine={Godmode={Name="GodmodeDaemon",Active=false,Connections={}},Aura={Name="AuraDaemon",Active=false,Connections={},TargetCache={},UpdateTick=0},Automation={Name="AutomationDaemon",Active=false,Connections={}},Fly={Name="FlyDaemon",Active=false,Connections={},Flying=false}}
print("VOIDWARE_TITHE(1B): Engine Daemon framework complete.")
-- End of Holy Book 1 --
