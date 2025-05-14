//
import StringTools;

var credits:Array<String> = CoolUtil.coolTextFile(Paths.txt("credits"));
var linkMap:Map<String, String> = [
        // A
    "Akayo" 				=> "https://twitter.com/Akayo61",
    "Atari" 				=> "https://bsky.app/profile/luvxpeace.bsky.social",
    "Awaken" 				=> "https://twitter.com/BakingMeshes",
        // B
    "Bio" 					=> "https://twitter.com/biookiee",
    "BreadiBoyo" 			=> "https://twitter.com/breadiboyo",
    "Bubu" 					=> "https://twitter.com/bubureal__",
        // C
    "Chronic x3"                  => "https://twitter.com/_chronicsilly"
    "Chase Redding" 		=> "https://twitter.com/Chase_R_Music_",
    "Codename Engine Devs"  => "https://codename-engine.com"
    "Comic" 				=> "https://twitter.com/ComicTheHero",
        // D
    "DeathWish"				=> "https://twitter.com/MrDeathWishFNF",
    "Dissonified"			=> "https://twitter.com/dissonified",
        // E
    "EdinClutch"			=> "https://twitter.com/EdingamerH",
    "Effy"					=> "https://twitter.com/EffyNuffys2",
    "Ezekiel"				=> "https://twitter.com/the_ez_lmao",
        // F
    "Facdela"		        => "https://twitter.com/Facdela1",
    "FakeBurritos"			=> "https://twitter.com/fakeburritos123",
        // G
    "Gio"					=> "https://bsky.app/profile/gioscalie.bsky.social",
    "Gojira Darko"			=> "https://twitter.com/Gojira_Darko",
        // H
    "Hazey"					=> "https://twitter.com/HazeyPurple_",
    "Hemp"					=> "https://twitter.com/smokedhemp",
        // I
    "Illuminion"			=> "https://illuminion.carrd.co",
    "Isaac"					=> "https://twitter.com/Isaacshouse2",
    "Izy_"					=> null,
        // J
    "Jade"					=> "https://twitter.com/Jadoukity24",
    "Junebug"				=> "https://twitter.com/junebug_7801",
        // K
    "KINGFOX"				=> "https://twitter.com/VOKINGF0X",
    "KOBAIKID"				=> "https://bsky.app/profile/kobaikid.bsky.social",
        // L
    "Lemmeo"				=> "https://twitter.com/Lemmeoo",
    "Leon"					=> "https://twitter.com/Leon_bruhlol",
    "LeShark"				=> "https://twitter.com/LeShark_0",
    "Lotus"					=> null,
        // M
    "Magafourts"			=> "https://twitter.com/Lemmeoo",
    "MerilynC" 				=> "https://twitter.com/MerilynCist",
    "MID"					=> null,
    "Millie"				=> "https://twitter.com/MillieWeikel",
    "MRmorian" 				=> "https://mrmorian.newgrounds.com/",
        // N
    "Nep"                   => "https://youtube.com/@neptvne_z",
    "Netrogrand" 			=> null,
    "Nope" 					=> "https://twitter.com/MemeAvi",
        // O
    "Obscurity" 			=> "https://twitter.com/rugahdugga",
        // P
    "Phantom" 				=> "https://twitter.com/archerthewolf2",
    "PiQ" 					=> "https://twitter.com/PiQ_real",
    "Puritzel" 				=> "https://twitter.com/ThePuritzel",
        // Q
    "Quackerona" 			=> "https://twitter.com/SillyDilly1001",
        // S
    "Sinwalker" 			=> "https://twitter.com/SinwalkerMusic",
    "Smokecannon" 			=> "https://twitter.com/SmokeDeveloper",
    "Spukuz" 				=> null,
    "Stawii" 				=> "https://twitter.com/iiwats",
    "Steriox" 				=> "https://twitter.com/LillSteriox",
        // T
    "TackSFM" 				=> "https://www.youtube.com/channel/UCuwpxhO4WqFp-uCBZtiMCBw",
    "Terminalangst"         => "https://twitter.com/terminalangst",
    "TheGoldhare" 			=> "https://twitter.com/TheGoldhare",
    "The Trap 8r1o" 		=> "https://twitter.com/Xx_8r1o_xX",
    "Thebron" 				=> "https://twitter.com/thebronjahames",
        // Z
    "Zalo" 					=> null,
];

var credCam:FlxCamera;
var camFollow:FlxSprite;

var cred:Array<FlxText> = [];
var cur:Int = 0;
var selectBar:FlxSprite;

function create() {
    window.title = "Analog Funkin' : Credits";

    FlxG.cameras.add(camera = credCam = new FlxCamera(), false).bgColor = FlxColor.BLUE;

    add(camFollow = new FlxSprite().makeSolid(1, 1, FlxColor.TRANSPARENT)).screenCenter();
	add(selectBar = new FlxSprite(120).makeSolid(1, 70));

    var why:Int = 100;
    for(a in 0...credits.length) {
        if(credits[a] != "") {
            why += 48 * (StringTools.endsWith(credits[a], ":") && a != 0 ? 3 : 1.5);
            cred.push(new FunkinText(StringTools.endsWith(credits[a], ":") ? 128 : 160, why, 0, credits[a], 64, false));
            add(cred[cred.length - 1]).antialiasing = Options.antialiasing;
        }
    }

    add(new FunkinText(0, 48, 0, "-------- CREDITS --------", 48, false)).screenCenter(FlxAxes.X);

    credCam.follow(camFollow);
    changeSelect(0);
}

function update() {
	camFollow.y = CoolUtil.fpsLerp(camFollow.y, cred[cur].y + FlxG.height/2 - 160.5, 0.11);

    if(controls.UP_P || controls.DOWN_P)
        changeSelect(controls.UP_P ? -1 : 1);

    if(controls.ACCEPT && !StringTools.endsWith(cred[cur].text, ":"))
        CoolUtil.openURL(linkMap[cred[cur].text] == null ? "https://yxtwitter.com/" : linkMap[cred[cur].text]);

    if(controls.BACK) {
        FlxG.cameras.remove(credCam);
        CoolUtil.playMenuSFX(2);
        window.title = "Analog Funkin' : Main Menu";
        close();
    }
}

function changeSelect(a:Int) {
    cred[cur].color = FlxColor.WHITE;
    CoolUtil.playMenuSFX();
    cur = FlxMath.wrap(cur + a, 0, cred.length - 1);
    cred[cur].color = 0xff141378;
    selectBar.y = cred[cur].y - 3;
    selectBar.scale.x = cred[cur].width + 32 + cred[cur].x - selectBar.x;
    selectBar.updateHitbox();
    selectBar.x = 120;
}