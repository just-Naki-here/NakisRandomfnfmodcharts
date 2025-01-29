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

    new FlxTimer().start(2, () -> {FlxG.sound.play(Paths.sound('menu/voicelines/3'), 0.7);});
    new FlxTimer().start(6, () -> {FlxG.cameras.remove(newCam); close();});
}