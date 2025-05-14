//
public static var pauseCam:FlxCamera;
var buttons:Array<FunkinSprite> = [];
var curSelect:Int = 1;

function create(e){
    e.cancel();
    FlxG.cameras.add(camera = pauseCam = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;

    var renderSuffix:String = switch (PlayState.SONG.meta.displayName.toLowerCase()) {
        case "petals": Conductor.curStep >= 960 && Conductor.curStep <= 1232 ? "-2" : "-1";
        case "enormity": Conductor.curStep < 1920 ? "-1" : "-2";
        case "wonderland": Conductor.curStep < 1344 ? "-1" : "-2";
        case "abduction": Conductor.curStep < 1024 ? "-1" : "-2";
        default: "";
    }

    remder = new FunkinSprite(FlxG.width, 0, Paths.image("menus/pauses/renders/" + (Assets.exists(Paths.image("menus/pauses/renders/" + PlayState.SONG.meta.displayName.toLowerCase() + renderSuffix)) || PlayState.SONG.meta.displayName.toLowerCase() == "thats what i do" ? PlayState.SONG.meta.displayName.toLowerCase() + renderSuffix : "null")));
    remder.updateHitbox();
    FlxTween.tween(remder, {x: FlxG.width - remder.width}, 0.7, {ease: FlxEase.smootherStepOut});
    add(remder).y = FlxG.height - remder.height;

    sidebar = new FunkinSprite(0, 0, Paths.image("menus/pauses/sidebar"));
    sidebar.scale.x = sidebar.scale.y = FlxG.height/720;
    sidebar.updateHitbox();
    add(sidebar).setPosition(0, 0);

    trace(sidebar.width);

    for(a in 0...4) {
        button = new FunkinSprite(25 + (a * 50), (a * 150) + (a != 0 ? -25 : 10));
        button.frames = Paths.getSparrowAtlas("menus/pauses/buttons");
        button.animation.addByPrefix(['Info', 'Resume', 'Restart', 'Quit'][a], ['Info', 'Resume', 'Restart', 'Quit'][a], 12, true);
        button.animation.play(['Info', 'Resume', 'Restart', 'Quit'][a]);
        buttons.push(button);
        add(buttons[a]);
    }
    // the fungus.
    changeSelect(0);
}

var selecting = true;

function update() {
    if(controls.ACCEPT && pauseCam.alpha == 1)
        switch(curSelect) {
            case 0: FlxTween.tween(pauseCam, {alpha: 0}, 0.5, {onComplete: (_) -> openSubState(new ModSubState("AnalogSubstates/PauseInfo"))});
            case 1: close();
            case 2: FlxG.switchState(new PlayState());
            case 3: 
                selecting = false;
                FlxTween.tween(sidebar, {x: sidebar.x - 880}, 1, {ease: FlxEase.smootherStepIn});
                FlxTween.tween(remder, {x: remder.x + 880}, 1, {ease: FlxEase.smootherStepIn});
                for(a in 0...4) FlxTween.tween(buttons[a], {x: buttons[a].x  - 880}, 1, {ease: FlxEase.smootherStepIn, onComplete: (_) -> FlxG.switchState(new ModState("AnalogStates/MainMenu"))});
        }
    if((controls.UP_P || controls.DOWN_P) && pauseCam.alpha == 1 && selecting)
        changeSelect(controls.UP_P ? -1 : 1);
}

function changeSelect(a:Int) {
    curSelect = FlxMath.wrap(curSelect + a, 0, buttons.length - 1);
    for(a in 0...buttons.length) buttons[a].color = (a == curSelect ? FlxColor.YELLOW : FlxColor.WHITE);
}