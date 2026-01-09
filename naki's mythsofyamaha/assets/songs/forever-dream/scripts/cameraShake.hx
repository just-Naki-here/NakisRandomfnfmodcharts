
var shakeDur = 0.25;
var shakeIntns:Float = 0.0001;

var updateShakeDur, updateShakeInt = 0;

function beatHit(b) 
    if (b % 4 == 0) FlxG.cameras.shake(shakeIntns,shakeDur);

// function update(e) 
    // if (updateShakeInt > 0 && updateShakeDur > 0) FlxG.cameras.shake(updateShakeInt,updateShakeDur);

function stepHit(s) {
    switch(s){
        case 0:
            shakeIntns = 0.003; 
        case 864: shakeIntns = 0.002;
        case 992: shakeIntns = 0;

        case 1056:
            updateShakeDur = 0.2;
            updateShakeInt = 0.0015;

        case 1176: updateShakeDur = updateShakeInt = 0;
    }
}