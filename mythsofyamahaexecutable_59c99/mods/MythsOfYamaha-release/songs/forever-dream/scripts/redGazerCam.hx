
public var camGaze:FlxCamera;
public var camSonic:FlxCamera;
public var camFlashers:FlxCamera;

function postCreate() {

    camGaze = new FlxCamera();
    camSonic = new FlxCamera();
    camFlashers = new FlxCamera();

    FlxG.cameras.remove(camHUD,false);
    FlxG.cameras.add(camGaze, false);
    FlxG.cameras.add(camFlashers, false);
    FlxG.cameras.add(camSonic, false);
    FlxG.cameras.add(camHUD, false);

    camGaze.bgColor = FlxColor.TRANSPARENT;
    camSonic.bgColor = FlxColor.TRANSPARENT;
    camHUD.bgColor = FlxColor.TRANSPARENT;
    camFlashers.bgColor = FlxColor.TRANSPARENT;

    strumLines.members[0].characters[3].camera = camGaze;

    for (char in strumLines.members[1].characters){
        char.camera = camSonic;
    }
}

function postUpdate() {
    for (cams in [camGaze,camSonic]){
        cams.scroll.x = camGame.scroll.x;
        cams.scroll.y = camGame.scroll.y;
        cams.zoom = camGame.zoom;
    }

    camFlashers?.shake(0.001,0.05);
}