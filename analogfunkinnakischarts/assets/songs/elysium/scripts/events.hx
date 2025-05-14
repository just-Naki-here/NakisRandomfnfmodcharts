import openfl.geom.ColorTransform;
import flixel.effects.FlxFlicker;

var zoomer:Float = 0;

var susanLines:Array<FunkinText> = [];
var bonLines:Array<FunkinText> = [];

function postCreate() {
    for (i in 0...4) cpuStrums.members[i].visible = false;

    customText.textColor = customSubText.textColor = FlxColor.BLACK;

    doIconBop = false;

    dad.setColorTransform(1, 1, 1, 1, 255, 255, 255);
    
    FlxG.cameras.add(camLines = new FlxCamera(), false).bgColor = camHUD.bgColor;
    camGame.fade(FlxColor.BLACK, 0);
    camHUD.alpha = 0;
    camGame.zoom = defaultCamZoom = 0.75;

    for (num => a in ["Where am I?", "Anybody?"]) {
        susanLines.push(newLineTxt(true, num, a));
        add(susanLines[num]);
    }
    for (num => a in ["Welcome", "to Wo nderland", "Susan.", "A new wo rld", "Just for", "you."]) {
        bonLines.push(newLineTxt(false, num % 3, a));
        add(bonLines[num]);
    }
}

function update()
    defaultCamZoom = zoomer + (curCameraTarget == 0 ? 0.9 : 0.75);

function stepHit(_:Int) {
    switch (_) {
        case 0: camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 28, true);
        case 64: FlxTween.num(255, 0, (Conductor.stepCrochet / 1000) * 32, {}, function(a) dad.setColorTransform(1, 1, 1, 1, a, a, a));
        case 128:
            FlxTween.tween(camHUD, {alpha: 1}, (Conductor.stepCrochet / 1000) * 16);
            if (Options.flashingMenu) camLines.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 16);
            for (a in 0...3)
                remove(susanLines[a]);
            for (a in 0...3)
                remove(bonLines[a]);
        case 508: camZoomEvent(0.9, 4, true, false);
        case 512:
            zoomer -= 0.15;
            coolFlash(FlxColor.BLACK, 16, 1);
            FlxTween.num(0.6, 0.8, 2, {}, _ -> camHUD.alpha = _);
            if (Options.flashingMenu) FlxTween.num(0.006, 0, 2, {}, _ -> camHUD.shake(_, 2));
        case 570:
            insert(members.indexOf(boyfriend) + 1, darkness = new FunkinSprite(-400, -400).makeSolid(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), 0xff000000));
                darkness.camera = camHUD;
                darkness.alpha = Options.flashingMenu ? 0.34 : 0;
                darkness.screenCenter();
        case 571 | 572: if (Options.camZoomOnBeat) darkness.alpha += 0.34;
        case 576:
            zoomer += 0.15;
            for(a in 3...6)
                remove(bonLines[a]);
            darkness.destroy();
            camHUD.alpha = 1;
            coolFlash(FlxColor.WHITE, 16, 1);
        case 700:
            if (Options.flashingMenu) camGame.fade(FlxColor.BLACK, 0);
            camZoomEvent(0.85, 4, false, true);
        case 704:
            if (Options.flashingMenu) camGame.fade(FlxColor.WHITE, 1, true);
            camZoomEvent(0.8, 16, false, true);
        case 832:
            FlxTween.tween(camHUD, {angle: 1, y: -3}, 2, {ease:FlxEase.quadInOut});
            FlxTween.tween(camHUD, {angle: -1, y: 3}, 2, {ease:FlxEase.quadInOut, type: FlxTween.PINGPONG, startDelay: 2.1});
        case 1596:
            if (FlxG.save.data.customOptions.modcharts) {
                for (i in 0...4) {
                    FlxTween.cancelTweensOf(playerStrums.members[i]);
                    FlxTween.tween(playerStrums.members[i], {x: 550 + (112 * (i))}, 0.6, {ease:FlxEase.quadInOut});
                }
            }
        case 1848: defaultCamZoom = defaultCamZoom + 0.2;
        case 1852: defaultCamZoom = defaultCamZoom + 0.2;
        case 1856:
            customText.textColor = customSubText.textColor = FlxColor.WHITE;
            camGame.fade(FlxColor.BLACK, 0); 
            defaultCamZoom = defaultCamZoom - 0.4;
            dad.setColorTransform(1, 1, 1, 1, 0, 0, 0);
        case 1864: for (i in 0...4) FlxTween.tween(playerStrums.members[i], {alpha: 0}, 0.6);
        case 2000:
            for (a in stage.stageSprites)
                a.color = FlxColor.BLACK;
            camGame.bgColor = FlxColor.BLACK;
            dad.colorTransform.color = boyfriend.colorTransform.color = FlxColor.WHITE;
        case 2112: iconP1.setIcon("susan-alt");
        case 2672:
            for (a in stage.stageSprites)
                a.color = FlxColor.WHITE;
            camGame.bgColor = FlxColor.WHITE;
            dad.setColorTransform();
            boyfriend.setColorTransform();
        case 2104 | 2496 | 2680: camGame.fade(FlxColor.BLACK, 1, true);
        case 2688:
            iconP1.setIcon("susan");
            customText.textColor = customSubText.textColor = FlxColor.BLACK;
        case 2352: defaultCamZoom = defaultCamZoom + 0.2;
        case 2368: defaultCamZoom = defaultCamZoom - 0.2;
        case 2488 | 2624: camGame.fade(FlxColor.BLACK, 0);
    
        // LINES
        case 30: FlxTween.tween(susanLines[0], {alpha: 1}, 1);
		case 42: FlxTween.tween(susanLines[1], {alpha: 1}, 1);
		case 62: FlxTween.tween(bonLines[0], {alpha: 1}, 1);
		case 82: FlxTween.tween(bonLines[1], {alpha: 1}, 1);
		case 110: FlxTween.tween(bonLines[2], {alpha: 1}, 1);
		case 523: FlxTween.tween(bonLines[3], {alpha: 1}, 1);
		case 549: FlxTween.tween(bonLines[4], {alpha: 1}, 1);
		case 564: FlxTween.tween(bonLines[5], {alpha: 1}, 1);
    }
}

function beatHit(_:Int) {
    if (Options.camZoomOnBeat) {
        if (_ >= 64 && _ < 128) {
		    if (_ % 2 == 0) {
		    	camHUD.zoom += 0.025;
		    	camGame.zoom += 0.045;
		    }
	    }

	    if (_ >= 144 && _ < 208) {
	    	if (_ % 4 == 0) {
	    		camGame.zoom += 0.065;
	    		camHUD.zoom += 0.045;
	    	}
	    	if (_ % 2 == 0) {
	    		camHUD.zoom += 0.025;
	    		camGame.zoom += 0.045;
	    	}
	    }

	    if (_ >= 208 && _ < 272 || _ >= 400 && _ < 462 || _ >= 672 && _ < 734) {
	    	if (_ % 4 == 0) {
	    		camGame.zoom += 0.1;
	    		camHUD.zoom += 0.065;
	    	}
	    	if (_ % 2 == 0) {
	    		camHUD.zoom += 0.035;
	    		camGame.zoom += 0.055;
	    	}
	    }
    }

    switch (_) {
		case 270:
			FlxTween.cancelTweensOf(camHUD);
			FlxTween.tween(camHUD, {zoom: camHUD.zoom - 0.2, angle: 0, y: 0}, 0.54, {ease: FlxEase.quadOut});
			defaultHudZoom = defaultHudZoom - 0.2;
		case 272: 
			if (Options.flashingMenu) camHUD.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 16, true);
			camHUD.zoom = camHUD.zoom + 0.2;
			defaultHudZoom = defaultHudZoom + 0.2;
            if (FlxG.save.data.customOptions.modcharts) for (i in 0...4) FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x - 550}, 2, {ease: FlxEase.quadInOut, type: FlxTween.PINGPONG});
        case 496: FlxTween.tween(playerStrums.members[0], {alpha: 1}, 1);
		case 504: FlxTween.tween(playerStrums.members[1], {alpha: 1}, 1);
		case 512: FlxTween.tween(playerStrums.members[3], {alpha: 1}, 1);
	    case 520: FlxTween.tween(playerStrums.members[2], {alpha: 1}, 1);
		case 742:
        if (Options.flashingMenu) {
			add(darkness = new FlxSprite(0, 0).makeSolid(Std.int(FlxG.width * 2), Std.int(FlxG.height * 2), 0xff000000));
				darkness.visible = false;
				darkness.camera = camHUD;
				darkness.screenCenter();

        
            add(red = new FlxSprite(0, 0).makeSolid(Std.int(FlxG.width * 2), Std.int(FlxG.height * 2), FlxColor.RED));
				red.screenCenter();
				red.camera = camHUD;
				red.alpha = 0;
				red.blend = 9;
            }

			camZoomEvent(1.1, 8, true, false); 
			if (Options.flashingMenu) FlxTween.tween(red, {alpha: 1}, 0.7);
		case 758: 
			camZoomEvent(1.1, 8, true, false); 
			if (Options.flashingMenu) FlxTween.tween(red, {alpha: 0.8}, 0.7);
		case 743 | 759: if (Options.flashingMenu) FlxFlicker.flicker(darkness, 0.35, 0.03, false);
		case 744 | 760: 
			if (Options.flashingMenu) {
                FlxTween.cancelTweensOf(red);
			    red.alpha = 0;
            }
		case 772: 
			if (Options.flashingMenu) camHUD.fade(FlxColor.BLACK, 0);
	}
}
function newLineTxt(susan:Bool, _:Int, idk:String):FunkinText {
    var txt:FunkinText = new FunkinText(0, 34 * _, 1024, idk, 32, false).setFormat(Paths.font("gelasio.ttf"), 32, FlxColor.BLACK);
    txt.alignment = susan ? "left" : "right";
    txt.camera = camLines;
    txt.alpha = 0;
    txt.antialiasing = Options.antialiasing;
    return txt;
}