import funkin.backend.utils.AudioAnalyzer;
var anal = new AudioAnalyzer(inst);
var analSize:Float;

var dahealth:FunkinSprite;
var bloomMyAss:CustomShader = new CustomShader("bloomAlt");
var helloblack:CustomShader = new CustomShader("bwoutline");

var balloonSpawnRate:Int;

function postCreate() {
    if (Options.flashingMenu) camHUD.fade(FlxColor.BLACK, 0);
    add(dahealth = new FunkinSprite().loadGraphic(Paths.image("stages/vignette-4to3"))).camera = camHUD;
    dahealth.alpha = 0;
    dahealth.color = FlxColor.RED;
    if(Options.gameplayShaders) {
        camGame.addShader(bloomMyAss);
        camHUD.addShader(bloomMyAss);
    }
    helloblack.lowerBound = 0.01;
    helloblack.upperBound = 0.12;
    helloblack.invert = true;
}

function update() {
    dahealth.alpha = lerp(dahealth.alpha, iconP1.animation.curAnim.curFrame, 0.04);
}

function stepHit(_:Int) {
    if (_ % balloonSpawnRate == 0 && _ >= 1488 && !Options.lowMemoryMode) 
        add(new BallonMechanic(FlxG.random.int(1, 4), FlxG.random.float(1, 3)));

    if (Options.gameplayShaders && (_ % 12 == 0) && Options.flashingMenu)
        FlxTween.num(0.35/2, 0, (Conductor.stepCrochet / 1000) * 12, null, _ -> bloomMyAss.intensity = _);

    switch(_) {
        case 48:
            if (Options.flashingMenu) camHUD.fade(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 12, true);
            camZooming = true;
        case 430:
            defaultCamZoom += 0.3;
        case 432 | 1008:
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 12, true);
            defaultCamZoom -= (curStep == 432 ? 1 : 0.7);
            if (!Options.lowMemoryMode && Options.flashingMenu) scary.alpha = 1;
            if (Options.flashingMenu) walls.colorTransform.color = FlxColor.WHITE;
            strumLines.members[0].characters[0].colorTransform.color = FlxColor.BLACK;
        case 624 | 1200:
            if (Options.flashingMenu) FlxTween.num(255, 0, (Conductor.stepCrochet / 1000) * 12, {}, function(a) walls.setColorTransform(1, 1, 1, 1, a, a, a));
            if (!Options.lowMemoryMode && Options.flashingMenu) FlxTween.tween(scary, {alpha: 0}, (Conductor.stepCrochet / 1000) * 12);
            FlxTween.color(strumLines.members[0].characters[0], (Conductor.stepCrochet / 1000) * 12, FlxColor.BLACK, FlxColor.WHITE);
            FlxTween.num(defaultCamZoom, defaultCamZoom + 0.7, (Conductor.stepCrochet / 1000) * 12, {ease: FlxEase.linear}, function(a) defaultCamZoom = a);
        case 1392:
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 12, true);
            if (!Options.lowMemoryMode) scary.alpha = 1;
            if (Options.flashingMenu) walls.color = FlxColor.BLACK;
            if (!Options.lowMemoryMode && Options.flashingMenu) strumLines.members[0].characters[0].colorTransform.color = scary.colorTransform.color = FlxColor.WHITE;
        case 1488:
            for(a in [camHUD, strumLines.members[0].characters[0]])
                FlxTween.tween(a, {alpha: 0}, (Conductor.stepCrochet / 1000) * 24);
            if (!Options.lowMemoryMode && Options.flashingMenu) FlxTween.tween(scary, {alpha: 0}, (Conductor.stepCrochet / 1000) * 56);
            FlxTween.num(defaultCamZoom, defaultCamZoom - 0.35, (Conductor.stepCrochet / 1000) * 24, {ease: FlxEase.linear}, function(a) defaultCamZoom = a);
            FlxTween.num(16, 1, (Conductor.stepCrochet / 1000) * 112, null, _ -> balloonSpawnRate = Std.int(_));
        case 1572:
            var jpg:CustomShader = new CustomShader("jpg");
            for (a in [camGame, camHUD])
                a.addShader(jpg);
            FlxTween.num(0.0000000001, 16, (Conductor.stepCrochet / 1000) * 12, null, _ -> jpg.pixel_size = _);
            FlxTween.tween(camGame, {alpha: 0}, (Conductor.stepCrochet / 1000) * 12);
    }
}

class BallonMechanic extends FunkinSprite {
    public function new(balloonName:String, speed:Float) {
        super();

        loadGraphic(Paths.image("stages/celebration/balloons/" + balloonName));
        scale.x = scale.y = FlxG.random.float(0.6, 0.8);
        updateHitbox();
        x = -width * 2;
        y = FlxG.random.float(100, 600);
        moves = true;
        zoomFactor = scrollFactor.x = scrollFactor.y = 0;
        velocity.x = 80 * speed;   
        shader = helloblack;     
    }

    override public function update(elapsed:Float) {
        super.update(elapsed);

        if (x >= FlxG.width + width) destroy();
    }
}