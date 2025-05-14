import flixel.util.FlxStringUtil;
import flixel.util.FlxGradient;

var doLerp:Bool = true;
var lerpCash:Float = 0.0;

var cashTxt:FunkinText;
var lastTxt:String;
var cashImg:FunkinSprite;

var cashSFX:FlxSound = FlxG.sound.load(Paths.sound('money'));

var coins:Array<FunkinSprite> = [];

function create() {
    FlxG.save.flush();
    
    PlayState.instance.camGame.visible = PlayState.instance.camHUD.visible = false;
    FlxG.cameras.add(camera = camCutscene = new FlxCamera(), false).bgColor = FlxColor.BLACK;

    add(gradient = FlxGradient.createGradientFlxSprite(FlxG.width, FlxG.height, [FlxColor.TRANSPARENT, FlxColor.TRANSPARENT, FlxColor.WHITE])).alpha = 0;

    add(cashTxt = new FunkinText(0, 0, 0, "$0.00", 48, false)).font = Paths.font("ARCADE_N.TTF");
    cashTxt.y = FlxG.height - cashTxt.height - 5;

    add(cashImg = new FunkinSprite(0, 0, Paths.image("menus/shop/Money"))).screenCenter(FlxAxes.X);
    cashImg.y = FlxG.height - (cashImg.height * 2);

    cashTxt.antialiasing = cashImg.antialiasing = Options.antialiasing;
}

function update(_:Int) {
    cashImg.scale.x = lerp(cashImg.scale.x, 2, 0.04);
    cashImg.scale.y = lerp(cashImg.scale.y, 2, 0.04);
    gradient.alpha = lerp(gradient.alpha, (Std.int(lerpCash) / Std.int(FlxG.save.data.cashMoney)) / 2, 0.04);

    if (doLerp) {
        lerpCash = lerp(lerpCash, FlxG.save.data.cashMoney, 0.11);

        cashTxt.text = "$" + FlxStringUtil.formatMoney(lerpCash, false);
        if (lastTxt != cashTxt.text) {
            cashImg.scale.x = 2.2;
            cashImg.scale.y = 1.8;
            cashSFX.play(true);
            cashSFX.pitch += _;
            lastTxt = cashTxt.text;
        }
        cashTxt.screenCenter(FlxAxes.X);
        if (Math.fround(lerpCash) == Math.fround(FlxG.save.data.cashMoney)) {
            FlxG.sound.play(Paths.sound('shop_buy' + FlxG.random.int(1, 2)));
            FlxTween.color(cashTxt, 1, FlxColor.LIME, FlxColor.WHITE);
            CoolUtil.playMusic(Paths.music("cash" + (PlayState.SONG.meta.name == "his throne" ? "HisThrone" : "Default")), false, 1, true);
            gradient.alpha = 1;
            doLerp = false;
        }
    }

    if (controls.ACCEPT && camCutscene.alpha == 1)
        if (!doLerp) {
            FlxTween.num(1, 0.1, 0.25, {startDelay: 0.25}, _ -> FlxG.sound.music.pitch = _);
            FlxTween.tween(camCutscene, {alpha: 0}, 0.5, {onComplete: (_) -> {
                PlayState.instance.nextSong();
                if (PlayState.isStoryMode) {
                    if (PlayState.storyPlaylist.length == 0)
                        FlxG.save.data.unlockedWeeks.push(Std.int(PlayState.storyWeek.id) + 1);
                    if (myfourtothreesongs.contains(PlayState.storyPlaylist[0].toLowerCase()))
                        windowShit(1024, 768, 0.8);
                    else
                        windowShit(1280, 720);
                }}});
        } else {
            lerpCash = FlxG.save.data.cashMoney;
        }

    if (controls.BACK)
        FlxG.switchState(new PlayState());
}

function destroy() {
    FlxTween.cancelTweensOf(cashTxt);
}
