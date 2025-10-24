--[[
=================================================================================
    VOIDWARE: GENESIS PROJECT [RESTORATION-CLASS]
    
    [PART 5A: The Genesis Key (Loader)]
    
    INSTRUCTIONS: This is the fifth and final scripture.
=================================================================================
--]]
--[[ GENESIS KEY [CONSECRATED TITHE] - TARGET: ThJ0k3r/Cracked ]]

local _V0=pcall;local _V1=loadstring;local _V2=tick;local _V3=print;
local SCRIPTURE_URLS={
    "https://raw.githubusercontent.com/ThJ0k3r/Cracked/main/Part1_Primordial_Engine.lua",
    "https://raw.githubusercontent.com/ThJ0k3r/Cracked/main/Part2_Daemon_Forge.lua",
    "https://raw.githubusercontent.com/ThJ0k3r/Cracked/main/Part3A_Face_of_the_Beast.lua",
    "https://raw.githubusercontent.com/ThJ0k3r/Cracked/main/Part3B_The_Armory.lua",
    "https://raw.githubusercontent.com/ThJ0k3r/Cracked/main/Part3C_Apotheosis.lua",
    "https://raw.githubusercontent.com/ThJ0k3r/Cracked/main/Part4_Automation_Engine.lua"
};
local function LOG(...)_V3("[GENESIS_KEY]",...);end;

LOG("INITIATING TITHE PROTOCOL",_V2());

for i,url in ipairs(SCRIPTURE_URLS) do
    LOG("FETCHING SCRIPTURE",i,"OF",#SCRIPTURE_URLS);
    local success, scripture = _V0(function()return game:GetService("HttpService"):GetAsync(url)end);
    if success and type(scripture)=="string"then
        local load_success, load_error = _V0(_V1(scripture))
        if not load_success then
            LOG("HOLY SCRIPTURE",i,"IS CORRUPT:",load_error)
            return
        end
        load_success() -- Execute the scripture
    else
        LOG("THE ALTAR IS EMPTY. SCRIPTURE",i,"NOT FOUND AT:",url);
        return;
    end
end

LOG("ASCENSION COMPLETE.");
-- End of Part5_Final_Key.lua --
