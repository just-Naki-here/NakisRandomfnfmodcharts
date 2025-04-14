public function playLoopedSong(){
    if(inIntro){
        if (FlxG.sound.music == null){
            CoolUtil.playMenuSong();
            FlxG.sound.music.pause();
            introMusic.play(true);
        }
    } else CoolUtil.playMenuSong();
}

//the menu, considered to be true...
public var yummerMusic:FlxSound = FlxG.sound.load(Paths.music('freakyMenuYummer'));
yummerMusic.looped = true;
yummerMusic.volume = 0;
public function playRandomSong(v:Bool = false){
    if (FlxG.sound.music == null || v) {
    CoolUtil.playMenuSong();
    CoolUtil.playMusic(Paths.music('freakyMenuRandom'));
    yummerMusic.play(false);
    FlxG.sound.music.persist = true;
    yummerMusic.persist = true;
    }
}
var yummerMusicActive = false;
public function switchSong(){ //yummer music function
    if (!yummerMusicActive) {
        trace("well Hello yummer music!");
        yummerMusicActive = true;
        yummerMusic.fadeIn(0.4); FlxG.sound.music.fadeOut(0.4);
        yummerMusic.time = FlxG.sound.music.time;
    } else {
        trace("bye yummer music!");
        yummerMusicActive = false;
        yummerMusic.fadeOut(0.4); FlxG.sound.music.fadeIn(0.4);
    }
}

function update(elapsed) {
    //trace(introMusic.time);
    if (introMusic.time >= 5650 && inIntro && !FlxG.save.data.randomActive){
        trace("hii");
        inIntro = false;
        FlxG.sound.music.resume();
    }
}