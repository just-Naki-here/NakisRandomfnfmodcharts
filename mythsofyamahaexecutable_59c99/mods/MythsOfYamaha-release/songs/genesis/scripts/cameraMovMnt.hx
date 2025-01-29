
import flixel.addons.display.FlxBackdrop;

var spikesTarget = [];

var opponentTarget = [356,-100,8];
public var opponentAlpTarget = 0;
var playerTarget = [336,-100,8];

function create() {
    spikesTarget = [(camHUD.downscroll ? -600 : -630),(camHUD.downscroll ? -600 : 700),8];
}

function postCreate() {
    insert(members.indexOf(dad)-1,topSpike = new FlxBackdrop(Paths.image("menus/spikesB"),FlxAxes.X, 0, 0));
    topSpike.y = (camHUD.downscroll ? -600 : -630);
    topSpike.scrollFactor.set(0.6,0);
    topSpike.flipY = true;
    topSpike.velocity.x = -80;
    topSpike.updateHitbox();
    
    insert(1,botSpike = new FlxBackdrop(Paths.image("menus/spikesB"),FlxAxes.X, 0, 0));
    botSpike.y = (camHUD.downscroll ? -600 : 700);
    botSpike.camera = camHUD;
    botSpike.velocity.x = 80;

    for (strumThing in cpuStrums.members)
        strumThing.y = opponentTarget[1];
}

function onEvent(e:EventGameEvent){
    if (e.event.name == "Camera Movement"){
        for (i => bars in [topSpike,botSpike]){
            bars.velocity.x *= 1.5;

            new FlxTimer().start((Conductor.stepCrochet / 1000) * 2, function(){
                bars.velocity.x = (i == 0 ? -1 : 1) * 80;
            });
        }
    }
}

function update(e) {
    if (topSpike.exists) 
        for (i => s in [topSpike, botSpike])
            if (s.y != spikesTarget[i])
                s.y = lerp(s.y, spikesTarget[i], FlxMath.bound(e * spikesTarget[2], 0, 1));
    
    for (num => strumThing in cpuStrums.members){
        if (cpuStrums.members[3].x != (opponentTarget[0] + 300))
            strumThing.x = lerp(strumThing.x,(num * 100) + opponentTarget[0], FlxMath.bound(e * opponentTarget[2], 0, 1));

        if (cpuStrums.members[3].y != opponentTarget[1])
            strumThing.y = lerp(strumThing.y,opponentTarget[1],FlxMath.bound(e * opponentTarget[2], 0, 1));
    }

    // this part here is the most fragile, i disabled it temporarily until someone manages to handle it properly
    // id suggest replacing the  lerps here with tweens or smth so that it doesnt run every frame

    // for (strumThing in cpuStrums.notes){
    //     if (strumThing.alpha >= opponentAlpTarget + 0.05)
    //         strumThing.alpha = lerp(strumThing.alpha, opponentAlpTarget, FlxMath.bound(e * 4, 0, 1));
    // }

    if (camNmi.alpha != opponentAlpTarget)
        camNmi.alpha = lerp(camNmi.alpha, opponentAlpTarget, FlxMath.bound(e * 4, 0, 1));

    for (num => strumThing in playerStrums.members){
        if (curStep < 2336 && playerStrums.members[3].x != (playerTarget[0] + 300)) 
            strumThing.x = lerp(strumThing.x,(num * 100) + playerTarget[0], FlxMath.bound(e * playerTarget[2], 0, 1));

        if (playerStrums.members[3].y != playerTarget[1])
            strumThing.y = lerp(strumThing.y,playerTarget[1],FlxMath.bound(e * playerTarget[2], 0, 1));
    }
}

function stepHit(s) {
    switch(s){
        case 278:
            opponentTarget[1] = playerTarget[1] = 50;
            playerTarget[2] = 21;
        case 284: playerTarget[2] = 8;

        // case 412,418,424, 540,546,552: 
        //     camNmi.alpha = 0.6;
        //     trace("notes vis");

        // case 444,450,456, 572,578,584: camNmi.alpha = 0.4;
        // case 676: camNmi.alpha = 1;

        case 700:
            camNmi.alpha = 1;

            // opponentTarget[2] = playerTarget[2] = 21;
            opponentAlpTarget = 1;
            opponentTarget[0] = 120;
            playerTarget[0] = 760;
            
            opponentTarget[1] = playerTarget[1];
            trace(dadZoom);
            dadZoom += 0.2;

            trace(strumLines.members[0].characters[0].cameraOffset.x);
            strumLines.members[0].characters[0].cameraOffset.x -= 800;

            boyfriendZoom = 0.77;

        // case 952:
        //     opponentAlpTarget = 0;

        case 1018: spikesTarget = [(camHUD.downscroll ? -120 : -120),(camHUD.downscroll ? -100 : 320),14];
        case 1022: spikesTarget = [(camHUD.downscroll ? -340 : -427),(camHUD.downscroll ? -360 : 576),4];

        case 2347:
            spikesTarget[0] -= 300;
            spikesTarget[1] += 300;
            spikesTarget[2] = 2;

        case 2364: 
            topSpike.destroy(); botSpike.destroy();
            remove(topSpike, true); remove(botSpike, true);

        case 2428: opponentTarget[0] -= 800;
    }
}