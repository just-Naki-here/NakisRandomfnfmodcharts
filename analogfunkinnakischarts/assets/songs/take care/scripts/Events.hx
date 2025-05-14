import openfl.geom.ColorTransform;

var bnw:CustomShader = new CustomShader("Colors/black n white");

function postCreate() {
    insert(members.indexOf(boyfriend), backSolid = new FunkinSprite().makeSolid(1, 1)).screenCenter();
        backSolid.color = 0xffffffff;
        backSolid.scrollFactor.x = backSolid.scrollFactor.y = backSolid.zoomFactor = 0;
		backSolid.scale.x = backSolid.scale.y = 1280;

    dad.setColorTransform(1, 1, 1, 1, -255, -255, -255);
    camGame.fade(FlxColor.BLACK, 0);
    camZoomEvent(1, 0, false, true);

	if (Options.gameplayShaders) camHUD.addShader(bnw);
}

function stepHit(_:Int) { 
    switch (_) {
        case 8:
			camZoomEvent(0.8, 220, false, true);
            camGame.fade(FlxColor.BLACK, 10, true);
		case 248: camGame.fade(FlxColor.BLACK, 0);
		case 256:
			backSolid.visible = false;
			dad.setColorTransform(1, 1, 1, 1, 0, 0, 0);
			camGame.fade(FlxColor.BLACK, 1.6, true);
		case 352:
            camZoomEvent(1.1, 12, true, true);
			FlxTween.tween(camGame, {angle: 1.5}, (Conductor.stepCrochet / 1000) * 12, {ease: FlxEase.cubeOut});
		case 384:
			camZoomEvent(0.8, 16, true, true);
            FlxTween.cancelTweensOf(camGame.angle);
			FlxTween.tween(camGame, {angle: 0}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.cubeOut});
		case 496:
			camZoomEvent(0.95, 16, false, true);
			daBadAppleEvent(true, FlxColor.BLACK, 255);
		case 512:
			camZoomEvent(0.8, 16, true, true);
			daBadAppleEvent(false, FlxColor.BLACK, 0);
		case 752: camZoomEvent(1, 8, false, true);
		case 768: camZoomEvent(0.8, 16, false, true);
		case 1332:
			camGame.fade(FlxColor.BLACK, 0.7, false);
			daBadAppleEvent(true, FlxColor.BLACK, 255);
			camZoomEvent(1.1, 8, false, false);
			FlxTween.num(0.006, 0, (Conductor.stepCrochet / 1000) * 12, {}, function(a) camGame.shake(a, 2));
		case 1344:
			camGame.fade(FlxColor.BLACK, 0.6, true);
			daBadAppleEvent(false, FlxColor.BLACK, 0);
		case 1520:
			daBadAppleEvent(true, FlxColor.BLACK, 255);
			camZoomEvent(0.9, 8, false, true);
		case 1536:
			camZoomEvent(0.8, 16, false, true);
			daBadAppleEvent(false, FlxColor.BLACK, 0);
		case 1792:
			FlxTween.tween(camGame, {angle: -3}, 4, {ease: FlxEase.quadInOut});
			camZoomEvent(1, 64, false, true);
		case 1848:
			camZoomEvent(0.75, 8, false, true);
			FlxTween.tween(camGame, {angle: 0}, 0.6, {ease: FlxEase.quadInOut});
		case 1856: daBadAppleEvent(true, FlxColor.WHITE, -255);
		case 2112:
			daLyricsEvent("When did you last\ngo *outside*?", 44, "in", 1.6, true, 0xFFFF1100);
			for (z in 0...2) for (a in strumLines.members[z]) FlxTween.tween(a, {y: 50}, Conductor.stepCrochet / 1000);
		case 2128:
			camZoomEvent(1.2, 0, false, true);
			camZoomEvent(0.8, 224, false, true);
			camGame.angle = 30;
			FlxTween.tween(camGame, {angle: 0}, 24, {ease: FlxEase.quadInOut});
			daBadAppleEvent(true, FlxColor.BLACK, 255);
		case 2152:
			daLyricsEvent("When did you last\ngo *outside*?", 44, "out", 0.6, false, 0xFFFF1100);
		case 2168: daLyricsEvent("When did you last see\nyour *friends*?", 44, "in", 1.6, true, 0xFFFF1100);
		case 2230: daLyricsEvent("Your *family*?", 44, "static", 1.6, true, 0xFFFF1100);
		case 2256: daLyricsEvent("Your *family*?", 44, "out", 2, false, 0xFFFF1100);
		case 2416: daLyricsEvent("Do you know what *day* it is?", 44, "in", 1, true, 0xFFFF1100);
		case 2448: daLyricsEvent("Do you know what *day* it is?", 44, "out", 1, false, 0xFFFF1100);
		case 2624: daLyricsEvent("*You still hide.*", 44, "in", 0.4, true, 0xFFFF1100);
		case 2640:
			daLyricsEvent("*You still hide.*", 44, "out", 1.3, false, 0xFFFF1100);
			camZoomEvent(1, 16, false, true);
			camGame.fade(FlxColor.BLACK, 1, false);
		case 2656:
			camGame.fade(FlxColor.BLACK, 0, true);
			camZoomEvent(0.8, 4, true, true);
			daBadAppleEvent(false, FlxColor.BLACK, 0);
		case 2784: camZoomEvent(0.95, 8, false, false);
		case 2896: camZoomEvent(0.77, 4, false, true);
		case 2904:
			camZoomEvent(1, 7, true, false);
			camGame.fade(FlxColor.BLACK, 0.6, false);
		case 2912:
			daBadAppleEvent(true, FlxColor.BLACK, 255);
			camGame.zoom += 0.045;
			camHUD.zoom += 0.025;
			camGame.fade(FlxColor.BLACK, 0, true);
		case 3168:
			for (z in 0...2) for (a in strumLines.members[z]) FlxTween.tween(a, {y: 50}, Conductor.stepCrochet / 1000);
			daLyricsEvent("You are in the basement\nin *flames*.", 44, "in", 1, true, 0xFFFF1100);
			daBadAppleEvent(true, FlxColor.WHITE, -255);
			camGame.zoom += 0.045;
			camHUD.zoom += 0.025;
		case 3198: daLyricsEvent("You are in the basement\nin *flames*.", 44, "out", 4, true, 0xFFFF1100);
		case 3456:
			camZoomEvent(0.55, 32, true, true);
			FlxTween.tween(dad, {alpha: 0}, 4, {ease: FlxEase.quadOut});
			FlxTween.tween(boyfriend, {alpha: 0}, 4, {ease: FlxEase.quadOut});
		case 3516: camHUD.fade(FlxColor.BLACK, 0.33, false);
		case 1864 | 1872 | 1880 | 1886 | 1892 | 1900 | 1908 | 1916 | 1920 | 1928 | 1936 | 1944 | 1950 | 1956 | 1964 | 1972 | 1980 | 
		1984 | 1992 | 2000 | 2008 | 2014 | 2020 | 2028 | 2036 | 2044 | 2048 | 2056 | 2064 | 2072 | 2078 | 2084 | 2092 | 2100 | 2108:
			daBadAppleEvent(true, FlxColor.WHITE, -255);
			for (z in 0...2) for (a in strumLines.members[z]) a.y = FlxG.random.int(25, 75, [a.y]);
			camGame.zoom += 0.035;
		case 1860 | 1868 | 1876 | 1884 | 1888 | 1896 | 1904 | 1912 | 1918 | 1924 | 1932 | 1940 | 1948 | 1952 | 1960 | 1968 | 1976 | 1982 | 
		1988 | 1996 | 2004 | 2012 | 2016 | 2024 | 2032 | 2040 | 2046 | 2052 | 2060 | 2068 | 2076 | 2080 | 2088 | 2096 | 2104:
			daBadAppleEvent(true, FlxColor.BLACK, 255);
			for (z in 0...2) for (a in strumLines.members[z]) a.y = FlxG.random.int(25, 75, [a.y]);
			camGame.zoom += 0.035;
		case 2920 | 2928 | 2936 | 2942 | 2948 | 2956 | 2964 | 2972 | 2976 | 2984 | 2992 | 3000 | 3006 | 3012 | 3020 | 3028 | 3036 | 3040 | 3048 | 3056 | 3064 | 3070 | 3076 | 3084 | 3092 | 3100 | 3104 | 3112 | 3120 | 3128 | 3134 | 3140 | 3148 | 3156 | 3164 | 3200:
			daBadAppleEvent(true, FlxColor.BLACK, 255);
			for (z in 0...2) for (a in strumLines.members[z]) a.y = FlxG.random.int(25, 75, [a.y]);
			camGame.zoom += 0.045;
			camHUD.zoom += 0.025;
		case 2916 | 2924 | 2932 | 2940 | 2944 | 2952 | 2960 | 2968 | 2974 | 2980 | 2988 | 2996 | 3004 | 3008 | 3016 | 3024 | 3032 | 3038 | 3044 | 3052 | 3060 | 3068 | 3072 | 3080 | 3088 | 3096 | 3102 | 3108 | 3116 | 3124 | 3132 | 3136 | 3144 | 3152 | 3160:
			daBadAppleEvent(true, FlxColor.WHITE, -255);
			for (z in 0...2) for (a in strumLines.members[z]) a.y = FlxG.random.int(25, 75, [a.y]);
			camGame.zoom += 0.045;
			camHUD.zoom += 0.025;
    }
}

function daBadAppleEvent(backVisible:Bool = true, backColor:FlxColor = FlxColor.WHITE, characterColor:Int = -255)
	if (FlxG.save.data.customOptions.badApple) {
		backSolid.visible = backVisible;
		backSolid.color = backColor;
		
		dad.setColorTransform(1, 1, 1, 1, characterColor, characterColor, characterColor);
		boyfriend.setColorTransform(1, 1, 1, 1, characterColor, characterColor, characterColor);
	}

function onEvent(e)
	if (e.name == "Camera Flash" && !Options.flashingMenus)
		e.cancel();