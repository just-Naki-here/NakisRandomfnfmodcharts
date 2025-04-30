--[[============================================================================
   pcinfo.lua - Auto-updating PC Info Display on Miss
============================================================================]]--

math.randomseed(os.time())

local lastMisses = 0
local computerName = os.getenv("COMPUTERNAME") or os.getenv("HOSTNAME") or "Unknown"
local userName     = os.getenv("USERNAME")     or os.getenv("USER")     or "User"
local fakeIPv6     = ""
local glitchTimer  = 0

-- Generate fake IPv6 address
local function generateFakeIPv6()
    local parts = {}
    for i = 1, 8 do
        parts[i] = string.format("%04x", math.random(0, 0xFFFF))
    end
    return table.concat(parts, ":")
end

-- Show PC Info Text (3-layer glitch)
local function showPCInfo()
    fakeIPv6 = generateFakeIPv6()
    local info = "Computer: " .. computerName ..
                 " | User: " .. userName ..
                 " | IPv6: " .. fakeIPv6

    for _, layer in ipairs({
        {tag = "pcNameText", color = "FFFFFF"},
        {tag = "pcNameRed",  color = "FF0000"},
        {tag = "pcNameBlue", color = "00BFFF"}
    }) do
        if not luaTextExists(layer.tag) then
            makeLuaText(layer.tag, info, 1200, 50, 50)
            setTextSize(layer.tag, 24)
            setTextColor(layer.tag, layer.color)
            setObjectCamera(layer.tag, "hud")
            addLuaText(layer.tag)
        end
        setTextString(layer.tag, info)
        setProperty(layer.tag .. ".alpha", 1)
    end

    glitchTimer = 0.4
end

-- onUpdate Hook
function onUpdate(elapsed)
    local misses = getProperty("songMisses")
    if misses > lastMisses then
        showPCInfo()
    end
    lastMisses = misses

    -- Glitchy visual effect
    if glitchTimer > 0 then
        glitchTimer = glitchTimer - elapsed
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
        for _, tag in ipairs({"pcNameText", "pcNameRed", "pcNameBlue"}) do
            setProperty(tag .. ".angle", 0)
            setProperty(tag .. ".scale.x", 1)
            setProperty(tag .. ".scale.y", 1)
            setProperty(tag .. ".x", getProperty("pcNameText.x"))
            setProperty(tag .. ".y", getProperty("pcNameText.y"))
        end
    end

    -- Fade out
    for _, tag in ipairs({"pcNameText", "pcNameRed", "pcNameBlue"}) do
        local a = getProperty(tag .. ".alpha")
        if a > 0 then
            setProperty(tag .. ".alpha", a - elapsed * 0.5)
        end
    end
end
