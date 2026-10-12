-- [[ VARIABLES ]]

-- services
local players = game:GetService("Players")

-- modules
local flags = require("./FFlags")
local detections = require("./DetectionsIndex")
local data = require("./Modules/Data")

-- [[ FUNCTIONS ]]

local function onPlayerJoin(player : Player)
	
end

local function onPlayerLeave(player : Player) 
	
end

-- [[ SOURCE]]

-- setup player connections
players.PlayerAdded:Connect(onPlayerJoin)
players.PlayerRemoving:Connect(onPlayerLeave)