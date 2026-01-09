
//50 0.7

public var povEffcs:Bool = false;

function beatHit(beat:Int) {
    if (beat % 2 == 0 && povEffcs){

        for (i in 1...3){
            playerStrums.members[i].y += 80;
            playerStrums.members[i].scale.set(0.5,1.1);
        }

        playerStrums.members[0].y += 20;
        playerStrums.members[3].y += 20;

        playerStrums.members[0].angle += FlxG.random.float(0,35);
        playerStrums.members[1].angle += FlxG.random.float(0,50);
        playerStrums.members[2].angle += FlxG.random.float(-50,0);
        playerStrums.members[3].angle += FlxG.random.float(-35,0);

        
        
    }
}

function update(e) {
    if (povEffcs)
        for (strum in playerStrums.members){
            strum.y = lerp(strum.y, 50, 0.15);

            strum.scale.x = lerp(strum.scale.x, 0.7, 0.25);
            strum.scale.y = lerp(strum.scale.y, 0.7, 0.25);

            strum.angle = lerp(strum.angle, 0, 0.15);
        }
}