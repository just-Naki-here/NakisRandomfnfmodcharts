public var camGaze;
public var camSonic;
public var camFlashers;

function postCreate() {
    camGaze = new FlxCamera();
    camSonic = new FlxCamera();
    camFlashers = new FlxCamera();

    FlxG.cameras.remove(camHUD,false);

    for (c in [camGaze, camFlashers, camSonic]) {
        FlxG.cameras.add(c, false);
        c.bgColor = FlxColor.TRANSPARENT;
    }

    FlxG.cameras.add(camHUD, false);

    strumLines.members[0].characters[3].camera = camGaze;
    for (c in strumLines.members[1].characters) c.camera = camSonic;
}

function postUpdate() {
    for (c in [camGaze,camSonic]){
        c.scroll.x = camGame.scroll.x;
        c.scroll.y = camGame.scroll.y;
        c.zoom = camGame.zoom;
    }

    camFlashers?.shake(0.001,0.05);
}