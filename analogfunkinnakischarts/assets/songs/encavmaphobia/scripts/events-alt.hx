import openfl.system.Capabilities;
import flixel.util.FlxStringUtil;
import openfl.display.BitmapData;
import flixel.addons.display.FlxBackdrop;

if (PlayState.difficulty == "ALT") {
    var dither:FunkinShader = new FunkinShader("
        #pragma header
        uniform float dither;
        uniform float zoom;

        float dither2(vec2 a) {
            a = floor(a + 0.5);
            return fract(a.x * 0.5 + a.y * a.y * 0.75);
        }

        #define dither4(a) (dither2(a * 0.5) * 0.25 + dither2(a))
        #define dithering (dither4(openfl_TextureCoordv * openfl_TextureSize / zoom) + dither) * 2.0 - 1.0
        void main() {
            if (dithering > 1.0) discard;
            gl_FragColor = flixel_texture2D(bitmap, openfl_TextureCoordv);
        }");
        var swirl:FunkinShader = new FunkinShader("
    #pragma header

    #define iResolution vec3(openfl_TextureSize, 0.)
    uniform float iTime;
    #define iChannel0 bitmap
    #define texture flixel_texture2D

    // variables which are empty, they need just to avoid crashing shader
    uniform vec4 iMouse;

    // end of ShadertoyToFlixel header

    // ******** TOGGLES 0 / 1 **************** // 
    const int SWIRL_OSC = 0;
    const int ONE_OSC 	= 1;
    // ******** TOGGLES 0 / 1 **************** // 

    ////////////////////////////////////////

    // 2*pi
    #define TAU 6.283185307179
    
    vec2 cxmul(vec2 z, vec2 w) {
        return mat2(z, -z.y, z.x) * w; //vec2(z.x*w.x - z.y*w.y, z.x*w.y + z.y*w.x);
    }

    vec2 cxdiv(vec2 z, vec2 w) {
        return cxmul(z, vec2(w.x, -w.y)) / dot(w,w);
    }

    vec2 mobius(vec2 z, vec2 a, vec2 b, vec2 c, vec2 d) {
        return cxdiv(cxmul(a,z) + b, cxmul(c,z) + d); 
    }

    // mobius transformation described with which complex numbers 
    // it sends zero, one and infinity to.
    // 0 -> q, 1 -> r, inf -> s
    vec2 mobi3(vec2 z, vec2 q, vec2 r, vec2 s) {
        return cxdiv(cxmul(z - q, r - s), cxmul(z - s, r - q));
    }


    ////////////////////////////////////////

    void mainImage( out vec4 fragColor, in vec2 fragCoord )
    {
        vec2 mnuv = iMouse.xy/iResolution.xy;
        vec2 mn = (2. * iMouse.xy - iResolution.xy) / iResolution.y;
        
        vec2 pos = ( 2. * fragCoord - iResolution.xy ) / iResolution.y; 
        
        // mouse control! 
        vec2 inf = mn;
        vec2 zero = -inf;
        
        vec2 one = vec2(0.);
        if (ONE_OSC==1) {
            float t = sin(iTime*0.912)*0.3 + 0.5;
            one = t*inf + (1.-t)*zero;
        } else {
            one =  (inf + zero) * 0.5;
        }
        
        // mobius transformed position - deforms the plane 
        vec2 posi = mobi3(pos, zero, one, inf);
        
        float logr = log(length(posi));
        
        float swirl = 0.;
        if (SWIRL_OSC==1) {
            swirl = 2.*TAU*sin(iTime*0.5) * atan(logr);
        } else { 
            // 2 positive turns at infinity, 2 negative turns at zero  
            swirl = 2.*TAU*atan(logr);
        }
        
        // add in the swirl
        float ang = atan(posi.y,posi.x) + swirl;
                
        // RGB offset
        const float offset = TAU*0.1;
        vec3 offsetv = vec3(-offset,0.,offset);
        
        vec3 colVal = sin(ang*2.+ iTime*5. + offsetv);
        
        // smooth colors mode
        vec3 smoothCol = colVal * 0.5 + 0.5;
        
        // antialiased solid colors mode 
        vec3 b = fwidth(colVal);
        vec3 col_aa = smoothstep(vec3(-b), vec3(b), colVal); 
        
        // switch modes
        vec3 col = mix(col_aa, smoothCol, 0.7+0.2*sin(iTime));//floor(mod(iTime*0.5,2.)));
        fragColor = vec4(col, texture(iChannel0, fragCoord / iResolution.xy).a);
    }

    void main() {
        mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
    }");

    var distort:CustomShader = new CustomShader("Distortion/distort");
    var glitch:CustomShader = new CustomShader("VHS/glitch");

    var jpg:CustomShader = new CustomShader("jpg");
    var jpgSize:Float = 32;

    var doCamFocus:Bool = false;

    var bopStrums:Bool = true;

    var bg:FunkinSprite = new FunkinSprite(-250, 0, Paths.image("baldibg"));
    var yep:FunkinSprite = new FunkinSprite(0, 0, Paths.image("youknowitstrue"));
    var locker:FlxBackdrop = new FlxBackdrop(Paths.image("locker"));
    var vig:FunkinSprite = new FunkinSprite(0, 0, Paths.image("stages/vignette-4to3"));

    var notebooks:FunkinText = new FunkinText(12.5, 12.5, 0, "0/7 Notebooks", 32, true);
    var timer:FunkinText = new FunkinText(12.5, 45, FlxG.width - 50, "9:99 Left", 32, true);

    var wow:FunkinText = new FunkinText(0, 0, 0, "WOW!", 256, true);

    function postPostCreate() {
        FlxG.cameras.add(camTxt = new HudCamera(), false).bgColor = camHUD.bgColor;
        camTxt.downscroll = camHUD.downscroll;

        vig.color = FlxColor.BLACK;
        add(vig).camera = camHUD;
        FlxG.game.removeShader(monitorEffect);
        if (Options.gameplayShaders) {
            FlxG.game.addShader(dither);
            dither.dither = 1;
            dither.zoom = 2;
            camGame.addShader(jpg);
            camHUD.alpha = 0;
        }

        camGame.fade(FlxColor.BLACK, 0);
        add(yep).camera = camTxt;
        yep.zoomFactor = yep.alpha = camTxt.alpha = 0;
        add(timer).camera = camTxt;
        add(notebooks).camera = camTxt;
        
        notebooks.font = timer.font = accuracyTxt.font = scoreTxt.font = missesTxt.font = lyricsEventTxt.font = wow.font = Paths.font("comic sans.ttf");
        timer.antialiasing = notebooks.antialiasing = wow.antialiasing = Options.antialiasing;

        defaultCamZoom = camGame.zoom = 0.025;

        insert(members.indexOf(boyfriend), bg).scale.set(2, 2);
        
        insert(members.indexOf(boyfriend), wow).scrollFactor.set();
        wow.camera = camTxt;
        wow.alpha = 0;
        wow.scale.set(0.2, 0.1);
        wow.screenCenter();

        for(a in [accuracyTxt, scoreTxt, missesTxt, newHealthBarBG, iconP2, iconP1]) remove(a);
        healthBar.createFilledBar(FlxColor.RED, FlxColor.LIME);
        healthBar.percent = health;
        healthBar.scale.set(350 / healthBar.barWidth, 25 / healthBar.barHeight);
        healthBar.updateHitbox();
        healthBar.setPosition(FlxG.width / 2 - healthBar.width / 2, FlxG.height * 0.9375);
        healthBar.camera = camTxt;
        healthBar.flipX = true;

        insert(0, locker).camera = camHUD;
        locker.setGraphicSize(FlxG.width);
        locker.visible = false;
        locker.screenCenter();
    }

    function postUpdate(elapsed:Float) {
        if (Conductor.songPosition >= 0)
            timer.text = FlxStringUtil.formatTime((inst.length - Conductor.songPosition) / 1000, false) + " Left";

        if (bg.shader != null)
            bg.shader.iTime = Conductor.songPosition / 2500;

        glitch.time = Conductor.songPosition / 1000 * 8;
    }

    function stepHit(_:Int) {
        switch (_) {
            case 0 | 16 | 32 | 48 | 64 | 80 | 96 | 112:
                if (_ == 0) FlxTween.num(1, 0.125, (Conductor.stepCrochet / 1000) * 256, null, dith -> dither.dither = dith);
                camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 15, true);
                defaultCamZoom = camGame.zoom += 0.075;
                FlxTween.num(jpgSize, jpgSize - 3.9, (Conductor.stepCrochet / 1000) * 15, null, pixel -> jpg.pixel_size = (jpgSize = pixel));
            case 128:
                coolFlash(FlxColor.WHITE, 32, 1);
                FlxTween.tween(camTxt, {alpha: 1}, (Conductor.stepCrochet / 1000) * 32);
                camGame.removeShader(jpg);
            case 188:
                notebooks.text = "1/7 Notebooks";
            case 240: FlxTween.tween(camHUD, {alpha: 1}, (Conductor.stepCrochet / 1000) * 16);
            case 256: daLyricsEvent("Hel-lo, everyone!", 32, "in", 0.5, true);
            case 284: daLyricsEvent("Do you want your child", 32, "in", 0.5, true);
            case 300: daLyricsEvent("To get real smart?", 32, "in", 0.5, true);
            case 316: daLyricsEvent("A little bit of math,", 32, "in", 0.5, true);
            case 332: daLyricsEvent("Here or there!", 32, "in", 0.5, true);
            case 348: daLyricsEvent("I've got just the place", 32, "in", 0.5, true);
            case 364: daLyricsEvent("For them to start!", 32, "in", 0.5, true);
            case 384:
                notebooks.text = "2/7 Notebooks";
                coolFlash(FlxColor.RED, 16, 0.5);
                vig.color = FlxColor.RED;
                daLyricsEvent("*Watch out for the ruling master!*", 32, "in", 0.5, true, FlxColor.RED);
            case 400: daLyricsEvent("*Beware, he's getting faster!*", 32, "in", 0.5, true, FlxColor.RED);
            case 416: daLyricsEvent("*Refrain from making noises -*", 32, "in", 0.5, true, FlxColor.RED);
            case 432: daLyricsEvent("*That man's a saboteur.*", 32, "in", 0.5, true, FlxColor.RED);
            case 448: daLyricsEvent("*Hear those slaps from down the path*", 32, "in", 0.5, true, FlxColor.RED);
            case 464: daLyricsEvent("*Just to avoid his wrath*", 32, "in", 0.5, true, FlxColor.RED);
            case 480: daLyricsEvent("*Now, the professor wants you in his grasp!*", 32, "in", 0.5, true, FlxColor.RED);
            case 508:
                coolFlash(FlxColor.WHITE, 4, 1);
                daLyricsEvent("*Now, the professor wants you in his grasp!*", 32, "out", 0.5, true, FlxColor.RED);
                FlxTween.color(vig, 0.5, FlxColor.RED, FlxColor.BLACK);
            case 512: daLyricsEvent("Geeet your PRIZE!", 32, "in", 0.5, true);
            case 537: daLyricsEvent("Won't", 32, "in", 0.5, true);
            case 539: daLyricsEvent("Won't you", 32, "in", 0.5, true);
            case 541: daLyricsEvent("Won't you come", 32, "in", 0.5, true);
            case 544: daLyricsEvent("iiin?", 32, "in", 0.5, true);
            case 555: daLyricsEvent("Into my schoolhouse?", 32, "in", 0.5, true);
            case 576: daLyricsEvent("Stay the course and follow through!", 32, "in", 0.5, true);
            case 590: daLyricsEvent("I'm", 32, "in", 0.5, true);
            case 592: daLyricsEvent("*slowly coming after you.*", 32, "in", 0.5, true, FlxColor.RED);
            case 606: daLyricsEvent("I'll", 32, "in", 0.5, true);
            case 608: daLyricsEvent("I'll bring", 32, "in", 0.5, true);
            case 611: daLyricsEvent("I'll bring *the*", 32, "in", 0.5, true, FlxColor.RED);
            case 613: daLyricsEvent("I'll bring *the punishment*", 32, "in", 0.5, true, FlxColor.RED);
            case 618: daLyricsEvent("*That's what I do.*", 32, "in", 0.5, true, FlxColor.LIME);
            case 628: daLyricsEvent("*That's what I do.*", 32, "out", 0.5, true, FlxColor.LIME);
            case 631:
                yep.alpha = 1;
                daLyricsEvent("", 32, "out", 0.5, true);
            case 640:
                daLyricsEvent("I ran out of time to code the rest sorrys", 32, "in", 0.5, true);
                coolFlash(FlxColor.WHITE, 8, 1);
                dad.color = boyfriend.color = FlxColor.BLACK;
                vig.color = FlxColor.WHITE;
                boyfriend.alpha = yep.alpha = iconP1.alpha = iconP2.alpha = newHealthBarBG.alpha = healthBar.alpha = camZoomingStrength = 0;
                bg.shader = swirl;
                bopStrums = false;
            case 656: daLyricsEvent("I ran out of time to code the rest sorrys", 32, "out", 0.5, true);
            case 768:
                coolFlash(FlxColor.WHITE, 8, 1);
                notebooks.text = "3/7 Notebooks";
                bopStrums = true;
                vig.color = FlxColor.BLACK;
                dad.color = boyfriend.color = FlxColor.WHITE;
                boyfriend.alpha =  iconP1.alpha = iconP2.alpha = newHealthBarBG.alpha = healthBar.alpha = camZoomingStrength = 1;
                bg.shader = null;
            case 961:
                notebooks.text = "4/7 Notebooks";
                FlxTween.color(vig, (Conductor.stepCrochet / 1000) * 8, 0x7F7F7F, FlxColor.BLACK);
            case 1020:
                doCamFocus = false;
                FlxTween.num(defaultCamZoom, 1, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.quadInOut}, _ -> defaultCamZoom = _);
            case 1024:
                doCamFocus = true;
                FlxTween.color(vig, (Conductor.stepCrochet / 1000) * 8, FlxColor.WHITE, FlxColor.BLACK);
                notebooks.text = "5/7 Notebooks";
            case 1088:
                if (Options.gameplayShaders) {
                    doCamFocus = false;
                    FlxG.game.addShader(distort);
                    FlxTween.num(0, 8, (Conductor.stepCrochet / 1000) * 17, {ease: FlxEase.quadInOut}, _ -> distort.iTime = -_);
                    FlxTween.num(defaultCamZoom, 1, (Conductor.stepCrochet / 1000) * 17, {ease: FlxEase.quadInOut}, _ -> defaultCamZoom = _);
                    FlxTween.tween(camGame, {alpha: 0}, (Conductor.stepCrochet / 1000) * 17);
                    FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 17);
                }
            case 1113:
                doCamFocus = true;
                FlxTween.num(8, 0, (Conductor.stepCrochet / 1000) * 6, {ease: FlxEase.quadInOut, onComplete: (twn) -> FlxG.game.removeShader(distort)}, _ -> distort.iTime = -_);
                FlxTween.tween(wow, {'scale.x': 5, 'scale.y': 10}, (Conductor.stepCrochet / 1000) * 6, {ease: FlxEase.quadIn});
                FlxTween.tween(wow, {alpha: 1}, (Conductor.stepCrochet / 1000) * 4);
            case 1116:
                wow.visible = false;
                camHUD.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 8);
                camGame.alpha = camHUD.alpha = 1;
            case 1238:
                var shakingIt:FlxTween = FlxTween.num(0.006, 0, (Conductor.stepCrochet / 1000) * 20, {}, _ -> camHUD.shake(_, 2));
                new FlxTimer().start((Conductor.stepCrochet / 1000) * 10, () -> shakingIt.cancel());
                doCamFocus = dad.visible = false;
                defaultCamZoom += 0.2;
                vig.color = bg.colorTransform.color = FlxColor.RED;
                boyfriend.colorTransform.color = FlxColor.BLACK;
            case 1248:
                camHUD.stopShake();
                doCamFocus = dad.visible = true;
                vig.color = FlxColor.BLACK;
                camGame.zoom = defaultCamZoom -= 0.2;
                bg.setColorTransform();
                boyfriend.setColorTransform();
            case 1249:
                FlxTween.color(vig, (Conductor.stepCrochet / 1000) * 8, FlxColor.WHITE, FlxColor.BLACK);
                notebooks.text = "6/7 Notebooks";    
            case 1308:
                doCamFocus = bopStrums = false;
                FlxTween.color(vig, (Conductor.stepCrochet / 1000) * 8, FlxColor.WHITE, FlxColor.BLACK);
                notebooks.text = "7/7 Notebooks";    
                FlxTween.num(defaultCamZoom, 1, (Conductor.stepCrochet / 1000) * 32, {ease: FlxEase.quadInOut}, _ -> defaultCamZoom = _);
                FlxTween.tween(camGame, {alpha: 0}, (Conductor.stepCrochet / 1000) * 32);
                FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 32);
                FlxTween.tween(camTxt, {alpha: 0}, (Conductor.stepCrochet / 1000) * 32);
            case 1344:
                locker.visible = doCamFocus = !(notebooks.visible = healthBar.visible = vig.visible = false);
                boyfriend.alpha = dad.alpha = 0;
                camMoveAmt = 12.5;
                timer.y = notebooks.y;
                bg.loadGraphic(Paths.image("baldibg2"));
            case 1348:
                FlxTween.tween(camGame, {alpha: 1}, (Conductor.stepCrochet / 1000) * 12);
                FlxTween.tween(camHUD, {alpha: 1}, (Conductor.stepCrochet / 1000) * 12);
                FlxTween.tween(camTxt, {alpha: 1}, (Conductor.stepCrochet / 1000) * 12);
            case 1548:
                coolFlash(FlxColor.RED , 8, 0.5);
                bopStrums = true;
            case 1787:
                camZoomingStrength = 0;
                FlxTween.num(locker.scale.x, 0.25, (Conductor.stepCrochet / 1000) * (1832 - 1787), null, scal -> locker.scale.x = locker.scale.y = scal);
                if (Options.gameplayShaders) {
                    bg.shader = glitch;
                    FlxTween.num(0.0000000001, 32, (Conductor.stepCrochet / 1000) * 32, null, _ -> {glitch.prob = _ / 50; glitch.intensityChromatic = _ / 60;});
                }    
            case 1808:
                for (a in strumLines.members[1])
                    FlxTween.tween(a, {alpha: 0}, (Conductor.stepCrochet / 1000) * 8);
            case 1832:
                camGame.visible = camHUD.visible = camTxt.visible = false;
        }

        if (_ % 4 == 0 && bopStrums && _ >= 0 && FlxG.save.data.customOptions.modcharts)
            for(a in strumLines.members[1]){
                FlxTween.cancelTweensOf(a);
                a.y += _ % 8 == 0 ? (a.ID % 2 == 0 ? -10 : 10) : (a.ID % 2 == 0 ? 10 : -10);
                FlxTween.tween(a, {y: 25}, 0.5, {ease: FlxEase.circOut});
            }
    }

    function onCameraMove()
        if (doCamFocus)
            defaultCamZoom = curCameraTarget == 0 ? 0.5 : 0.625;

    function onNoteHit(e) if (e.noteType == "Miles") e.characters = strumLines.members[0].characters;

    function destroy() {
        FlxG.game.removeShader(dither);
        FlxG.game.removeShader(distort);
        if (Options.gameplayShaders)
            FlxG.game.addShader(monitorEffect);
    }
}