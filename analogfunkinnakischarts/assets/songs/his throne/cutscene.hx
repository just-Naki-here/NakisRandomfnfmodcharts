var page:FunkinSprite = new FunkinSprite(0, 0, Paths.image("cutscenes/his throne"));
var panel:Int = 0;

var end:Bool = false;

var music:FlxSound = FlxG.sound.load(Paths.music("cashHisThrone"));
function create() {
    PlayState.inCutscene = true;
    game.persistentUpdate = false;
    music.play();
    FlxG.cameras.add(camera = camCutscene = new FlxCamera(), false).bgColor = FlxColor.BLACK;
    camCutscene.fade(FlxColor.BLACK, 1, true);

    add(page).screenCenter(FlxAxes.Y);
    add(new FunkinSprite(0, 0, Paths.image('stages/vignette-16to9'))).color = FlxColor.BLACK;
}

function update() {
    if (controls.ACCEPT && !end) {
        CoolUtil.playMenuSFX();
        panel++;
        if (panel == 3) {
            end = true;
            FlxTween.num(1, 0.1, 0.75, {startDelay: 0.25}, _ -> music.pitch = _);
            FlxTween.tween(camCutscene, {alpha: 0}, 1, {onComplete: (_) -> close()});
        }
    }

    if (!end)
        page.x = lerp(page.x, (2400 / -3 * panel) + FlxG.width / 2 - 2400/3/2, 0.11);
}
