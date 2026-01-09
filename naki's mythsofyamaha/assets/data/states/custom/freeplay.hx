import funkin.backend.system.GraphicCacheSprite;
import Sys;

import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;

import flixel.graphics.frames.FlxBitmapFont;
import flixel.text.FlxBitmapText;
import flixel.text.FlxText;

// Sprites
var chapter;
var bg, bg2;
var arrowL, arrowR;
var back, exit;
var stuff = [];

// Shaders
final sketch = new CustomShader('sketch');
final water = new CustomShader('water');

// Constants
final p = 'menus/freeplay/';
final inv = 0.0001;

// Variables
var curChap = 1;
var unlockTypeShi:Array<String> = [];

// song name, portrait[x, y, angle], text[x, y, angle] //
var list = [
    [ // chapter 1
        ['forever-dream', [140, 190, 0], [-2,-20,0]],
        ['genesis', [785, 160, 0], [0,0,0]]
    ],

    [ // chapter 2
        ['unknown', [80, 220, -10], [0,0,0]],
        ['premeditated', [420, 150, 0], [38,0,0]],
        ['classic', [830, 160, 7], [39,28,-7]]
    ]
];

var backOffs = [
    [1.3, -40],
    [0.4, -30]
];

var smileyNum = -4;
var smileyMessages = [
    "No second chances.\nYou had the perfect opportunity, yet you blew it away.\nAll that training for nothing.\nYou deserve this.",
    "Don't you get it?\nYou won't be able to retry this song ever again.\nYou're a waste of precious time.",
    "You're pissing me off now.\nGo away.",
    "I said go away.",
    "You're doing this on purpose now.\nGet out of here.",
    "GET THE FUCK OUT OF HERE"
];

var l;
var hitbox2011;
var songCnt;

function create() {
    FlxG.mouse.enabled = true;

    FlxG.cameras.add(camFront = new FlxCamera(), false).bgColor = 0;
    CoolUtil.playMenuSong(true);

    unlockTypeShi = FlxG.save.data.moySongsBeat;

    // l = new FlxTimer().start(1, () -> {
    //     if (FlxG.random.bool(20)) FlxG.sound.play(Paths.sound('menu/voicelines/freeplay/1'));
    // });

    // very important as it preloads all the bg graphics!
    for (i in 1...list.length+1) {
        ss = new GraphicCacheSprite().cache(Paths.image(p + 'bg' + i));
        s = new GraphicCacheSprite().cache(Paths.image(p + 'b' + i));
    }

    add(bg = new FlxSprite().loadGraphic(Paths.image(p + 'bg' + curChap))).screenCenter();
    bg.scale.set(0.43, 0.43);
    bg.shader = water;

    add(bg2 = new FlxSprite().loadGraphic(Paths.image(p + 'hud/thing'))).screenCenter();
    bg2.scale.set(0.43, 0.43);
    bg2.shader = sketch;

    add(back = new FlxSprite().loadGraphic(Paths.image(p + 'b' + curChap))).screenCenter().y -= 40;
    back.scale.set(1.3, 1.3);

    // FRONT //
    add(front = new FlxSprite().loadGraphic(Paths.image(p + 'hud/front'))).screenCenter();
    front.cameras = [camFront];

    add(chapter = new FlxSprite(0, 580).loadGraphic(Paths.image(p + 'chapters/c1'))).screenCenter(FlxAxes.X);
    chapter.scale.set(0.43, 0.43);
    chapter.cameras = [camFront];

    add(arrowL = new FlxSprite(10).loadGraphic(Paths.image(p + 'hud/arrow'))).flipX = true;
    add(arrowR = new FlxSprite(FlxG.width - 70).loadGraphic(Paths.image(p + 'hud/arrow')));

    for (a in [arrowL, arrowR]) {
        a.scale.set(0.28, 0.28);
        a.cameras = [camFront];
        a.updateHitbox();
        a.screenCenter(FlxAxes.Y);
    }

    for (i in 0...list.length) {
        for (b in 0...list[i].length) {
            var m = list[i][b];

            song = new Portrait(m[1][0], m[1][1], m[1][2], m[0]);
            song.scale.set(1.25, 1.25);
            song.updateHitbox();
            song.alpha = inv;
    
            add(song);
            stuff.push(song);
    
            if (m[0] != 'unknown') {
                song.text.x += m[2][0];
                song.text.y += m[2][1];
                song.text.angle += m[2][2];
    
                add(song.text);
            }
        }
    }

    add(hitbox2011 = new FunkinSprite(FlxG.width/2 - 140,100).makeGraphic(260,250,FlxColor.BLUE)).alpha = 0;

    for (songs in ['genesis','forever-dream','premeditated','classic']){
		if (unlockTypeShi.contains(songs)){
            songCnt++;
        }
	}

    if (songCnt >= 3 && (FlxG.save.data.moyUnlockedFalse == false)){
        FlxG.mouse.enabled = false;

        FlxG.save.data.moyUnlockedFalse = true;
        
        FlxG.sound.music.fadeOut(.75,0.1);
        add(bgFade = new FunkinSprite().makeGraphic(FlxG.width,FlxG.height,FlxColor.BLACK)).screenCenter();
        bgFade.alpha = 0.7;

        var monospaceLetters:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        var charSize = FlxPoint.get(220, 320);
        var fontMonospace = FlxBitmapFont.fromMonospace(Paths.image('merged'), monospaceLetters, charSize);

        msg = new FlxBitmapText(0 ,0, "", fontMonospace);
        msg.autoUpperCase = true;
        msg.text = "something has unlocked\n  in the chart editor . . .";
        msg.scale.set(0.2,0.2);
        msg.updateHitbox();
        msg.screenCenter();
        add(msg);

        new FlxTimer().start(3, (_) -> {
            for (twen in [bgFade,msg]){
                FlxTween.tween(twen,{alpha: 0},2,{ease: FlxEase.linear});
            }

            FlxG.sound.music.fadeIn(2,0.1,0.6);

            FlxG.mouse.enabled = true;
        });
    }

    scroll(0);
}

var f = 0;
function update(elapsed) {
    if (FlxG.mouse.enabled) {
        if (controls.BACK){
            FlxG.save.data.moyTransitionType = false;
            FlxG.switchState(new ModState('custom/mainMenu'));
        }
    
        if (controls.LEFT_P || controls.RIGHT_P) 
            scroll(controls.LEFT_P ? -1 : 1);
    
        for (a in [arrowL, arrowR])
            a.scale.x = a.scale.y = lerp(a.scale.x, FlxG.mouse.overlaps(a, camFront) ? 0.3 : 0.28, elapsed * 16);
    
        if (FlxG.mouse.justPressed) {
            if (FlxG.mouse.overlaps(arrowL, camFront)) scroll(-1);
            if (FlxG.mouse.overlaps(arrowR, camFront)) scroll(1);
    
            if (FlxG.mouse.overlaps(hitbox2011) && curChap == 1) {
                doAline();
            }
        }
    }

    f += elapsed;
    sketch.iTime = f / 2;
    water.iTime = Conductor.songPosition / 1000;
}

var curLine;
var donePlaying = true;

function doAline() {
    if (donePlaying){
        donePlaying = false;
        new FlxTimer().start(1, () -> {
            var theRand = FlxG.random.int(4,7);
            
            curLine = FlxG.sound.load(Paths.sound("menu/voicelines/freeplay/" + theRand));
            curLine.volume = FlxG.random.float(0.7,1.1);            
            curLine.play();

            new FlxTimer().start((curLine.length / 1000), () -> {donePlaying = true;});
        });
    }
}

function scroll(n) {
    curChap += n;

    if (curChap > list.length) curChap = 1;
    if (curChap < 1) curChap = list.length;

    var a;
    if (n == -1) a = arrowL;
    if (n == 1) a = arrowR;

    if (a != null) a.scale.set(0.32, 0.32);

    CoolUtil.playMenuSFX(3,0.8);

    var c = curChap - 1;

    for (ss in stuff) ss.alpha = inv;

    for (i in 0 ... list[c].length) 
        for (ss in stuff) 
            if (ss.alpha != 1) ss.alpha = ((ss.song == list[c][i][0])) ? 1 : inv;
        
    bg.loadGraphic(Paths.image(p + 'bg' + curChap));
    bg.screenCenter();

    back.loadGraphic(Paths.image(p + 'b' + curChap));
    back.scale.set(backOffs[c][0], backOffs[c][0]);
    back.screenCenter().y += backOffs[c][1];

    chapter.loadGraphic(Paths.image(p + 'chapters/c' + curChap));
    chapter.screenCenter(FlxAxes.X);
}

function destroy() {
    FlxG.mouse.enabled = true;
}

class Portrait extends flixel.FlxSprite {
    public var selected = false;
    public var transitioning = false;
    public var isUnknown;

    public var song;
    public var text;

    public function new(xx, yy, an, s) { 
        super();

        var u = (s == 'unknown');
        isUnknown = u;

        loadGraphic(Paths.image(p + 'songs/' + (u ? 'unknown' : (s + '/normal'))));
        setPosition(xx, yy);
        angle = an;
        song = s;

        origin.set(width / 2, height / 2);

        if (!u) {
            text = new FlxSprite(xx + 0, yy + 250).loadGraphic(Paths.image(p + 'songs/' + s + '/text'));
            text.scale.set(0.43, 0.43);
            text.angle = an;
            text.updateHitbox();
        }
    }

    override function update(_) {
        super.update(_);

        if (!isUnknown) {
            text.alpha = alpha;
            selected = (FlxG.mouse.overlaps(this, FlxG.camera) && alpha > inv);

            if (!(song == 'premeditated' && !FlxG.save.data.canPlayPremed)) loadGraphic(Paths.image(p + 'songs/' + song + '/' + (selected ? 'hover' : 'normal')));
            updateHitbox();

            /*var f = Math.sin(Conductor.songPosition / 1000) / FlxG.random.float(6, 10);

            y += f;
            text.y += f;*/

            if (selected && FlxG.mouse.justPressed && !transitioning) {
                if (song == 'premeditated' && !FlxG.save.data.canPlayPremed) {

                    smileyNum++;
                    var n = (smileyNum > -1) ? smileyNum : 0;
                    window.alert(smileyMessages[n]);
                    FlxG.sound.play(Paths.sound('menu/cancel'));

                    if (smileyNum == smileyMessages.length-1) Sys.exit(0);
                }
                else {
                    FlxG.save.data.moyTransitionType = true;
                    if (l != null) l.cancel();

                    transitioning = true;
                    FlxG.sound.play(Paths.sound('menu/confirmSong'));
                    FlxG.mouse.enabled = false;

                    var voiceLine;

                    switch(song){
                        case 'genesis': voiceLine = FlxG.sound.load(Paths.sound('menu/voicelines/freeplay/1'));
                        case 'forever-dream': voiceLine = FlxG.sound.load(Paths.sound('menu/voicelines/freeplay/2'));
                        case 'premeditated': voiceLine = FlxG.sound.load(Paths.sound('menu/voicelines/freeplay/3'));

                        default:
                            voiceLine = FlxG.sound.load(Paths.sound('menu/voicelines/freeplay/4'));
                            trace(song);
                    }
                    FlxG.sound.music.fadeOut(.75,0.1);
                    new FlxTimer().start(1, () -> {
                        voiceLine.play();

                        new FlxTimer().start((voiceLine.length / 1000) * 1.2, () -> {
                            PlayState.loadSong(song, 'hard');
                            FlxG.switchState(new PlayState());
                        });
                    });
                }
            }
        }
    }
}