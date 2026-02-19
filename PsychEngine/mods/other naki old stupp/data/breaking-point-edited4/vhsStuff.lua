local updateShader = false

function onCreate()
	runHaxeCode([[
		var shaderName = "shader";
		game.initLuaShader(shaderName);
		VHS = game.createRuntimeShader(shaderName);
	]])
end

function onStepHit()
  if curStep == 2080 then
      cameraFlash('Game', '0xFFFF00ED', 3, true)
      updateShader = true
      runHaxeCode("FlxG.game.setFilters([new ShaderFilter(VHS)]);")
  end
  if curStep == 2464 then
      runHaxeCode([[FlxG.game.setFilters([]);]])
      cameraFlash('HUD', '0xFFFF00ED', 3, true)
  end
end

function onUpdate()
    if updateShader then
        --runHaxeCode([[VHS.setFloat("uFrame", ]] .. os.clock() .. [[);]])
		--runHaxeCode([[VHS.setFloat("uInterlace", FlxG.random.bool(30) ? 1 : 0);]])
    end
end

function onDestroy()
    runHaxeCode([[FlxG.game.setFilters([]);]])
end