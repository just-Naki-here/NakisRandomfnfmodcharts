import flixel.addons.display.FlxBackdrop;
import hxvlc.flixel.FlxVideoSprite;

var creepyMus;
var adjCol:CustomShader = null;
var twitchGrp:FlxTypedGroup<FlxSprite>;
function create() {
    persistentUpdate = false;
    camera = newCam = new FlxCamera();
    FlxG.cameras.add(newCam, false);

    adjCol = new CustomShader("adjustColor");
    // adjCol.saturation = -100;
    // adjCol.contrast = 100;
    newCam.addShader(adjCol);

    add(fuck = new FlxSprite().makeSolid(1,1, FlxColor.BLACK));
    fuck.setGraphicSize(1280, 720);
    fuck.screenCenter();

    creepyMus = FlxG.sound.load(Paths.sound('intro/classic/song'));
    
    // new FlxTimer().start(12, () -> {FlxG.cameras.remove(newCam); close();});

    tGFaceUp = new FunkinSprite();
    tGFaceUp.frames = Paths.getSparrowAtlas('stages/classic/intro/rse-phase1');
    tGFaceUp.animation.addByPrefix('idle','freak',30,true);
    tGFaceUp.animation.play('idle');
    tGFaceUp.scale.set(2,2);
    tGFaceUp.updateHitbox();
    tGFaceUp.screenCenter();
    tGFaceUp.antialiasing = true;
    add(tGFaceUp);
    tGFaceUp.visible = false;

    twitchGrp = new FlxTypedGroup();
    add(twitchGrp);
    twitchGrp.visible = false;

    twitchGrp.add(hallBG = new FunkinSprite().loadGraphic(Paths.image('stages/classic/intro/hall')));
    hallBG.scale.set(0.5,0.5);
    hallBG.updateHitbox();
    hallBG.screenCenter();

    twitchyGuy = new FunkinSprite(380,350);
    twitchyGuy.frames = Paths.getSparrowAtlas('stages/classic/intro/rse-phase0');
    twitchyGuy.animation.addByPrefix('idle','anim',30,true);
    twitchyGuy.animation.play('idle');
    twitchyGuy.scale.set(0.6,0.6);
    twitchyGuy.updateHitbox();
    twitchGrp.add(twitchyGuy);

    add(wallsBG = new FlxBackdrop(Paths.image('stages/classic/intro/pipeWall'), true));
    wallsBG.scale.set(0.3,0.3);
    wallsBG.updateHitbox();
    wallsBG.screenCenter();
    wallsBG.velocity.x = 100;
    wallsBG.visible = false;

    add(introVid = new FlxVideoSprite());
    introVid.load(Paths.video('classic/intro'));
    
    introVid.bitmap.onEndReached.add(() -> {
        FlxTween.tween(introVid,{alpha: 0},0.5,{ease: FlxEase.quadOut, onComplete: (_) -> {
            introVid?.visible = false;
            introVid?.stop();
            introVid?.destroy();
            introVid = null;
            wallsBG.visible = true;

            FlxTween.tween(blackScreen,{alpha: 1},4,{ease: FlxEase.smootherStepInOut, startDelat: 3, onComplete: () -> {

                wallsBG.visible = false;
                twitchGrp.visible = true;
                newCam.zoom = 1.1;
                FlxTween.tween(blackScreen,{alpha: 0},1.6,{ease: FlxEase.smootherStepInOut, onComplete: () -> {
                    FlxTween.tween(newCam,{zoom: 1.8},6,{ease: FlxEase.smootherStepInOut, onComplete: () -> {

                        FlxTween.tween(blackScreen,{alpha: 1},1.5,{ease: FlxEase.smootherStepInOut, onComplete: () -> {

                            FlxTween.tween(blackScreen,{alpha: 0},2,{ease: FlxEase.smootherStepInOut});

                            newCam.zoom = 1;
                            twitchGrp.visible = false;
                            tGFaceUp.visible = true;

                            FlxTween.tween(creepyMus,{pitch: -2, volume: 4},8,{ease: FlxEase.smootherStepInOut});

                            FlxTween.num(0, -100, 5, {ease: FlxEase.circIn}, (v) -> {adjCol.saturation = v;});
                            FlxTween.num(0, 100, 5, {ease: FlxEase.circIn, onComplete: () -> {
                                FlxTween.tween(blackScreen,{alpha: 1},4,{ease: FlxEase.smootherStepInOut,onComplete: () -> {
                                    tGFaceUp.visible = false;

                                    FlxTween.tween(creepyMus,{volume: 0},2,{ease: FlxEase.smootherStepInOut});

                                    FlxTween.tween(newCam,{alpha: 0},3,{ease: FlxEase.smootherStepInOut, startDelay: 1, onComplete: () -> {
                                        creepyMus?.stop();
                                        FlxG.cameras.remove(newCam);
                                        close();
                                    }});
                                }});
                            }}, (v) -> {adjCol.contrast = v;});
                        }});
                        
                       
                    }});

                    for (item in twitchGrp){
                        FlxTween.tween(item,{x: item.x + 100,y: item.y - 100},6,{ease: FlxEase.smootherStepInOut});
                    }
                }});

              
            }});
            
        }});
        
    });

    add(blackScreen = new FunkinSprite().makeGraphic(1,1,FlxColor.BLACK));
    blackScreen.setGraphicSize(1280,720);
    blackScreen.updateHitbox();
    blackScreen.screenCenter();
    blackScreen.alpha = 0;

    var tranDur:Float = .35;
    add(up = new FlxBackdrop(Paths.image("menus/extras/Spikey"),FlxAxes.X, 0, 0));
    up.flipY = true;
    up.velocity.x = -200;
    up.y = -1000;
    FlxTween.tween(up,{y: up.y - 1000},tranDur,{ease: FlxEase.circInOut});
    
    add(down = new FlxBackdrop(Paths.image("menus/extras/Spikey"),FlxAxes.X, 0, 0));
    down.velocity.x = 200;
    down.y = 350;
    FlxTween.tween(down,{y: down.y + 1000},tranDur,{ease: FlxEase.circInOut, onComplete: init});
}

function init() {
    FlxG.sound.play(Paths.sound("menu/TransitionIn"));
    creepyMus?.play();
    introVid.play();
}