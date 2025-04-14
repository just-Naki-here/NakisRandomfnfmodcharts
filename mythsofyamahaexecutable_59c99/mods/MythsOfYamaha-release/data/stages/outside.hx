import hxvlc.flixel.FlxVideoSprite;

var jelly2Group:FlxTypedGroup;
var jelly3Group:FlxTypedGroup;

public var humisky:FlxVideoSprite;

function postCreate() {
    humisky = new FlxVideoSprite();
    humisky.load(Assets.getPath(Paths.video("HumiSky")), [':input-repeat=655535']);
    humisky.bitmap.onFormatSetup.add(function() {
        humisky.setGraphicSize(FlxG.width * 2, FlxG.height * 2);
        humisky.screenCenter();
        humisky.y -= 200;
    });
    humisky.play();
    humisky.scrollFactor.set(0.36, 0.36);
    humisky.alpha = 0;
    insert(members.indexOf(bg) + 1, humisky);

    for (i in [bg, bg2]) i.alpha = 1;
    

    jelly2Group = createJellyGroup(55, 0.4, 0.4);
    insert(members.indexOf(bg2), jelly2Group);

    jelly3Group = createJellyGroup(45, 0.5, 0.5);
    insert(members.indexOf(bg2), jelly3Group);
}

// some helper functions so we dont have to repeatedly do the same thing
function createJellyGroup(count:Int, scrollX:Float, scrollY:Float): FlxTypedGroup {
    var group = new FlxTypedGroup();
    group.cameras = [camGame];
    
    for (i in 0...count) {
        var randomFPS = 80;
        var jelly = new FlxSprite(300, 300);
        jelly.frames = Paths.getSparrowAtlas('stages/Outside/jellyParticle');
        jelly.animation.addByPrefix('idle', 'jellyfly', randomFPS, true);
        jelly.ID = i;
        
        var scaleJelly = FlxG.random.float(0.03, 0.07);
        jelly.scale.set(scaleJelly, scaleJelly);
        jelly.updateHitbox();
        jelly.scrollFactor.set(scrollX, scrollY);

        jelly.x += -100 * i - FlxG.random.int(-700, 500);
        jelly.y += 110 * i;
        jelly.alpha = 0;
        jelly.angle = 45;
        
        jelly.animation.play('idle', true);
        jelly.animation.curAnim.curFrame = FlxG.random.int(0, 54);

        group.add(jelly);
    }
    
    return group;
}

function stepHit(step) {
    switch (step) {
        case 1040:
            for (i in [bg, bg2]) i.alpha = 1;
            setJellyVelocity(jelly2Group);
            setJellyVelocity(jelly3Group);
        case 1168:
            setJellyAlpha(jelly2Group, 0);
            setJellyAlpha(jelly3Group, 0);
    }
}
// same goes for this
function setJellyVelocity(group:FlxTypedGroup) {
    for (jelly in group.members) {
        jelly.alpha = 1;
        var velocity = FlxG.random.float(150, 300);
        jelly.velocity.y = -velocity;
        jelly.velocity.x = velocity;
    }
}

function setJellyAlpha(group:FlxTypedGroup, alphaValue:Float) for (jelly in group.members) jelly.alpha = alphaValue;