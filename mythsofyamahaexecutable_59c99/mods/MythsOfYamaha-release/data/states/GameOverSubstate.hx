import openfl.Lib;

var fakeCamFollow:FlxSprite;
var replaceCamera:Bool = false;
var daCharacter:Character;
var fakeCamZoom:Float;
var doBeatAnim:Bool = true;
var canLoop:Bool = false;

var createNewCharacter:Bool = false;

function create()
{
    var position:Array<{x:Float,y:Float}> = [{x: 0, y: 0}];

    createNewCharacter = PlayState.instance.boyfriend.gameOverCharacter != characterName;

    PlayState.deathCounter++;

    daCharacter = new Character(PlayState.instance.boyfriend.x, PlayState.instance.boyfriend.y, PlayState.instance.boyfriend.gameOverCharacter, true);
    if (createNewCharacter)
    {
        daCharacter.danceOnBeat = false;
        daCharacter.playAnim('firstDeath');
        add(daCharacter);
    }

    fakeCamZoom = 1;
    switch (daCharacter.curCharacter)
    {
        case 'propa_sponge':
            fakeCamZoom = 0.7;
            position[0].x = 620 + daCharacter.x;
            position[0].y = 300 + daCharacter.y;
        case 'berryfriend-dead':
            fakeCamZoom = 0.6;
            doBeatAnim = false;
            canLoop = true;
            position[0].x = 140 + daCharacter.x;
            position[0].y = 390 + daCharacter.y;
        case 'bf-dead':
            position[0].x = 200 + daCharacter.x;
            position[0].y = 450 + daCharacter.y;
        case 'bf_mcm':
            fakeCamZoom = 1.4;
            position[0].x = 200 + daCharacter.x;
            position[0].y = 450 + daCharacter.y;
        default:
            var camPos = daCharacter.getCameraPosition();
            position[0].x = camPos.x + daCharacter.x;
            position[0].y = camPos.y + daCharacter.y; 
    }

    fakeCamFollow = new FlxSprite(position[0].x, position[0].y).makeSolid(1, 1, 0xFFFFFFFF);
    fakeCamFollow.visible = false;
    add(fakeCamFollow);
    replaceCamera = true;

    window.title = "Mistful Crimson Morning - " + PlayState.SONG.meta.name + " - GAME OVER";
}

function postCreate()
{
    FlxG.camera.bgColor = 0xFF000000;
    if (!createNewCharacter)
        return;

    for (member in members)
        if (Std.isOfType(member, Character))
        {
            if (member == daCharacter)
                continue;

            remove(member);
            break;
        }
}

function beatHit(curBeat:Int)
{
    if (!createNewCharacter)
        return;

    if (FlxG.sound.music != null && FlxG.sound.music.playing && doBeatAnim){
        trace('test');
        daCharacter.playAnim("deathLoop", false);
    }
}

function update(elapsed:Float)
{
    FlxG.camera.zoom = lerp(FlxG.camera.zoom, fakeCamZoom, 0.05);
    if(replaceCamera){
        FlxG.camera.target = fakeCamFollow;
        replaceCamera = false;
    }

    for (member in members)
        if (Std.isOfType(member, Character))
        {
            member.lastAnimContext = "LOCK"; //i hate the fact that i have to add this WHY DOES THE IDLE PLAY IN THE DEATH SCREEN
        }

    if (createNewCharacter)
    {
        if (controls.ACCEPT && !isEnding)
            daCharacter.playAnim("deathConfirm", true);

        if(!isEnding && (daCharacter.getAnimName() == "deathConfirm" && daCharacter.isAnimFinished()) && canLoop)
            daCharacter.playAnim("deathConfirm-loop", true);

        if (!isEnding && ((!lossSFX.playing) || (daCharacter.getAnimName() == "firstDeath" && daCharacter.isAnimFinished())) && (FlxG.sound.music == null || !FlxG.sound.music.playing)) 
        {
            CoolUtil.playMusic(Paths.music(gameOverSong), false, 1, true, 100);
            daCharacter.playAnim("deathLoop", true);
        }
    }

    if (controls.BACK)
        isEnding = true; //fix that one music bug that codename somehow neglected
}