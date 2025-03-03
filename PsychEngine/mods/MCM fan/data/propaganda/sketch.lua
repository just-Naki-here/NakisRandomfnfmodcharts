function onCreatePost()
if version < '1' then
    initLuaShader("pixel");
    makeLuaSprite("pixel") makeGraphic("pixel", screenWidth, screenHeight);
    setSpriteShader("pixel", "pixel");

    addHaxeLibrary("ShaderFilter", "openfl.filters");

    runHaxeCode([[trace(ShaderFilter);
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("pixel").shader)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("pixel").shader)]);
        game.camOther.setFilters([new ShaderFilter(game.getLuaObject("pixel").shader)]);
    ]]); -- Remove the → // ←  above if you want the shader on the pause screen
    setShaderFloat("pixel", "uBlocksize", 2)
    end
end