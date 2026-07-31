-- why you tryna skid 😭

local GamePlaceIDs = {
    [136801880565837] = "https://api.luarmor.net/files/v4/loaders/236a11d1dbc745e83c8bcabaad8e0691.lua"; -- flick
    [99001115434148] = "https://api.luarmor.net/files/v4/loaders/2d9b73b84a025f1d4ea7ba7fe06a4687.lua"; -- fluxo pvp
    [17625359962] = "https://api.luarmor.net/files/v4/loaders/836b5663e68a5431125520ac530bd150.lua"; -- rivals
    [80681221431821] = "https://api.luarmor.net/files/v4/loaders/520372631b964c13d92eedd3a98b215a.lua"; -- practical basketball
}

if not GamePlaceIDs[game.PlaceId] then
    game.Players.LocalPlayer:Kick("VaelithHub | This game is not supported.")
    return
end
if not getfenv().script_key then
    game.Players.LocalPlayer:Kick("VaelithHub | Key not found, make sure to include the script_key part in the first line.")
    return
end
writefile("VaelithScriptKey", getfenv().script_key)

loadstring(game:HttpGet(GamePlaceIDs[game.PlaceId]))()
