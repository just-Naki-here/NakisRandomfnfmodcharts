
import flixel.addons.display.FlxBackdrop;
import openfl.display.BlendMode;
import Shadow;

final water = new CustomShader('water');
final blur = new CustomShader('blur');

// Extra character sprites.
public var redNmi;
public var nmiAnim1;
public var nmiAnim2;
var shadows = [];

// Additional stage parts.
public var coolFlash;
public var fogwar;

public var stageParts = [];
public var scrollerBG;
public var scroller;
public var cracked;

function postCreate() {
    redNmi = strumLines.members[0].characters[1];
    nmiAnim1 = strumLines.members[0].characters[2];
    nmiAnim2 = strumLines.members[0].characters[3];

    redNmi.alpha = nmiAnim1.alpha = nmiAnim2.alpha = 0;

    insert(members.indexOf(floor), coolFlash = new FlxSprite(0,500).makeGraphic(FlxG.width*2,FlxG.height*2,FlxColor.RED)).screenCenter();
    coolFlash.scrollFactor.set();
    coolFlash.blend = BlendMode.ADD;
    coolFlash.alpha = 0;

	insert(members.indexOf(bg) + 1, fogwar = new FlxBackdrop(Paths.image('stages/genesis/fogLoop'), true)).scale.set(0.8, 0.8);
	fogwar.updateHitbox();
	fogwar.y += 220;
	fogwar.blend = BlendMode.ADD;
	fogwar.velocity.x = 90;
	fogwar.shader = water;

    insert(members.indexOf(redNmi) - 1,scrollerBG = new FlxSprite().makeGraphic(FlxG.width*3,FlxG.height*3,FlxColor.RED));
    scrollerBG.screenCenter();
    scrollerBG.scrollFactor.set();
    scrollerBG.alpha = 0;

    insert(members.indexOf(redNmi) - 1,scroller2 = new FlxBackdrop(Paths.image('stages/genesis/brainWashing'), FlxAxes.X,-18));
    scroller2.y = -100;
    scroller2.scale.set(0.46,0.46);
    scroller2.updateHitbox();
    scroller2.screenCenter(FlxAxes.X);
    scroller2.velocity.x = -(800 * 2);
    scroller2.alpha = 0;

    insert(members.indexOf(redNmi) - 1,scroller3 = new FlxBackdrop(Paths.image('stages/genesis/brainWashing'), FlxAxes.X,-18));
    scroller3.y = 500;
    scroller3.scale.set(0.46,0.46);
    scroller3.updateHitbox();
    scroller3.screenCenter(FlxAxes.X);
    scroller3.velocity.x = -(800 * 2);
    scroller3.alpha = 0;

    insert(members.indexOf(redNmi) - 1,scroller = new FlxBackdrop(Paths.image('stages/genesis/brainWashing'), FlxAxes.X,-18));
    scroller.y = 100;
    scroller.scale.set(0.56,0.56);
    scroller.updateHitbox();
    scroller.screenCenter(FlxAxes.X);
    scroller.velocity.x = 800 * 5;
    scroller.alpha = 0;

	add(lightShine = new FlxSprite().loadGraphic(Paths.image("stages/genesis/light"))).screenCenter();
	lightShine.blend = BlendMode.ADD;

	blur.directions = 16;
    blur.quality = 4;
    blur.size = 10;

    for (c in [boyfriend, dad]) {
        s = new Shadow(c);
        s.alpha = 0.85;
        s.shader = blur;
        s.matrixExposed = true;

        switch(c) {
            case boyfriend:
                var lol = new FlxMatrix(1, 0, 1, 0.6, 523, -825);
                lol.rotate(0.03);
                s.transformMatrix = lol;

            case dad: s.transformMatrix = new FlxMatrix(1, 0, -1, 0.6, -1600, -120);
        }
        shadows.push(s);
    }

    for (p in [bg, floor, fogwar, lightShine]) stageParts.push(p);
}

public function scrollersEnable() scrollerBG.alpha = scroller.alpha = scroller2.alpha = scroller3.alpha = 1;

function update() 
	if (fogwar.exists) water.iTime = Conductor.songPosition / 1000;

function onCountdown(e) 
	if (e.soundPath != null) e.soundPath = 'intro/nmi/' + e.soundPath;

function onPlayerHit(e)  e.showRating = false;
function onStrumCreation(e) e.cancelAnimation();