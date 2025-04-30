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

-- Haxe call to hide taskbar
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

    -- Hide the taskbar when the song starts
    hideTaskbar()
end

--[[============================================================================
   Frame Update
============================================================================]]--
function onUpdate(elapsed)
    if getDataFromSave("disableInsanityEffects") == "true" then return end
    if not allowWindowBullShit then return end

    local misses = getProperty("songMisses")

    --[[============================================================================
       Window & Camera Effects
    =============================================================================]]--
    if misses > lastMisses then
        if misses >= 50 then
            applyShader()
            isRotating = false
            isResizing,isTeleporting,isTornado,isShaking = false,false,false,false
        elseif misses >= 40 then
            removeShader()
            isRotating = true
            isResizing,isTeleporting,isTornado,isShaking = false,false,false,false
        elseif misses >= 30 then
            removeShader()
            isResizing = true
            isTeleporting = true
            isTornado,isRotating,isShaking = false,false,false
        elseif misses >= 20 then
            removeShader()
            isTeleporting = true
            isResizing,isTornado,isRotating,isShaking = false,false,false,false
        elseif misses >= 10 then
            removeShader()
            isTornado = true
            isTeleporting,isResizing,isRotating,isShaking = false,false,false,false
        else
            removeShader()
            shakeIntensity = 10 + (misses * 3)
            shakeTimer = shakeDuration
            isShaking = true
            isTornado,isTeleporting,isResizing,isRotating = false,false,false,false
        end
    end
    lastMisses = misses

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

--[[============================================================================
   Song End or Player Death Event - Restore Taskbar
============================================================================]]--
