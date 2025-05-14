import funkin.backend.MusicBeatState;
import openfl.display.BitmapData;
import openfl.display.BlendMode;
import openfl.utils.Assets;

var arrow:FunkinSprite;
var tv:FunkinSprite;

var trans:Bool = false;
var camFollow:FunkinSprite;

var mouseIdle = Assets.getBitmapData(Paths.image('menus/cursor/idle'));
var mouseHover = Assets.getBitmapData(Paths.image('menus/cursor/hover'));
var mouseHoverState:Bool = null;

function create() {
    FlxG.game._filters = [];
    if (Options.gameplayShaders)
        FlxG.game.addShader(bloom);
    CoolUtil.playMenuSong();
    window.title = "Analog Funkin'";

    FlxG.mouse.visible = true;
    FlxG.camera.zoom += 0.05;

    add(camFollow = new FunkinSprite().makeSolid(1, 1, FlxColor.BLACK)).screenCenter();
    add(bg = new FunkinSprite(0, 0, Paths.image("menus/tv/back"))).screenCenter();
    add(tv = new FunkinSprite(0, 250, Paths.image("menus/tv/tv-optimized"))).screenCenter(FlxAxes.X);
    

    insert(members.indexOf(tv), tvScreen = new FunkinSprite().makeSolid(Std.int(tv.width * 0.75), Std.int(tv.height * 0.55), FlxColor.BLUE));
    tvScreen.setPosition(tv.x + tv.width/2 - tvScreen.width/2, tv.y + tv.height/2 - (tvScreen.height/2));

    add(vig = new FunkinSprite(0, 0, Paths.image("menus/tv/vignette"))).screenCenter();
    vig.blend = BlendMode.MULTIPLY;

    add(discordButton = new FunkinSprite(FlxG.width - 97 - 60, 30, Paths.image("menus/tv/discordButton"))).scale.set(0.8,0.8);
    add(changelog = new FunkinSprite(FlxG.width - 100 - 60, FlxG.height - 100 - 30, Paths.image("menus/tv/changelog"))).scale.set(0.8,0.8);
    discordButton.alpha = changelog.alpha = 0.05;

    add(arrow = new FunkinSprite(37.5));
    arrow.scrollFactor.x = arrow.scrollFactor.y = vig.scrollFactor.x = vig.scrollFactor.y = 0;
    arrow.alpha = 0.1;
    arrow.frames = Paths.getSparrowAtlas("menus/tv/arrow");
    arrow.animation.addByPrefix("loop", "loop", 12, true);
    arrow.animation.play("loop");
    arrow.updateHitbox();
    arrow.screenCenter(FlxAxes.Y);

    bg.antialiasing = arrow.antialiasing = tv.antialiasing = tvScreen.antialiasing = discordButton.antialiasing = Options.antialiasing;

    FlxG.camera.follow(camFollow);
    doMouseShit();
}

function update(elapsed:Float) {
    doMouseShit();

    if(!trans) {
        if(FlxG.mouse.justPressed && FlxG.mouse.overlaps(discordButton)) CoolUtil.openURL("https://discord.com/invite/d5FBpsxcBa");
        discordButton.alpha = FlxMath.lerp(discordButton.alpha, FlxG.mouse.overlaps(discordButton) ? 1 : 0.1, 0.05);

        if(FlxG.mouse.justPressed && FlxG.mouse.overlaps(changelog)) {
            persistentUpdate = !(persistentDraw = true);
            openSubState(new ModSubState("AnalogSubstates/ChangeLog"));
        }
        changelog.alpha = FlxMath.lerp(changelog.alpha, FlxG.mouse.overlaps(changelog) ? 1 : 0.1, 0.05);

        if(FlxG.mouse.justPressed && (FlxG.mouse.overlaps(arrow) || FlxG.mouse.overlaps(tv))) transition(FlxG.mouse.overlaps(arrow) ? "shop" : "menu");
        arrow.alpha = FlxMath.lerp(arrow.alpha, FlxG.mouse.overlaps(arrow) ? 1 : 0.1, 0.05);
        // this code isnt mine ty lunar cleitn
        FlxG.camera.scroll.x = FlxMath.lerp(FlxG.camera.scroll.x, (FlxG.mouse.screenX-(FlxG.width/2)) * 0.015, (1/30)*240*elapsed);
        FlxG.camera.scroll.y = FlxMath.lerp(FlxG.camera.scroll.y, (FlxG.mouse.screenY-6-(FlxG.height/2)) * 0.015, (1/30)*240*elapsed);
    }
}

function destroy() {
    if (Options.gameplayShaders) {
        FlxG.game.removeShader(bloom);
        FlxG.game.addShader(vhsblur);
        FlxG.game.addShader(monitorEffect);
    }
}

function transition(type:String) {
    trans = !(FlxG.mouse.visible = false);
    FlxTween.tween(arrow, {alpha: 0}, 0.75);
    if(type == "menu") {
        CoolUtil.playMenuSFX(1);
        FlxTween.tween(camFollow, {y: camFollow.y + 120}, 1.5, {ease: FlxEase.cubeInOut});
        FlxTween.tween(FlxG.camera, {zoom: 7.5}, 1.5, {ease: FlxEase.cubeInOut});
        new FlxTimer().start(1.25, _ -> FlxG.switchState(new MainMenuState()));
    } else {
        FlxG.sound.play(Paths.sound('shop_go'));
        FlxTween.num(1, 0.1, 1.25, null, _ -> FlxG.sound.music.pitch = _);
        FlxTween.tween(camFollow, {x: camFollow.x - FlxG.width}, 3, {ease: FlxEase.cubeInOut});
        new FlxTimer().start(2.5, _ -> FlxG.switchState(new ModState("AnalogStates/ShopState")));
    }
}

function doMouseShit() {
    if((FlxG.mouse.overlaps(arrow) || FlxG.mouse.overlaps(tv) || FlxG.mouse.overlaps(discordButton) || FlxG.mouse.overlaps(changelog)) && !mouseHoverState) {
        FlxG.mouse.load(mouseHover, 0.625);
        mouseHoverState = true;
    } else if(!(FlxG.mouse.overlaps(arrow) || FlxG.mouse.overlaps(tv) || FlxG.mouse.overlaps(discordButton) || FlxG.mouse.overlaps(changelog)) && mouseHoverState) {
        FlxG.mouse.load(mouseIdle, 0.625);
        mouseHoverState = false;
    }
}
