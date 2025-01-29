

public var grpSnowFall:FlxTypedGroup<FlxSprite>;

public var snowDirection:Array<Float> = [
    -480,
    480
];

var curShader = null;

function postCreate() {
    grpSnowFall = new FlxTypedGroup();
    grpSnowFall.camera = camSonic;
    add(grpSnowFall);
}

function makeItSnow() {
    snowBall = new FlxSprite(FlxG.random.int(200,4000),FlxG.random.int(-800,-1400));
    if (FlxG.random.bool(50)){
        snowBall.loadGraphic(Paths.image('stages/forever/fx/alt'));
    } else {
        snowBall.frames = Paths.getSparrowAtlas('stages/forever/fx/snow');
        snowBall.animation.addByPrefix('anim', 'snowfall0', 8, false);
        snowBall.animation.play('anim');
    }
    snowBall.scrollFactor.set();
        
    final randomSizeMul:Float = 0.7 * FlxG.random.float(0.8,1.2);
    snowBall.scale.set(randomSizeMul,randomSizeMul);
        
    //speed of fall
    var randomMult:Float = FlxG.random.float(0.6,1.8);

    snowBall.velocity.set(
        snowDirection[0] * randomMult,
        snowDirection[1] * randomMult
    );
    
    if (FlxG.save.data.fdBloom) {
        snowBall.shader = curShader;
    }
    
    snowBall.alpha = 0.6 * FlxG.random.float(0.2,1);
    grpSnowFall.add(snowBall);
}

public function changeSnowGlitchAmt(sqrAmt:Float = 0.0,chroma:Float = 0.0) {
    if (curShader == null) curShader = new CustomShader("Glitch");

    curShader.prob = sqrAmt;
	curShader.intensityChromatic = chroma;
}

var elapsedTime:Float = 0;
function update(e) {
    elapsedTime += e;
    curShader?.time = elapsedTime;
    
    for (item in grpSnowFall.members){
        if (item.y >= 2000){
            grpSnowFall.remove(item,true);
        }
    }
}

function stepHit() {
    makeItSnow();
}