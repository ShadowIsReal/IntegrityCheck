local module = {}
local signalCache = {}

-- [[ PUBLIC ]]

function module.Connect(signal : RBXScriptSignal, callback : ()->any?, identifier : string)

    if not signalCache[signal] then
        signalCache[signal] = {}

        local connection; connection = signal:Connect(function(...)
            for _, callback in signalCache[signal] do
                task.spawn(callback, ...)
            end
        end)

        signalCache[signal].__connection = connection
    end

    if not signalCache[signal][identifier] then
        signalCache[signal][identifier] = {}
    end

    table.insert(signalCache[signal][identifier], callback)
end

function module.Disconnect(signal : RBXScriptSignal, identifier : string)
    if signalCache[signal] and signalCache[signal][identifier] then
        signalCache[signal][identifier] = nil

        if #signalCache[signal] == 0 then
            signalCache[signal].__connection:Disconnect()
            signalCache[signal] = nil
        end
    end
end


--[[
The purpose of this module is so that we don't create several connections per detection and just have one connection fire all the callbacks,
creating many connections creates a lot of overhead we don't need
]]--
return module
