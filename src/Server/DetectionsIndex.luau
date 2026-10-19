local detections = {}

local flags = require("./FFlags")

-- load all detections into our index
-- TODO: if a detection is disabled via FFLags then we must not require it here ( if we require it then it will be cache'd into memory that we will never use )

for _,folder in script.Parent.Detections:GetChildren() do
	local detectionIndex = {}
	detections[folder.Name] = {}
	
	for _,detectionCategory in folder:GetChildren() do
		detectionIndex[detectionCategory.Name] = require(detection)
	end
	
	detections[folder.Name] = detectionIndex
end

return detections