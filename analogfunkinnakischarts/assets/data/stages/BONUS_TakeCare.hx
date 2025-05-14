var vignette:FunkinSprite;

function postCreate() {
    insert(0, vignette = new FunkinSprite()).frames = Paths.getSparrowAtlas("stages/takecare/vignette");
		vignette.animation.addByPrefix("vignette", "vignette", 24, true);
		vignette.animation.play("vignette");
		vignette.screenCenter();
		vignette.camera = camHUD;
		vignette.zoomFactor = 0;
}