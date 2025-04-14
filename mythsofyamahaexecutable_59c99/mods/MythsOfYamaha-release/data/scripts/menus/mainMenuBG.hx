import funkin.backend.utils.DiscordUtil;

public var camFront:FlxCamera = new FlxCamera();
camFront.bgColor = 0;

//bikini bottom
public var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/mainmenu/fakeMenu/skyFull'));
var hall:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/mainmenu/fakeMenu/concertHall'));
var dunes:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/mainmenu/fakeMenu/dunes'));
var rocks:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/mainmenu/fakeMenu/rockLoops'));
var road:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/mainmenu/fakeMenu/Road'));
public var squidward:FlxSprite = new FlxSprite();
public var coral:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/mainmenu/fakeMenu/frontCoral'));

bg.scrollFactor.set(0.14, 0.14);
hall.scrollFactor.set(0.58, 0.58);
dunes.scrollFactor.set(0.6, 0.6);
rocks.scrollFactor.set(0.95, 0.95);
coral.scrollFactor.set(1.3, 1.3);
squidward.frames = Paths.getSparrowAtlas('menus/mainmenu/fakeMenu/humiwalk');
squidward.animation.addByPrefix("walk", "walk", 16, true);
squidward.visible = false;

//randomland
var bg2:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menus/mainmenu/trueMenu/bg"));
var lips:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menus/mainmenu/trueMenu/lips"));
var clouds:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menus/mainmenu/trueMenu/clouds"));
var city:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menus/mainmenu/trueMenu/buildings"));
public var ground:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menus/mainmenu/trueMenu/ground"));
var hand:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menus/mainmenu/trueMenu/hand"));

bg2.scrollFactor.set(0.1, 0.1);
lips.scrollFactor.set(0.25, 0.25);
clouds.scrollFactor.set(0.28, 0.28);
city.scrollFactor.set(0.45, 0.5);
ground.scrollFactor.set(0.5, 0.5);
hand.scrollFactor.set(0.68, 0.58);
squidward.scale.set(0.5,0.5);

var depth = new CustomShader('3d');
public var blur = new CustomShader("blur");

//FlxG.save.data.randomActive = false;

function create() {
	if (FlxG.save.data.randomActive){
		for (stuff in [bg2, lips, clouds, city, ground, hand]) {
			stuff.screenCenter();
			bg2.y -= 50;
			city.y += 3;
			ground.y = 480;
			stuff.antialiasing = true;
			add(stuff);
		}
	}
	else{
		for (stuff in [bg, hall, dunes, rocks, road, squidward, coral]) {
			stuff.screenCenter();
			bg.y -= 50;
			stuff.antialiasing = true;
			add(stuff);
		}
	}

	FlxG.camera.zoom = (FlxG.save.data.randomActive ? 0.5 : 0.43);
	if (FlxG.save.data.randomActive) {
		ground.shader = depth;
		FlxG.camera.addShader(blur);
		blur.blurSize = 0;
	}

	FlxG.cameras.add(camFront, false);
	DiscordUtil.changePresence('In the Menus', (FlxG.save.data.randomActive ? "Randomland" : "Bikini Bottom"));
	//FlxG.camera.scroll.y = 300;
	//FlxTween.tween(FlxG.camera.scroll, {y: -300}, 1, {type: FlxTween.PINGPONG, ease: FlxEase.quadInOut});
}
public var depthLock = false;
function update(elapsed) {
	if (FlxG.save.data.randomActive) {
		if (!depthLock) {
			depth.curveX = (((FlxG.camera.scroll.x + (FlxG.width / 2)) - ground.getMidpoint().x) / ground.scrollFactor.x) / Math.PI / ground.width;
    		depth.curveY = (((FlxG.camera.scroll.y + (FlxG.height / 2)) - ground.getMidpoint().y) * ground.scrollFactor.y) / Math.PI / ground.height*1.5;
		} else {
			depth.curveX = 0;
			depth.curveY = -0.443;
		}
	}
}