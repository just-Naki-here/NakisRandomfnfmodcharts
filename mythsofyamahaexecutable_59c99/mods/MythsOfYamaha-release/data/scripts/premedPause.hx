
var txtGraphic;
var txtGroup = [];
var s = new CustomShader('vhsPause');

var options = ['Resume', 'Restart', 'Options', 'Quit'];

function create(_) {
    _.cancel();
    _.music = 'premed-pause';

    FlxG.cameras.add(pauseCam = new FlxCamera(), false).bgColor = 0;
    cameras = [pauseCam];

    menuItems.remove('Change Controls'); 
    menuItems.remove('Exit to charter');

    add(fuck = new FlxSprite().makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK)).alpha = 0.4;
    add(txtGraphic = new FlxSprite().makeSolid(1, 1, FlxColor.BLACK));

    for (i in 0...menuItems.length) {
        add(txt = new FlxText(0, 150 + (i * 120), 0, options[i].toUpperCase())).setFormat(Paths.font('vcr.ttf'), 65, FlxColor.WHITE, 'center');
        txt.borderSize = 5;
        txt.screenCenter(FlxAxes.X);
        txt.antialiasing = true;
        txtGroup.push(txt);
    }

    changeSelection(0);
    FlxG.game.addShader(s);
}

var f = 0;

function update(_) {
    if (controls.UP_P || controls.DOWN_P) 
        changeSelection(controls.UP_P ? -1 : 1);
    
    if (controls.ACCEPT) selectOption();
    if (controls.BACK) close();

    f += _; s.iTime = f;
}

function changeSelection(_) {
	curSelected += _;
    FlxG.sound.play(Paths.sound('menu/scroll'));

	if (curSelected < 0) curSelected = menuItems.length - 1;
	if (curSelected >= menuItems.length) curSelected = 0;

    var t = txtGroup[curSelected];

    txtGraphic.scale.set(t.fieldWidth + 20, t.fieldHeight + 20);
    txtGraphic.updateHitbox();
    txtGraphic.setPosition(t.getGraphicMidpoint().x - txtGraphic.scale.x/2, t.getGraphicMidpoint().y - txtGraphic.scale.y/2);
}

function destroy() FlxG.game.removeShader(s);