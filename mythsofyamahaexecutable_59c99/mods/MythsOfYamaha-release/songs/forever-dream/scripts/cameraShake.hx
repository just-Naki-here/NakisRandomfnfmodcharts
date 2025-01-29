
// function postCreate() {
    
// }

var shakeDur:Float = 0.25;
var shakeIntns:Float = 0.0;
// function postUpdate(e) {
    
// }

function beatHit(beat:Int) {
    if (beat % 4 == 0){
        FlxG.cameras.shake(shakeIntns,shakeDur);
    }
}


var updateShakeDur:Float = 0.0;
var updateShakeInt:Float = 0.0;
function update(e) {
    if (updateShakeInt > 0.0 && updateShakeDur > 0.0)
        FlxG.cameras.shake(updateShakeInt,updateShakeDur);
}

function stepHit(step:Int) {
    switch(step){
        case 864:
            shakeIntns = 0.002;
        case 992:
            shakeIntns = 0.0;

        case 1056:
            updateShakeDur = 0.2;
            updateShakeInt = 0.0015;

        case 1176:
            updateShakeDur = 0;
            updateShakeInt = 0;
    }
}