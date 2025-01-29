
import flixel.addons.display.FlxBackdrop;
import flixel.input.mouse.FlxMouseEvent;
import sys.FileSystem;

final fish = new CustomShader('fisheye');


// var pathGal:String = 'images/gallery/Art/';
var curSelected:Int = 0;
static var pathGal = StringTools.replace(FileSystem.absolutePath(Assets.getPath("assets/images/gallery/Art/")), "/", "\\");
var grpImgs:FlxTypedGroup;

var galItems:Array<String> = [];
function create() {
    camnotNormal = new FlxCamera();
    camnotNormal.bgColor = FlxColor.TRANSPARENT;
    FlxG.cameras.add(camnotNormal, false);
    
    fish.MAX_POWER = 0.3;
    camnotNormal.addShader(fish);

    add(checkBG = new FlxBackdrop(Paths.image('gallery/bg')));
    checkBG.camera = camnotNormal;
	checkBG.velocity.set(80,80);

    camNormal = new FlxCamera();
    camNormal.bgColor = FlxColor.TRANSPARENT;
    FlxG.cameras.add(camNormal, false);

    grpImgs = new FlxTypedGroup();
    grpImgs.camera = camNormal;
    add(grpImgs);

    add(overlay = new FlxSprite().loadGraphic(Paths.image('gallery/overlay')));
    overlay.scale.set(0.8,0.7);
    overlay.updateHitbox();
    overlay.screenCenter();
    overlay.alpha = 0.8;
    

    add(lArrow = new FlxSprite().loadGraphic(Paths.image('gallery/arrow')));
    lArrow.scale.set(0.4,0.4);
    lArrow.updateHitbox();
    lArrow.screenCenter(FlxAxes.Y);

    add(rArrow = new FlxSprite(1160).loadGraphic(Paths.image('gallery/arrow')));
    rArrow.flipX = true;
    rArrow.scale.set(0.4,0.4);
    rArrow.updateHitbox();
    rArrow.screenCenter(FlxAxes.Y);

    add(descTxt = new FunkinText(0, FlxG.height * 0.75, 0, "SCORE:", 32, true));
    descTxt.screenCenter(FlxAxes.X);

    for (all in [overlay,lArrow,rArrow,descTxt]){
        all.camera = camNormal;
    }
}


//only pngs so far
function postCreate() {
    if(FileSystem.exists(pathGal))
        for (num => file in FileSystem.readDirectory(pathGal)) {
            if (StringTools.endsWith(file,'.png')){
                grpImgs.add(random = new FlxSprite().loadGraphic(Paths.image('gallery/Art/' + file.substr(0, file.length - 4))));
                random.camera = camNormal;
                random.ID = num;
                random.screenCenter();

                galItems.push(file.substr(0, file.length - 4));
            } else {
                trace(file);
            }

            
        }
    else
        trace("doesnt");

    changeSelection(0);
}

var debugSize:Float = 1;

function clamp(value: Float, min: Float): Float {
    if (value < min)
        return min;
    else
        return value;
}

var arrowTarget:Array<Float> = [0,1160];
function update(e:Float) {
    if (FlxG.mouse.justReleased){
        if (FlxG.mouse.overlaps(lArrow)){
            changeSelection(-1);
            lArrow.x -= 60;
            lArrow.scale.set(0.3,0.3);
        }

        if (FlxG.mouse.overlaps(rArrow)){
            changeSelection(1);
            rArrow.x += 60;
            rArrow.scale.set(0.3,0.3);
        }
    }

    if (controls.BACK)
        FlxG.switchState(new ModState('custom/extras'));

    if (controls.LEFT_P)
        debugSize -= 0.2;

    if (controls.RIGHT_P)
        debugSize += 0.2;

    if (FlxG.mouse.wheel > 0)
        debugSize += 0.025;
    else if (FlxG.mouse.wheel < 0)
        debugSize = clamp(debugSize - 0.025, 0.1);

    for (num => arrows in [lArrow,rArrow]){
        arrows.x = lerp(arrows.x,arrowTarget[num],FlxMath.bound(e * 8, 0, 1));

        arrows.scale.x = arrows.scale.y = lerp(arrows.scale.y, 0.4,FlxMath.bound(e * 8, 0, 1));
    }

    for (item in grpImgs.members){
        // if (item.ID == curSelected){
            item.scale.x = item.scale.y = lerp(item.scale.y,debugSize,FlxMath.bound(e * 6, 0, 1));
            item.screenCenter();
        // }
    }
    
}

function changeSelection(change:Int = 0){
    // debugSize = 1;
    curSelected += change;

    if (curSelected < 0)
        curSelected = grpImgs.length - 1;
    if (curSelected >= grpImgs.length)
        curSelected = 0;

    trace(curSelected);

    for (item in grpImgs.members){
        item.visible = (item.ID == curSelected ? true : false);
    }
    descTxt.text = galItems[curSelected];
    descTxt.screenCenter(FlxAxes.X);
}    