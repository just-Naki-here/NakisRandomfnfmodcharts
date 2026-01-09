function create() {
    persistentUpdate = false;
    camera = newCam = new FlxCamera();
    FlxG.cameras.add(newCam, false);
    
    add(fuck = new FlxSprite().makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK)).alpha = 0.5;
    fuck.camera = newCam;

    add(descTxt = new FunkinText(0, FlxG.height * 0.75, 0, "HOVER AND CLICK OVER THE HEADS\nOR ELSE...", 32, true));
    descTxt.screenCenter();
    descTxt.x -= 80;
    descTxt.camera = newCam;

    add(face = new FunkinSprite(450,430).loadGraphic(Paths.image('stages/genesis/warning')));

    face.scale.set(0.65,0.65);
    face.updateHitbox();

    new FlxTimer().start(2, () -> {FlxG.sound.play(Paths.sound('menu/voicelines/freeplay/3'), 0.7).pitch = 0.9;});
    new FlxTimer().start(6, () -> {FlxG.cameras.remove(newCam); close();});
}