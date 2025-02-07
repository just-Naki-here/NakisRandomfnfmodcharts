local shaderName = "blur"
blurSize = 8
function onCreate()
    shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

    makeLuaSprite("blur")
    makeGraphic("shaderImage", screenWidth, screenHeight)

   setSpriteShader("shaderImage", "blur")


    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("blur").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("blur").shader)]);
        return;
    ]])
    setShaderFloat("blur", "blurSize", 8)
    doTweenAlpha('hudalpha', 'camHUD', 0, 0.0001, 'linear');
    doTweenAlpha('camGameOff' ,'camGame', 0, 0.00000001, 'linear')
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
local TweenValues  = {blurSize = 1}
function onStepHit() -- mi cara cuando dead hope 30 fps :(
	if curStep > 0 and curStep < 128 then
	setShaderFloat("blur", "blurSize", blurSize)
	blurSize = blurSize - 8/128
	end
	if curStep == 1 then
	doTweenAlpha('camGameOff1' ,'camGame', 1, 10, 'linear')
	end
	if curStep == 128 then
	blurSize = 0
	end
	end
	

