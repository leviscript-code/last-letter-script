local VIM = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local pgui = player.PlayerGui
local myName = player.Name

-- ========================
--         GUI
-- ========================
local gui = Instance.new("ScreenGui")
gui.Name = "LastLetterBot"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = game:GetService("CoreGui")

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 280, 0, 340)
main.Position = UDim2.new(0, 20, 0.5, -170)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
main.BorderSizePixel = 0
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
local mainStroke = Instance.new("UIStroke", main)
mainStroke.Color = Color3.fromRGB(88, 101, 242)
mainStroke.Thickness = 2

-- drag
local dragging, dragStart, startPos
main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)
main.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
main.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

-- title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
titleBar.BorderSizePixel = 0
titleBar.Parent = main
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 12)

local titleFix = Instance.new("Frame")
titleFix.Size = UDim2.new(1, 0, 0, 12)
titleFix.Position = UDim2.new(0, 0, 1, -12)
titleFix.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
titleFix.BorderSizePixel = 0
titleFix.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -40, 1, 0)
titleText.Position = UDim2.new(0, 12, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "LAST LETTER BOT"
titleText.TextColor3 = Color3.fromRGB(88, 101, 242)
titleText.TextSize = 16
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(240, 60, 60)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 14
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BorderSizePixel = 0
closeBtn.Parent = titleBar
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

-- content
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -20, 1, -50)
content.Position = UDim2.new(0, 10, 0, 45)
content.BackgroundTransparency = 1
content.Parent = main

-- status
local statusDot = Instance.new("Frame")
statusDot.Size = UDim2.new(0, 10, 0, 10)
statusDot.Position = UDim2.new(0, 0, 0, 5)
statusDot.BackgroundColor3 = Color3.fromRGB(240, 60, 60)
statusDot.BorderSizePixel = 0
statusDot.Parent = content
Instance.new("UICorner", statusDot).CornerRadius = UDim.new(1, 0)

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -18, 0, 20)
statusLabel.Position = UDim2.new(0, 18, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "OFFLINE"
statusLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
statusLabel.TextSize = 13
statusLabel.Font = Enum.Font.GothamMedium
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = content

-- turn label
local turnLabel = Instance.new("TextLabel")
turnLabel.Size = UDim2.new(1, 0, 0, 18)
turnLabel.Position = UDim2.new(0, 0, 0, 22)
turnLabel.BackgroundTransparency = 1
turnLabel.Text = ""
turnLabel.TextColor3 = Color3.fromRGB(140, 140, 160)
turnLabel.TextSize = 11
turnLabel.Font = Enum.Font.GothamMedium
turnLabel.TextXAlignment = Enum.TextXAlignment.Left
turnLabel.Parent = content

-- word box
local wordBox = Instance.new("Frame")
wordBox.Size = UDim2.new(1, 0, 0, 50)
wordBox.Position = UDim2.new(0, 0, 0, 46)
wordBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
wordBox.BorderSizePixel = 0
wordBox.Parent = content
Instance.new("UICorner", wordBox).CornerRadius = UDim.new(0, 8)

local prefixLabel = Instance.new("TextLabel")
prefixLabel.Size = UDim2.new(1, -16, 0, 18)
prefixLabel.Position = UDim2.new(0, 8, 0, 4)
prefixLabel.BackgroundTransparency = 1
prefixLabel.Text = "PREFIX"
prefixLabel.TextColor3 = Color3.fromRGB(100, 100, 120)
prefixLabel.TextSize = 11
prefixLabel.Font = Enum.Font.GothamMedium
prefixLabel.TextXAlignment = Enum.TextXAlignment.Left
prefixLabel.Parent = wordBox

local wordLabel = Instance.new("TextLabel")
wordLabel.Size = UDim2.new(1, -16, 0, 22)
wordLabel.Position = UDim2.new(0, 8, 0, 24)
wordLabel.BackgroundTransparency = 1
wordLabel.Text = "---"
wordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
wordLabel.TextSize = 18
wordLabel.Font = Enum.Font.GothamBold
wordLabel.TextXAlignment = Enum.TextXAlignment.Left
wordLabel.Parent = wordBox

-- stats
local statsBox = Instance.new("Frame")
statsBox.Size = UDim2.new(1, 0, 0, 60)
statsBox.Position = UDim2.new(0, 0, 0, 106)
statsBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
statsBox.BorderSizePixel = 0
statsBox.Parent = content
Instance.new("UICorner", statsBox).CornerRadius = UDim.new(0, 8)

local function makeStat(name, x)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.33, 0, 0, 14)
    lbl.Position = UDim2.new(x, 0, 0, 6)
    lbl.BackgroundTransparency = 1
    lbl.Text = name
    lbl.TextColor3 = Color3.fromRGB(100, 100, 120)
    lbl.TextSize = 10
    lbl.Font = Enum.Font.GothamMedium
    lbl.Parent = statsBox
    local val = Instance.new("TextLabel")
    val.Name = name
    val.Size = UDim2.new(0.33, 0, 0, 24)
    val.Position = UDim2.new(x, 0, 0, 22)
    val.BackgroundTransparency = 1
    val.Text = "0"
    val.TextColor3 = Color3.fromRGB(88, 101, 242)
    val.TextSize = 20
    val.Font = Enum.Font.GothamBold
    val.Parent = statsBox
    return val
end

local wordsVal = makeStat("WORDS", 0)
local retriesVal = makeStat("RETRIES", 0.33)
local roundsVal = makeStat("ROUNDS", 0.66)

-- toggle
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(1, 0, 0, 38)
toggleBtn.Position = UDim2.new(0, 0, 0, 176)
toggleBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
toggleBtn.Text = "START"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextSize = 15
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.BorderSizePixel = 0
toggleBtn.Parent = content
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 8)

-- speed
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 16)
speedLabel.Position = UDim2.new(0, 0, 0, 222)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "SPEED: NORMAL"
speedLabel.TextColor3 = Color3.fromRGB(100, 100, 120)
speedLabel.TextSize = 11
speedLabel.Font = Enum.Font.GothamMedium
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = content

local speeds = {{"SLOW", 3}, {"NORMAL", 1.5}, {"FAST", 0.5}}
for i, s in pairs(speeds) do
    local btn = Instance.new("TextButton")
    btn.Name = s[1]
    btn.Size = UDim2.new(0.31, 0, 0, 28)
    btn.Position = UDim2.new((i - 1) * 0.345, 0, 0, 242)
    btn.BackgroundColor3 = s[1] == "NORMAL" and Color3.fromRGB(88, 101, 242) or Color3.fromRGB(38, 38, 50)
    btn.Text = s[1]
    btn.TextColor3 = Color3.fromRGB(200, 200, 210)
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    btn.Parent = content
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
end

-- ========================
--       BOT LOGIC
-- ========================
local botActive = false
local baseDelay = 1.5
local totalWords = 0
local totalRetries = 0
local totalRounds = 0

statusLabel.Text = "LOADING DICT..."
statusDot.BackgroundColor3 = Color3.fromRGB(240, 180, 40)

local dictUrl = "https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt"
local rawDict = game:HttpGet(dictUrl)
local allWords = {}

for word in string.gmatch(rawDict, "%S+") do
    if #word >= 3 and #word <= 12 then
        table.insert(allWords, string.lower(word))
    end
end

local byPrefix = {}
for _, w in pairs(allWords) do
    for len = 1, math.min(4, #w) do
        local pre = string.sub(w, 1, len)
        if not byPrefix[pre] then
            byPrefix[pre] = {}
        end
        table.insert(byPrefix[pre], w)
    end
end

statusLabel.Text = "READY (" .. #allWords .. " words)"
statusDot.BackgroundColor3 = Color3.fromRGB(60, 180, 75)

local used = {}
local triedThisRound = {}

local function isMyTurn()
    local ok, result = pcall(function()
        return string.find(pgui.InGame.Frame.Type.Text:lower(), myName:lower()) ~= nil
    end)
    return ok and result
end

local function getLetters()
    local ok, result = pcall(function()
        local frame = pgui.InGame.Frame.CurrentWord
        local letters = {}
        local i = 1
        while true do
            local slot = frame:FindFirstChild(tostring(i))
            if not slot then break end
            local lbl = slot:FindFirstChild("Letter")
            if lbl and lbl.Text and lbl.Text ~= "..." and lbl.Text ~= "" then
                table.insert(letters, lbl.Text)
            else
                break
            end
            i = i + 1
        end
        return table.concat(letters):lower()
    end)
    return ok and result or ""
end

local function getWord(prefix)
    if not byPrefix[prefix] then return nil end
    for _, w in pairs(byPrefix[prefix]) do
        if not used[w] and not triedThisRound[w] then
            used[w] = true
            triedThisRound[w] = true
            return w
        end
    end
    used = {}
    for _, w in pairs(byPrefix[prefix]) do
        if not triedThisRound[w] then
            triedThisRound[w] = true
            return w
        end
    end
    return nil
end

local function humanDelay()
    task.wait(baseDelay + math.random() * (baseDelay * 0.8))
end

local function pressKey(keyCode)
    VIM:SendKeyEvent(true, keyCode, false, game)
    task.wait(0.03)
    VIM:SendKeyEvent(false, keyCode, false, game)
end

local function typeWord(word, prefixLen)
    for i = prefixLen + 1, #word do
        local char = string.sub(word, i, i)
        pressKey(Enum.KeyCode[string.upper(char)])
        task.wait(0.06 + math.random() * 0.12)
    end
    task.wait(0.2 + math.random() * 0.4)
    pressKey(Enum.KeyCode.Return)
end

local function clearAll(count)
    for i = 1, count do
        pressKey(Enum.KeyCode.Backspace)
        task.wait(0.04)
    end
end

local function isInGame()
    local ok, result = pcall(function()
        return pgui.InGame.Frame.Visible
    end)
    return ok and result
end

local function joinMatch()
    pcall(function()
        local dm = pgui:FindFirstChild("DisplayMatch")
        if not dm then return end
        local matches = dm.Frame:FindFirstChild("Matches")
        if not matches then return end
        for _, match in pairs(matches:GetChildren()) do
            if match:IsA("TextButton") then
                local title = match:FindFirstChild("Title")
                if title and string.find(title.Text, "Last Letter") then
                    local pls = match:FindFirstChild("Players")
                    if pls then
                        for _, slot in pairs(pls:GetChildren()) do
                            local dots = slot:FindFirstChild("Dots")
                            if dots and dots.Text == "..." then
                                for _, conn in pairs(getconnections(match.MouseButton1Click)) do
                                    conn:Fire()
                                end
                                return
                            end
                        end
                    end
                end
            end
        end
    end)
end

-- gui events
toggleBtn.MouseButton1Click:Connect(function()
    botActive = not botActive
    if botActive then
        toggleBtn.Text = "STOP"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(240, 60, 60)
        statusLabel.Text = "ACTIVE"
        statusDot.BackgroundColor3 = Color3.fromRGB(60, 240, 75)
    else
        toggleBtn.Text = "START"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        statusLabel.Text = "PAUSED"
        statusDot.BackgroundColor3 = Color3.fromRGB(240, 180, 40)
    end
end)

for _, btn in pairs(content:GetChildren()) do
    if btn:IsA("TextButton") and (btn.Name == "SLOW" or btn.Name == "NORMAL" or btn.Name == "FAST") then
        btn.MouseButton1Click:Connect(function()
            for _, b in pairs(content:GetChildren()) do
                if b:IsA("TextButton") and (b.Name == "SLOW" or b.Name == "NORMAL" or b.Name == "FAST") then
                    b.BackgroundColor3 = Color3.fromRGB(38, 38, 50)
                end
            end
            btn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
            for _, s in pairs(speeds) do
                if s[1] == btn.Name then
                    baseDelay = s[2]
                    speedLabel.Text = "SPEED: " .. btn.Name
                end
            end
        end)
    end
end

closeBtn.MouseButton1Click:Connect(function()
    botActive = false
    gui:Destroy()
end)

-- ========================
--       MAIN LOOP
-- ========================
while task.wait(0.3) do
    if not botActive then continue end

    if isInGame() then
        if isMyTurn() then
            statusLabel.Text = "MY TURN"
            statusDot.BackgroundColor3 = Color3.fromRGB(60, 240, 75)
            turnLabel.Text = "Playing..."
            turnLabel.TextColor3 = Color3.fromRGB(60, 240, 75)

            local prefix = getLetters()
            if prefix == "" then continue end

            triedThisRound = {}
            totalRounds = totalRounds + 1
            roundsVal.Text = tostring(totalRounds)
            prefixLabel.Text = "PREFIX: " .. string.upper(prefix)

            local attempts = 0
            while isMyTurn() and attempts < 8 do
                attempts = attempts + 1

                local word = getWord(prefix)
                if not word then
                    wordLabel.Text = "NO WORDS LEFT"
                    break
                end

                if attempts == 1 then
                    wordLabel.Text = string.upper(word)
                    humanDelay()
                else
                    totalRetries = totalRetries + 1
                    retriesVal.Text = tostring(totalRetries)
                    wordLabel.Text = string.upper(word) .. " (retry " .. (attempts - 1) .. ")"
                    task.wait(0.4 + math.random() * 0.6)
                end

                typeWord(word, #prefix)
                totalWords = totalWords + 1
                wordsVal.Text = tostring(totalWords)

                -- aspetta per vedere se il turno passa
                task.wait(1.2)

                -- se non è più il mio turno → accettata
                if not isMyTurn() then
                    wordLabel.Text = string.upper(word) .. " OK"
                    break
                end

                -- ancora il mio turno → rifiutata, cancella tutto e riprova
                clearAll(#word - #prefix)
                task.wait(0.3)
            end
        else
            statusLabel.Text = "WAITING"
            statusDot.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
            pcall(function()
                local otherName = string.match(pgui.InGame.Frame.Type.Text, "^(.+),")
                turnLabel.Text = "Turn: " .. (otherName or "?")
                turnLabel.TextColor3 = Color3.fromRGB(140, 140, 160)
            end)
        end
    else
        statusLabel.Text = "SEARCHING MATCH..."
        statusDot.BackgroundColor3 = Color3.fromRGB(240, 180, 40)
        turnLabel.Text = ""
        joinMatch()
        task.wait(2)
    end
end
