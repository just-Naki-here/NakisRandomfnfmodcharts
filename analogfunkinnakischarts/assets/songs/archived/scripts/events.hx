
var daStatic:CustomShader = new CustomShader("VHS/static");
var flashyColor:FlxColor = FlxColor.BLACK;
var light = stage.stageSprites["light"];
var coolText:FunkinText = new FunkinText(0, 0, 0, "", 128, false);

function postCreate() {
    angleEnable = true;
    camAngleOffset = 2;
    camLerpIntensity = 0.1;

    if (Options.flashingMenu) camGame.visible = false;
    camZoomingStrength = camHUD.alpha = iconP2.alpha = 0;
    dad.color = FlxColor.BLACK;

    iconP1.setIcon("bf");
    healthBar.createFilledBar(FlxColor.TRANSPARENT, 0xff31b0d1);
    healthBar.percent = health;

    if (Options.gameplayShaders)
        camGame.addShader(daStatic);
    daStatic.intensity = 0.3;

    if (!Options.lowMemoryMode) {
        insert(1, coolText).camera = camHUD;

        insert(0, vignette = new FunkinSprite(0, 0, Paths.image('stages/vignette-16to9'))).screenCenter();
            vignette.color = FlxColor.BLACK;
            vignette.camera = camHUD;
    }
}

function postUpdate(elapsed:Float)
    if (Options.gameplayShaders)
        daStatic.iTime = Conductor.songPosition/1000; 

function stepHit(_:Int) {
    if (_ >= 1344 && _ <= 1728 && _ % 6 == 0 && FlxG.save.data.customOptions.badApple && Options.flashingMenu)
        homophobia();

    switch(_) {
        case 0:
            FlxTween.tween(camHUD, {alpha: 1}, 1.5);
            FlxTween.tween(camGame, {zoom: 1}, (Conductor.stepCrochet / 1000) * 256, {ease: FlxEase.cubeInOut, onComplete: function(tween:FlxTween) {defaultCamZoom = 1;}});
            camGame.visible = true;
            coolFlash(FlxColor.BLACK, 96, 1);
        case 244:
            FlxTween.color(dad, (Conductor.stepCrochet / 1000) * 12, FlxColor.BLACK, 0xFF818181);
            healthBar.createFilledBar(dad.iconColor, 0xff31b0d1);
            healthBar.percent = health;
            FlxTween.tween(iconP2, {alpha:1}, (Conductor.stepCrochet / 1000) * 12);
        case 256:
            defaultCamZoom = 0.8;
            coolFlash(FlxColor.BLACK, 16, 0.4);
            FlxTween.num(0.003, 0, 2, {}, _ -> camGame.shake(_, 2));
        case 384 | 500 | 704 | 656 | 816 | 896 | 912 | 1040 | 1184 | 1200 | 1232 | 1312 | 1328 | 1856 | 1872 | 1888 | 1904 | 1920 | 2310:
            defaultCamZoom = 0.8;
        case 289 | 416 | 640 | 902 | 918 | 1024 | 1894:
            defaultCamZoom = 1;
        case 320 | 448 | 672 | 800 | 1046 | 1190 | 1206 | 1238 | 1318 | 1334 | 1862 | 1878:
            defaultCamZoom = 1.05;
        case 352 | 480 | 608 | 736 | 784 | 1030 | 1824 | 1910:
            defaultCamZoom = 1.1;
        case 509:
            FlxTween.tween(camGame, {zoom: 1.5}, (Conductor.stepCrochet / 1000) * 64, {ease: FlxEase.quadInOut, onComplete: function(tween:FlxTween) {defaultCamZoom = 1.5;}});
        case 512:
            defaultCamZoom = 0.75;
            coolFlash(FlxColor.RED, 16, 0.4);
        case 544:
            FlxTween.num(0.3, 0.75, (Conductor.stepCrochet / 1000) * 31, {}, _ -> daStatic.intensity = _);
            FlxTween.tween(camGame, {zoom: 1.4}, (Conductor.stepCrochet / 1000) * 32, {ease: FlxEase.quadIn});
        case 576:
            FlxTween.num(0.5, 0.3, (Conductor.stepCrochet / 1000) * 12, {}, _ -> daStatic.intensity = _);
        case 577 | 1808:
            defaultCamZoom = 0.8;
            coolFlash(FlxColor.RED, 16, 0.8);
        case 640 | 688 | 768 | 908 | 1052 | 1868 | 1900:
            defaultCamZoom = 1.05;
        case 836 | 924 | 964 | 1036 | 1196 | 1212 | 1244 | 1324 | 1336 | 1884:
            defaultCamZoom = 1.075;
        case 864 | 928 | 992:
            defaultCamZoom = 1.05;
        case 1088 | 1120 | 1152 | 1217 | 1248 | 1916:
            defaultCamZoom = 1.1;
        case 1096 | 1128 | 1160 | 1224 | 1256:
            defaultCamZoom = 0.9;
            coolFlash(FlxColor.RED, 8, 0.4);
        case 1344:
            coolFlash(FlxColor.RED, 16, 1);
        case 1342:
            defaultCamZoom = 0.8;
        case 1728:
            coolFlash(FlxColor.RED, 16, 1);
            for (a in stage.stageSprites)
                a.setColorTransform();
            camGame.bgColor = FlxColor.BLACK;
            dad.setColorTransform();
            boyfriend.setColorTransform();
            FlxTween.tween(camGame, {zoom: 1}, (Conductor.stepCrochet / 1000) * 64, {ease: FlxEase.quadInOut, onComplete: function(tween:FlxTween) {defaultCamZoom = 1;}});
        case 1760:
            if (Options.flashingMenu) camGame.visible = false;
            datext("PICK");
        case 1776:
            datext("PICK UP.");
        case 1792:
            datext("");
            if (Options.flashingMenu) camGame.visible = true;
            if (!Options.lowMemoryMode)  FlxTween.color(light, (Conductor.stepCrochet / 1000) * 12, FlxColor.WHITE, FlxColor.RED);
            defaultCamZoom = 0.9;
            coolFlash(FlxColor.BLACK, 16, 1);
        case 1800:
            defaultCamZoom = 0.85;
        case 2304:
            defaultCamZoom = 0.8;
        case 2316:
            defaultCamZoom = 1;
    }
}

function homophobia() {
    flashyColor = (flashyColor == FlxColor.BLACK ? FlxColor.RED : FlxColor.BLACK);
    for (a in stage.stageSprites)
        a.colorTransform.color = (flashyColor == FlxColor.BLACK ? FlxColor.RED : FlxColor.BLACK);

    camGame.bgColor = (flashyColor == FlxColor.BLACK ? FlxColor.RED : FlxColor.BLACK);
    dad.colorTransform.color = boyfriend.colorTransform.color = flashyColor;

    camGame.zoom += 0.1;
    camHUD.zoom += 0.03;

}

function datext(_:String) {
    if (!Options.lowMemoryMode) {
        FlxTween.cancelTweensOf(coolText);
        coolText.text = _;
        FlxTween.color(coolText, (Conductor.stepCrochet / 1000) * 4, FlxColor.RED, FlxColor.WHITE);
        coolText.screenCenter();
    }
}