local _DV = true

local _RKJ = "RKJ"

local function LoadMainScript()
    local _NL = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()

    if _G[_RKJ] then
        _NL:SendNotification("Warning", "RKJ Already Executed!", 4)
        return
    end

    _G[_RKJ] = true

    local _V4 = workspace:GetAttribute("VIPServer") ~= nil

    if _V4 then
        _NL:SendNotification("Error", "Private Servers Unsupported!", 7)
        _G[_RKJ] = nil
        return
    end

    _NL:SendNotification("Success", "RKJ Loaded!", 5)

    if _DV then
        _NL:SendNotification("Info", "Developer Mode", 9999999999)
    end

    local _G1 = game:GetService("Players")
    local _G2 = game:GetService("StarterGui")
    local _G3 = game:GetService("RunService")
    local _G4 = game:GetService("UserInputService")
    local _G5 = game:GetService("ReplicatedStorage")
    local _SS = game:GetService("SoundService")

    local _L1 = _G1.LocalPlayer
    local _R1 = _G5:WaitForChild("Replication")

    local _V1 = 0.15
    local _V2 = 0.1

    local _M1VP = {
        [0.10] = 0.14, [0.20] = 0.28, [0.30] = 0.42, [0.40] = 0.56,
        [0.50] = 0.70, [0.60] = 0.84, [0.70] = 0.98, [0.80] = 1.12,
        [0.90] = 1.26, [1.00] = 1.40,
    }

    local _M1SG = _SS:WaitForChild("Sounds")

    local function _M1GV()
        local _GV = _M1SG.Volume
        local _RND = math.round(_GV * 100) / 100
        return _M1VP[_RND] or 0.70
    end

    local _T1 = {[3755636438] = true, [3755636825] = true}

    local _T2 = {
        {d = 10469493270, r = 17325510002, s = 1, n = 17325528680},
        {d = 10469630950, r = 17325513870, s = 1, n = 17325528583},
        {d = 10469639222, r = 17325522388, s = 1, n = 17325528509},
        {d = 10469643643, r = 17325537719, s = 1, n = 17325528401},
        {d = 10503381238, x = true, l = 13379003796, q = 10503381238}
    }

    local _RS = _G5:FindFirstChild("Resources")
    local _T3 = {phone = _RS and _RS:FindFirstChild("le phone")}

    local _C1, _C2, _C3, _C4, _C5
    local _X1, _X2, _X3
    local _Y1 = 0
    local _Y2 = nil

    local function _F1(a, b, c)
        _G2:SetCore("SendNotification", {Title = a, Text = b, Duration = c or 5})
    end

    local function _F2(t)
        return tonumber(t.Animation.AnimationId:match("%d+"))
    end

    local function _F3(audioId)
        if not audioId or not _C2 then return end
        local s = Instance.new("Sound")
        s:SetAttribute("KJScript", true)
        s.SoundId = "rbxassetid://" .. audioId
        s.SoundGroup = _M1SG
        s.Volume = 1.0
        s.Parent = _C2
        s:Play()
        local desiredFinal = _M1GV()
        if _M1SG.Volume > 0 then
            s.Volume = desiredFinal / _M1SG.Volume
        else
            s.Volume = 0
        end
        s.Ended:Once(function()
            s:Destroy()
        end)
    end

    local _Z1 = true
    local _Z2 = false
    local _Z3

    local function _F4()
        local g = _L1:FindFirstChildOfClass("PlayerGui")
        if not g then return end
        for _, x in ipairs(g:GetDescendants()) do
            if x:IsA("Sound") then x.Volume = 0 end
        end
    end

    local function _F5(d)
        if not d or type(d) ~= "table" or d.Effect ~= "Notification" then 
            return false 
        end
        local _CCH = _L1:GetAttribute("Character")
        if _CCH == "KJ." then
            return d.KJ == true
        end
        return true
    end

    local function _F6()
        if _Z2 then return end
        _Z2 = true
        
        pcall(function()
            for _, c in ipairs(getconnections(_R1.OnClientEvent)) do
                local ok, f = pcall(function() return c.Function end)
                if ok and type(f) == "function" then
                    c:Disconnect()
                    _R1.OnClientEvent:Connect(function(...)
                        local d = (...)
                        if type(d) == "table" and d.Effect == "Notification" and not _F5(d) then
                            _F4()
                            return
                        end
                        return f(...)
                    end)
                end
            end
        end)
        
        local m = getrawmetatable(game)
        _Z3 = m.__namecall
        setreadonly(m, false)
        m.__namecall = newcclosure(function(s, ...)
            local k = getnamecallmethod()
            if _Z1 and (k == "Connect" or k == "Once") then
                local ok, p = pcall(function() return s.Parent end)
                if ok and p == _R1 then
                    local f = select(1, ...)
                    if type(f) == "function" then
                        return _Z3(s, function(...)
                            local d = (...)
                            if type(d) == "table" and d.Effect == "Notification" and not _F5(d) then
                                _F4()
                                return
                            end
                            return f(...)
                        end)
                    end
                end
            end
            if _Z1 and (k == "FireServer" or k == "InvokeServer") and s == _R1 then
                return k == "InvokeServer" and true or nil
            end
            return _Z3(s, ...)
        end)
        setreadonly(m, true)
        
        local g = _L1:FindFirstChildOfClass("PlayerGui")
        if g then
            g.DescendantAdded:Connect(function(o)
                if o:IsA("Sound") then 
                    if _L1:GetAttribute("Character") == "KJ." then
                        o.Volume = 0 
                    end
                end
            end)
        end
        
        _F4()
    end

    _F6()

    local _H1 = false

    local function _F7(t)
        if _H1 then return end
        if _L1:GetAttribute("Character") ~= "KJ." then return end
        
        local i = _F2(t)
        
        for _, a in ipairs(_T2) do
            if i == a.d then
                _H1 = true
                local ri = a.r
                if a.x and _C2 then
                    local cy = _C2.Orientation.Y
                    local dt = cy - _Y1
                    if dt > 180 then dt = dt - 360 end
                    if dt < -180 then dt = dt + 360 end
                    ri = (dt < 0) and a.l or a.q
                end
                t:Stop(_V2)
                if _C5 and _F2(_C5) ~= ri then
                    _C5:Stop(_V2)
                    _C5 = nil
                end
                if not _C5 and _C4 then
                    local an = Instance.new("Animation")
                    an.AnimationId = "rbxassetid://" .. ri
                    local nt = _C4:LoadAnimation(an)
                    nt:Play(_V1)
                    if a.s then nt:AdjustSpeed(a.s) end
                    _C5 = nt
                    if a.n then _F3(a.n) end
                end
                _H1 = false
                break
            end
        end
    end

    local function _F8(s)
        if not s:IsA("Sound") or s:GetAttribute("KJScript") then return end
        local i = tonumber((s.SoundId or ""):match("%d+"))
        if i and _T1[i] and _L1:GetAttribute("Character") == "KJ." then
            s.Volume = 0
        end
    end

    local function _F10()
        local char = _L1.Character
        if not char then return end
        for _, obj in ipairs(char:GetDescendants()) do
            if obj:IsA("Sound") and not obj:GetAttribute("KJScript") then
                local sid = tonumber((obj.SoundId or ""):match("%d+"))
                if sid and _T1[sid] then
                    obj.Volume = _L1:GetAttribute("Character") == "KJ." and 0 or 1
                end
            end
        end
    end

    local function _F9(c)
        if _X1 then _X1:Disconnect() end
        if _X2 then _X2:Disconnect() end
        if _X3 then _X3:Disconnect() end
        
        _C1 = c
        _C2 = c:WaitForChild("HumanoidRootPart")
        _C3 = c:WaitForChild("Humanoid")
        _C4 = _C3:WaitForChild("Animator") or _C3:FindFirstChildOfClass("Animator")
        _C5 = nil
        _Y1 = _C2.Orientation.Y
        
        _X2 = _C2.DescendantAdded:Connect(_F8)
        _X1 = _C3.AnimationPlayed:Connect(_F7)
        _X3 = _G3.Heartbeat:Connect(function()
            if _C2 then _Y1 = _C2.Orientation.Y end
        end)
        
        _F10()
    end

    local function _FA()
        local tb = _L1.PlayerGui:WaitForChild("TopbarPlus", 5)
        if not tb then return end
        tb = tb:WaitForChild("TopbarContainer", 5)
        if not tb then return end
        tb = tb:WaitForChild("UnnamedIcon", 5)
        if not tb then return end

        local ib = tb:FindFirstChild("IconButton")
        if not ib then
            ib = Instance.new("Frame")
            ib.Name = "IconButton"
            ib.Parent = tb
            ib.Size = UDim2.new(1, 0, 1, 0)
            ib.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            ib.BackgroundTransparency = 0.3
            ib.BorderSizePixel = 0
            ib.ZIndex = 10
        end

        local nf = ib:FindFirstChild("NoticeFrame")
        if not nf then
            nf = Instance.new("ImageLabel")
            nf.Name = "NoticeFrame"
            nf.Parent = ib
            nf.Position = UDim2.new(0.5, 0, 0, -2)
            nf.Size = UDim2.new(1, 0, 0.7, 0)
            nf.BackgroundTransparency = 1
            nf.Image = "http://www.roblox.com/asset/?id=4871790969"
            nf.ScaleType = Enum.ScaleType.Fit
            nf.ZIndex = 12
        end

        local nl = nf:FindFirstChild("NoticeLabel")
        if not nl then
            nl = Instance.new("TextLabel")
            nl.Name = "NoticeLabel"
            nl.Parent = nf
            nl.Position = UDim2.new(0.25, 0, 0.15, 0)
            nl.Size = UDim2.new(0.5, 0, 0.7, 0)
            nl.BackgroundTransparency = 1
            nl.Text = "1"
            nl.Font = Enum.Font.Arial
            nl.TextSize = 8
            nl.TextColor3 = Color3.fromRGB(31, 33, 35)
            nl.TextScaled = true
            nl.ZIndex = 13
        else
            local n = tonumber(nl.Text)
            nl.Text = n and tostring(n + 1) or "1"
        end
    end

    task.spawn(function()
        _FA()
        local df = _L1.PlayerGui.TopbarPlus.TopbarContainer.UnnamedIcon.DropdownContainer.DropdownFrame
        
        local kf = df:WaitForChild("KJ")
        kf.Visible = true
        local kb = kf:WaitForChild("IconButton")
        kb.Visible = true
        
        kb.MouseButton1Click:Connect(function()
            if _L1:GetAttribute("Character") == "KJ." then
                _F1("NOTIFICATION", "YOU'RE ALREADY PLAYING THIS CHARACTER.", 3)
                return
            end
            if _L1.Character and _L1.Character:FindFirstChild("Communicate") then
                _L1.Character.Communicate:FireServer({Goal = "Change Character", Character = "KJ."})
            end
            _L1.CharacterAdded:Wait()
            _L1:SetAttribute("Character", "KJ.")
        end)
        
        local bf = df:FindFirstChild("Bald")
        if bf then
            bf.Visible = true
            local bb = bf:WaitForChild("IconButton")
            bb.Visible = true
            
            local function _FB()
                if _L1:GetAttribute("Character") == "KJ." then
                    firesignal(_R1.OnClientEvent, {
                        Message = "ARE YOU SURE YOU WANT TO CHANGE YOUR CHARACTER?",
                        char = "Bald",
                        Button = "Reset",
                        Effect = "Notification",
                        KJ = true
                    })
                    _L1.CharacterAdded:Wait()
                    _L1:SetAttribute("Character", "Bald")
                    return
                end
                if _L1.Character and _L1.Character:FindFirstChild("Communicate") then
                    _L1.Character.Communicate:FireServer({Goal = "Change Character", Character = "Bald"})
                end
            end
            
            bb.MouseButton1Click:Connect(_FB)
            if _G4.TouchEnabled then
                bb.TouchTap:Connect(_FB)
            end
        end
        
        _L1:GetAttributeChangedSignal("Character"):Connect(function()
            local ca = _L1:GetAttribute("Character")
            if ca == "KJ." then
                if _Y2 ~= ca then
                    _F1("NOTIFICATION", "Character based on KJ's Final Ride & KJ Kills Day")
                    _Y2 = ca
                end
            end
            _F10()
        end)
        
        _L1.CharacterAdded:Connect(function()
            local kj = _L1.PlayerGui.TopbarPlus.TopbarContainer.UnnamedIcon.DropdownContainer.DropdownFrame:WaitForChild("KJ")
            kj.Visible = true
            kj:WaitForChild("IconButton").Visible = true
        end)
    end)

    if _L1.Character then _F9(_L1.Character) end
    _L1.CharacterAdded:Connect(_F9)
end

local _LS = "https://raw.githubusercontent.com/Sk8rz/Reprised-KJ/main/Main/Loader.lua"

if not _G.ReprisedKJ_LoaderExecuted then
    _G.ReprisedKJ_LoaderExecuted = true
    
    if not _DV then
        local _PSS = pcall(function()
            loadstring(game:HttpGet(_LS))()
        end)
        
        if not _PSS then
            local _NL = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()
            _NL:SendNotification("Error", "Loader is Currently Down!", 7)
            LoadMainScript()
            return
        end
        
        if _G[_RKJ] then
            return
        end
    end
end

LoadMainScript()
