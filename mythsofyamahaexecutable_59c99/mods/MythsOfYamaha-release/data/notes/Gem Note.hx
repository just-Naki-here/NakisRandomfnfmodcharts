
public var gemsCollected:Int = 0;
public var gemsCol = [
    0xFFF30013,
    0xFFFF7234,
    0xFFE08D2B,
    0xFF397B29,
    0xFF0080F9,
    0xFFCC6AE5,
    0xFF7C868F
];

var gemsStr:Array<String> = [
    'jack',
    'orang',
    'hello',
    'muh',
    'water',
    'orple',
    'silver'
];

function onNoteHit(e) {
    if (e.note.noteType == "Gem Note"){
        e.cancel();
        trace("got gem (" + gemsCollected + ") out of 7");
        gemsCollected++;

        FlxTween.tween(gemBec,{alpha: 0},0.2,{ease: FlxEase.linear});
        superSpark.alpha = 1;
        superSpark.animation.play('playOnce');

        
        FlxG.sound.play(Paths.sound((gemsCreated == 7 ? 'game/drean/bonus' : 'game/drean/getchaos')),0.4);
    }
}

function onPlayerMiss(e) {
    if (e.note.noteType == "Gem Note"){
        e.cancel();
        FlxTween.tween(gemBec,{alpha: 0},0.2,{ease: FlxEase.linear});
    }
}

// function update() {
//     for (note in playerStrums.notes){
//         if (note.noteType == "Gem Note"){
//             trace("first");
//             trace(note.ID);

//         }
         
//     }
// }

var gemsCreated:Int = 0;
function onNoteCreation(e) {
    switch (e.noteType) {
        case "Gem Note":
            if (gemsCreated < 7){
                e.noteSprite = "game/notes/types/the7souls/" + gemsStr[gemsCreated];    
                gemsCreated++;
            }
    }
}