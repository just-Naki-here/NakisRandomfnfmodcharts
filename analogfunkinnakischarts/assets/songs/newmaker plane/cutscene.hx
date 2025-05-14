var pages:Array<FunkinSprite> = [];
var panel:Int = 0;
var page:Int = 0;

var end:Bool = false;

var music:FlxSound = FlxG.sound.load(Paths.music("cutscene"));
function create() {
    PlayState.inCutscene = true;
    game.persistentUpdate = false;
    music.play();
    FlxG.cameras.add(camera = camCutscene = new FlxCamera(), false).bgColor = FlxColor.BLACK;
    camCutscene.fade(FlxColor.BLACK, 1, true);

    for (a in 0...3) {
        pages.push(new FunkinSprite(0, 0, Paths.image("cutscenes/newmaker plane-" + (a + 1))));
        pages[a].y = (FlxG.height / 2 - pages[a].height / 2) + pages[a].height * (a - page);
        add(pages[a]);
    }
}

function update() {
    if (controls.ACCEPT && !end) {
        CoolUtil.playMenuSFX();
        if ((panel + 1) % 3 == 0)
            page++;
        panel = (panel + 1) % 3;
        if (page == 2 && panel == 1) {
            end = true;
            FlxTween.num(1, 0.1, 0.75, {startDelay: 0.25}, _ -> music.pitch = _);
            FlxTween.tween(camCutscene, {alpha: 0, zoom: 1.5}, 1, {onComplete: (_) -> close()});
        }
    }

    if (!end)
        for (a in 0...pages.length) {
            pages[a].x = lerp(pages[a].x, (2400 / -3 * panel) + FlxG.width / 2 - 2400/3/2, 0.11);
            pages[a].y = lerp(pages[a].y, (FlxG.height / 2 - pages[a].height / 2) + pages[a].height * (a - page), 0.11);
            pages[a].alpha = lerp(pages[a].alpha, a == page ? 1 : 0.25, 0.11);
        }
}