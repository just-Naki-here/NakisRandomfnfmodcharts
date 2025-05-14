public var newHealthBarBG:FunkinSprite = new FunkinSprite(0, FlxG.height == 720 ? 612 : 655);

public var camMove:Bool = true;
public var camMoveAmt:Float = 25.0;
public static var angleEnable:Bool = false;
public static var camAngleOffset:Float = 0.5;
public var camLerpIntensity:Float = 0.2;

public var oppDamage:Float = 0.0;

PauseSubState.script = 'data/scripts/pause';
GameOverSubstate.script = 'data/scripts/gameover';
playCutscenes = true;
endCutscene = Paths.script('data/scripts/cashmoneycutscene');

function onPostNoteCreation(e) if(e.note.gapFix != null) e.note.gapFix = 2.95;

function create()
    angleEnable = seenCutscene = canPause = false;

function postCreate(){
    FlxG.mouse.visible = ["broadcast", "enormity"].contains(PlayState.SONG.meta.name.toLowerCase());
    allowGitaroo = false;
    strumLines.members[0].visible = (FlxG.save.data.customOptions.oppNotes && !["elysium", "broadcast", "encavmaphobia", "abduction"].contains(SONG.meta.name));

    window.title = "Analog Funkin' : " + SONG.meta.displayName;
    newHealthBarBG.frames = Paths.getSparrowAtlas("game/newHealthBar");
    insert(members.indexOf(healthBar) + 1, newHealthBarBG).screenCenter(FlxAxes.X);
    newHealthBarBG.animation.addByPrefix("bar", "bar", 24, true);
    newHealthBarBG.animation.play("bar");
    newHealthBarBG.camera = camHUD;
    newHealthBarBG.antialiasing = Options.antialiasing;
    remove(healthBarBG.destroy());
    healthBar.scale.set(1.06, 2.5);

    for(a in [accuracyTxt, scoreTxt, missesTxt]) {
        remove(a);
        insert(1, a).y += 12.5;
        a.antialiasing = Options.antialiasing;
    }
    
    switch(SONG.meta.name) {
        case "celebration" | "lament": // Da easy songs
            oppDamage = 0.012;
        case "in the dark" | "memory lane" | "abduction" | "take care": // Da normal songs
            oppDamage = 0.018;
        case "ectype":
            oppDamage = 0.023;
        case "wonderland" | "archived" | "broadcast" | "pursuit": // da hard songs
            oppDamage = 0.025;
        case "found footage" | "elysium" | "enormity" | "encavmaphobia": // da sing or you fucking die songs
            oppDamage = 0.028;
        default:
            oppDamage = 0.000;
    }

    scripts.call('postPostCreate');
}

function onNoteHit(e) e.displayRating = e.displayCombo = e.showRating = false;
function onDadHit(e)
    if  (e.characters == strumLines.members[0].characters && FlxG.save.data.customOptions.healthdrain && iconP1.animation.curAnim.curFrame != 1)
        e.healthGain = oppDamage;

if (["take care", "newmaker plane", "ectype", "petals", "invective"].contains(SONG.meta.name)) {
    function onNoteCreation(e)
        e.noteSprite = "game/notes/" + (SONG.meta.name == "take care" ? "takecare" : "petscop");
    function onStrumCreation(e)
        e.sprite = "game/notes/" + (SONG.meta.name == "take care" ? "takecare" : "petscop");
}

function onCameraMove(e)
    if (!["ectype", "broadcast", "enormity"].contains(SONG.meta.name.toLowerCase())) {
        e.cancel();
        
        FlxTween.tween(PlayState.instance.camFollow, {
            x: strumLines.members[curCameraTarget].characters[0].getCameraPosition().x,
            y: strumLines.members[curCameraTarget].characters[0].getCameraPosition().y
        }, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.linear});
    }

function postUpdate() {
    if(FlxG.keys.justPressed.EIGHT && FlxG.save.data.customOptions.devSkipSong) endSong();
    if (angleEnable) camGame.angle = lerp(camGame.angle, 0, camLerpIntensity);

    if(camMove){
        switch(strumLines.members[curCameraTarget].characters[0].getAnimName().split("-")[0]) {
            case 'singLEFT':
                camFollow.x = camFollow.x -camMoveAmt;
                if (angleEnable) camGame.angle = lerp(camGame.angle, camAngleOffset, camLerpIntensity);
            case 'singRIGHT':
                camFollow.x = camFollow.x + camMoveAmt;
                if (angleEnable) camGame.angle = lerp(camGame.angle, -camAngleOffset, camLerpIntensity);
                
            case 'singUP':
                camFollow.y = camFollow.y -camMoveAmt;
                if (angleEnable) camGame.angle = lerp(camGame.angle, 0, camLerpIntensity);
            case 'singDOWN':
                camFollow.y = camFollow.y + camMoveAmt;
                if (angleEnable) camGame.angle = lerp(camGame.angle, 0, camLerpIntensity);
            }
    }
}

var bnw:CustomShader = new CustomShader("Colors/black n white");

var cameras:Array<FlxCamera> = FlxG.cameras.list;

function onGamePause() {
    window.title = "Analog Funkin' : " + SONG.meta.displayName + " - PAUSED";
    for (a in cameras) a.addShader(bnw);
}

function onSubstateClose() {
    window.title = "Analog Funkin' : " + SONG.meta.displayName;
    for (a in cameras) a.removeShader(bnw);

}

function onSongStart()
    canPause = true;

function onSongEnd() {
    var cashMoney:Float = Math.round(((inst.length) * (floorDecimal(accuracy * 100, 2) / 1000000)) * 100) / 100;
    cashMoney *= (["manipulated", "abduction", "wonderland", "take-care", "deadlines", "enormity", "pursuit", "encavmaphobia"].contains(SONG.meta.name.toLowerCase()) ? 1.875 : 2.25); // 25% increase if bonus song (can we add communism next)
    FlxG.save.data.cashMoney += (FlxG.save.data.customOptions.devBotplay || accuracy <= 0 ? 0 : cashMoney);
}

function floorDecimal(value:Float, decimals:Int):Float {
	if(decimals < 1)
		return Math.floor(value);

	var tempMult:Float = 1;
	for (i in 0...decimals)
		tempMult *= 10;

	var newValue:Float = Math.floor(value * tempMult);
	return newValue / tempMult;
}

function onPlayerMiss(e) if (!e.character.hasAnim("sing" + ["LEFT", "DOWN", "UP", "RIGHT"][e.direction] + "miss")) e.preventAnim();
