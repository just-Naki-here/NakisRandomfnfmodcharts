isChase = false;
function postCreate(){
    chase.screenCenter();
    chase.x += 140;
    chase.y += 20;
    chase.frames = Paths.getFrames("stages/treedome/Dehydrated");
    chase.animation.addByPrefix("chase", "Dehydrated idle", 60,true);
    
    die.frames = Paths.getFrames("stages/treedome/DrySpongeDeath");
    die.animation.addByPrefix("die", " die", 60,false);
    die.alpha = 0;
}
function spongeDies(){
    isChase = true;
    for(i in 0...3) strumLines.members[0].characters[i].alpha = 0;
    die.animation.play("die");
    die.alpha = 1;
    //chase.animation.play("chase", true, false, 20);
}
function update(elapsed){
    chase.visible = isChase;
    for(i in 1...3) strumLines.members[0].characters[i].visible = isChase;
    strumLines.members[0].characters[0].visible = !isChase;
    if (isChase) chase.animation.play("chase");
    else chase.animation.reset();

}

function beatHit(){
    switch(curBeat){
        case 182: isChase = true;
        case 258: spongeDies(); //258
    }
}
