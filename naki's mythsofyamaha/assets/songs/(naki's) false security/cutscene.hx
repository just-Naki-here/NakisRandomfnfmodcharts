
import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;

var unlockTypeShi:Array<String> = [];
var songCnt:Int = 0;
var veryNiceText:FlxBitmapText;

function create() {
    unlockTypeShi = FlxG.save.data.moySongsBeat;
    // trace(FlxG.save.data.moySongsBeat);
    persistentUpdate = false;
    camera = newCam = new FlxCamera();
    FlxG.cameras.add(newCam, false);

    for (songs in ['genesis','forever-dream','premeditated','classic']){
		if (unlockTypeShi.contains(songs)){
            songCnt++;
        }
	}
    
    if (songCnt >= 3){
        close();
    } else {
        add(backBlack = new FunkinSprite().makeGraphic(FlxG.width,FlxG.height,FlxColor.BLUE));
        backBlack.screenCenter();
    
        msg = new FlxText(0,0, FlxG.width ,"you have not beaten the other 4 songs...\n\n\nget to it",64);
        msg.setFormat(Paths.font("vcr.ttf"), msg.size, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        msg.camera = newCam;
        msg.borderSize = 1.25;
        msg.screenCenter();
        add(msg);
    
        new FlxTimer().start(5, function(){
            FlxG.switchState(new ModState('custom/mainMenu'));
        });
    }    
}

var trantitioning:Bool = false;
function update(e) {
    if (controls.ACCEPT && !trantitioning){
        trantitioning = true;
        FlxG.switchState(new ModState('custom/mainMenu'));
    }
}