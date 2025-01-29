import flixel.addons.effects.FlxTrail;

public var dadTrail:FlxTrail;
public var bfTrail:FlxTrail;

public var superBfTrail:FlxTrail;

function postCreate() {
    var redChar = strumLines.members[0].characters[3];
    dadTrail = new FlxTrail(redChar, null, 6, 2, 0.48, 0.069);
    dadTrail.beforeCache = redChar.beforeTrailCache;
    dadTrail.afterCache = () -> {redChar.afterTrailCache();}
    dadTrail.visible = false;

    var sonic = strumLines.members[1].characters[0];
    bfTrail = new FlxTrail(sonic, null, 6, 3, 0.3, 0.069);
    // bfTrail.beforeCache = sonic.beforeTrailCache;
    // bfTrail.afterCache = () -> {sonic.afterTrailCache();}


    var superSonic = strumLines.members[1].characters[2];
    superBfTrail = new FlxTrail(superSonic, null, 6, 3, 0.3, 0.069);
    superBfTrail.beforeCache = superSonic.beforeTrailCache;
    superBfTrail.afterCache = () -> {superSonic.afterTrailCache();}
    superBfTrail.visible = false;
}

function swapTrails(isPlayer = 'bf') {
    if (isPlayer == 'bf'){
        if (gemsCollected == 7){
            // trace("checked");
            // bfTrail.destroy();
            remove(bfTrail);
            superBfTrail.visible = true;

            // removeTrail('bf');
        }
    } else {
        dadTrail.visible = true;
    }
}

function removeTrail(isPlayer = 'bf') {
    if (isPlayer == 'bf'){
        for (trail in [bfTrail]) remove(trail);
    } else {
        for (trail in [dadTrail]) remove(trail);
    }
}

function trails(toggle = 'false') {
    if (toggle == 'true'){
        for (trail in [dadTrail,bfTrail,superBfTrail]) add(trail);
    } else {
        for (trail in [dadTrail,bfTrail,superBfTrail]) remove(trail);
    }
}