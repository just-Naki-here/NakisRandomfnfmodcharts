import flixel.addons.display.FlxBackdrop;
import openfl.display.BlendMode;

var evilBloom:CustomShader = new CustomShader("VHS/vhs2015");
var memory:Int = -1;
var memoryStepOffset:Int = 2;

var backdrops:Array<FlxBackdrop> = [];
var lastBackdrop:Int = 0;

var end1:FunkinSprite = new FunkinSprite(0, 0, Paths.image("stages/memorylane/end/1"));
var end2:FunkinSprite = new FunkinSprite(0, 0, Paths.image("stages/memorylane/end/2"));
var endTxt:FunkinText = new FunkinText(150, 5, 0, "", 24, false);

function postCreate() {
        // Added this since when you refresh the state the shaders pile up
    if (Options.gameplayShaders) {
        FlxG.game._filters = [];
        FlxG.game.addShader(monitorEffect);
        FlxG.game.addShader(vhsblur);

        evilBloom.iTime = 0.0;
        evilBloom.theBloom = 0.05;
    }

    FlxG.cameras.add(camOther = new FlxCamera(), false).bgColor = camHUD.bgColor;

    defaultCamZoom = 1;

    iconP1.setIcon("bf");
    healthBar.createFilledBar(dad.iconColor, 0xff31b0d1);
    healthBar.percent = health;
    camHUD.alpha = 0;
    camGame.fade(FlxColor.BLACK, 0);

    if (!Options.lowMemoryMode) {
        for (a in Paths.getFolderContent("images/stages/memorylane/words/")) {
            var backdrop:FlxBackdrop = new FlxBackdrop(Paths.file("images/stages/memorylane/words/" + a), FlxAxes.XY, 45, 25);
            backdrop.scrollFactor.x = backdrop.scrollFactor.y = backdrop.alpha = 0;
            backdrop.colorTransform.color = FlxColor.WHITE;
            backdrop.antialiasing = Options.antialiasing;
            backdrop.scale.x = backdrop.y = 0.875;
            backdrops.push(backdrop);
            insert(members.indexOf(stage.stageSprites["grass"]) + 1, backdrop).screenCenter();
        }

        memoryBackdrop = new FlxBackdrop(Paths.image("stages/memorylane/memoryScroll"), FlxAxes.XY, 25, 25);
        memoryBackdrop.scrollFactor.x = memoryBackdrop.scrollFactor.y = memoryBackdrop.alpha = 0;
        memoryBackdrop.antialiasing = Options.antialiasing;
        memoryBackdrop.velocity.y = memoryBackdrop.velocity.x = 100;
        memoryBackdrop.blend = 0;
        insert(members.indexOf(stage.stageSprites["grass"]) + 1,memoryBackdrop).screenCenter();
    }

    for (a in [end1, end2]) {
        a.scrollFactor.x = a.scrollFactor.y = a.zoomFactor = 0;
        a.setGraphicSize(FlxG.width);
        a.screenCenter();
        insert(0, a).visible = false;
    }

    add(endTxt).camera = camOther;
}

function postPostCreate() {
    iconP1.visible = iconP2.visible = newHealthBarBG.visible = healthBar.visible = accuracyTxt.visible = missesTxt.visible = scoreTxt.visible = !(camZooming = true);
}

function onStrumCreation(e) {
    e.cancelAnimation();
    e.strum.x -= FlxG.width / 4;
    e.strum.alpha = e.player;
}

function update(elapsed:Float) {
    if(Options.gameplayShaders)
        evilBloom.iTime = Conductor.songPosition / 1000;
}

function stepHit(_:Int) {
    if (((_ >= 408 && _ <= 576) || (_ >= 840 && _ < 1224)) && _ % 24 == 0 && Options.gameplayShaders && Options.flashingMenu)
        FlxTween.num(_ == 408 || _ == 576 ? 0.3 : 0.2, 0.05, (Conductor.stepCrochet / 1000) * 4, {}, _ -> evilBloom.data.theBloom.value = [_]);

    if ((_ >= 1248 && _ <= 1416) && _ % 24 == 0) {
        if (Options.camZoomOnBeat) {
            camGame.zoom += 0.1; 
            camHUD.zoom  += 0.02;
        }
        if (Options.gameplayShaders && Options.flashingMenu) FlxTween.num(0.15, 0.05, (Conductor.stepCrochet / 1000) * 15, {}, _ -> evilBloom.data.theBloom.value = [_]);
    }
    
    if (_ >= 624 && _ <= 816 && _ % memoryStepOffset == 0) {
        memory = FlxG.random.int(0, memories.length - 1, [memory]);
        for (a in 0...memories.length) {
            memories[a].visible = a == memory;
            if (a == memory) {
                FlxTween.cancelTweensOf(memories[a]);
                memories[a].alpha = 0.75;
                FlxTween.tween(memories[a], {alpha: 0}, (Conductor.stepCrochet / 1000) * 4);
            }
        }
    }

    if (_ >= 624 && _ <= 816 && _ % 12 == 0 && !Options.lowMemoryMode) {
        FlxTween.num(SONG.meta.bpm * 5, SONG.meta.bpm * 2, (Conductor.stepCrochet / 1000) * 12, {ease: FlxEase.cubeOut}, vel -> backdrops[lastBackdrop].velocity.y = vel);
    }

    if (_ >= 840 && _ < 1224 && _ % 12 == 0 && !Options.lowMemoryMode) {
        lastBackdrop = FlxG.random.int(0, backdrops.length - 1, [lastBackdrop]);
        FlxTween.num(SONG.meta.bpm * 5, SONG.meta.bpm * 2, (Conductor.stepCrochet / 1000) * 12, {ease: FlxEase.cubeOut}, vel -> backdrops[lastBackdrop].velocity.y = vel);
        for (a in 0...backdrops.length) {
             backdrops[a].visible = a == lastBackdrop;
             if (a == lastBackdrop) {
                 FlxTween.cancelTweensOf(backdrops[a]);
                 backdrops[a].alpha = 0.375;
                 FlxTween.tween(backdrops[a], {alpha: 0}, (Conductor.stepCrochet / 1000) * 12);
             }
         }
    }

    switch (_) {
        case 0:
            if (Options.gameplayShaders) {
                var jpg:CustomShader = new CustomShader("jpg");
                for (a in [camGame, camHUD])
                    a.addShader(jpg);
                FlxTween.num(16, 0.0000000001, (Conductor.stepCrochet / 1000) * 20, {onComplete: (_) -> for (a in [camGame, camHUD]) a.removeShader(jpg)}, _ -> jpg.pixel_size = _);
            }
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 20, true);    
            FlxTween.tween(camHUD, {alpha: 1}, (Conductor.stepCrochet / 1000) * 20);

            defaultCamZoom = 0.5;
            FlxTween.tween(camGame, {zoom: defaultCamZoom}, (Conductor.stepCrochet / 1000) * 64, {ease: FlxEase.smootherStepOut});
        case 192:
            FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 8);
            if (Options.flashingMenu) camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 8);    
        case 194:
            FlxTween.tween(strumLines.members[0].characters[0], {y: 312.5}, (Conductor.stepCrochet / 1000) * 20);
            FlxTween.num(strumLines.members[0].characters[0].cameraOffset.y, strumLines.members[0].characters[0].cameraOffset.y + 700, (Conductor.stepCrochet / 1000) * 20, null, _ -> strumLines.members[0].characters[0].cameraOffset.y = _);
        case 206 | 207 | 208 | 209 | 210 | 211 | 212 | 213:
            if (Options.flashingMenu) {
                camGame.fade(FlxColor.BLACK, 0, true);
                strumLines.members[0].characters[0].animateAtlas.colorTransform.color = strumLines.members[0].characters[0].colorTransform.color = FlxColor.RED;
                for(a in stage.stageSprites.keys())
                    stage.stageSprites[a].colorTransform.color = a == "bricks" ? FlxColor.RED : FlxColor.BLACK;        
                camGame.visible = !camGame.visible;
                camGame.zoom = defaultCamZoom += 0.05;
            }  
        case 216:
            if (Options.flashingMenu) camHUD.flash(FlxColor.RED, (Conductor.stepCrochet / 1000) * 8);
            camHUD.alpha = camHUD.zoom = 1.75;
            if(Options.gameplayShaders)
                FlxG.game.addShader(evilBloom);        
            for (a in stage.stageSprites)
                a.setColorTransform();
            strumLines.members[0].characters[0].animateAtlas.setColorTransform();
            strumLines.members[0].characters[0].setColorTransform();
            defaultCamZoom = 0.5;
            for (a in 0...2)
                for (b in strumLines.members[a])
                    b.alpha = b.x += FlxG.width / 4;
            iconP1.visible = iconP2.visible = newHealthBarBG.visible = healthBar.visible = accuracyTxt.visible = missesTxt.visible = scoreTxt.visible = true;
        case 404:
            if (Options.gameplayShaders) evilBloom.theBloom = 0.05;
        case 600:
            for(a in stage.stageSprites.keys())
                stage.stageSprites[a].visible = a == "bricks";  
            
            if (Options.flashingMenu) {
                stage.stageSprites["bricks"].colorTransform.color = dad.colorTransform.color = FlxColor.RED;
                camGame.alpha = camHUD.alpha = 0;
                FlxTween.num(0.3, 0.6, (Conductor.stepCrochet / 1000) * 24, {ease: FlxEase.circInOut}, _ -> defaultCamZoom = _);
                iconP1.visible = iconP2.visible = newHealthBarBG.visible = healthBar.visible = accuracyTxt.visible = missesTxt.visible = scoreTxt.visible = false;
            }
        case 620:
            if (FlxG.save.data.customOptions.modcharts) {
			    strumLines.members[1].members[3].x = strumLines.members[1].members[2].x;
                strumLines.members[1].members[2].x = strumLines.members[1].members[1].x;
			    strumLines.members[1].members[0].x = strumLines.members[0].members[1].x;
			    strumLines.members[1].members[1].x = strumLines.members[0].members[2].x;
			    for(b in strumLines.members[0]) b.x -= FlxG.width;
            }
            if (Options.flashingMenu) FlxTween.tween(camGame, {alpha: 0.25}, (Conductor.stepCrochet / 1000) * 4);
        case 624:
            if (Options.flashingMenu) {
                camHUD.flash(FlxColor.RED, (Conductor.stepCrochet / 1000) * 8);
                FlxTween.cancelTweensOf(camGame);
                camHUD.alpha = camGame.alpha = 1;
            }
            stage.stageSprites["bricks"].setColorTransform();
            dad.setColorTransform();
            if (!Options.lowMemoryMode) backdrops[lastBackdrop].alpha = 0.5;
            camMoveAmt = 0;
        case 816:
            camHUD.alpha = 0;
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 24, true);
            FlxTween.tween(camHUD, {alpha: 1}, (Conductor.stepCrochet / 1000) * 12);
            camZoomingStrength = 0;
            for(a in stage.stageSprites.keys())
                stage.stageSprites[a].visible = a != "friendhider";
            if (!Options.lowMemoryMode) backdrops[lastBackdrop].visible = false;
            camMoveAmt = 25;
        case 840:
            if (Options.flashingMenu) camHUD.flash(FlxColor.RED, (Conductor.stepCrochet / 1000) * 8);
            if (FlxG.save.data.customOptions.modcharts) {
                for(a in strumLines.members[0].members) FlxTween.tween(a, {x: (FlxG.width * 0.25) + (Note.swagWidth * (a.ID - 2))}, (Conductor.stepCrochet / 1000) * 12, {ease: FlxEase.circOut});
                for(a in strumLines.members[1].members) FlxTween.tween(a, {x: (FlxG.width * 0.75) + (Note.swagWidth * (a.ID - 2))}, (Conductor.stepCrochet / 1000) * 12, {ease: FlxEase.circOut});
            }
            camHUD.alpha = 1;
        case 1200:
            FlxTween.color(dad, (Conductor.stepCrochet / 1000) * 16, FlxColor.WHITE, FlxColor.BLACK);
            FlxTween.tween(camGame, {zoom: defaultCamZoom + 0.3}, (Conductor.stepCrochet / 1000) * 24, {ease: FlxEase.smootherStepIn});
        case 1224:
            coolFlash(FlxColor.WHITE, 12, 0.5);
            if (Options.camZoomOnBeat) {
                camGame.zoom += 0.1;
                camHUD.zoom  += 0.02;
            }
            if (!Options.lowMemoryMode) FlxTween.tween(memoryBackdrop, {alpha: 0.3}, (Conductor.stepCrochet / 1000) * 24);
            if (Options.gameplayShaders && Options.flashingMenu) FlxTween.num(0.35, 0.05, (Conductor.stepCrochet / 1000) * 16, {}, _ -> evilBloom.data.theBloom.value = [_]);
            FlxTween.color(dad, (Conductor.stepCrochet / 1000) * 8, FlxColor.BLACK, FlxColor.WHITE);
        case 1416:
            camGame.visible = false;
        case 1428:
            coolFlash(FlxColor.BLACK, 12, 1);
            camGame.visible = true;
            if (!Options.lowMemoryMode) memoryBackdrop.destroy();
            FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 12);
            for(a in stage.stageSprites) remove(a);
            dad.visible = !(end1.visible = end2.visible = true);
            end1.alpha = end2.alpha = 0;
            FlxTween.tween(end1, {alpha: 1}, (Conductor.stepCrochet / 1000) * 12);
        case 1436: endTxt.text = "They didn't go home that night.";
        case 1452, 1500, 1532, 1562: endTxt.text = "";
        case 1460: endTxt.text = "He buried them here. He was too scared";
        case 1508: endTxt.text = "but they found a way out eventually";
        case 1540:
            endTxt.x = 125;
            endTxt.text = "But that's not all, is it?";
        case 1570: endTxt.text = "There's still something you forgot to remember";
        case 1596: remove(endTxt);
        case 1604:
            if (!Options.lowMemoryMode) backdrops[lastBackdrop].visible = false;
            FlxTween.tween(end1, {alpha: 0}, (Conductor.stepCrochet / 1000) * 28);
            FlxTween.tween(end2, {alpha: 1}, (Conductor.stepCrochet / 1000) * 28);
        case 1632:
            if (Options.gameplayShaders) {
                var jpg:CustomShader = new CustomShader("jpg");
                for (a in [camGame, camOther])
                    a.addShader(jpg);
                FlxTween.num(0.0000000001, 16, (Conductor.stepCrochet / 1000) * 76, null, _ -> jpg.pixel_size = _);
            }
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 76);    
    }
}

function destroy()
    if (Options.gameplayShaders) {
        FlxG.game._filters = [];
        FlxG.game.addShader(monitorEffect);
        FlxG.game.addShader(vhsblur);
    }