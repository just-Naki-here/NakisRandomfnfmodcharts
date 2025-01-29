
public var superSpark:FlxSprite;
public var gemBec:FlxSprite;
var sparkTween:FlxTween;

// var dataStuff = [
//     153268 => 660,
//     153527 => 0,
//     153604 => 0,
//     153621 => 0,
//     153714 => 0,
//     153818 => 0,
//     154007 => 0
// ];


/**
 * 660
 * 
 */
function postCreate() {
    add(superSpark = new FlxSprite());
    superSpark.frames = Paths.getSparrowAtlas('stages/forever/Glitter');
    superSpark.animation.addByPrefix('playOnce', 'glitters0', 24, false);
    superSpark.animation.addByPrefix('playLoop', 'glitters0', 24, true);
    
    // superSpark.animation.play('playOnce');

    superSpark.animation.finishCallback = (name: String) -> {
        sparkTween?.cancel();
        sparkTween = FlxTween.tween(superSpark,{alpha: 0},.45,{ease: FlxEase.circOut});
    }
    superSpark.camera = camSonic;
    superSpark.scale.set(2,2);
    superSpark.updateHitbox();
    superSpark.setPosition(boyfriend.x + 180,boyfriend.y + 340);
    superSpark.alpha = 0;



    add(gemBec = new FlxSprite(playerStrums.members[1].x - 40,0).loadGraphic(Paths.image('stages/forever/becon')));
    gemBec.camera = camHUD;
    gemBec.scale.set(0.3,0.3);
    gemBec.updateHitbox();
    gemBec.flipY = camHUD.downscroll;
    gemBec.alpha = 0.2;
    gemBec.y = 140;
    gemBec.alpha = 0;
    // trace(gemBec.x);
}

function notePlace(what = 0) {
    FlxTween.tween(gemBec,{alpha: 1},0.25,{ease: FlxEase.linear});
    // gemBec.alpha = 1;
    gemBec.x = playerStrums.members[Std.parseInt(what)].x - 40;
}

function beatHit(beat:Int) {
    if (beat % 2 == 0){
        gemBec.color = gemsCol[gemsCollected];    
    }
}

function stepHit(step:Int) {
    if (step == 1708){
        if (gemsCollected == 7){ //ie 7 gems
            goSuper();
        }
    }
}

function goSuper() {
    switchChar(true,1);
    strumLines.members[1].characters[1].playAnim("change");
    strumLines.members[1].altAnim = false;
    strumLines.members[1].characters[2].idleSuffix = "";

    strumLines.members[1].characters[1].animation.finishCallback = function(anim:String){
        if (anim == "change"){
            switchChar(true,2);
            superSpark.alpha = 1;
            superSpark.animation.play('playLoop');
        }
    }
}