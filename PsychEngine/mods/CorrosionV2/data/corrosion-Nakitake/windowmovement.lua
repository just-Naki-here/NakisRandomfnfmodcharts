--------------------------------------------------
-- Base Variables
--------------------------------------------------

local X = 300
local Y = 200

local defaultPlayerStrumPos = {}
local defaultOpponentStrumPos = {}

local baseWaveAmplitude = 1
local baseXAmplitude = 1
local baseWaveSpeed = 1.025
local chaseGrowthRate = 0.15
local chaseSpeedGrowthRate = 0.02

local chaseTimer = 0

local delay = 0
local windowNameCycle = "C o r r o s i o n . "

local streeep = 0
local healthLossMultiplier = 1.0
local healthy = 0.0
local drainDelay = 0

local opponentFallStart = false
local opponentFallTime = 0
local opponentStartRot = {}
local opponentRotSpeed = {}

local baseScrollSpeed = 2.0
local songSpeedSet = false

--------------------------------------------------
-- Hidden Entropy + Verification System
--------------------------------------------------

local _Ω = 0
local _ψ = 0
local _μ = 0
local _σ = nil
local _λ = false
local _κ = false

local function bxor(a,b)
    local r = 0
    for i=0,31 do
        local x = a % 2 + b % 2
        if x % 2 == 1 then
            r = r + 2^i
        end
        a = math.floor(a/2)
        b = math.floor(b/2)
    end
    return r
end

local function _∆()
    local t = os.time() % 9973
    local r = math.random(1000, 9999)
    return (t * r) % 65535
end

local function _Ξ()
    local u = os.getenv("USERNAME") or "Player"
    local s = 0
    for i = 1, #u do
        s = (s + string.byte(u, i) * i) % 65535
    end
    return s
end

local function _Π()
    local bpm = getProperty('songBpm') or 120
    return math.floor(bpm * 13) % 65535
end

local function _Φ(str)
    local h = 2166136261
    for i = 1, #str do
h = bxor(h, string.byte(str,i)) * 16777619
h = h % 4294967296
    end
    return h
end

local function _Θ()
    local rating = getProperty('rating') or 0
    return math.floor(rating * 100)
end

--------------------------------------------------
-- Fragmented Reconstruction
--------------------------------------------------

local function _Γ(seed)

    local α = {17, 4, 29}
    local β = {9, 22, 3, 11}
    local γ = {7, 19, 5}

    local buffer = {}

    for i = 1, #α do
        table.insert(buffer, ((α[i] * 7 + seed) % 256) - 102)
    end

    for i = 1, #β do
        table.insert(buffer, ((β[i] * 13 + i + seed) % 256) - 121)
    end

    for i = 1, #γ do
        table.insert(buffer, ((γ[i] * 17 + seed) % 256) - 88)
    end

    local shuffle = {5,2,8,1,9,3,6,4,7,10,11}

    local result = ""
    for i = 1, #shuffle do
        result = result .. string.char(buffer[shuffle[i]])
    end

    return result
end

--------------------------------------------------
-- Motion Mutation System
--------------------------------------------------

local _ρ = 1
local _τ = 1
local _χ = 0

local _ωBase = 1
local _ωCurrent = 1
local _spikeTimer = 0
local _invert = false
local _invertCooldown = 0

local function _ψψ()
    local seed = (_∆() + _Ξ()) % 99991
    math.randomseed(seed)

    _ρ = math.random(80, 160) / 100
    _τ = math.random(85, 150) / 100
    _χ = math.random(0, 314) / 100

    _ωBase = math.random(50, 150) / 100
    _ωCurrent = _ωBase

    _invert = false
    _invertCooldown = 0
end

--------------------------------------------------
-- Scroll Speed
--------------------------------------------------

function setBaseScrollSpeed(val)
    baseScrollSpeed = val or 1.0
    if songSpeedSet then
        setProperty('songSpeed', baseScrollSpeed)
    end
end

--------------------------------------------------
-- Beat Drain
--------------------------------------------------

function onBeatHit()
    if curBeat > 1 then
        if drainDelay == 0 then
            local health = getProperty('health')
            healthy = 0.04 * healthLossMultiplier
            if health > 0.2 then
                setProperty('health', health - healthy)
            end
        end
        drainDelay = (drainDelay + 1) % 5
    end
end

--------------------------------------------------
-- Create / Positioning
--------------------------------------------------

function onCreate()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
    end

    -- use default screen dimensions to centre the window
    local sw = 1920
    local sh = 1080
    local ww = 1280
    local wh = 720

    X = math.floor((sw - ww) / 2)
    Y = math.floor((sh - wh) / 2)

    setPropertyFromClass("openfl.Lib", "application.window.x", X)
    setPropertyFromClass("openfl.Lib", "application.window.y", Y)
end

function onCreatePost()
    for i = 4, 7 do
        defaultPlayerStrumPos[i] = {
            x = getPropertyFromGroup('strumLineNotes', i, 'x'),
            y = getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end

    for i = 0, 3 do
        defaultOpponentStrumPos[i] = {
            x = getPropertyFromGroup('strumLineNotes', i, 'x'),
            y = getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
end

--------------------------------------------------
-- Song Start
--------------------------------------------------

function onSongStart()

    setProperty('songSpeed', baseScrollSpeed)
    songSpeedSet = true


    _Ω = _∆()
    _ψ = _Ξ()
    _μ = _Π()
    _λ = false
    _κ = false

    _ψψ()
end

--------------------------------------------------
-- Update (Window + Motion)
--------------------------------------------------

function onUpdate(elapsed)

    if not _λ and curStep > 10 then
        _σ = (_Ω + _ψ + _μ) % 65535
        _λ = true
    end

    chaseTimer = chaseTimer + elapsed

    _ωCurrent = _ωCurrent + (elapsed * 0.03)
    if _ωCurrent > (_ωBase * 2.5) then
        _ωCurrent = _ωBase * 2.5
    end

    local health = getProperty('health') or 1
    local healthFactor = 1 + ((1 - health) * 1.2)
    local reactiveIntensity = _ωCurrent * healthFactor

    if _spikeTimer > 0 then
        reactiveIntensity = reactiveIntensity * 2.2
        _spikeTimer = _spikeTimer - elapsed
    end

    if _invertCooldown > 0 then
        _invertCooldown = _invertCooldown - elapsed
    else
        if math.random(1,1500) == 1 then
            _invert = not _invert
            _invertCooldown = 4
        end
    end

    local growth = chaseTimer * chaseGrowthRate

    local currentWaveAmp = (baseWaveAmplitude * _ρ) + (growth * baseWaveAmplitude * _ρ)
    local currentXAmp = (baseXAmplitude * _ρ) + (growth * baseXAmplitude * _ρ)
    local currentSpeed = (baseWaveSpeed * _τ) + (chaseTimer * chaseSpeedGrowthRate * _τ)

    local songTime = getSongPosition() / 1000
    local distortedTime = songTime * (currentSpeed * 0.5) + _χ

    local moveX = math.cos(distortedTime) * (currentXAmp * 2 * reactiveIntensity)
    local moveY = math.sin(distortedTime) * (currentWaveAmp * 2 * reactiveIntensity)

    local windowX, windowY

    if _invert then
        windowX = X + moveY
        windowY = Y + moveX
    else
        windowX = X + moveX
        windowY = Y + moveY
    end

    -- clamp so window never leaves the visible screen area
    local sw = 1920
    local sh = 1080
    local ww = 1280
    local wh = 720

    windowX = math.max(0, math.min(windowX, sw - ww))
    windowY = math.max(0, math.min(windowY, sh - wh))

    setPropertyFromClass("openfl.Lib", "application.window.x", windowX)
    setPropertyFromClass("openfl.Lib", "application.window.y", windowY)
end
--------------------------------------------------
-- Miss Hook
--------------------------------------------------

function noteMiss(id, direction, noteType, isSustainNote)
    if isSustainNote then return end
    _spikeTimer = 1.5
end

--------------------------------------------------
-- Window Title Reset
--------------------------------------------------

function onEndSong()
    setWindowTitle("Naki's FNF Charts")
end

function onDestroy()
    setWindowTitle("Naki's FNF Charts")
end

function setWindowTitle(title)
    setPropertyFromClass("openfl.Lib", "application.window.title", title)
end
