import funkin.backend.MusicBeatState;

var ending:Bool = false;
static var path:String;

var deathSFX:FlxSound;
var confirm:FlxSound;

function create(e) {
    e.cancel();
    window.title += " - GAME OVER";

    FlxG.cameras.add(camera = camDie = new FlxCamera(), false).bgColor = FlxColor.BLACK;

    path = "death/" + switch (PlayState.SONG.meta.name.toLowerCase()) {
        // week songs
        case "lament" | "archived" | "memory lane" | "elysium" | "abduction": "walten";
        case "tally mark" | "celebration" | "in the dark" | "found footage": "backrooms";
        case "newmaker plane" | "petals" | "ectype" | "invective": "petscop";
        case "grave mistake" | "real sleep" | "broadcast" | "his throne": "local58";
        // bonus
        case "enormity": "enormity";
        case "deadlines": "harmony and horror";
        case "pursuit": "vita carnis";
        case "take care": "boisvert";
        case "encavmaphobia": "encavmaphobia";
        case "manipulated": "tmk";
        case "wonderland": "nmi";
        // fallback
        default: "walten";
    } + "/";

    trace(path);

    deathSFX = FlxG.sound.play(Paths.sound((Assets.exists(Paths.sound(path + "deathSFX")) ? path : "death/walten/") + "deathSFX"));

    var gameover:FunkinText = new FunkinText(0, 25, 0, "Game Over.", 96, false);
    gameover.font = Paths.font("ARCADE_N.TTF");
    add(gameover).screenCenter();
    FlxTween.num(0, 1, deathSFX.length / 1000, null, _ -> gameover.alpha = _);
}

var time:Float = 0.0;

function update(_:Float) {
    if ((!ending && !deathSFX.playing) && (FlxG.sound.music == null || !FlxG.sound.music.playing))
        CoolUtil.playMusic(Paths.sound(path + "loop"), false, 1, true, 100);

    if ((controls.BACK || controls.ACCEPT) && !ending) {
        ending = true;
        if (FlxG.sound.music != null)
			FlxG.sound.music.stop();
		FlxG.sound.music = null;
        if (controls.ACCEPT) {
            if (Assets.exists(Paths.sound(path + "confirm")))
                confirm = FlxG.sound.play(Paths.sound(path + "confirm"));
            camDie.fade(FlxColor.BLACK, (confirm.length / 1000) - 0.7, false, function() {
                MusicBeatState.skipTransOut = true;
                FlxG.switchState(new PlayState());
            });
        } else {
            FlxG.switchState(new ModState("AnalogStates/MainMenu"));
        }
    }
}