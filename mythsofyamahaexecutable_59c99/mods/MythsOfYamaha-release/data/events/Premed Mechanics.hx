
var smile, sign;
var p = 'stages/premed/mechanics/';

function onEvent(_) {
    if (_.event.name == 'Premed Mechanics') {
        switch(Std.parseInt(_.event.params[0])) {

            case 0: // destroy everything sign
                add(smile = new FlxSprite(750, 440).loadGraphic(Paths.image(p + 'hi')));
                add(sign = new FlxSprite(smile.x - 100, smile.y - 400).loadGraphic(Paths.image(p + 'sign')));
                sign.origin.y = sign.height;
                var l = FlxG.random.int(3, 5);

                for (s in [smile, sign]) {
                    s.cameras = [camTxt];
                    s.alpha = 0;
                    //FlxTween.tween(s, {alpha : 1}, 0.6);
                    pixelFade(s, 1, 0.6, 4);

                    new FlxTimer().start(l, () -> {
                        FlxTween.tween(s, {alpha : 0}, 0.6, {onComplete: function(t:FlxTween) {
                            s.destroy(); remove(s, true);
                        }});
                    });
                }

            case 1: // smiley wave
                new FlxTimer().start(FlxG.random.float(1.4, 1.6), () -> {

                    var w = makeSmiley('wave', FlxG.random.int(450, 700), FlxG.random.int(0, 400), 1, FlxG.random.float(20, 25));
                    new FlxTimer().start(FlxG.random.int(2, 4), () -> {w.destroy(); remove(w, true);});

                }, FlxG.random.int(3, 5));

            case 2: // smiley bounce
                new FlxTimer().start(FlxG.random.float(1.5, 1.7), () -> {

                    var j = makeSmiley('bounce', FlxG.random.int(200, 400), FlxG.random.int(-200, 350), 0.6, FlxG.random.float(20, 25));
                    new FlxTimer().start(FlxG.random.int(2, 4), () -> {j.destroy(); remove(j, true);});

                }, FlxG.random.int(3, 4));

            case 3: // big smiley bounce bottom
                var j = makeSmiley('bounce', 430, 400, 0.8, 24);
                FlxTween.tween(j, {y: 310}, 0.08);
                
                new FlxTimer().start(3, () -> {j.destroy(); remove(j, true);});

            case 4: // big smiley bounce top
                var j = makeSmiley('bounce', 430, -390, 0.8, 24);
                j.flipY = true;
                FlxTween.tween(j, {y: -300}, 0.08);

                new FlxTimer().start(3, () -> {j.destroy(); remove(j, true);});
        }
    }
}

function makeSmiley(t, x, y, sc, f) {
    var s = new FlxSprite(x, y);
    s.frames = Paths.getSparrowAtlas(p + ((t == 'wave') ? 'wave' : 'smile'));
    s.animation.addByPrefix('s', ((t == 'wave') ? 'WAVEE' : 'bouncy'), f, true);
    s.animation.play('s');
    s.scale.set(sc, sc);
    s.cameras = [camTxt];
    add(s);
    return s;
}

function update() {
    if (smile != null && smile.exists) {
        smile.angle = FlxG.random.float(-0.6, 0.6);
        sign.angle = FlxG.random.int(-1, 1);

        sign.offset.set(FlxG.random.float(-5.5, 5.5), FlxG.random.float(-5.5, 5.5));
    }
}

function pixelFade(obj, val, time, fadeAm:Int) {
    var al = obj.alpha;

    new FlxTimer().start(time / fadeAm, () -> {
        if ((al - val) >= 0) {obj.alpha -= ((al - val) / fadeAm);}
        else {obj.alpha += ((val - al) / fadeAm);}
    }, fadeAm);
}