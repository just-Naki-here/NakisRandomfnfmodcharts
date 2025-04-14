import flixel.math.FlxBasePoint;

static var camMoveOffset:Float = 10;
static var camFollowChars:Bool = true;
public var currentNumber = 0;
public var currentNumberBF = 0;

var movement = new FlxBasePoint();

function create() {
    camFollowChars = true;
}

function postCreate() {
    var cameraStart = strumLines.members[curCameraTarget].characters[0].getCameraPosition();
    cameraStart.y -= 100; FlxG.camera.focusOn(cameraStart);

    allowGitaroo = false;
}

function onCameraMove(camMoveEvent) {
    if (camFollowChars) {
        if (camMoveEvent.strumLine != null && camMoveEvent.strumLine?.characters[camMoveEvent.strumLine.opponentSide ? currentNumber : currentNumberBF] != null) {
            switch (camMoveEvent.strumLine.characters[camMoveEvent.strumLine.opponentSide ? currentNumber : currentNumberBF].animation.name) {
                case "singLEFT" | "singLEFT-alt" | "singLEFT-loop": movement.set(-camMoveOffset, 0);
                case "singDOWN" | "singDOWN-alt" | "singDOWN-loop": movement.set(0, camMoveOffset);
                case "singUP" | "singUP-alt" | "singUP-loop": movement.set(0, -camMoveOffset);
                case "singRIGHT" | "singRIGHT-alt" | "singRIGHT-loop": movement.set(camMoveOffset, 0);
                default: movement.set(0,0);
            };
            camMoveEvent.position.x += movement.x;
			camMoveEvent.position.y += movement.y;
        }
    } else camMoveEvent.cancel();
}

function destroy() {camFollowChars = true; camMoveOffset = 10; currentNumber = 0; currentNumberBF = 0;}