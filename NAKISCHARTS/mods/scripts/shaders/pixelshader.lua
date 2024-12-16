local shaderName = "pixel"
function onCreatePost()
--    shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

    makeLuaSprite("shaderImage")
    initLuaShader("pixel")
    makeGraphic("shaderImage", 0, 0)
    setProperty("shaderImage.x", -3000)
    setProperty("shaderImage.y", -3000)
    addLuaSprite("shaderImage", true)
   setSpriteShader("shaderImage", "pixel")


   addHaxeLibrary('ShaderFilter', 'openfl.filters');
    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("pixel").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("pixel").shader)]);
        return;
    ]])
end

function onUpdatePost()
    setShaderFloat("pixel", "iTime", os.clock())
 end