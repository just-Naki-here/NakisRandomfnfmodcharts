import funkin.backend.MusicBeatState;
import funkin.savedata.FunkinSave;
importScript("data/scripts/menus/mainMenuBG");
importScript("data/scripts/menus/musicLoop");

FlxG.save.data.humizero = false;
function postCreate()
{
    if (!FlxG.save.data.randomActive) playLoopedSong(); else playRandomSong(optionMenuReturn ? false : true);
    if (FlxG.save.data.randomActive) depthLock = true;
	camFront.zoom = (FlxG.save.data.randomActive ? 0.5 : 0.43);
    FlxG.camera.zoom = 1;
    camFront.scroll.y = -700;

    FlxG.cameras.remove(camFront, false);
	FlxG.cameras.remove(FlxG.camera, false);

    FlxG.cameras.add(camFront, false);
    FlxG.cameras.add(FlxG.camera, true);
    
    FlxG.camera.bgColor = 0;

    for (i=>member in members){
        if (FlxG.save.data.randomActive){
            switch(i){
                case 0 | 1 | 2 | 3 | 4 | 5:
                    member.cameras = [camFront];
                case 6:
                    remove(member);
            }
        }
        else{
            switch(i){
                case 0 | 1 | 2 | 3 | 4 | 5 | 6:
                    member.cameras = [camFront];
                case 7:
                    remove(member);
            }
        }
    }
}

function update(){
    if(optionMenuReturn)
        MusicBeatState.skipTransIn = MusicBeatState.skipTransOut = true;
    if(FlxG.save.data.humizero){
        FunkinSave.getSongHighscore("Humiliation", "HARD").score = 0;
        FlxG.save.data.humizero = false;
        FlxG.save.data.randomActive = false;
    }
}