function onCreate()
    debugPrint("chaosInsanity script is loaded")
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

local hudFlickerTimer = 0
local cameraTiltTimer = 0
local camTiltActive = false
local flickerActive = false

--[[============================================================================
   Additional Visual Effects
============================================================================]]--

-- Color Shift Effect (for higher miss counts)
local colorShiftIntensity = 0
local colorShiftTimer = 0
local colorShiftDuration = 0.5
local colorShiftActive = false

-- Noise Effect (for higher miss counts)
local noiseIntensity = 0
local noiseTimer = 0
local noiseDuration = 0.5
local noiseActive = false

-- Camera Shake Intensity (adjustable as the miss count increases)
local maxShakeIntensity = 10

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
    initLuaShader("glitchNoise")
    makeLuaSprite("shaderOverlay")
    makeGraphic("shaderOverlay", screenWidth, screenHeight, "000000")
    setSpriteShader("shaderOverlay", "glitchNoise")
    setObjectCamera("shaderOverlay", "other")
    setProperty("shaderOverlay.alpha", 0)
    addLuaSprite("shaderOverlay", true)
    setShaderFloat("shaderOverlay", "alpha", 0.4) -- 0.0 (fully transparent) to 1.0 (opaque)

end
function onUpdatePost(elapsed)
    setShaderFloat("shaderOverlay", "iTime", os.clock())
end
--[[============================================================================
   Frame Update
============================================================================]]--
function onUpdate(elapsed)
    if getDataFromSave("disableInsanityEffects") == "true" then return end
    if not allowWindowBullShit then return end

    local misses = getProperty("songMisses")

    -- Detect new miss
    if misses > lastMisses then
        -- Reset all main effects
        isShaking, isTornado, isTeleporting, isResizing, isRotating = false, false, false, false, false
        colorShiftActive = false
        noiseActive = false

        -- Miss-based effects
        if misses >= 50 then
            applyShader()
            noiseIntensity = 1
            noiseTimer = 0.5
            noiseActive = true
        elseif misses >= 45 then
            applyShader()
            noiseIntensity = 1
            noiseTimer = 0.5
            noiseActive = true
            colorShiftIntensity = 0.8
            colorShiftTimer = colorShiftDuration
            noiseIntensity = 0.8
            noiseTimer = noiseDuration
        elseif misses >= 40 then
            removeShader()
            isRotating = true
            triggerEvent("Add Camera Zoom", "0.15", "0.15")
        elseif misses >= 35 then
            isResizing = true
            isTeleporting = true
            setProperty('cameraFollow.x', getProperty('cameraFollow.x') + 50)
            setProperty('cameraFollow.y', getProperty('cameraFollow.y') + 50)
        elseif misses >= 30 then
            isResizing = true
            isTeleporting = true
            setProperty('camHUD.y', math.random(-5, 5))
        elseif misses >= 25 then
            isResizing = true
            isTeleporting = true
            setPropertyFromClass('openfl.Lib', 'application.window.width', 300)
            setPropertyFromClass('openfl.Lib', 'application.window.height', 300)
        elseif misses >= 20 then
            isTeleporting = true
            cameraFlash('game', 'FF0000', 0.2)
        elseif misses >= 15 then
            shakeIntensity = 6
            shakeTimer = 0.05
            isShaking = true
        elseif misses >= 11 then
            shakeIntensity = 5
            shakeTimer = shakeDuration
            isShaking = true
            flickerActive = true
            hudFlickerTimer = 0.2
        elseif misses >= 5 then
            shakeIntensity = 5
            shakeTimer = shakeDuration
            isShaking = true
            camTiltActive = true
            cameraTiltTimer = 0.2
            setProperty('camGame.angle', 3)
            noiseActive = false 
        elseif misses >= 1 then
            shakeIntensity = 4
            shakeTimer = shakeDuration
            isShaking = true
            applyShader()
            noiseIntensity = 1
            noiseTimer = 0.5
            noiseActive = true
            doTweenZoom('screenZoom', 'camGame', 1.1, 0.1, 'quadInOut')
        else
            -- No misses; clear effects
            removeShader()
        end
    end

    lastMisses = misses

    -- === FRAME-EFFECT UPDATES === --

    -- Apply Color Shift Effect
    if colorShiftActive then
        colorShiftTimer = colorShiftTimer - elapsed
        if colorShiftTimer > 0 then
            setProperty('camGame.color', {colorShiftIntensity, colorShiftIntensity * 0.5, colorShiftIntensity * 0.3})
        else
            colorShiftActive = false
        end
    end

    -- Apply Noise Effect
    
    if noiseActive then
        noiseTimer = noiseTimer - elapsed
        if noiseTimer > 0 then
            setProperty("shaderOverlay.alpha", 1)
            setShaderFloat("shaderOverlay", "alpha", 0.4) -- Or lower for more transparency
            for i in 100 do
                applyShader()
            end
        else
            setProperty("shaderOverlay.alpha", 0)
            noiseActive = false
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
            isShaking = false
        end
    end

    -- Tornado effect adjusted for aspect ratio
    if isTornado then
        local screenWidth = getPropertyFromClass('openfl.Lib', 'application.window.width')  -- Get screen width
        local screenHeight = getPropertyFromClass('openfl.Lib', 'application.window.height') -- Get screen height

        -- Calculate the center of the screen dynamically
        local centerX = screenWidth / 2
        local centerY = screenHeight / 2

        tornadoAngle = tornadoAngle + tornadoSpeed * elapsed

        -- Use the center of the screen for the tornado's rotation
        local offsetX = math.cos(tornadoAngle) * tornadoRadius
        local offsetY = math.sin(tornadoAngle) * tornadoRadius

        -- Move the window based on the tornado angle and center
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
