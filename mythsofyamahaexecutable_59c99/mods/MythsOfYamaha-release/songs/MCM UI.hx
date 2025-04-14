import flixel.text.FlxTextFormat;
import flixel.text.FlxTextBorderStyle;

public var mistIconP1:HealthIcon;
public var mistIconP2:HealthIcon;
public var hudVisible:Bool = true;

var currentSong = PlayState.instance.SONG.meta.name.toLowerCase();

var iconOffsets:Array<Array<Float>> = [];

public var stopHealthInit:Bool = false;
public var healthBG:FlxSprite;

importScript("data/scripts/subtitles");


function postCreate()
{
    healthBG = new FlxSprite().loadGraphic(switch(currentSong){
        case 'delivery': Paths.image("stages/sand_flat/delivery-healthbar");
        case 'paradise': Paths.image("stages/paradise/paradise-healthbar");
        default: Paths.image("game/mcm-healthbar");
    });
    healthBG.cameras = [camHUD];
    insert(members.indexOf(healthBar) + 1, healthBG);
    healthBG.y = (currentSong == 'paradise' ? 312+(downscroll ? 25 : 0) : 530);
    healthBG.x = -26;
    if (currentSong == 'paradise') healthBG.screenCenter(FlxAxes.X);
    healthBG.scale.set(0.45, currentSong == 'delivery' ? 0.45 : 0.4);
    healthBG.antialiasing = true;

    healthBar.scale.set(0.68, 1.8);
    if (currentSong == 'paradise') {
        healthBar.scale.set(0.75, 2.3);
        healthBar.y -= (downscroll ? 7 : 20);
    }
	healthBarBG.scale.set(0, 0);
	healthBarBG.alpha = 0;
	healthBar.alpha = 0.7;
    healthBar.numDivisions = 10000;

	for (i in [accuracyTxt, missesTxt, scoreTxt])
	{
		if(currentSong == 'delivery') i.setFormat(Paths.font("arial.ttf"), 20, null, null); else
        if(currentSong == 'propaganda') i.setFormat(Paths.font("nxtsunday.ttf"), 24, FlxColor.BLACK, null); else
        if(currentSong == 'paradise') { 
            i.setFormat(Paths.font("badabb.ttf"), 30, 0xFFffff00, null, FlxTextBorderStyle.OUTLINE, 0xFF000000); 
            i.borderSize = 1.5;
        } else
        i.setFormat(Paths.font("krabby.ttf"), 20, null, null, FlxTextBorderStyle.OUTLINE, 0xFF000000);
        i.antialiasing = true; //hmmm
	}

	scoreTxt.visible = false;
	accuracyTxt.visible = false;
    PlayState.instance.comboGroup.visible = false;
    iconP1.visible = iconP2.visible = false;


	var bfColor = (boyfriend != null && boyfriend.xml != null && boyfriend.xml.exists("color")) ? CoolUtil.getColorFromDynamic(boyfriend.xml.get("color")) : 0xFF66FF33;
	var dadColor = (dad != null && dad.xml != null && dad.xml.exists("color")) ? CoolUtil.getColorFromDynamic(dad.xml.get("color")) : 0xFFFF0000;

	healthBar.createFilledBar(dadColor, bfColor);

    for (newIcon in 0...2) {
        var framerate;
        switch (currentSong){
            case "paradise": framerate = 3;
            case "surrogate": framerate = 12;
        }
        var icon = createIcon(newIcon == 1 ? boyfriend : dad, framerate);
        add(switch (newIcon) {
            case 1: mistIconP1 = icon;
            case 0: mistIconP2 = icon;
        });
    }

    updateIcons();
    healthBar.updateBar();

    window.title = "Mistful Crimson Morning - " + PlayState.SONG.meta.name;
    if (!hudVisible) for (i in [healthBG, healthBar, mistIconP1, mistIconP2, missesTxt]) i.visible = false;
    PauseSubState.script = 'data/scripts/menus/MCM Pause';
    allowGitaroo = false;

    //mistIconP1.visible = mistIconP2.visible = false;
    textTest(currentSong);
}

static function createIcon(character:Character, ?frameRate:Int = 24):FlxSprite {
    var icon = new FlxSprite();
    icon.ID = iconOffsets.length;

    var path = 'icons/' + ((character != null) ? character.getIcon() : "face");
    if (!Assets.exists(Paths.image(path))) path = 'icons/face';

    if ((character != null && character.xml != null && character.xml.exists("animatedIcon")) ? (character.xml.get("animatedIcon") == "true") : false) {
        icon.frames = Paths.getSparrowAtlas(path);
        
        if(!character.xml.exists("noLosingIcon")){
            icon.animation.addByPrefix("losing", "losing", frameRate, true);
        }
        icon.animation.addByPrefix("idle", "idle", frameRate, true);
        icon.animation.play("idle");
    } else {
        icon.loadGraphic(Paths.image(path)); // load once to get the width and stuff
        icon.loadGraphic(icon.graphic, true, icon.graphic.width/2, icon.graphic.height);
        icon.animation.add("non-animated", [0,1], 0, false);
        icon.animation.play("non-animated");
    }

    icon.flipX = character.isPlayer; icon.updateHitbox();
    if(character.xml.exists("iconScale")){
        icon.scale.set(Std.parseFloat(character.xml.get("iconScale")),Std.parseFloat(character.xml.get("iconScale")));
    }
    icon.cameras = [camHUD]; icon.scrollFactor.set();
    icon.antialiasing = character.antialiasing;

    iconOffsets.push([
        (character != null && character.xml != null && character.xml.exists("iconoffsetx")) ? Std.parseFloat(character.xml.get("iconoffsetx")) : 0,
        (character != null && character.xml != null && character.xml.exists("iconoffsety")) ? Std.parseFloat(character.xml.get("iconoffsety")) : 0
	]);

    return icon;
}

function update(elapsed:Float) updateIcons();
//smooth healthbar r
var lerpHealth = maxHealth/2;
var startLerpHealth = false;
function postUpdate()
{
    lerpHealth = CoolUtil.fpsLerp(lerpHealth, (health * 50), 0.3);
    if (startLerpHealth) healthBar.percent = lerpHealth;
}
function onSongStart() startLerpHealth = true;


static function updateIcons() {
    if(stopHealthInit){
        mistIconP1.visible = false;
        mistIconP2.visible = false;
        return;
    }
    // Positions 
    mistIconP1.x = 805;
    mistIconP2.x = 317;

    // Offsets
    for (icon in [mistIconP1, mistIconP2]) {
		var offset = iconOffsets[icon.ID];
        icon.x += offset[0];
		icon.y = healthBar.y - (currentSong == 'paradise' && !downscroll ? 101 : 76) + offset[1];

        // Animations
        var losing:Bool = switch (icon) {
            case mistIconP1: (healthBar.percent < 20);
            case mistIconP2: (healthBar.percent > 80);
            default: false;
        };

        if (icon.animation.name == "non-animated"){ icon.animation.curAnim.curFrame = losing ? 1 : 0;}
        else{
            if(icon.animation.exists("losing"))
                icon.animation.play(losing ? "losing" : "idle");
        }
    }
}

function onPlayerMiss(e) {
    FlxTween.cancelTweensOf(missesTxt);
    FlxTween.cancelTweensOf(missesTxt.scale);

    missesTxt.scale.set(0.8, 0.8);
    FlxTween.tween(missesTxt.scale, {x: 1, y: 1}, 0.3, {ease: FlxEase.quadOut});
    FlxTween.tween(missesTxt, {angle: 0}, 0.2, {ease: FlxEase.bounceOut});
}

function onSongEnd(){
    if(!PlayState.chartingMode) finishedSong = true;
}