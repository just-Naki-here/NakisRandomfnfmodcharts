var button:FunkinSprite;
var curSelect:Int = 0;
var isSelected: Bool = false;

function create(e){
    e.cancel();
    e.music = 'forever-dream-pause';

    camera = pauseCam = new FlxCamera();
    FlxG.cameras.add(pauseCam, false);

    if (FlxG.save.data.fdHUDCamPixel) {
        var pixely:CustomShader = new CustomShader("MosaicShader");
		pixely.data.uBlocksize.value = [2, 2];
		pauseCam.addShader(pixely);
	}
    
    add(yep = new FlxSprite().makeGraphic(1, 1, FlxColor.BLACK)).screenCenter();
    yep.scale.set(FlxG.width, FlxG.height);
    yep.alpha = 0.5;
    
    button = new FunkinSprite().loadGraphic(Paths.image("game/stargazerUI/pauseMenu"), true, 112, 75);
    button.animation.add(":3", [for(a in 0...button.frames.frames.length) a], 0, false);
    button.animation.play(":3");
    button.scale.x = button.scale.y = 2.75;
    add(button).screenCenter();

    FlxG.sound.play(Paths.sound("menu/fdPause/paused"));

    add(border = new FlxSprite().loadGraphic(Paths.image("stages/forever/border"))).screenCenter();
	border.scale.x = border.scale.y = 0.75;

    changeSelect(0);
}

function update(){
    if(controls.ACCEPT && !isSelected) {
        isSelected = true;
        FlxG.sound.play(Paths.sound("menu/fdPause/enter"));
        new FlxTimer().start(0.25, () -> {
            switch (curSelect) {
                case 0: close();
                case 1:
                    FlxTween.cancelTweensOf(PlayState.instance.camGame);
                    PlayState.instance.registerSmoothTransition();
                    FlxG.resetState();
                case 2:
                    FlxTween.cancelTweensOf(PlayState.instance.camGame);
                    FlxG.switchState(new FreeplayState());
                default: trace(curSelect);
            }});
    }
    if(controls.UP_P || controls.DOWN_P)
        changeSelect(controls.UP_P ? -1 : 1);
}

function changeSelect(a:Int) {
    if (a != 0) FlxG.sound.play(Paths.sound("menu/fdPause/changeSelect"));
    curSelect = FlxMath.wrap(curSelect + a, 0, button.frames.frames.length - 1);
    button.animation.curAnim.curFrame = curSelect;
}