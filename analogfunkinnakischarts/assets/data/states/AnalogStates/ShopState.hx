// yeah this is getting recoded in the hotfix bwaa
import flixel.addons.text.FlxTypeText;
import flixel.util.FlxStringUtil;
import openfl.display.BitmapData;
import openfl.display.BlendMode;
import flixel.util.FlxGradient;
import flixel.group.FlxGroup;
import openfl.utils.Assets;

var shopData:Array<Dynamic> = ["E_57","TM_D","TMH_AB","B_TC","EPH_01","VC_P","WL_1992","TMK_M"];
var tapes:Array<FunkinSprite> = [];

var arrow:FunkinSprite = new FunkinSprite();
var hitbox:FunkinSprite = new FunkinSprite();

var lights:FunkinSprite = new FunkinSprite();
var board:FunkinSprite = new FunkinSprite(110, 85);

var notMason:Character = new Character(575, 280, "!notmason");
var notMasonIdle:String = FlxG.random.bool() ? "altidle" : "idle";
var notMasonHitbox:FunkinSprite = new FunkinSprite();

public static var lines:Map<String, Array<String>> = [
    "intro"    => CoolUtil.coolTextFile(Paths.txt('shoplines/intro'))
    "idle"     => CoolUtil.coolTextFile(Paths.txt("shoplines/idle")),
    "purchase" => CoolUtil.coolTextFile(Paths.txt("shoplines/purchase")),
    "fail"     => CoolUtil.coolTextFile(Paths.txt("shoplines/fail")),
    "congrats" => CoolUtil.coolTextFile(Paths.txt("shoplines/congrats"))
];
var dialogueBox:FunkinSprite = new FunkinSprite().loadGraphic(Paths.image("menus/shop/dialoguebox"));
var dialogueTxt:FlxTypeText = new FlxTypeText().setFormat(Paths.font("ARCADE_N.TTF"), 32);
var dialogueCamY:Float = 100.0;
var dialogueEnded:Bool = false;

var mouseIdle = Assets.getBitmapData(Paths.image('menus/cursor/idle'));
var mouseHover = Assets.getBitmapData(Paths.image('menus/cursor/hover'));
var mouseHoverState:Bool = null;

function create() {
    monitorEffect.uScanlineEffect = 0.0;
    CoolUtil.playMusic(Paths.music(checkIfModBeat() ? "shopCongrat" : "shopTheme"), false, 1, true);
    window.title = "Analog Funkin' : Viewing Shop";
    FlxG.mouse.visible = true;

    add(camFollow = new FunkinSprite().makeSolid(1, 1, FlxColor.BLACK)).screenCenter();

    var shadow:FunkinSprite = new FunkinSprite().makeSolid(FlxG.width, FlxG.height, 0xff5c5c5c);
    shadow.blend = BlendMode.MULTIPLY;
    shadow.scrollFactor.x = shadow.scrollFactor.y = shadow.zoomFactor = 0;
    shadow.alpha = 0.5;

    lights.blend = BlendMode.ADD;

    var welcome:FunkinSprite = new FunkinSprite(0, -163, Paths.image("menus/shop/welcome"));

    var shadow2:FunkinSprite = new FunkinSprite(0, 0, Paths.image("menus/shop/ShadowAgain"));
    shadow2.blend = BlendMode.MULTIPLY;

    arrow.alpha = arrow.scrollFactor.x = arrow.scrollFactor.y = 0.1;
    arrow.frames = Paths.getSparrowAtlas("menus/tv/arrow");
    arrow.animation.addByPrefix("loop", "loop", 12, true);
    arrow.animation.play("loop");
    arrow.flipX = arrow.flipY = true;
    arrow.screenCenter(FlxAxes.Y);
    arrow.x = FlxG.width - 37.5 - arrow.width;

    board.frames = Paths.getSparrowAtlas("menus/shop/boardoutline");
    board.animation.addByPrefix("loop", "loop", 24, true);
    board.scale.set(1.1, 1.1);
    board.animation.play("loop");

    hitbox.makeSolid(board.width, board.height, FlxColor.RED);
    hitbox.setPosition(110, 85);

    notMason.playAnim(notMasonIdle);

    notMasonHitbox.makeSolid(258, 262, FlxColor.RED);
    notMasonHitbox.setPosition(511, 151.5);
    
    var vig:FunkinSprite = new FunkinSprite().loadGraphic(Paths.image("stages/vignette-16to9"));
    vig.color = FlxColor.BLACK;

    for(num => a in [
        new FunkinSprite(0, 0, Paths.image("menus/shop/ShopBack")), // backshops
        shadow, notMason, lights.loadGraphic(Paths.image("menus/shop/Lights")),
        new FunkinSprite(135, 87.5, Paths.image("menus/shop/VHSTapes")),
        board, new FunkinSprite(0, 0, Paths.image("menus/shop/ShopFront")),
        welcome.screenCenter(FlxAxes.X), shadow2, arrow,
        new FunkinSprite(35, FlxG.height - 25 - 122, Paths.image("menus/shop/Money")),
        money = new FunkinText(247, FlxG.height - 112.5, 0, "$" + FlxStringUtil.formatMoney(FlxG.save.data.cashMoney, true), 40, true),
        vig, hitbox, notMasonHitbox
    ]){
        add(a);
        if(num > 8 && num < 13) a.scrollFactor.y = a.scrollFactor.x = 0;
        a.antialiasing = Options.antialiasing;
    }
    money.font = Paths.font("ARCADE_N.TTF");

    var why:Int = 0;
    var ex:Int = 0;
    for (a in 0...shopData.length) {
        if(a % 2 == 0) {
            why += 55;
            ex = 0;
        }
        tapes.push(new FunkinSprite(100 + ex, 50 + why).loadGraphic(Paths.image("menus/shop/tape")));
        tapes[a].scale.x = tapes[a].scale.y = 0.5;
        insert(members.indexOf(board), tapes[a]).antialiasing = Options.antialiasing;
        ex += 100;
    }

    hitbox.alpha = notMasonHitbox.alpha = 0;
    FlxG.camera.zoom -= 0.1;
    FlxG.sound.play(Paths.sound('shop_bell'));
    FlxTween.tween(welcome, {y: -15}, 2, {ease: FlxEase.elasticInOut});
    FlxTween.tween(FlxG.camera, {zoom: 1.05}, 2, {ease: FlxEase.elasticInOut});

    FlxG.cameras.add(newCam = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;
    add(FlxGradient.createGradientFlxSprite(FlxG.width, FlxG.height, [FlxColor.TRANSPARENT, FlxColor.TRANSPARENT, FlxColor.BLACK])).camera = newCam;
    add(dialogueBox).screenCenter(FlxAxes.X);
    dialogueBox.y = 500;
    add(dialogueTxt).setPosition(dialogueBox.x + 25, dialogueBox.y + 35);
    dialogueTxt.sounds = [FlxG.sound.load(Paths.sound("shop_talk"))];
    dialogueTxt.fieldWidth = dialogueBox.width - 50;
    dialogueTxt.antialiasing = Options.antialiasing;
    dialogueBox.camera = dialogueTxt.camera = newCam;

    FlxG.camera.follow(camFollow);
    doMouseShit();
    doTapeShit();
    var temp:Array<String> = lines[checkIfModBeat() ? "congrats" : "intro"];
    notMasonTalk(FlxG.random.getObject(temp), notMasonIdle);
}

function update(elapsed:Float) {
    // this code isnt mine ty lunar cleitn
	FlxG.camera.scroll.x = FlxMath.lerp(FlxG.camera.scroll.x, (FlxG.mouse.screenX-(FlxG.width/2)) * 0.015, (1/30)*240*elapsed);
	FlxG.camera.scroll.y = FlxMath.lerp(FlxG.camera.scroll.y, (FlxG.mouse.screenY-6-(FlxG.height/2)) * 0.015, (1/30)*240*elapsed);

    FlxG.mouse.visible = dialogueCamY == 100;
    if (dialogueCamY == 100)
        doMouseShit();

    if(FlxG.mouse.justPressed && FlxG.mouse.overlaps(arrow) && camFollow.x == FlxG.width / 2 - 0.5){
        FlxG.sound.play(Paths.sound('shop_go'));
        FlxTween.tween(camFollow, {x: camFollow.x + FlxG.width * 1.5}, 3, {ease: FlxEase.cubeInOut});
        FlxTween.num(1, 0.1, 2.5, {startDelay: 0.25}, _ -> FlxG.sound.music.pitch = _);
        new FlxTimer().start(2.75, _ -> FlxG.switchState(new ModState("AnalogStates/TVState")));
    }

    if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(hitbox) && dialogueCamY == 100 && !checkIfAllTapes()) {
        persistentUpdate = !(persistentDraw = true);
        openSubState(new ModSubState("AnalogSubstates/ShopPurchaseSubstate"));
    }

    if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(notMasonHitbox) && dialogueCamY == 100)
        notMasonTalk(FlxG.random.getObject(lines["idle"]), notMasonIdle);    

    if (dialogueEnded && controls.ACCEPT) {
        dialogueEnded = false;
        dialogueCamY = 100;
        dialogueTxt.resetText("");
        FlxTween.cancelTweensOf(FlxG.camera);
        FlxTween.cancelTweensOf(camFollow);
        FlxTween.tween(FlxG.camera, {zoom: 1.05}, 1 - (1.55 - FlxG.camera.zoom), {ease: FlxEase.cubeInOut});
        FlxTween.tween(camFollow, {y: FlxG.height / 2 - 0.5}, 1 + (FlxG.height / 2 - 0.5 - 50 - camFollow.y), {ease: FlxEase.linear});
        newCam.alpha = 0;
        notMason.playAnim(notMasonIdle);

        if (lastLine == "And with that, we're out of stock.")
            notMasonTalk("I have to thank you for your persistent patronage.", "purchase");
        else if (lastLine == "I have to thank you for your persistent patronage.")
            notMasonTalk("Now get out.", "fail");
    }

    arrow.alpha = FlxMath.lerp(arrow.alpha, FlxG.mouse.overlaps(arrow) && dialogueCamY == 100 ? 1 : 0.1, 0.04);
    board.alpha = FlxMath.lerp(board.alpha, FlxG.mouse.overlaps(hitbox) && dialogueCamY == 100 ? 1 : 0, 0.11);
    newCam.y = FlxMath.lerp(newCam.y, dialogueCamY + (FlxG.height - dialogueBox.y - dialogueBox.height + 200) - dialogueTxt.height, 0.33);
    lights.alpha = FlxG.random.float(0.3, 1, [lights.alpha]);
}

function destroy()
    monitorEffect.uScanlineEffect = 1.0;

function doMouseShit() {
    if((FlxG.mouse.overlaps(hitbox) || FlxG.mouse.overlaps(notMasonHitbox) || FlxG.mouse.overlaps(arrow)) && !mouseHoverState) {
        FlxG.mouse.load(mouseHover, 0.625);
        mouseHoverState = true;
    } else if(!(FlxG.mouse.overlaps(hitbox) || FlxG.mouse.overlaps(notMasonHitbox) || FlxG.mouse.overlaps(arrow)) && mouseHoverState) {
        FlxG.mouse.load(mouseIdle, 0.625);
        mouseHoverState = false;
    }
}

var lastLine:String = null;
var idk:String = null;

public static function notMasonTalk(_:String, anim:String = notMasonIdle) {
    dialogueTxt.skipKeys = (["And with that, we're out of stock.", "I have to thank you for your persistent patronage.", "Now get out."].contains(_) ? [] : [Reflect.field(Options, 'P1_ACCEPT')[0]]);

    dialogueEnded = false;
    dialogueCamY = 0;
    newCam.alpha = 1;

    lastLine = _;
    idk = anim;

    if (anim == "fail")
        FlxG.sound.play(Paths.sound('shop_fail'));
    else if (anim == "purchase")
        FlxG.sound.play(Paths.sound('shop_buy' + FlxG.random.int(1,2)));

    if (!lines["intro"].contains(_)) {
        FlxTween.cancelTweensOf(FlxG.camera);
        FlxTween.cancelTweensOf(camFollow);
        FlxTween.tween(FlxG.camera, {zoom: 1.55}, 0.5 + (1.55 - FlxG.camera.zoom), {ease: FlxEase.cubeInOut});
        FlxTween.tween(camFollow, {y: FlxG.height / 2 - 0.5 - 50}, 0.5 + (FlxG.height / 2 - 0.5 - camFollow.y), {ease: FlxEase.linear});
    }
    notMason.playAnim(idk + '_talk');

    dialogueTxt.resetText(FlxG.random.bool(99) ? _ : "The fungus has claimed its newest victim.");
    dialogueTxt.start(0.1, null, null, null, () -> {
        dialogueEnded = true;
        notMason.playAnim(idk);
    });
}

public static function doTapeShit() {
    money.text = "$" + FlxStringUtil.formatMoney(FlxG.save.data.cashMoney, false);
    for (a in 0...tapes.length)
        tapes[a].visible = FlxG.save.data.unlockedSongs.length < tapes.length - a;
        // if (a > FlxG.save.data.unlockedSongs.length)
        //     shopData.remove(shopData[a]);
}