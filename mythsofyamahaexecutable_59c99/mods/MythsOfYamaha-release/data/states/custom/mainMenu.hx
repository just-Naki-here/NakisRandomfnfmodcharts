
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.display.FlxBackdrop;
import flixel.effects.FlxFlicker;
import funkin.editors.EditorPicker;
import funkin.menus.ModSwitchMenu;
import funkin.options.OptionsMenu;
import funkin.menus.credits.CreditsMain;
import openfl.display.BlendMode;
import hxvlc.flixel.FlxVideoSprite;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.text.FlxBitmapText;
import flixel.text.FlxText;
import flixel.input.mouse.FlxMouseEvent;

var transitioning, redStory, isScreenIn = false;

var canAnnoyNmi = true;
var nmiN = 10;

var grpMenuBGItems:FlxTypedGroup<FlxSprite>;
var grpMenuItems:FlxTypedGroup<FlxSprite>;
var grpMenuChars:FlxTypedGroup<FlxSprite>;

var tf3, vid, t;
var ltgSound = null;

public static var curSelectedA = 0;
var staticSound;

final menuOptions = ["story", "freeplay", "extra", "options"];
final evolvedStations = ["nmi", "2011", "gazer", "smiley", "screen"];

var ePos = [
    [200,-125],
    [235, 0],
    [135,-100],
    [315, 15],
    [385,0]
];

final water = new CustomShader("water");
var g = new CustomShader('Glitch');

function create() {
    CoolUtil.playMenuSong(true);

    if (FlxG.sound.music != null && FlxG.sound.music.time < 13700) FlxG.sound.music.time = 13700;

    staticSound = FlxG.sound.play(Paths.sound("menu/StaticNoise"));
    staticSound.pause();
    staticSound.looped = true;
    staticSound.persist = true;

    grpMenuBGItems = new FlxTypedGroup();
    add(grpMenuBGItems);

    wallpaper = new FlxSprite(0,0).loadGraphic(Paths.image("menus/mainmenu/wallpaper"));
    wallpaper.scale.set(0.6,0.6);
    wallpaper.updateHitbox();
    wallpaper.screenCenter();
    grpMenuBGItems.add(wallpaper);
    
    minecraftFog = new FlxSprite(0,130).loadGraphic(Paths.image("menus/mainmenu/fog-of-genesis"));
    minecraftFog.updateHitbox();
    minecraftFog.screenCenter(FlxAxes.X);
    minecraftFog.blend = BlendMode.ADD;
    grpMenuBGItems.add(minecraftFog);
    minecraftFog.shader = water;
    
    bottomSpikes = new FlxBackdrop(null, FlxAxes.X, 0, 0).loadGraphic(Paths.image('menus/extras/Spikey'));
    bottomSpikes.y += 280;
    bottomSpikes.scale.set(0.5, 0.5);
    grpMenuBGItems.add(bottomSpikes);

    topSpikes = new FlxBackdrop(null, FlxAxes.X, 0, 0).loadGraphic(Paths.image('menus/extras/Spikey'));
    topSpikes.angle = 180;
    topSpikes.y -= 980;
    topSpikes.scale.set(0.5, 0.5);
    grpMenuBGItems.add(topSpikes);

    dragonWorriorScrollFromTheFirstPOMovie = new FlxSprite(0,130).loadGraphic(Paths.image("menus/mainmenu/scroll"));
    dragonWorriorScrollFromTheFirstPOMovie.scale.set(0.5,0.5);
    dragonWorriorScrollFromTheFirstPOMovie.updateHitbox();
    dragonWorriorScrollFromTheFirstPOMovie.screenCenter();
    grpMenuBGItems.add(dragonWorriorScrollFromTheFirstPOMovie);

    samsung = new FlxSprite(FlxG.width * 0.01,FlxG.height * 0.86).loadGraphic(Paths.image("menus/mainmenu/watermark"));
    samsung.updateHitbox();
    grpMenuBGItems.add(samsung);

    grpMenuChars = new FlxTypedGroup();
    add(grpMenuChars);

    var monospaceLetters:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var charSize = FlxPoint.get(220, 320);
    var fontMonospace = FlxBitmapFont.fromMonospace(Paths.image('merged'), monospaceLetters, charSize);

    tf3 = new FlxBitmapText(0 ,0, "", fontMonospace);
    tf3.y = 200;
    tf3.autoUpperCase = true;
    tf3.text = "fuck off";
    tf3.shader = water;
    tf3.scrollFactor.set();
    tf3.scale.set(0.2,0.2);
    tf3.updateHitbox();
    tf3.screenCenter(FlxAxes.X);
    add(tf3);

    if (!redStory) tf3.alpha = 0;

    ltgSound = FlxG.sound.play(Paths.sound("ltg"));
    ltgSound.pause();

    add(vid = new FlxVideoSprite());
    vid.load(Paths.video('mods crush his skull thank you. LTG'));
    vid.x = 45;
    vid.scale.set(0.25, 0.25);

    vid.x = 640;
    vid.y = 240;
    
    vid.bitmap.onEndReached.add(() -> {
        FlxTween.color(tf3,.25,FlxColor.WHITE,FlxColor.RED);
        for (things in [vid,tf3]){
            FlxTween.tween(things,{alpha: 0},1,{ease: FlxEase.quadOut, onComplete: (_) -> {
                vid?.visible = false;
                vid?.stop();
                vid?.destroy();
                vid = null;
                transitioning = false;
            }});
        }
    });

    for (i in 0...evolvedStations.length){
        eStation = new FlxSprite();
        eStation.frames = Paths.getSparrowAtlas('menus/mainmenu/screens/' + evolvedStations[i]);
        eStation.animation.addByPrefix('play', 'idle', 24, false);
        eStation.animation.addByIndices('stop', 'idle', [0], "", 1, false);

        eStation.animation.finishCallback = (name: String) -> {
            if (name == "play" && isScreenIn) staticScreen();
        }
        
        eStation.scale.set(0.5,0.5);
        eStation.updateHitbox();
        eStation.setPosition(ePos[i][0],ePos[i][1]);
        eStation.ID = i;
        grpMenuChars.add(eStation);

        eStation.visible = (eStation.ID == curSelectedA);
    }

    //==========================BG===================================

    grpMenuItems = new FlxTypedGroup();
    add(grpMenuItems);

    for (i in 0...menuOptions.length) {
        if (i <= 2){
            menuItem = new FlxSprite(0,(i * 115) + 360).loadGraphic(Paths.image("menus/mainmenu/menu_" + menuOptions[i]));
            menuItem.scale.set(0.45,0.45);
            menuItem.updateHitbox();
            menuItem.screenCenter(FlxAxes.X);
            menuItem.ID = i;
            grpMenuItems.add(menuItem);
        } else {
            menuItem = new FlxSprite(FlxG.width * 0.9,FlxG.height * 0.06).loadGraphic(Paths.image("menus/menu_options"));
            menuItem.scale.set(0.45,0.45);
            menuItem.updateHitbox();
            menuItem.ID = i;
            grpMenuItems.add(menuItem);
        }
        FlxMouseEvent.add(menuItem, null, null, mouseHover, null, false, true, false);

        if (redStory) grpMenuItems.members[0].color = FlxColor.RED;
    }

    add(spinLMAO = new FlxVideoSprite());
    spinLMAO.load(Assets.getPath(Paths.file('images/gallery/mp4s/lv_0_20240421173443.mp4')));
    spinLMAO.x = 45;
    // spinLMAO.scale.set(0.8, 0.8);

    spinLMAO.x = -100;
    spinLMAO.y = -100;
    // spinLMAO.play();
    spinLMAO.bitmap.onEndReached.add(() -> {
        spinLMAO?.visible = false;
        spinLMAO?.stop();
        spinLMAO?.destroy();
        spinLMAO = null;

        FlxG.sound.play(Paths.sound("menu/voicelines/12"),1).pitch = FlxG.random.float(0.4,1);
    });

    t = new FlxTimer().start(5, () -> {
        if (FlxG.random.bool(20))
            FlxG.sound.play(Paths.sound("menu/voicelines/" + FlxG.random.int(13,14)));
    });
}

function mouseHover(object:FlxSprite) {
    if (!transitioning && object.ID != curSelectedA)
        changeSelection(object.ID, true, true);
}


var goons:Array<String> = [
    'mni',
    'spin',
    'mth'
];

var fuckingCounter:Int = 0;
var reachedPeak:Bool = false;
function update(e) {
    if(FlxG.sound.music != null)
        Conductor.songPosition = FlxG.sound.music.time;

    if (water != null)
		water.iTime = Conductor.songPosition / 1000;
    
    if(!transitioning){

        if (FlxG.mouse.justReleased){
			// FlxG.sound.play(Paths.sound('clickText'), 0.3);

            if (fuckingCounter > 68 && !reachedPeak){
                spinLMAO.play();
                FlxG.sound.play(Paths.sound("runnin"));
                reachedPeak = true;
            }
			if (fuckingCounter > 10) {
				var gooFNmi:FlxSprite = new FlxSprite(0,200 + FlxG.random.float(-200,500));
				var quickSwitch:Bool = FlxG.random.bool();

                var ranInt:Bool = FlxG.random.int(0,2);

				gooFNmi.frames = Paths.getSparrowAtlas('menus/mainmenu/secret/' + goons[ranInt]);
				gooFNmi.animation.addByPrefix('idle','idle',24,true);
				gooFNmi.animation.play('idle');
				gooFNmi.setGraphicSize(Std.int(gooFNmi.width * (0.5 + FlxG.random.float(-0.4,1))));
				
				gooFNmi.flipX = quickSwitch;

				add(gooFNmi);

				FlxG.sound.play(Paths.sound('ooosecret/loony running'), 0.35).pitch = FlxG.random.float(0.6,1.5);

                if (ranInt == 2){
                    gooFNmi.y = FlxG.height + 300;
                    gooFNmi.x = FlxG.random.float(-100,800);
                    FlxTween.tween(gooFNmi, {y: -1000, /** READD THIS WITH A PERCENT CHANCE :3 angle: 359 **/},1 + FlxG.random.float(-0.6,1),{ease: FlxEase.linear,
                        onComplete: function(twn:FlxTween)
                        {
                            remove(gooFNmi);
                            gooFNmi.destroy();
    
                            trace("runner died");
                            FlxG.sound.play(Paths.sound('ooosecret/loony dies'), 0.2);
                        }});

                } else {
                    gooFNmi.x = (gooFNmi.flipX ? 1200 : -400);
                    FlxTween.tween(gooFNmi, {x: (gooFNmi.flipX ? -400 : 1200), /** READD THIS WITH A PERCENT CHANCE :3 angle: 359 **/},1 + FlxG.random.float(-0.6,1),{ease: FlxEase.linear,
                        onComplete: function(twn:FlxTween)
                        {
                            remove(gooFNmi);
                            gooFNmi.destroy();
    
                            trace("runner died");
                            FlxG.sound.play(Paths.sound('ooosecret/loony dies'), 0.2);
                        }});
                }
				
					
				trace("runner created");
			}

			fuckingCounter++;
            trace(fuckingCounter);
		}

        if(controls.ACCEPT || (FlxG.mouse.overlaps(grpMenuItems) && FlxG.mouse.justReleased)){
            CoolUtil.playMenuSFX(1, 1);

            if (curSelectedA == 0) {
                if (!redStory) {
                    transitioning = true;
                    doSTFU();
                }
                else if (canAnnoyNmi) {
                    nmiN--;
                    if (nmiN == 0) {
                        canAnnoyNmi = false;
                        FlxG.sound.play(Paths.sound("menu/voicelines/6"));
                        FlxG.camera.addShader(g);

                        FlxTween.num(0, 2, 0.2, {ease: FlxEase.circIn, onComplete: () -> {
                            grpMenuItems.members[0].destroy();
                            grpMenuItems.members[0] = null;
                            
                            changeSelection(1);
                            FlxG.camera.removeShader(g);
                            g.prob = 0;
                        }}, (v) -> {g.prob = v;});
                    }
                }
                return;
            }

            transitioning = true;
            t.cancel();

            FlxFlicker.flicker(grpMenuItems.members[curSelectedA], .45, 0.06, true, false, (_) -> {
                transTv();
            });

            for (i in 0...grpMenuItems.members.length) {
                if (grpMenuItems.members[i] != null) {
                    FlxTween.tween(grpMenuItems.members[i], {alpha: 0}, 0.4, {
                        ease: FlxEase.quadOut,
                        startDelay: .45,
                        onComplete: (_) -> grpMenuItems.members[i].kill()
                    });
                }
            }
        }

        if (controls.UP_P || controls.DOWN_P) changeSelection(controls.UP_P ? -1 : 1);
        if (FlxG.mouse.wheel != 0) changeSelection(-1 * FlxG.mouse.wheel, false);

        if (controls.BACK) {
            FlxG.switchState(new TitleState());
            staticSound.destroy();
        }
    }

    for (item in grpMenuItems.members) {
        if (item != null) {
            if (item.ID == 0 && redStory) item.alpha = lerp(item.alpha, (item.ID == curSelectedA ? 0.25 : 0.1), e * 18);
            item.alpha = lerp(item.alpha, (item.ID == curSelectedA ? 0.9 : 0.5), e * 18);
    
            if (item.ID == 0 && redStory) item.scale.x = item.scale.y = lerp(item.scale.y, (item.ID == curSelectedA ? 0.38 : 0.35), e * 18);
            item.scale.x = item.scale.y = lerp(item.scale.y, (item.ID == curSelectedA ? 0.55 : 0.45), e * 18);
    
            if (item.ID == 0 && redStory) item.color = CoolUtil.lerpColor(item.color, (item.ID == curSelectedA ? 0xFFFF0000 : 0xFF680000), e*19);
            item.color = CoolUtil.lerpColor(item.color, (item.ID == curSelectedA ? FlxColor.WHITE : FlxColor.RED), e*19);
        }
    }

    if(controls.SWITCHMOD){
        persistentUpdate = !(persistentDraw = true);
		openSubState(new ModSwitchMenu());
    }
    // keys
    if(FlxG.keys.justPressed.SEVEN){
        persistentUpdate = !(persistentDraw = true);
		openSubState(new EditorPicker());        
    }

    topSpikes.x += 35 * e;
    bottomSpikes.x -= 35 * e;
}

function doSTFU() {
    FlxTween.color(grpMenuItems.members[0], .55, FlxColor.WHITE, FlxColor.RED,{ onComplete: (_) -> redStory = true });
    FlxTween.tween(tf3, { alpha: 1 }, .85, { ease: FlxEase.quadOut, startDelay: 2});
    FlxTween.tween(vid, { alpha: 1 }, 2, { ease: FlxEase.quadOut, onComplete: (_) -> {
        vid.play();
        ltgSound.play();
    }});
}

var timerForFake:FlxTimer = null;
function changeSelection(change:Int = 0, playSound:Bool = true, mouse:Bool = false)
{
    isScreenIn = true;
    FlxG.sound.play(Paths.sound("menu/Hover"));
    staticSound.play();

    for (item in grpMenuChars)
        item.animation.play("play");

    if (playSound)
        CoolUtil.playMenuSFX(3,0.8);

    if (mouse) {
        curSelectedA = change;
    } else {
        curSelectedA += change;

        if (!canAnnoyNmi && curSelectedA == 0) curSelectedA = change;

        if (curSelectedA < 0) curSelectedA = menuOptions.length - 1;
        if (curSelectedA >= menuOptions.length) curSelectedA = (canAnnoyNmi ? 0 : 1);
    }

    if (timerForFake == null) {
        timerForFake = new FlxTimer().start(.75, (_) -> {
            staticSound.pause();
            FlxG.sound.play(Paths.sound("menu/StaticOut"));
            isScreenIn = false;

            for (item in grpMenuChars) {
                item.visible = (item.ID == curSelectedA);
                if (item.ID == curSelectedA)
                    item.animation.play('play', true, true);
            }
            
            timerForFake = null;
        });
    } else {
        // Reset the timer if we still have something going on.
        timerForFake.reset(1);
    }
}

function transTv() {
    final spr = grpMenuChars.members[curSelectedA];
    
    FlxTween.color(spr, .65, FlxColor.WHITE, FlxColor.BLACK);
    FlxTween.tween(FlxG.camera, {zoom: 5}, 1,{ease: FlxEase.quadIn});
    FlxTween.tween(spr, {y: spr.y + 180}, 1,{ease: FlxEase.circOut, onComplete: (_) -> {
        switch(curSelectedA){
            case 1: FlxG.switchState(new ModState('custom/freeplay'));
            case 2: FlxG.switchState(new ModState('custom/extras'));
            case 3: FlxG.switchState(new OptionsMenu());
        }
        staticSound.destroy();
    }});
}

function staticScreen() {
    for (item in grpMenuChars) {
        item.visible = !(item.ID != 4);
        item.animation.play(item.ID != 4 ? 'stop' : 'play');
    }
}