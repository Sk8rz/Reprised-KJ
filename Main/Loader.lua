local _NL = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()

local _RJCT = "Rejected"

local _IE = identifyexecutor and identifyexecutor() or "Unknown Executor"

if _G[_RJCT] then
    _NL:SendNotification("Warning", _IE .. " doesn't meet Requirements!", 10)
    return
end

_G[_RJCT] = false

_NL:SendNotification("Info", "Executor : " .. _IE, 2)

local _RF = {}

if not getrawmetatable then table.insert(_RF, "getrawmetatable") end
if not newcclosure then table.insert(_RF, "newcclosure") end
if not getconnections then table.insert(_RF, "getconnections") end
if not getnamecallmethod then table.insert(_RF, "getnamecallmethod") end
if not setreadonly then table.insert(_RF, "setreadonly") end
if not firesignal then table.insert(_RF, "firesignal") end

task.wait(2.2)

if #_RF > 0 then
    _NL:SendNotification("Error", _IE .. " Unsupported!", 5)
    task.wait(0.5)
    _G[_RJCT] = true
    return
end

task.wait(0.2)
_NL:SendNotification("Success", _IE .. " Supported!", 5)

https://raw.githubusercontent.com/Sk8rz/Reprised-KJ/refs/heads/main/Main/RKJ.lua?token=GHSAT0AAAAAAD3NQLXFHGJ6BG374MV73F3G2PMIQWQ
