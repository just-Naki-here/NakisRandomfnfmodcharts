//a
import flixel.math.FlxRect;

var leftHealth:FlxSprite;
var rightHealth:FlxSprite;
var barHealth:FlxSprite;

var __healthScale:Float = 0.9;

var barX:Float = 306.25;
var barY:Float = 587.5; 

var diffpartsAlpha:Float = 1;

var cam = camHUD;


function postCreate() {

    for (uselessBar in [healthBar,healthBarBG]) uselessBar.visible = false;

    leftHealth = new FlxSprite(barX,barY, Paths.image("healthBars/nmi/NMI_healthbarBGfull"));
    leftHealth.color = (dad.iconColor != null ? dad.iconColor : 0xFFFF0000);
    leftHealth.camera = cam;
    leftHealth.setGraphicSize(Std.int(leftHealth.width * __healthScale));
    leftHealth.updateHitbox();

    leftHealth.clipRect = new FlxRect(0, 0, leftHealth.frameWidth*0.5, leftHealth.frameHeight);

    rightHealth = new FlxSprite(0,0, Paths.image("healthBars/nmi/NMI_healthbarBGfull"));
    rightHealth.color = (boyfriend.iconColor != null ? boyfriend.iconColor : 0xFF00FF00);
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
        spr.setPosition(leftHealth.x + 34, leftHealth.y + 5);
        spr.draw();
    }

    for (items in [rightHealth,leftHealth,barHealth]){
        insert(members.indexOf(iconP2) - 1, items);
    }

}

public function changeBarCam(camy:FlxCamera) {

    for (item in [leftHealth,rightHealth,barHealth]){
        item.camera = camy;
    }
}

function update(e) {
    leftHealth.clipRect = new FlxRect(0, 0, leftHealth.frameWidth * (1 - (health / maxHealth)), leftHealth.frameHeight);

    leftHealth.setPosition(barX,barY);

    for (items in [leftHealth,rightHealth,barHealth]){
        items.alpha = diffpartsAlpha;
    }
}