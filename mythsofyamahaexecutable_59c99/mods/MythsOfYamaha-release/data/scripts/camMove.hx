
//0 is dad
//1 is bf

/**
 * THESE ARE DEFAULT VALUES DONT TOUCH
 */
public var boyfriendZoom:Float = 0.7;
public var dadZoom:Float = 0.7;

public var camOffAmt:Float = 15;

public var camZoomSpeed:Float = 6;

public var manualZoom:Bool = false;

/**
 * HERE FOR PER STAGE OFFSETS
 */

function postCreate() {
    switch(curStage){

        case 'genesis':
            dadZoom = 0.74;

            boyfriendZoom = 0.8;

            camOffAmt  = 20;

        case 'dream':
            dadZoom = 0.57;
            boyfriendZoom = 0.4;

            camOffAmt  = 35;

        case 'premed': 
            camOffAmt = 0;
            boyfriendZoom = dadZoom = defaultCamZoom;

        case "insomnia":
            dadZoom = 1;

            boyfriendZoom = 0.7;

            // angleOffsetMono = 2;

            // angleOffsetting = true;
        case "false-security":
            camOffAmt = 25;
        default:
            boyfriendZoom = dadZoom = defaultCamZoom;
    }
}

function changeZoomScript(leCharacter:String,zoomLvl:Float){
    switch(leCharacter){
        case "dad":
            dadZoom = Std.parseFloat(zoomLvl);
        case "bf":
            boyfriendZoom = Std.parseFloat(zoomLvl);

        default:
            trace("error");
    }
}

function postUpdate(elapsed:Float) {
    final _curCamOffset: Float = (camOffAmt + (camOffAmt * (1 - defaultCamZoom)));
    switch(strumLines.members[curCameraTarget].characters[0].getAnimName()) {
        case "singLEFT", "singLEFT-alt": 
            camFollow.x -= _curCamOffset;

        case "singDOWN", "singDOWN-alt": 
            camFollow.y += _curCamOffset;
        
        case "singUP", "singUP-alt": 
            camFollow.y -= _curCamOffset;
        
        case "singRIGHT", "singRIGHT-alt": 
            camFollow.x += _curCamOffset;
    }
    
    if (!manualZoom) defaultCamZoom = lerp(defaultCamZoom, (curCameraTarget == 0 ? dadZoom : boyfriendZoom), elapsed * camZoomSpeed);    
}