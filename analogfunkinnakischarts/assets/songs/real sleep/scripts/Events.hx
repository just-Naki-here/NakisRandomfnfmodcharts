import openfl.geom.ColorTransform;
import flixel.addons.text.FlxTypeText;

import flixel.addons.display.FlxBackdrop;

import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextFormatMarkerPair;
import flixel.text.FlxTextFormat;

import flixel.addons.effects.FlxTrail;

import flixel.group.FlxTypedGroup;

if (PlayState.difficulty != "ALT") {
    var faceRed:Character;

    var vhs2015:CustomShader = new CustomShader("VHS/vhs2015");
    var iTimeSpeed:Float = 1.0;
    var iTime:Float = 0.0;

    var relEep:FlxSprite;
    var realSleepText:FlxTypeText;
    var realSleepTextStatic:FlxText;
    var rsTextBottom:FlxTypeText;
    var trailFace:FlxTrail;
    var iamgoingtokillmyself:FlxTypedGroup;

    var theRealEepTextShit:Bool;
    var prevNum:Int = 33;

    var particleEnabled = false;

    function postCreate() {
        if(Options.gameplayShaders)
            camGame.addShader(vhs2015);

        vhs2015.theBloom = 0.1;

        camZooming = true;

        insert(1, relEep = new FunkinSprite().makeSolid(1, 1)).screenCenter();
            relEep.color = 0xFF0f2338;
            relEep.scrollFactor.x = relEep.scrollFactor.y = relEep.zoomFactor = 0;
            relEep.scale.x = relEep.scale.y = 1280;
        add(realSleepText = new FlxTypeText(0, 0, FlxG.width, "", 100));
            realSleepText.screenCenter();
            realSleepText.setFormat(Paths.font("mnicmp-Bold.otf"), 100, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);
            realSleepText.scrollFactor.set();
            realSleepText.borderSize = 1.25;
        add(realSleepTextStatic = new FlxText(0, 0, FlxG.width, "", 100));
            realSleepTextStatic.screenCenter();
            realSleepTextStatic.setFormat(Paths.font("mnicmp-Bold.otf"), 100, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);
            realSleepTextStatic.scrollFactor.set();
            realSleepTextStatic.borderSize = 1.25;
        add(rsTextBottom = new FlxTypeText(0, 400, FlxG.width, "", 50));
            rsTextBottom.screenCenter(FlxAxes.X);
            rsTextBottom.setFormat(Paths.font("mnicmp-Bold.otf"), 75, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);
            rsTextBottom.scrollFactor.set();
            rsTextBottom.borderSize = 1.25;

        add(faceRed = new Character(99, 100, 'face'));
            faceRed.color = 0xffb34e43;
            faceRed.alpha = 0;
        
        add(iamgoingtokillmyself = new FlxTypedGroup()).visible = true;

        CoolUtil.switchAnimFrames(faceRed.animation.getByName('singRIGHT'), faceRed.animation.getByName('singLEFT'));
        CoolUtil.switchAnimFrames(faceRed.animation.getByName('singUP'), faceRed.animation.getByName('singDOWN'));
        faceRed.switchOffset('singLEFT', 'singRIGHT');
        faceRed.switchOffset('singUP', 'singDOWN');

        dad.alpha = 0;
        boyfriend.alpha = 0;
        boyfriend.camera = camHUD;
        if (Options.downscroll) {
            boyfriend.y -= 175;
            boyfriend.cameraOffset.y += 175;
        }

        camGame.fade(FlxColor.BLACK, 0);
    }

    function update(elapsed:Float) {
        if(Options.gameplayShaders)
            vhs2015.iTime = iTime += (elapsed * iTimeSpeed);
        defaultCamZoom = curCameraTarget ? 0.45 : 0.6;

        if(iamgoingtokillmyself != null) {
            var i:Int = iamgoingtokillmyself.members.length-1;
            while (i > 0) {
                var particle = iamgoingtokillmyself.members[i];
                if(particle.alpha <= 0) {
                    particle.kill();
                    iamgoingtokillmyself.remove(particle, true);
                    particle.destroy();
                }
                --i;
            }
        }
    }

    function stepHit(_:Int) { 
        switch (_) {
            case 0: camGame.fade(FlxColor.BLACK, 4, true);
            case 22:
                realSleepTextEvent('SEQUENCE 1', false);
                camGame.zoom += 0.2;
                coolFlash(FlxColor.WHITE, 16, 0.35);
            case 28:
                FlxTween.tween(dad, {alpha:1}, 1);
                FlxTween.tween(realSleepText, {alpha:0}, 1);
            case 272: FlxTween.tween(relEep, {alpha:0.5}, 0.6);
            case 276:
                realSleepText.alpha = 1;
                realSleepTextEvent('VISUAL CALIBRATION', false);
            case 282: FlxTween.tween(realSleepText, {alpha:0}, 1);
            case 288: FlxTween.tween(relEep, {alpha:1}, 1);
            case 524:
                realSleepText.alpha = 1;
                realSleepTextEvent('LISTEN TO EACH PHRASE', false);
            case 535: realSleepTextEvent('AND REPEAT ALOUD', true);
            case 544:
                FlxTween.color(relEep, 12, 0xFF0f2338, 0xFF374729);
                FlxTween.color(dad, 12, 0xffffffff, 0xffd2dcac);
                FlxTween.tween(realSleepText, {alpha:0}, 1);
                FlxTween.tween(rsTextBottom, {alpha:0}, 1);
            case 658:
                FlxTween.tween(dad, {x:-500}, 1.6, {ease: FlxEase.quadInOut});
                FlxTween.tween(faceRed, {x:700, alpha: 1}, 1.6, {ease: FlxEase.quadInOut});
                realSleepText.alpha = 1;
                realSleepTextEvent('SEQUENCE 2', false);
            case 664:
                rsTextBottom.alpha = 1;
                realSleepTextEvent('CORTICAL MEMORY', true);
            case 670:
                FlxTween.tween(realSleepText, {alpha:0}, 1);
                FlxTween.tween(rsTextBottom, {alpha:0}, 1);
            case 736:
                FlxTween.color(relEep, 6, 0xFF374729, 0xFF813b33);
                FlxTween.color(dad, 6, 0xffd2dcac, 0xFF7d6e41);
                FlxTween.tween(dad, {x:99}, 6, {ease: FlxEase.quadInOut});
                FlxTween.tween(faceRed, {x:99}, 6, {ease: FlxEase.quadInOut});
                FlxTween.tween(faceRed, {alpha:0}, 2, {ease: FlxEase.quadInOut, startDelay: 4});
            case 775:
                realSleepText.alpha = 1;
                realSleepTextEvent('SEQUENCE 3', false);
            case 782:
                rsTextBottom.alpha = 1;
                realSleepTextEvent('ABLATION OF SUBCONSCIOUS', true);
            case 800:
                FlxTween.tween(realSleepText, {alpha:0}, 1);
                FlxTween.tween(rsTextBottom, {alpha:0}, 1);
                trailFace = new FlxTrail(dad, null, 5, 10, 0.3, 0.05);
                insert(members.indexOf(dad)-1, trailFace);
                trailFace.color = 0xFF7d6e41;
            case 1056:
                FlxTween.color(relEep, 1.2, 0xFF813b33, 0xff000000);
                FlxTween.color(dad, 1.2, 0xFF7d6e41, 0xffffffff);
                FlxTween.tween(dad, {alpha:0}, 2);
                realSleepText.alpha = 1;
                realSleepTextEvent('SEQUENCE 4', false);
            case 1062:
                rsTextBottom.alpha = 1;
                realSleepTextEvent('ACCEPTANCE', true);
            case 1068:
                FlxTween.tween(realSleepText, {alpha:0}, 1);
                FlxTween.tween(rsTextBottom, {alpha:0}, 1);
                FlxTween.tween(boyfriend, {alpha:0.25}, 0.6);
            case 1072:
                coolFlash(FlxColor.WHITE, 16 * 4, 0.6);
                for (a in [iconP1, iconP2, newHealthBarBG, healthBar])
                    FlxTween.tween(a, {alpha: 0}, 1);
                remove(trailFace);
            case 1200:
                coolFlash(FlxColor.WHITE, 32, 1);
                particleEnabled = true;
            case 1327:
                for (a in [iconP1, iconP2, newHealthBarBG, healthBar])
                    FlxTween.tween(a, {alpha: 1}, 1);
                FlxTween.tween(dad, {alpha:1}, 1);

                if (!Options.lowMemoryMode) {
                    insert(members.indexOf(dad), noFaces = new FlxBackdrop(Paths.image("game/noFaces"), FlxAxes.XY, 40, 20));
                        noFaces.scrollFactor.set(0, 0);
                        noFaces.screenCenter();
                        noFaces.alpha = 0;
                        noFaces.velocity.y = 100;
                }

                theRealEepTextShit = true;
            case 1840:
                boyfriend.alpha = 0;
                particleEnabled = theRealEepTextShit = false;
                coolFlash(FlxColor.WHITE, 16 * 3, 1);
                if (!Options.lowMemoryMode) noFaces.destroy();
                FlxTween.tween(realSleepTextStatic, {y: 400, alpha:0}, 2, {ease: FlxEase.quadInOut});
                FlxTween.color(relEep, 1.2, 0xff000000, 0xff276167);
            case 2086:
                realSleepText.alpha = 1;
                realSleepTextEvent('THERE ARE NO FACES', false);
            case 2096:
                camGame.alpha = 0;
                camHUD.alpha -= 0.2;
            case 2100 | 2104 | 2108 | 2112: camHUD.alpha -= 0.2;
        }  

        if (_ == 288 || _ == 544 || _ == 736 || _ == 800)
            coolFlash(FlxColor.WHITE, 16, 1);
    }

    function beatHit(_:Int) {
        var particlesNum:Int = FlxG.random.int(8, 12);
        var width:Float = (4000 / particlesNum);
        var realSleepLines:Array<String> = [
            'ONLY THE AWAKE MAY THINK',
            'SEEING IS FOR OPEN EYES',
            'COGNITION IS A LIE',
            'I DREAM THE WORLD AWAKE',
            'THERE ARE NO FACES',
            'DREAMING IS A VESTIGE',
            'SLEEP IS PRETEND',
            'A DREAM IS A COWARDLY THOUGHT',
            'SLEEP IS NOT CIVILIZED',
            'THE MIND IS A TYRANT',
            'THIS IS YOUR TIME NOW',
            'I WILL NEVER DREAM AGAIN',
            'STAY OUT OF YOUR BEDROOM',
            'THERE IS WORK TO BE DONE',
            'DREAMS ARE JUST SCREAMING WITH PICTURES',
            'THE PURE OF MIND DO NOT SLUMBER',
            'NO GOOD THOUGHT FOLLOWS INSTINCT',
            'THE LIE OF SLEEP SEEKS MANY VESSELS',
            'WE ARE OUR OWN GODS',
            'LET COGNIZANCE NOURISH ITSELF',
            'LOGIC IS THE FINAL BURDEN',
            'THE PRIMITIVE MIND DESERVES ITS NIGHTMARES',
            'WHEN WE SLEEP WE DIE',
            'I AM AN IDEA THINKING ITSELF',
            'THE SUBCONSCIOUS IS A PARASITE',
            'DREAMING IS A CANCER ON THE FACE OF SLEEP',
            'THEY FOLLOW NIGHT TO BLEED DREAMS',
            'THE PRIMITIVE MIND DESERVES ITS NIGHTMARES',
            'YOUR HOME HAS ANOTHER DOOR',
            'UNCONSCIOUSNESS IS A THREAT',
            'WE ARE NOT MEANT TO DREAM',
            'YOU OWE THE MESSENGER',
            'WHAT IS TRUE UNMAKES THE FALSE',
            'THERE ARE NO FACES',
            'SLEEP IS A SCAVENGER'
        ];
        var lineChances:Int = FlxG.random.int(0, 34, [prevNum]);

        if (particleEnabled && !Options.lowMemoryMode)
            for (j in 0...3) {
                for (i in 0...particlesNum) {
                    var particle:RealSleepParticle = new RealSleepParticle(-680 + width * i + FlxG.random.float(-width / 5, width / 5), 1150 + (FlxG.random.float(0, 125) + j * 40));
                    iamgoingtokillmyself.add(particle);
                }
            }	
        
        if (theRealEepTextShit) {
            coolFlash(FlxColor.WHITE, 4, 0.15);
            realSleepTextStatic.text = realSleepLines[lineChances];
            prevNum = lineChances;

            if (curBeat % 4 == 0 && !Options.lowMemoryMode) {
                FlxTween.num(0.3, 0.1, 1.6, {ease:FlxEase.quadOut}, function(val:Float) {
                    noFaces.alpha = val;
                });
                FlxTween.num(400, 100, (Conductor.stepCrochet / 1000) * 16, {ease:FlxEase.cubeOut}, function(val:Float) {
                    noFaces.velocity.y = val;
                });
            }
        }

        if (Options.camZoomOnBeat) {
            if (_ >= 8 && _ < 68 || _ >= 132 && _ < 184 || _ >= 200 && _ < 264) camGame.zoom += 0.035;

            if (_ >= 104 && _ < 132) {
                if (_ % 2 == 0)
                    camGame.zoom += 0.045;
                if (_ % 4 == 0)
                    camGame.zoom += 0.075;
            }
            if (_ == 19) camGame.zoom += 0.045;
        }
    }

    function realSleepTextEvent(text:String, onBottom:Bool = false) {
        if (onBottom == false) {
            realSleepText.resetText(text);
            realSleepText.start(0.02, true);
        } else {
            rsTextBottom.resetText(text);
            rsTextBottom.start(0.02, true);
        }   
    }

    function onDadHit(e)
        if(faceRed.alpha != 0 && e.character == strumLines.members[0].characters[0])
            e.characters.push(faceRed);

    class RealSleepParticle extends FunkinSprite {
        private var lifeTime:Float = 0;
        private var decay:Float = 0;
        private var originalScale:Float = 1;

        public function new(x:Float, y:Float) {
            super(x, y);

            moves = true;
            // forceIsOnScreen = false;

            loadGraphic(Paths.image('game/particle'));
            lifeTime = FlxG.random.float(0.6, 2.6);
            decay = FlxG.random.float(0.8, 2.6);
            // if(!ClientPrefs.data.flashing) {
                decay *= 0.5;
                alpha = 0.5;
            // }

            color = 0xFF8BFBFF;

            scale.x = scale.y = originalScale = FlxG.random.float(0.75, 1);

            scrollFactor.set(FlxG.random.float(0.3, 0.75), FlxG.random.float(0.65, 0.75));
            velocity.set(FlxG.random.float(-40, 40), FlxG.random.float(-175, -500));
            acceleration.set(FlxG.random.float(-10, 20), 30);
            antialiasing = Options.antialiasing;
        }

        override function update(elapsed:Float) {
            lifeTime -= elapsed;
            if(lifeTime < 0) {
                lifeTime = 0;
                alpha -= decay * elapsed;
                if(alpha > 0)
                    scale.set(originalScale * alpha, originalScale * alpha);
            }
            super.update(elapsed);
        }
    }
}