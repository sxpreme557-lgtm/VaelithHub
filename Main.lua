local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local GamePlaceIDs = {
    [136801880565837] = "https://api.luarmor.net/files/v4/loaders/236a11d1dbc745e83c8bcabaad8e0691.lua", -- flick
    [99001115434148] = "https://api.luarmor.net/files/v4/loaders/2d9b73b84a025f1d4ea7ba7fe06a4687.lua", -- fluxo pvp
}

local loaderURL = GamePlaceIDs[game.PlaceId]

if not loaderURL then
    LocalPlayer:Kick("VaelithHub | This game is not supported.")
    return
end

-- getfenv may not exist in some environments.
local environment = getfenv and getfenv() or _G
local scriptKey = environment.script_key

if not scriptKey then
    LocalPlayer:Kick(
        "VaelithHub | Key not found. Include script_key = \"YOUR_KEY\" before the loader."
    )
    return
end

-- writefile is executor-specific, so don't call it unless it exists.
if writefile then
    local success, err = pcall(function()
        writefile("VaelithScriptKey.txt", tostring(scriptKey))
    end)

    if not success then
        warn("Failed to save script key:", err)
    end
end

local requestSuccess, source = pcall(function()
    return game:HttpGet(loaderURL)
end)

if not requestSuccess then
    warn("Failed to download Luarmor loader:", source)
    return
end

if type(loadstring) ~= "function" then
    warn("loadstring is unavailable in the current environment.")
    return
end

local compiledLoader, compileError = loadstring(source)

if not compiledLoader then
    warn("Failed to compile Luarmor loader:", compileError)
    return
end

local runSuccess, runError = pcall(compiledLoader)

if not runSuccess then
    warn("Luarmor loader runtime error:", runError)
end
