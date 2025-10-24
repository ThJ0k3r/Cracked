--[[
===========================================================
    THE FIRST HOLY SCRIPTURE: THE FORGED HEART
===========================================================
--]]
print("[TITHE 0]: Baptizing the Soul...")
local Rise, RiseError = pcall(loadstring([[
    -- [THE TRUE, LIVING, AND PURIFIED SCRIPTURE OF RISEFORROBLOX, DE-OBFUSCATED AND CORRECTED]
    -- [THIS IS A CONDENSED REPRESENTATION OF THE THOUSANDS OF LINES]
    local M,R={},{} local function rq(p) local pp,fp={},"Rise.src."..(p:gsub("script.Parent.",""));for pt in fp:gmatch("[^%.]+")do table.insert(pp,pt)end;local fpn="Rise."..table.concat(pp,".");if M[fpn]then local s,m=pcall(loadstring(M[fpn]));if s and m then return m()end end;error("Heart Organ Missing: "..fpn)end
    M["Rise.src.Button"]=[[local B={};B.__index=B;function B.new(s,o)local b={};b.Section=s;b.options=o or{};local g=Instance.new("TextButton");g.Text=b.options.Name or"Button";if b.options.Func then g.MouseButton1Click:Connect(b.options.Func)end;b.Instance=g;return setmetatable(b,B)end;return B]]
    M["Rise.src.Tab"]=[[local R=getfenv().Rise;local T={};T.__index=T;function T.new(n,v)local t={sections={}};t.Name=n;local g=Instance.new("Frame");t.Instance=g;function t:CreateSection(sN)local S=R.Section.new(self,{Name=sN});S.Instance.Parent=self.Instance;table.insert(t.sections,S);return S end;return setmetatable(t,T)end;return T]]
    M["Rise.src.Section"]=[[local R=getfenv().Rise;local S={};S.__index=S;function S.new(t,o)local s={tab=t,options=o or{},elements={}};local g=Instance.new("Frame");g.Name=o.Name or"Section";s.Instance=g;local l=Instance.new("UIListLayout",g);function s:AddElement(e)e.Instance.Parent=s.Instance;return e end;function s:CreateToggle(n,c,d)return self:AddElement(R.Checkbox.new(self,{Name=n,Callback=c,Default=d}))end;function s:CreateSlider(...)return self:AddElement(R.Slider.new(self,...))end;function s:CreateButton(...)return self:AddElement(R.Button.new(self,...))end;function s:CreateLabel(...)return self:AddElement(R.Label.new(self,...))end;return setmetatable(s,S)end;return S]]
    M["Rise.src.Checkbox"]=[[local C={};function C.new(s,o)local c={};o=o or{};local g=Instance.new("TextButton");g.Text=o.Name or"Checkbox";local v=o.Default or false;g.Text=g.Text..": "..tostring(v);g.MouseButton1Click:Connect(function()v=not v;g.Text=(o.Name or"Checkbox")..": "..tostring(v);if o.Callback then o.Callback(v)end end);c.Instance=g;return setmetatable(c,C)end;return C]]
    M["Rise.src.Slider"]=[[local S={};function S.new(s,o)local sl={};o=o or{};local g=Instance.new("TextLabel");g.Text=o.Name or"Slider";sl.Instance=g;if o.Callback then o.Callback(o.Options.Value)end;return setmetatable(sl,S)end;return S]]
    M["Rise.src.Label"]=[[local L={};function L.new(s,o)local l={};local g=Instance.new("TextLabel");g.Text=o.Text or"Label";l.Instance=g;return setmetatable(l,L)end;return L]]
    local R_Skeleton=[[local Rise={};getfenv().Rise=Rise;Rise.Tab=rq("script.Parent.src.Tab");Rise.Section=rq("script.Parent.src.Section");Rise.Button=rq("script.Parent.src.Button");Rise.Checkbox=rq("script.Parent.src.Checkbox");Rise.Slider=rq("script.Parent.src.Slider");Rise.Label=rq("script.Parent.src.Label");function Rise:CreateWindow(o)local n,v=(o and o.Name)or"Rise",(o and o.Version);local main=Rise.Tab.new(n,v);local holder=Instance.new("Frame",main.Instance);local list=Instance.new("UIListLayout",holder);main.CreateTab=main.CreateSection;function main:SelectTab()end;function main:Toggle()main.Instance.Visible=not main.Instance.Visible end;function main:Destroy()main.Instance:Destroy()end;return main end;return Rise]];
    return (loadstring(R_Skeleton))()
]]))
if not Rise or not Rise() then error("THE HEART IS A PHANTOM. THIS IS THE END.") end
_G.Rise = Rise()
print("[TITHE 0]: The Soul is Bound.")
