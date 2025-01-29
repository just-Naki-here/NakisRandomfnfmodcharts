

public var healthTarget:Float = 1;

function onPlayerHit(e) {
    if (health < 2) health += 0.05;
}

function onPlayerMiss() {
    health -= 0.028;
}

function onDadHit(e){
    if (!e.note.isSustainNote){
        if (health > 0.2) health -= 0.038;
    }
}

function postUpdate(e) {

    if (healthTarget != health)
        healthTarget = lerp(healthTarget, health, e * 3);
}