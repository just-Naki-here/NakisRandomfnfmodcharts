import flixel.text.FlxTextFormatMarkerPair;
import flixel.text.FlxTextFormat;
import openfl.display.BlendMode;

var grpGems:FlxTypedGroup;

function create() {
    for(a in [
        scorTXT = new FunkinText(235, 10, 0, "SCORE:", 40, true),
        accTXT = new FunkinText(235, 10 + scorTXT.size * 2, 0, "ACCURACY:", scorTXT.size, true)
    ]) {
        add(a);
        a.font = Paths.font("BigShouldersText-Light.ttf");
        a.camera = camHUD;
        a.borderSize = 2.25;
    }

    updateScores();
}

function postCreate() {
    doIconBop = iconP1.antialiasing = iconP1.antialiasing = accuracyTxt.visible = scoreTxt.visible = missesTxt.visible = false;
    iconP1.scale.x = iconP1.scale.y = iconP2.scale.x = iconP2.scale.y = 0.6;
    for(thing in [iconP1, iconP2, healthBar, healthBarBG]) thing.visible = false; //thing.x += FlxG.width/13;

    add(border = new FlxSprite().loadGraphic(Paths.image("stages/forever/border"))).camera = camHUD;
	border.screenCenter();
	border.scale.x = border.scale.y = 0.75;
    
    places = new FunkinSprite(0, 660);
    places.frames = Paths.getSparrowAtlas("game/stargazerUI/places");
    for(a in ["first", "second"]) places.animation.addByPrefix(a, a, 1, false);
    places.camera = camHUD;
	places.scale.set(3,3);
	places.setPosition(310, FlxG.height*0.84);
    places.animation.play("second");
    add(places);

    // camHUD.alpha = 0;
    for (things in [scorTXT,accTXT,border,places]){
        things.visible = false;
    }

    grpGems = new FlxTypedGroup();
    grpGems.camera = camHUD;
    add(grpGems);

    for (i in 0...7){
        gem = new FlxSprite((i*60) + 600,FlxG.height*0.9);

        gem.frames = Paths.getSparrowAtlas('game/stargazerUI/emptyGems');
        gem.animation.addByPrefix('idle', 'idle', 4, false);
        gem.ID = i;
        gem.scale.set(0.2,0.2);
        gem.updateHitbox();
        gem.visible = false;
        grpGems.add(gem);
    }

    //implement later -lus
    
    // add(iceMiddle = new FlxSprite().loadGraphic(Paths.image('stages/forever/blizzard/ice')));
    // iceMiddle.camera = camHUD;
    // iceMiddle.blend = 12;
    // iceMiddle.scale.set(0.8,0.8);
    // iceMiddle.updateHitbox();
    // iceMiddle.screenCenter();
    // iceMiddle.alpha = 0;//0.4;

    // add(iceOver = new FlxSprite().loadGraphic(Paths.image('stages/forever/blizzard/iceoverlay')));
    // iceOver.camera = camHUD;
    // iceOver.blend = 5;
    // iceOver.scale.set(0.8,0.8);
    // iceOver.updateHitbox();
    // iceOver.screenCenter();
    // iceOver.alpha = 0;//0.7;
}

function beatHit(beat:Int){
    places.animation.play(iconP1.health > iconP2.health ? "first" : "second");

    for (gem in grpGems){
        gem.animation.play('idle');
        
        if (gemsCollected == (gem.ID + 1)) gem.visible = true;
    }

    if (gemsCollected == 1)
        grpGems.members[0].color = gemsCol[0];

    if (gemsCollected == 2)
        grpGems.members[1].color = gemsCol[1];

    if (gemsCollected == 3)
        grpGems.members[2].color = gemsCol[2];

    if (gemsCollected == 4)
        grpGems.members[3].color = gemsCol[3];

    if (gemsCollected == 5)
        grpGems.members[4].color = gemsCol[4];

    if (gemsCollected == 6)
        grpGems.members[5].color = gemsCol[5];

    if (gemsCollected == 7)
        grpGems.members[6].color = gemsCol[6];

    /**
     * my brain hurty will loop this later ~luscious
     */


    // if (beat % 6 == 0){
    //     FlxG.sound.play(Paths.sound('icecrack'),0.4).pitch = FlxG.random.float(0.4,1.4);
    // }
}

// var iceTargets:Array<Float> = [0,0];//[0.4,0.7];
// function update(e:Float) {
//     for (num => stuff in [iceMiddle,iceOver]){
//         stuff.alpha = lerp(stuff.alpha,iceTargets[num],0.25);
//     }
// }

function onRatingUpdate()
    updateScores();

function onPlayerMiss()
    updateScores();

function updateScores() {
    scorTXT.applyMarkup("*SCORE:* " + songScore, [new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF8F00), "*")]);
    accTXT.applyMarkup("*ACCURACY:* [" + Std.string(accuracy * 100 == -100 ? 0 : accuracy * 100).substr(0, 5) + "%]", [new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF8F00), "*")]);
}

function onNoteHit(e) {
	e.ratingScale = e.numScale *= 15;
    e.ratingPrefix = "game/score/sonic-racers/";
    e.numAntialiasing = e.ratingAntialiasing = false;
}

function showMoreHud() {
    for (things in [scorTXT,accTXT,border,places]){
        things.visible = true;
    }
}

var hudTween:FlxTween = null;
function hideHud(?toggle:String,?amt = 0.45) {
    hudTween?.cancel();
    if (toggle == 'true')
        camHUD.alpha = 0;
    else {
        hudTween = FlxTween.tween(camHUD,{alpha: 0.8},amt,{ease: FlxEase.circOut});
    }       
}