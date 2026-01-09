import flixel.ui.FlxBar;
import flixel.util.FlxStringUtil;

function postCreate() {
    for (uselessBar in [healthBar,healthBarBG]) uselessBar.visible = false;


    healthyBar = new FlxBar(0, FlxG.height*0.9, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(750), Std.int(16), this, 'health', 0, maxHealth);
    healthyBar.createFilledBar(dad.iconColor != null ? dad.iconColor : 0xFFFF0000,boyfriend.iconColor != null ? boyfriend.iconColor : 0xFF00FF00);
    healthyBar.numDivisions = 800;
    healthyBar.unbounded = true;
	healthyBar.screenCenter(FlxAxes.X);
	healthyBar.cameras = [camHUD];
    healthyBar.angle = 180;
	insert(0,healthyBar);

    insert(members.indexOf(healthyBar)+1,barGraph = new FunkinSprite(0,FlxG.height*0.8).loadGraphic(Paths.image('healthBars/false/healthBar')));
    barGraph.camera = camHUD;
    barGraph.scale.set(0.3,0.3);
    barGraph.updateHitbox();
    barGraph.screenCenter(FlxAxes.X);
    barGraph.y -= 10;

    for (icons in [iconP1,iconP2]) icons.y -= 20;
}