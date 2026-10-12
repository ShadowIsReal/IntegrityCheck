local detections = {}

-- load all detections into table

for _,folder in script.Parent.Detections:GetChildren() do
	local detectionIndex = {}
	detections[folder.Name] = {}
	
	for _,detection in folder:GetChildren() do
		detectionIndex[detection.Name] = require(detection)
	end
	
	detections[folder.Name] = detectionIndex
end

return detections