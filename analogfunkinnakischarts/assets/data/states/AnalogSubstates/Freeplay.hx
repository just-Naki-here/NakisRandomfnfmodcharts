// this code isnt good im sorry
import funkin.savedata.FunkinSave;
import flixel.group.FlxGroup;

var freeplayCam:FlxCamera;

var songList:Array<String> = [];
var songs = [
    ["Lament", "Archived", "Memory Lane", "Elysium"],
    ["Tally Mark", "Celebration", "In The Dark", "Found Footage"],
    ["Newmaker Plane", "Petals", "Ectype", "Invective"],
    ["Grave Mistake", "Real Sleep", "Broadcast", "His Throne"],
    ["Deadlines", "Enormity", "Abduction", "Encavmaphobia", "Take Care", "Wonderland", "Manipulated", "Pursuit"]
];

var buyablesMap:Map<String, String> = [
    "Enormity" => "E_57",
    "Deadlines" => "TM_D",
    "Pursuit" => "VC_P",
    "Wonderland" => "WL_1992",
    "Take Care" => "B_TC",
    "Encavmaphobia" => "EPH_01",
    "Abduction" => "TMH_AB",
    "Manipulated" => "TMK_M"
];

var curCat:Int = 0;
var curSong:Int = 0;

var categories:Array<FlxTypedGroup<FunkinText>> = [];
var accs:Array<FunkinText> = [];

var selectBar:FunkinSprite;
var camFollow:FunkinSprite; // for like tweening the categories i made them a flxgroup and you cant tween flxgroups i am stupid 

function create() {
    window.title = "Analog Funkin' : Freeplay";
    FlxG.cameras.add(camera = freeplayCam = new FlxCamera(), false).bgColor = FlxColor.BLUE;

    add(camFollow = new FunkinSprite().makeSolid(1, 1, FlxColor.TRANSPARENT)).screenCenter();
	add(selectBar = new FunkinSprite(120).makeSolid(FlxG.width - 240, 70));

    var why:Int = 0;
    for (num => a in songs) {
        var grp:FlxTypedGroup = new FlxTypedGroup();
        var title:FunkinText = new FunkinText(0, why, 0, '-------- ' + ["THE WALTEN FILES", "THE BACKROOMS", "PETSCOP", "LOCAL 58", "BONUS SONGS", "HOTFIX SONGS"][num] + ' --------', 48, false);
        title.screenCenter(FlxAxes.X);
        title.antialiasing = Options.antialiasing;
        grp.add(title);
        why += 50;
        for(b in a) {
            grp.add(new FunkinText(128, why, 0, songNameShit(b, num), 64, false));
            accs.push(new FunkinText(0, why, 0, grp.members[grp.length - 1].text == "????" ? "" : accShit(FunkinSave.getSongHighscore(b, "normal").accuracy * 100) + "%", 64, false));
            add(accs[accs.length - 1]).x = FlxG.width - 128 - accs[accs.length - 1].width;
            why += 70;
            grp.members[grp.length - 1].antialiasing = accs[accs.length - 1].antialiasing = Options.antialiasing;
            if (num != 4) songList.push(b); else if (FlxG.save.data.unlockedSongs.contains(b)) songList.push(b);
        }
        categories.push(grp);
        add(categories[num]);
    }

    freeplayCam.follow(camFollow);
    changeSelect(0);

    controls.ACCEPT = false;
}

function postUpdate(elapsed:Float) {
	camFollow.y = CoolUtil.fpsLerp(camFollow.y, categories[curCat].members[0].y + FlxG.height/2 - 0.5, 0.11);

	if(controls.UP_P || controls.DOWN_P)
		changeSelect(controls.UP_P ? -1 : 1);

    if (controls.BACK) {
        window.title = "Analog Funkin' : Main Menu";
        CoolUtil.playMenuSFX(2);
        FlxG.cameras.remove(freeplayCam);
        close();
    }

    if ((controls.ACCEPT && categories[curCat].members[curSong + 1].text != "????") || FlxG.keys.justPressed.R)
        enterSong(FlxG.keys.justPressed.R ? songList[FlxG.random.int(0, songList.length - 1)] : songs[curCat][curSong], "NORMAL");

    if (FlxG.keys.justPressed.TAB && Assets.exists(Paths.chart(songs[curCat][curSong], "ALT")) && categories[curCat].members[curSong + 1].text != "????" && FunkinSave.getSongHighscore(songs[curCat][curSong], "normal").date != null)
        enterSong(songs[curCat][curSong], "ALT");

    for (a in accs)
        a.color = selectBar.overlaps(a) ? 0xff141378 : FlxColor.WHITE;
}

function changeSelect(a:Int) {
    if(a != 0) CoolUtil.playMenuSFX();
    categories[curCat].members[curSong + 1].color = FlxColor.WHITE; // shitty bug fix
    // makes it move which section its in
    if(curSong + a >= songs[curCat].length || curSong + a == -1)
        changeCategory(curSong + a == -1 ? -1 : 1);
    else
        curSong += a;
    // makes the thing do the thing idk
    selectBar.y = categories[curCat].members[curSong + 1].y - 3;

    for(num => a in categories[curCat].members) a.color = num == (curSong + 1) ? 0xff141378 : FlxColor.WHITE;
}

function changeCategory(a:Int) {
    curCat = FlxMath.wrap(curCat + a, 0, songs.length - 1);
    curSong = (a == 1 ? 0 : songs[curCat].length - 1);
    changeSelect(0);
}

function enterSong(song:String, diff:String) {
    CoolUtil.playMenuSFX(1);
    freeplayCam.fade(FlxColor.BLACK, 0.1, false, () -> {
        if (myfourtothreesongs.contains(songs[curCat][curSong].toLowerCase()) || (songs[curCat][curSong].toLowerCase() == "real sleep" && diff == "ALT"))
            windowShit(1024, 768, 0.8);
        PlayState.loadSong(song, diff);
        FlxG.switchState(new PlayState());
    });
}

function accShit(_:Int):Int // really useless function but just makes it so they don't say -100% for no reason sob
    return _ < 0 ? 0 : Std.int(_);

function songNameShit(_:String, week:Int):String 
    return week != 4 ? (FlxG.save.data.unlockedWeeks.contains(week) ? _ : "????") : (FlxG.save.data.unlockedSongs.contains(_.toLowerCase()) ? (FunkinSave.getSongHighscore(_, "normal").date == null ? buyablesMap[_] : _) : "????");