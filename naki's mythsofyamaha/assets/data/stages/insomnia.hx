
import openfl.display.BlendMode;

function onPlayerHit(e) e.showRating = false;

public var switlfx:FunkinSprite;

function postCreate() {
	// importScript("data/scripts/camMove");

	rsePov = strumLines.members[0].characters[1];
	rsePov.visible = false;

	for (shit in [iconP1,iconP2,scoreTxt,missesTxt,accuracyTxt,healthBar,healthBarBG]) shit.visible = false;

	add(switlfx = new FunkinSprite().loadGraphic(Paths.image("stages/classic/swirl"))).blend = BlendMode.MULTIPLY;
	switlfx.scrollFactor.set();
	switlfx.scale.set(2,2);
	switlfx.updateHitbox();
	switlfx.screenCenter();
	switlfx.y -= 100;
	switlfx.alpha = 0.4;
	switlfx.visible = false;

	insert(0,vig = new FunkinSprite().loadGraphic(Paths.image("stages/classic/vig")));
	vig.camera = camHUD;
	vig.color = FlxColor.BLACK;
	vig.alpha = 0.1;
}

function update(e) {
	for (a in strumLines.members[1])
		a.alpha = FlxMath.lerp(a.alpha, (curCameraTarget == 1 ? 0.9 : 0.6), FlxMath.bound(e * 8, 0, 1));
}