//a
import flixel.math.FlxRect;

public var leftHealth:FlxSprite;
public var rightHealth:FlxSprite;
public var barHealth:FlxSprite;

var __healthScale:Float = 0.9;

public var barX:Float = 200;
public var barY:Float = 970; 

public var partsAlpha = 0;

public var cam = camInsideTV;


function postCreate() {

    for (uselessBar in [healthBar,healthBarBG]) uselessBar.visible = false;

    leftHealth = new FlxSprite(barX,barY, Paths.image("healthBars/nmi/NMI_healthbarBGfull"));
    leftHealth.color = dad.iconColor;
    leftHealth.camera = cam;
    leftHealth.setGraphicSize(Std.int(leftHealth.width * __healthScale));
    leftHealth.updateHitbox();

    leftHealth.clipRect = new FlxRect(0, 0, leftHealth.frameWidth*0.5, leftHealth.frameHeight);


    letterA = new FlxSprite(0,0,Paths.image("healthBars/nmi/txt1"));

    letterB = new FlxSprite(0,0,Paths.image("healthBars/nmi/txt2"));

    letterC = new FlxSprite(0,0,Paths.image("healthBars/nmi/txt3"));
    


    for (num => letter in [letterA,letterB,letterC]){
        letter.camera = cam;
        letter.ID = num;
        letter.onDraw = function(spr:FlxSprite) {
            spr.setPosition(leftHealth.x, leftHealth.y);
            spr.draw();
        };
    
    }
    

    rightHealth = new FlxSprite(0,0, Paths.image("healthBars/nmi/NMI_healthbarBGfull"));
    rightHealth.color = boyfriend.iconColor;
    rightHealth.camera = cam;
    rightHealth.setGraphicSize(Std.int(rightHealth.width * __healthScale));
    rightHealth.updateHitbox();
    rightHealth.onDraw = function(spr:FlxSprite) {
        spr.setPosition(leftHealth.x, leftHealth.y);
        spr.draw();
    };
    
    rightHealth.clipRect = new FlxRect(0, 0, rightHealth.frameWidth, rightHealth.frameHeight);

    barHealth = new FlxSprite(0,0, Paths.image("healthBars/nmi/NMI_healthbarBG"));
    barHealth.camera = cam;
    barHealth.onDraw = function(spr:FlxSprite) {
        spr.setPosition(leftHealth.x + 32, leftHealth.y + 5);
        spr.draw();
    }

    for (items in [letterA,letterB,letterC,rightHealth,leftHealth,barHealth]){
        insert(members.indexOf(iconP2) - 1, items);
    }

    for (icon in [iconP1,iconP2]){
        icon.cameras = [cam];
    }
}

public function changeBarCam(camy:FlxCamera) {

    for (item in [leftHealth,letterA,letterB,letterC,rightHealth,barHealth]){
        item.camera = camy;
    }
    trace("done");
}

var songPercentage:Float = 0;
function update(e) {
    songPercentage = (Conductor.songPosition / inst.length);
    // trace(songPercentage);
    leftHealth.clipRect = new FlxRect(0, 0, leftHealth.frameWidth * (1 - (healthTarget / maxHealth)), leftHealth.frameHeight);

    leftHealth.setPosition(barX,barY);

    for (items in [letterA,letterB,letterC,leftHealth,rightHealth,barHealth]){
        if (items.alpha != partsAlpha)
            items.alpha = partsAlpha;
    }


    if (letterA.color != FlxColor.RED)
        if (songPercentage > 0.2){
            letterA.color = CoolUtil.lerpColor(letterA.color, FlxColor.RED, e);
        }

    if (letterB.color != FlxColor.RED)
        if (songPercentage > 0.35){
            letterB.color = CoolUtil.lerpColor(letterB.color, FlxColor.RED, e);
        }

    if (letterC.color != FlxColor.RED)
        if (songPercentage > 0.5){
            letterC.color = CoolUtil.lerpColor(letterC.color, FlxColor.RED, e);
        }

    for (letter in [letterA,letterB,letterC]){
        if (letter.color != FlxColor.BLACK)
            if (songPercentage > 0.55){
                letter.color = CoolUtil.lerpColor(letter.color, FlxColor.BLACK, e * 4);
            }
    }
}

function postUpdate(e) {
    iconP2.setPosition(leftHealth.x - 60,leftHealth.y - (camHUD.downscroll ? 0 : 30));
    iconP2.offset.set(10,(camHUD.downscroll ? 0 : -10));

    iconP1.setPosition((leftHealth.x + leftHealth.frameWidth) - 200 ,leftHealth.y - (camHUD.downscroll ? 0 : 30));
    iconP1.offset.set(-20,(camHUD.downscroll ? 0 : -10));

    // letterA.x += FlxG.random.int(-10,10);
    // letterA.y += FlxG.random.int(-10,10);
}

// Conductor.songPosition / inst.length