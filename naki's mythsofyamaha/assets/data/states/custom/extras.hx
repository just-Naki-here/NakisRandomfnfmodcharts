import FlxG;
import flixel.input.mouse.FlxMouseEvent;
import flixel.effects.FlxFlicker;
import funkin.options.OptionsMenu;
import flixel.addons.display.FlxBackdrop;
import sys.net.Http;
import funkin.menus.credits.CreditsMain;

import flixel.graphics.frames.FlxBitmapFont;
import flixel.text.FlxBitmapText;
import flixel.text.FlxText;

// Variables
var grpMenuItems:FlxTypedGroup<FlxSprite>;
var transitioning: Bool = false;
public static var curSelectedA: Int = 0;

// Constants
final rootDirectory: String = 'menus/extras/';
final extraOptions: Array<String> = [
    "Discord",
    "Credits",
    "Gallery",
    "options"
];
final characterPoses: Array<String> = [
    "Allfather",
    "NMI"
];

// Shaders
final water = new CustomShader('water');
final latestDiscordInv = new Http("https://raw.githubusercontent.com/Luscious77/Gimmick/main/MOY/json/mod.json");
var discordServerLink:String = '???';

final subtitle:Array<String> = [
    'you dont look like\na baby to me',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    'multiple assassinations and yet\nyou couldnt kill your childs partner\nwhat a fool you are',
    'personally i wouldnt have\nlet that relationship slide',
    'you couldnt kill the blue\none fine i will\ndo it myself then',
    'stop your crying\nam trying to drink',
    'yesh',
    'is your life like this',
    'when will you go on with your departure\nfrom here i want some alone time'
];

var curPlayingLine:Int = 0;
var nmiSubtitle:FlxBitmapText;
function create() {

    latestDiscordInv.onData = function(data:String) {
        var parsedJson:Dynamic = Json.parse(data);
        discordServerLink = parsedJson.discordServerLink;
    }
    latestDiscordInv.request();

    bg = new FlxSprite().loadGraphic(Paths.image(rootDirectory + 'Background'));
    bg.scale.set(0.4, 0.425);
    bg.shader = water;
    bg.screenCenter();
    add(bg);

    charPose = new FlxSprite().loadGraphic(Paths.image(rootDirectory + 'characterPoses/' + characterPoses[1])); //FlxG.random.int(0, characterPoses.length - 1)
    charPose.scale.set(0.425, 0.425);
    charPose.screenCenter();
    charPose.x -= 150;
    add(charPose);

    bottomSpikes = new FlxBackdrop(null, FlxAxes.X, 0, 0).loadGraphic(Paths.image(rootDirectory + 'Spikey'));
    bottomSpikes.y += 245;
    bottomSpikes.scale.set(0.5, 0.5);
    add(bottomSpikes);

    topSpikes = new FlxBackdrop(null, FlxAxes.X, 0, 0).loadGraphic(Paths.image(rootDirectory + 'Spikey'));
    topSpikes.angle = 180;
    topSpikes.y -= 945;
    topSpikes.scale.set(0.5, 0.5);
    add(topSpikes);

    mg = new FlxSprite().loadGraphic(Paths.image(rootDirectory + 'Middleground'));
    mg.scale.set(0.435, 0.435);
    mg.screenCenter();
    add(mg);

    grpMenuItems = new FlxTypedGroup();
    add(grpMenuItems);

    for (i in 0 ... extraOptions.length) {
        if (i <= 2) {
            menuItem = new FlxSprite(FlxG.width * 0.575, (i * 245) + 10).loadGraphic(Paths.image("menus/extras/buttons/" + extraOptions[i]));
            menuItem.scale.set(0.425, 0.425);
            menuItem.updateHitbox();
            menuItem.ID = i;
            grpMenuItems.add(menuItem);
        } else {
            // This is for the settings icon in the top left.
            menuItem = new FlxSprite(FlxG.width * 0.025, FlxG.height * 0.03).loadGraphic(Paths.image("menus/menu_options"));
            menuItem.scale.set(0.55,0.55);
            menuItem.updateHitbox();
            menuItem.ID = i;
            grpMenuItems.add(menuItem);
        }
        FlxMouseEvent.add(menuItem, null, null, mouseHover, null, false, true, false);
    }

    var monospaceLetters:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var charSize = FlxPoint.get(220, 320);
    var fontMonospace = FlxBitmapFont.fromMonospace(Paths.image('merged'), monospaceLetters, charSize);

    nmiSubtitle = new FlxBitmapText(120 ,550, "now you see me", fontMonospace);
    nmiSubtitle.autoUpperCase = true;
    nmiSubtitle.scrollFactor.set();
    nmiSubtitle.scale.set(0.12,0.12);
    nmiSubtitle.updateHitbox();

    add(nmiSubtitle);

    doAline();
    
}

var curLine:FlxSound;
var txtTween;
var donePlaying:Bool = true;



var banList:Array<Int> = [1,2,3,4,5,6,7];
var unBanList:Array<Int> = [0,14];
function doAline() {
    if (donePlaying){
        donePlaying = false;
        FlxG.sound.music.fadeOut(.75,0.1);
        new FlxTimer().start(1, () -> {
            
            var theRand:Int = FlxG.random.int(unBanList[0],unBanList[1],banList);
            banList.push(theRand);

            if (banList.length >= 13)
                banList = [1,2,3,4,5,6,7];
            

            curLine = FlxG.sound.load(Paths.sound("menu/voicelines/extra/" + theRand));
            curPlayingLine = theRand;
            curLine.volume = FlxG.random.float(0.7,1.1);
            curLine.play();

            nmiSubtitle.alpha = 1;
            nmiSubtitle.text = subtitle[curPlayingLine];

            new FlxTimer().start((curLine.length / 1000) * 0.8, () -> {
                if (txtTween != null) txtTween.cancel();
                txtTween = FlxTween.tween(nmiSubtitle, {alpha : 0}, 1,{ease: FlxEase.linear});
            });

            new FlxTimer().start((curLine.length / 1000), () -> {
                donePlaying = true;
                curLine = null;
                FlxG.sound.music.fadeIn(1,0.1,0.6);
            });
        });
    }
}

function mouseHover(object: FlxSprite) {
    if (!transitioning && object.ID != curSelectedA)
        changeSelection(object.ID, true, true);
}

function changeSelection(change: Int = 0, playSound: Bool = true, mouse: Bool = false)
{
    FlxG.sound.play(Paths.sound("menu/Hover"));

    if (mouse) {
        curSelectedA = change;
    } else {
        curSelectedA += change;

        if (curSelectedA < 0)
            curSelectedA = extraOptions.length - 1;
        if (curSelectedA >= extraOptions.length)
            curSelectedA = 0;
    }
}

function beatHit(beat:Int) {
    if (curLine != null){
        if (beat % 4 == 0 && beat > 8 && !curLine.playing){
            if (FlxG.random.bool(30)) doAline();
        }
        nmiSubtitle.screenCenter();
        nmiSubtitle.offset.set(100,250);
    }
}
var totalElapsed: Int = 0;
function update(elapsed: Float) {
    if(!transitioning) {
        if (controls.BACK) {
            FlxG.switchState(new ModState('custom/mainMenu'));
            transitioning = true;
        }

        if(controls.ACCEPT || (FlxG.mouse.overlaps(grpMenuItems) && FlxG.mouse.justReleased)){
            CoolUtil.playMenuSFX(1, 1);

            if (!curSelectedA == 0)
                transitioning = true;

            FlxFlicker.flicker(grpMenuItems.members[curSelectedA], .45, 0.06, true, false, (flick: FlxFlicker) -> {
                switch(curSelectedA) {
                    case 0:
                        FlxG.switchState(FlxG.openURL(discordServerLink));

                    case 1:
                        FlxG.switchState(new CreditsMain());
    
                    case 2:
                        FlxG.switchState(new ModState('custom/galleryState'));
    
                    case 3:
                        FlxG.switchState(new OptionsMenu());
                }
            });
        }

        final shiftMult: Int = FlxG.keys.pressed.SHIFT ? 3 : 1;
        if(controls.UP_P)
            changeSelection(-shiftMult);
        else if(controls.DOWN_P)
            changeSelection(shiftMult);

        if(FlxG.mouse.wheel != 0)
            changeSelection(-shiftMult * FlxG.mouse.wheel, false);
    }

    topSpikes.x += 75 * elapsed;
    bottomSpikes.x -= 75 * elapsed;

    for (item in grpMenuItems.members) {
        item.alpha = lerp(item.alpha, (item.ID == curSelectedA ? 0.9 : 0.5), elapsed * 18);
        item.scale.x = item.scale.y = lerp(item.scale.y, (item.ID == curSelectedA ? 0.45 : 0.425), elapsed * 18);

        item.color = CoolUtil.lerpColor(item.color, (item.ID == curSelectedA ? FlxColor.WHITE : FlxColor.RED), elapsed*19);
    }

    totalElapsed += elapsed;
    water.iTime = Conductor.songPosition / 1000;
}

function destroy() {
    if (curLine != null)
        curLine.volume = 0;

    FlxG.sound.music.fadeIn(1,0.1,0.6);
}