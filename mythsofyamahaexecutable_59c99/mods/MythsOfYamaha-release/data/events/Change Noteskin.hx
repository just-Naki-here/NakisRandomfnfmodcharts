
var notesSize:Float = 0.6;
function onEvent(e) {
    if (e.event.name == "Change Noteskin") {
        for (a in strumLines.members[e.event.params[1]]) updateStrumSkin(a, e.event.params[0] == "" ? "game/notes/default" : "game/notes/" + e.event.params[0]);
        for (a in strumLines.members[e.event.params[1]].notes) updateNoteSkin(a, e.event.params[0] == "" ? "game/notes/default" : "game/notes/" + e.event.params[0]);
    }
}

function updateStrumSkin(theFucking:Strum, newSkin:String) {
    theFucking.frames = Paths.getSparrowAtlas(newSkin);

    var direction:String = ["left", "down", "up", "right"][theFucking.ID];
    theFucking.animation.addByPrefix(['purple', 'blue', 'green', 'red'][theFucking.ID], 'arrow' + direction.toUpperCase());

    theFucking.antialiasing = Options.antialiasing;
    theFucking.setGraphicSize(Std.int(theFucking.width * notesSize));

    theFucking.animation.addByPrefix('static', 'arrow' + direction.toUpperCase());
    theFucking.animation.addByPrefix('pressed', direction + ' press', 24, false);
    theFucking.animation.addByPrefix('confirm', direction + ' confirm', 24, false);

    theFucking.animation.play('static');
    theFucking.updateHitbox();

}

function updateNoteSkin(theFucker:Note, newSkin:String){
    var idk = theFucker.animation.name;
    theFucker.frames = Paths.getSparrowAtlas(newSkin);

    var color:String = ['purple', 'blue', 'green', 'red'][theFucker.strumID % 4];

    theFucker.animation.addByPrefix(idk, switch(idk){
        case 'scroll': color + '0';
        case 'hold': color + ' hold piece';
        case 'holdend': (color == 'purple' ? 'pruple end hold0' : color + ' hold end0');
    });

    theFucker.animation.play(idk);
    // theFucker.setGraphicSize(Std.int(theFucker.width * notesSize));
    theFucker.updateHitbox();
}