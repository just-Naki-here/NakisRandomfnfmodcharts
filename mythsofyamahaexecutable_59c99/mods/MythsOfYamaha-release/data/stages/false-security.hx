
var fisheye = new CustomShader("fisheye");

var cameraSprite:FlxSprite;
var camTarget:FlxCamera;
function create() {

	importScript("data/scripts/camMove");

	picoCam = new FlxCamera();
	picoCam.bgColor = FlxColor.TRANSPARENT;

	pcClone = new FlxCamera();
	pcClone.bgColor = FlxColor.TRANSPARENT;

	FlxG.cameras.remove(camHUD,false);
	FlxG.cameras.remove(camGame,false);

	FlxG.cameras.add(pcClone,false);
	FlxG.cameras.add(camGame);
	camGame.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(picoCam, false);
	FlxG.cameras.add(camHUD, false);

	insert(members.indexOf(boyfriend),cineBartop = new FlxSprite(0,-250).makeGraphic(FlxG.width*4,FlxG.height*0.25,FlxColor.BLACK));

	add(cineBarBot = new FlxSprite(0,FlxG.height*1.5).makeGraphic(FlxG.width*4,FlxG.height*0.25,FlxColor.BLACK));

	for (item in [cineBartop,cineBarBot]){
		item.scrollFactor.set(1,0.4);
		item.camera = picoCam;
	}

	
	defaultCamZoom = 2;
	camGame.zoom = 2;
}

var unlockTypeShi;
function postCreate() {
	unlockTypeShi = FlxG.save.data.moySongsBeat;
	// dad.alpha = 0;
	// stage.stageSprites["computer-overlay"].alpha = 0.2;

	camGame.addShader(fisheye);
	fisheye.MAX_POWER = 0.0;

    boyfriend.camera = picoCam;


	camTarget = camGame;
    cameraSprite = new FlxSprite(1400,230).makeGraphic(640,360);
	cameraSpriteP2 = new FlxSprite(1400,230).makeGraphic(640,360);

	for (camSpr in [cameraSprite,cameraSpriteP2]){
		camSpr.scrollFactor.set(1,1);
		camSpr.cameras = [pcClone];
		camSpr.shader = new CustomShader("camSprite");
		add(camSpr);
	}
	cams = [camGame,picoCam];

	for (songs in ['genesis','forever-dream','premeditated','classic']){
		if (!unlockTypeShi.contains(songs)){
			trace(songs + " is NOT in");
			FlxG.switchState(new MainMenuState());
		} else 
			trace(songs + " is in");
	}
	
}
var cams:Array<FlxCamera> = null;

function update(e) {
	for (num => camSprs in [cameraSprite,cameraSpriteP2]){

		cams[num].canvas.__cacheAsBitmap = true;

		if (cams[num].canvas.__cacheBitmapRenderer != null){		
			camSprs.shader.screenBitmap = cams[num].canvas.__cacheBitmap.bitmapData;
			camSprs.shader.zoom = cams[num].zoom;
			camSprs.shader.width = cams[num].canvas.__cacheBitmap.bitmapData.width;
			camSprs.shader.height = cams[num].canvas.__cacheBitmap.bitmapData.height;
			camSprs.shader.scrollx = cams[num].scroll.x;
			camSprs.shader.scrolly = cams[num].scroll.y;
			camSprs.shader.scale = FlxG.scaleMode.scale.x > FlxG.scaleMode.scale.y ? FlxG.scaleMode.scale.x : FlxG.scaleMode.scale.y;
		}
	}

    for (cam in [picoCam,pcClone]){
        cam.scroll.x = camGame.scroll.x;
        cam.scroll.y = camGame.scroll.y;
        cam.zoom = camGame.zoom;
    }

	fisheye.MAX_POWER = lerp(fisheye.MAX_POWER, (curCameraTarget == 0 ? 0.16 : 0.2), e * 6);
}

function onSongStart() {
	// fade.visible = false;
	// FlxG.cameras.flash(FlxColor.BLACK,8);


	FlxTween.tween(camGame,{zoom: 0.75},6,{ease: FlxEase.linear,onComplete: function (twn:FlxTween) {
		defaultCamZoom = 0.75;
	}});
}