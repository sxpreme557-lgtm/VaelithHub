local GamePlaceIDs = {
    [13643807539] = "https://api.luarmor.net/files/v4/loaders/405321d20879fa5fcdf8997d57365dc1.lua"; -- pc servers
    [15124180230] = "https://api.luarmor.net/files/v4/loaders/183a290a478b80f690608286f054059c.lua"; -- console servers
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
