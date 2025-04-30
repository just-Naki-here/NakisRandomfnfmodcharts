--[[============================================================================
   Utils / Fake IP generator
============================================================================]]--
math.randomseed(os.time())

function generateFakeIPv6()
    local parts = {}
    for i = 1, 8 do
        parts[i] = string.format("%04x", math.random(0, 0xFFFF))
    end
    return table.concat(parts, ":")
end

--[[============================================================================
   Configuration & State
============================================================================]]--
local allowWindowBullShit = false

local shakeIntensity = 0
local shakeDuration = 0.2
local shakeTimer = 0
local windowX = 0
local windowY = 0
local tornadoRadius = 150
local tornadoSpeed = 6
local tornadoAngle = 0

local isShaking = false
local isTornado = false
local isTeleporting = false
local isResizing = false
local isRotating = false

local currentRotation = 0
local rotationSpeed = 50

local shaderEnabled = false
local shaderName = 'wobble'
local lastMisses = 0

local computerName, userName, fakeIPv6 = "", "", ""
local pcTextGlitchTime = 0

--[[============================================================================
   Step checker
============================================================================]]--
function onStepHit()
    if curStep < 2631 then
        allowWindowBullShit = true
    elseif curStep == 2632 then
        allowWindowBullShit = false
    end
end

--[[============================================================================
   Post-creation setup
============================================================================]]--
function onCreatePost()
    windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
    windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')
    initLuaShader(shaderName)

    computerName = os.getenv("COMPUTERNAME") or os.getenv("HOSTNAME") or "Unknown"
    userName     = os.getenv("USERNAME")     or os.getenv("USER")     or "User"
    fakeIPv6     = generateFakeIPv6()

    local info = "Computer: " .. computerName ..
                 " | User: " .. userName ..
                 " | IPv6: " .. fakeIPv6

    for _, layer in ipairs({
        {tag = "pcNameText", color = "FFFFFF"},
        {tag = "pcNameRed",  color = "FF0000"},
        {tag = "pcNameBlue", color = "00BFFF"}
    }) do
        makeLuaText(layer.tag, info, 1200, 50, 50)
        setTextSize(layer.tag, 24)
        setTextColor(layer.tag, layer.color)
        setObjectCamera(layer.tag, "hud")
        addLuaText(layer.tag)
        setProperty(layer.tag .. ".alpha", 0)
    end
end

--[[============================================================================
   Frame Update
============================================================================]]--
function onUpdate(elapsed)
    if getDataFromSave("disableInsanityEffects") == "true" then return end
    if not allowWindowBullShit then return end

    local misses = getProperty("songMisses")
    if misses > lastMisses then
        fakeIPv6 = generateFakeIPv6()
        local info = "Computer: " .. computerName ..
                     " | User: " .. userName ..
                     " | IPv6: " .. fakeIPv6
        for _, tag in ipairs({"pcNameText", "pcNameRed", "pcNameBlue"}) do
            setTextString(tag, info)
            setProperty(tag .. ".alpha", 1)
        end
        pcTextGlitchTime = 0.4
    end
    lastMisses = misses

    -- Visual glitch animation for text
    if pcTextGlitchTime > 0 then
        pcTextGlitchTime = pcTextGlitchTime - elapsed
        local baseX = getProperty("pcNameText.x")
        local baseY = getProperty("pcNameText.y")

        setProperty("pcNameText.angle", math.random(-15, 15))
        local scale = 1 + math.random() * 0.3
        setProperty("pcNameText.scale.x", scale)
        setProperty("pcNameText.scale.y", scale)

        setProperty("pcNameRed.x", baseX - 2)
        setProperty("pcNameRed.y", baseY + 2)
        setProperty("pcNameBlue.x", baseX + 2)
        setProperty("pcNameBlue.y", baseY - 2)
    else
        setProperty("pcNameText.angle", 0)
        setProperty("pcNameText.scale.x", 1)
        setProperty("pcNameText.scale.y", 1)
        for _, tag in ipairs({"pcNameRed", "pcNameBlue"}) do
            setProperty(tag .. ".x", getProperty("pcNameText.x"))
            setProperty(tag .. ".y", getProperty("pcNameText.y"))
        end
    end

    for _, tag in ipairs({"pcNameText", "pcNameRed", "pcNameBlue"}) do
        local a = getProperty(tag .. ".alpha")
        if a > 0 then
            setProperty(tag .. ".alpha", a - elapsed * 0.5)
        end
    end

    --[[============================================================================
       Window & Camera Effects
    =============================================================================]]--
    if misses > lastMisses then
        if misses >= 50 then
            applyShader()
            isRotating = true
            isResizing = isTeleporting = isTornado = isShaking = false
        elseif misses >= 40 then
            removeShader()
            isRotating = true
            isResizing = isTeleporting = isTornado = isShaking = false
        elseif misses >= 30 then
            removeShader()
            isResizing = true
            isTeleporting = true
            isTornado = isRotating = isShaking = false
        elseif misses >= 20 then
            removeShader()
            isTeleporting = true
            isResizing = isTornado = isRotating = isShaking = false
        elseif misses >= 10 then
            removeShader()
            isTornado = true
            isTeleporting = isResizing = isRotating = isShaking = false
        else
            removeShader()
            shakeIntensity = 10 + (misses * 3)
            shakeTimer = shakeDuration
            isShaking = true
            isTornado = isTeleporting = isResizing = isRotating = false
        end
    end

    -- Shake
    if isShaking then
        shakeTimer = shakeTimer - elapsed
        if shakeTimer > 0 then
            setPropertyFromClass('openfl.Lib', 'application.window.x', windowX + math.random(-shakeIntensity, shakeIntensity))
            setPropertyFromClass('openfl.Lib', 'application.window.y', windowY + math.random(-shakeIntensity, shakeIntensity))
        else
            setPropertyFromClass('openfl.Lib', 'application.window.x', windowX)
            setPropertyFromClass('openfl.Lib', 'application.window.y', windowY)
        end
    end

    -- Tornado
    if isTornado then
        local centerX = 1920 / 2 - 300
        local centerY = 1028 / 2 - 200
        tornadoAngle = tornadoAngle + tornadoSpeed * elapsed
        local offsetX = math.cos(tornadoAngle) * tornadoRadius
        local offsetY = math.sin(tornadoAngle) * tornadoRadius
        setPropertyFromClass('openfl.Lib', 'application.window.x', centerX + offsetX)
        setPropertyFromClass('openfl.Lib', 'application.window.y', centerY + offsetY)
    end

    -- Teleport
    if isTeleporting then
        local screenWidth = 1920
        local screenHeight = 1080
        local windowWidth = getPropertyFromClass('openfl.Lib', 'application.window.width')
        local windowHeight = getPropertyFromClass('openfl.Lib', 'application.window.height')
        local maxX = screenWidth - windowWidth
        local maxY = screenHeight - windowHeight
        setPropertyFromClass('openfl.Lib', 'application.window.x', math.random(0, math.max(maxX, 0)))
        setPropertyFromClass('openfl.Lib', 'application.window.y', math.random(0, math.max(maxY, 0)))
    end

    -- Resize
    if isResizing then
        local newWidth = 800 + math.random(-200, 400)
        local newHeight = 600 + math.random(-150, 300)
        newWidth = math.min(math.max(newWidth, 200), 1200)
        newHeight = math.min(math.max(newHeight, 150), 900)
        setPropertyFromClass('openfl.Lib', 'application.window.width', newWidth)
        setPropertyFromClass('openfl.Lib', 'application.window.height', newHeight)
    end

    -- Rotate
    if isRotating then
        currentRotation = currentRotation + rotationSpeed * elapsed
        setProperty('camGame.angle', currentRotation)
        setProperty('camHUD.angle', currentRotation)
    else
        setProperty('camGame.angle', 0)
        setProperty('camHUD.angle', 0)
    end

    if curStep == 2631 then
        setProperty('camGame.angle', 0)
        setProperty('camHUD.angle', 0)
    end
end

--[[============================================================================
   Shader helpers
============================================================================]]--
function applyShader()
    if not shaderEnabled then
        shaderEnabled = true
        setSpriteShader('camGame', shaderName)
        setSpriteShader('camHUD', shaderName)
    end
end

function removeShader()
    if shaderEnabled then
        shaderEnabled = false
        removeSpriteShader('camGame')
        removeSpriteShader('camHUD')
    end
end
