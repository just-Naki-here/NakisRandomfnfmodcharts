if (PlayState.difficulty != "ALT") {
    var black:FunkinSprite = new FunkinSprite().makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK);
    public var bgs:Array<FunkinSprite> = [];

    public var curBG:Int = -1;
    public var shakeIt:Bool = true;
    var noteShakeIntensity:Float = 0.0;

    function create() {
        insert(0, black).scrollFactor.set();
        black.zoomFactor = 0;
        camZoomingInterval = 1;

        if (Options.gameplayShaders)
            for (a in 0...4) {
                bgs.push(new FunkinSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.RED));
                bgs[a].zoomFactor = bgs[a].scrollFactor.x = bgs[a].scrollFactor.y = 0;
                insert(0, bgs[a]).shader = new CustomShader("Backgrounds/encavBG" + (a + 1));
            }
    }

    function postUpdate() {
        if (curBG != -1 && black.alpha != 1 && Options.gameplayShaders)
            bgs[curBG].shader.iTime = Conductor.songPosition / 1000;
        
        if (strumLines.members[0].visible && noteShakeIntensity > 0 && shakeIt)
            for (a in strumLines.members[0]) {
                a.x = ((FlxG.width * 0.75) + (Note.swagWidth * (a.ID - 2))) + FlxG.random.float(-noteShakeIntensity, noteShakeIntensity);
                a.y = 50 + FlxG.random.float(-noteShakeIntensity, noteShakeIntensity);
            }
    }

    public static function switchBG(?_:Float = 1) {
        if (Options.gameplayShaders) {
            curBG = FlxG.random.int(0, bgs.length - 1, [curBG]);
            for(a in 0...bgs.length)
                bgs[a].visible = a == curBG;
            FlxTween.cancelTweensOf(black);
            black.alpha = 1;
            FlxTween.tween(black, {alpha: 0}, _, {type: FlxTween.BACKWARD});
        }
        FlxTween.num(3, 1, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.quadInOut}, _ -> noteShakeIntensity = _);
    }
}