import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxText.FlxTextFormat;
import flixel.util.FlxStringUtil;

var clickTxt:FunkinText = new FunkinText(5, 5, 0, "", 32, true);
var cashTxt:FunkinText = new FunkinText(5, 45, 0, "", 32, true);

var shopItems:Array<HealthIcon> = [];
var prices:Array<Int> = [0, 1250, 3000, 5000, 10000, 12500];

function create() {
    FlxG.cameras.add(camera = shopCam = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;
    FlxG.mouse.load(Assets.getBitmapData(Paths.image('menus/cursor/idle')), 0.625);

    add(new FunkinSprite().makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK)).alpha = 0.75;

    add(clickTxt).applyMarkup("*Clicks: *" + FlxG.save.data.clicks, [new FlxTextFormatMarkerPair(new FlxTextFormat(FlxColor.RED), "*")]);
    add(cashTxt).applyMarkup("*Money: *$" + FlxStringUtil.formatMoney(FlxG.save.data.cashMoney, true), [new FlxTextFormatMarkerPair(new FlxTextFormat(FlxColor.RED), "*")]);
    clickTxt.font = cashTxt.font = Paths.font("ARCADE_N.TTF");

    for (a in 0...6) {
        shopItems.push(new HealthIcon(a != 5 ? "belle" : "care"));
        shopItems[a].alpha = FlxG.save.data.unlocksyeah.contains(a) ? 1 : 0.25;
        shopItems[a].screenCenter(FlxAxes.Y);
        shopItems[a].x = FlxG.width / 7 * (a + 1) - shopItems[a].width / 2;
        add(shopItems[a]).color = [FlxColor.WHITE, FlxColor.RED, FlxColor.ORANGE, FlxColor.YELLOW, FlxColor.LIME, FlxColor.WHITE][a];

        var hellomynewtexts:FunkinText = new FunkinText(0, a % 2 == 0 ? 275 : 450, 0, prices[a] + " CLICKS", 24, true);
        hellomynewtexts.alignment = "center";
        add(hellomynewtexts).x = FlxG.width / 7 * (a + 1) - hellomynewtexts.width / 2;
    }
}

function update() {
    if (controls.BACK)
        close();

    for (a in 0...shopItems.length) {
        shopItems[a].scale.x = shopItems[a].scale.y = lerp(shopItems[a].scale.x, FlxG.mouse.overlaps(shopItems[a]) ? 1.125 : 1, 0.11);
        if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(shopItems[a]))
            if (FlxG.save.data.clicks - prices[a] < 0) {
                window.alert("not enough clicks :osakaguh:", "i was too lazy to make this a text in game");
            } else {
                if (!FlxG.save.data.unlocksyeah.contains(a)) {
                    FlxG.save.data.clicks -= prices[a];
                    FlxG.save.data.unlocksyeah.push(a);
                }
                FlxG.save.data.mode = a;
                setModeOrSomething();
                close();
            }
    }
}