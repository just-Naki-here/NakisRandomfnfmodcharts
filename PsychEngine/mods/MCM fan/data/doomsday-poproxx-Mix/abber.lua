local shaderName = "abber"
defaultChrome = 0.002
function onCreatePost()
    shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

    makeLuaSprite('chrome', '', defaultChrome * 100000, 0)
    addLuaSprite('chrome', true)
    setProperty('chrome.alpha', 0)

    makeLuaSprite("abber")
    makeGraphic("shaderImage", screenWidth, screenHeight)
    setObjectCamera('shaderImage', 'other')
    setSpriteShader("shaderImage", "abber")


    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("abber").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("abber").shader)]);
        game.camOther.setFilters([new ShaderFilter(game.getLuaObject("abber").shader)]);
        return;
    ]])
end

function setChromeVal(value, time, setToDefault)
    if setToDefault == false then
        setProperty('chrome.x', value * 100000)
        doTweenX('chrome', 'chrome', defaultChrome * 100000, time)
    else
        defaultChrome = value
        setProperty('chrome.x', defaultChrome * 100000)
    end
    end

function onUpdate(elapsed)
    setShaderFloat("abber", "rOffset", getProperty('chrome.x') / 100000)
    setShaderFloat("abber", "bOffset", -1 * getProperty('chrome.x') / 100000)
    --setShaderFloat("abber", "rOffset", 0.002)
    setShaderFloat("abber", "gOffset", 0.0)
    --setShaderFloat("abber", "bOffset", -0.002)
 end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end