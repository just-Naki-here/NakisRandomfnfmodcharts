import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxStringUtil;
import StringTools;
import Date;

public var walls:FlxBackdrop;
public var scary:FlxBackdrop;

public var vhs:CustomShader = new CustomShader("VHS/tally");

function create() {
    if(Options.gameplayShaders) {
        FlxG.game._filters = [];
        FlxG.game.addShader(vhsblur);
        FlxG.game.addShader(monitorEffect);
        if (PlayState.instance.seenCutscene) FlxG.game.addShader(vhs);
    }
}

function postPostCreate() {
    FlxG.cameras.add(camOther = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;

    var date  = new FunkinText(20, FlxG.height - 60, 0,
        ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"][Date.now().getMonth()] + ". " + Date.now().getDate() + " " + (FlxG.save.data.tallyYear ??= FlxG.random.int(1990, 1999)), 48, false);
    for(a in [
        idk = new FunkinText(20, 12, 0, "REC", 48, false),
        date,
        newTimer = new FunkinText(20, FlxG.height - 108, 0, "00:00:00", 48, false)
    ])
        add(a).camera = camOther;

    camGame.zoom = defaultCamZoom += 0.03;
    camMoveAmt /= 4;

    insert(members.indexOf(dad), walls = new FlxBackdrop(Paths.image("stages/tallymark/scroll"), FlxAxes.X)).velocity.x = 375/2;
    if (!Options.lowMemoryMode) {
        insert(members.indexOf(dad), scary = new FlxBackdrop(Paths.image("stages/tallymark/scary"), FlxAxes.X)).screenCenter(FlxAxes.Y);
        scary.velocity.x = 375/2;
        scary.alpha = 0;
    }

    var shaderfix:FunkinSprite = new FunkinSprite().makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK);
    insert(0, shaderfix).scrollFactor.set();
    shaderfix.zoomFactor = 0;

    for(a in [accuracyTxt, scoreTxt, missesTxt, newHealthBarBG, iconP2]) remove(a);
    healthBar.visible = idk.visible = iconP1.visible = false;

    
}

function update() {
    if(Options.gameplayShaders)
        vhs.iTime = Conductor.songPosition / 1000;

    if(Conductor.songPosition >= 0)
        newTimer.text = StringTools.replace("0" + FlxStringUtil.formatTime(Conductor.songPosition / 1000, true), ".", ":");
}

function beatHit(_:Int)
    idk.visible = _ % 2 == 0;

function destroy() FlxG.game.removeShader(vhs);
function onGamePause() FlxG.game.removeShader(vhs);
function onSubstateClose() if (paused && Options.gameplayShaders) FlxG.game.addShader(vhs);
function onSongEnd() FlxG.game.removeShader(vhs);