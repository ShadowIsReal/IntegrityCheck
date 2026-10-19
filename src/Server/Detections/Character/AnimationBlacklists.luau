-- [[ Variables ]]

-- services
local players = game:GetService("Players")

-- animation list
local blacklistedAnimations = {

}

-- modules
local signals = require("../../../Modules/Signals")
local fflags = require("../../../FFlags")

-- [[ Source]]
return function()
    signals.Connect(players.PlayerAdded, function(player : Player)
        signals.Connect(player.CharacterAdded, function(character : Model)
            local humanoid : Humanoid = character:WaitForChild("Humanoid")

            while humanoid.Health > 0 do
                for _,animationTrack : AnimationTrack in humanoid:GetPlayingAnimationTracks() do
                    if table.find(blacklistedAnimations, animationTrack.Animation.AnimationId) then
                        -- TODO: implement customizable punishment
                    end
                end
            end
        end, "detection_character_animationBlacklist")
    end, "detection_character_animationBlacklist")

    signals.Connect(players.PlayerRemoving, function(player : Player)
        signals.Disconnect(player.CharacterAdded, "detection_character_animationBlacklist")
    end, "detection_character_animationBlacklist")
end