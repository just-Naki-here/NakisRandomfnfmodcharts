
function onCreatePost()
    makeShader('saturation', {'game', 'hud'})
    makeControl('saturation', 'size', 0) --saturation,size

    makeShader('bloom', {'game', 'hud'})
    makeControl('bloom', 'u_brightness', 0) --bloom,u_brightness

    setShaderFloatArray('bloom', 'u_samples', {6, 6})
    setShaderFloatArray('bloom', 'u_size', {20, 20}) 
    setShaderFloatArray('bloom', 'u_tint', {1, 1, 1})

    --setShaderFloat('bloom', 'u_brightness', 0.25)
    setShaderFloat('bloom', 'u_range', 3) 
    setShaderFloat('bloom', 'u_threshold', 1)

    makeShader('perspective', {'game'})
    setShaderFloat('perspective', 'iTime', .3)

    makeShader('multisplit', {'game'})
    makeControl('multisplit', 'multi', 1) --bloom,u_brightness

    reloadShaders()
end

function onUpdate()
    updateControllers()

    setShaderFloat('perspective', 'uv.x', cameraX)
    setShaderFloat('perspective', 'uv.y', cameraY)
    setShaderFloat('perspective', 'iResolution', getProperty("camGame.angle"))

    --setShaderFloat('multisplit', 'uv.x', getProperty("game.scaleX"))
    --setShaderFloat('multisplit', 'uv.y', getProperty("game.scaleY"))
end

function onEvent(n,v1,v2)
    if n == "ess_Tween Controller" then
        val1 = splitter(v1, ',')
        val2 = splitter(v2, ',')

        tweenControl(val1[1]..'_'..val1[2]..'_control_tween', val1[1], val1[2], val2[1] or 0, 1 / ((bpm) / val2[2]) or 1, val2[3])
    end
    if n == "ess_Bump Controller" then
        val1 = splitter(v1, ',')
        val2 = splitter(v2, ',')

        setControl(val1[1], val1[2], val2[1])
        tweenControl(val1[1]..'_'..val1[2]..'_control_bump', val1[1], val1[2], val2[2], 1 / ((bpm) / 120), 'QuintOut')
    end
    if n == "ess_Set Controller Value" then
        val1 = splitter(v1, ',')
        setControl(val1[1], val1[2], v2)
    end
end

function splitter(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end




----------------------------------
----------------------------------
--        SHADERS CODE          --
--      DONT TOUCH !!!!!!       --
----------------------------------
----------------------------------

function makeShader(shader, cams)
    for i = 1, #cams do
        table.insert(shaderTable[cams[i]], shader)
    end

    initLuaShader(shader); 
    makeLuaSprite(shader) 
    makeGraphic(shader, screenWidth, screenHeight); 
    setSpriteShader(shader, shader)
end

function makeControl(shader, var, value)
    table.insert(controllerTable, {shader, var, value})

    if value ~= 'os.clock' then
        makeLuaSprite(shader..'_'..var..'_control', '', value, -10000)
        addLuaSprite(shader..'_'..var..'_control')
    end
end

--I hate how i made this so i just renamed functions so it doesnt look so ugly lol
function getControl(shader, control)
    return getProperty(shader..'_'..control..'_control.x')
end

function setControl(shader, control, value)
    return setProperty(shader..'_'..control..'_control.x', value)
end

function tweenControl(tag, shader, control, value, time, ease)
    return doTweenX(tag, shader..'_'..control..'_control', value, time, ease)
end

--------------------------------------------------------
--------------------------------------------------------
--------------------------------------------------------

shaderTable = {
    ['game'] = {},
    ['hud'] = {},
    ['other'] = {}
}
controllerTable = {}

function reloadShaders()
    runHaxeCode([[
        game.camGame.setFilters([
            ]]..shaderString(getShaders('game'))..[[
        ]);

        game.camHUD.setFilters([
            ]]..shaderString(getShaders('hud'))..[[
        ]); 

        game.camOther.setFilters([
            ]]..shaderString(getShaders('other'))..[[
        ]); 
    ]])
end

function updateControllers()
    for i = 1, #controllerTable do
        if controllerTable[i][3] ~= 'os.clock' then 
            setShaderFloat(controllerTable[i][1], controllerTable[i][2], getControl(controllerTable[i][1], controllerTable[i][2]))
        else
            setShaderFloat(controllerTable[i][1], controllerTable[i][2], os.clock())
        end
    end
end

function getShaders(cam)
    local shaders = {}
    for i = 1, #shaderTable[cam] do
        table.insert(shaders, shaderTable[cam][i])
    end

    return shaders
end

function shaderString(shaders)
    local string = ''
    for i = 1, #shaders do
        string = string .. 'new ShaderFilter(game.getLuaObject("' .. shaders[i] .. '").shader),'
    end
    return string
end