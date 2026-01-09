

public var healthTarget:Float = 1;

function onPlayerHit(e) {
    if (health < 2) health += 0.005; //number doesnt need to be that hi, if you want difficulty
}

function onPlayerMiss() {
    if (FlxG.save.data.moyDrainHealth) health -= 0.028;
}

function onDadHit(e){
    if (!e.note.isSustainNote){
        if (FlxG.save.data.moyDrainHealth) if (health > 0.2) health -= 0.009; //high health drain will make it imposible for the heads to do real damage (immidiate insta kill if a head chomps)
    }
}

function postUpdate(e) {

    if (healthTarget != health)
        healthTarget = lerp(healthTarget, health, e * 3);
    if (stepHit > 2424 ){ 
        if(stepHit < 2524){
            if (stepHit == 2524){
                health = healthTarget;
                }
        }
    }
}