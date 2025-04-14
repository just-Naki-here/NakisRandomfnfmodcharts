function create() {
    FlxG.cameras.remove(camCaptions, false);
    startVideo(Paths.video("surrogate-cutscene"), () -> close());
    new FlxTimer().start(37.7, () ->{
        if (PlayState.instance.inCutscene){
            FlxG.cameras.add(camCaptions, false);
            FlxTween.tween(separatedLinesGrp.members[0],{alpha:1},0.2,{onComplete: function(){
                FlxTween.tween(separatedLinesGrp.members[0],{alpha:0},0.2,{startDelay: 3.5});
            }});
        }
    });
}
