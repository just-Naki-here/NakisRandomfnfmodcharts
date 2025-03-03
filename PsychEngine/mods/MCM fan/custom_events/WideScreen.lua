--[[
	Widescreen Support Script (v0.6.1+)
	Raltyro's #5 HScript Usage in Psych Lua
	by Raltyro (9/10/2022)
	(LAST MODIFIED 9/10/2022)
	
	A Script that makes widescreen possible,
	no matter what the window size ratio is.
	
	Once this script runs, you can no longer revert until you restart the game.
	
	You can remove this credits this if your a fucker for me i won't give a shit
	fuck me if you want.
--]]

function onCreate()
	widescreenInit()
end

function widescreenInit()
	addHaxeLibrary("Math")
	
	addHaxeLibrary("Lib", "openfl")
	
	addHaxeLibrary("BaseScaleMode", "flixel.system.scaleModes")
	addHaxeLibrary("FlxAngle", "flixel.math")
	addHaxeLibrary("FlxG", "flixel")
	
    runHaxeCode([[
		if (Lib.application.meta["widescreen"] != null && Lib.application.meta["widescreen"]) return;
		Lib.application.meta.set("widescreen", true);
		
		var windowWidth:Float = 0;
		var windowHeight:Float = 0;
		
		var scaleModeX:Float = 1;
		var scaleModeY:Float = 1;
		
		FlxG.scaleMode = new BaseScaleMode();
		
		widescreenPostUpdateCam = function(cam) {
			var canvas = cam.canvas;
			var flashSprite = cam.flashSprite;
			var _flashOffset = cam._flashOffset;
			var _scrollRect = cam._scrollRect;
			
			_scrollRect.scrollRect.x = 0;
			_scrollRect.scrollRect.y = 0;
			_scrollRect.scrollRect.width = windowHeight;
			_scrollRect.scrollRect.height = windowHeight;
			_scrollRect.x = 0;
			_scrollRect.y = 0;
			
			flashSprite.x -= cam.width * 0.5 * FlxG.scaleMode.scale.x * cam.initialZoom;
			flashSprite.y -= cam.height * 0.5 * FlxG.scaleMode.scale.y * cam.initialZoom;
			
			var offsetX = flashSprite.x - (cam.x * FlxG.scaleMode.scale.x);
			var offsetY = flashSprite.y - (cam.y * FlxG.scaleMode.scale.y);
			
			flashSprite.x = cam.x * scaleModeX;
			flashSprite.y = cam.y * scaleModeY;
			
			if (canvas == null) return;
			var mat = canvas.__transform;
			
			var aW:Float = cam.width / 2;
			var aH:Float = cam.height / 2;
			
			mat.identity();
			
			mat.translate(-aW, -aH); // AnchorPoint In
			
			mat.scale(cam.scaleX, cam.scaleY); // Scaling
			
			mat.rotate(cam.angle * FlxAngle.TO_RAD); // Angle
			
			mat.translate(aW + offsetX, aH + offsetY); // AnchorPoint Out
			
			mat.scale(scaleModeX, scaleModeY); // ScaleMode
			mat.translate(windowWidth / 2 - (aW * scaleModeX), 0);
		}
		
		widescreenPostUpdate = function(?e) {
			if (FlxG.game._lostFocus && FlxG.autoPause) return;
			
			windowWidth = Lib.application.window.width;
			windowHeight = Lib.application.window.height;
			
			if (FlxG.game != null)
				FlxG.game.y = FlxG.game.x = 0;

			scaleModeY = scaleModeX = windowHeight / FlxG.height;

			for (cam in FlxG.cameras.list)
				widescreenPostUpdateCam(cam);
		}
		
		FlxG.stage.addEventListener("enterFrame", widescreenPostUpdate);
		widescreenPostUpdate();
    ]])
	
	--[==[
	local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            if (FlxG.stage.hasEventListener("enterFrame"))
				FlxG.stage.removeEventListener("enterFrame", widescreenPostUpdate);
        ]])
        if (temp) then temp()end
    end
	]==]
end