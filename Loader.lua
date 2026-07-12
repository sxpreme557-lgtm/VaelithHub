local GamePlaceIDs = {
    [76427445314955 ] = "https://api.luarmor.net/files/v4/loaders/d0c7c6e71ce166cae7f7f75dd10d5ae7.lua"; -- vc2
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
