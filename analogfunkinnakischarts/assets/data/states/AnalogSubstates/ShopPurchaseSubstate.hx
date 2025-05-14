import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxText.FlxTextFormat;
import flixel.util.FlxStringUtil;

var text:FunkinText = new FunkinText(550, 150, 0, "TAPE ID", 64, false);
var text2:FunkinText = new FunkinText(550, 275, 0, "Would you like to\npurchase this tape\nfor (Amount)?", 32, false);

var curSelect:Int = 0;

var curTape:FunkinSprite;
var arrows:Array<FunkinSprite> = [];

var imlowkeyendingitallonmay3rd2025 = [
    "E_57" => "Enormity",
    "TM_D" => "Deadlines",
    "VC_P" => "Pursuit",
    "WL_1992" => "Wonderland",
    "B_TC" => "Take Care",
    "EPH_01" => "Encavmaphobia",
    "TMH_AB" => "Abduction",
    "TMK_M" => "Manipulated"
];
var shopData:Array<Dynamic> = [
    // tape name, price
    ["TM_D", 150, FlxG.save.data.unlockedSongs.contains("deadlines")],
    ["E_57", 150, FlxG.save.data.unlockedSongs.contains("enormity")],
    ["TMH_AB", 100, FlxG.save.data.unlockedSongs.contains("abduction")],
    ["EPH_01", 100, FlxG.save.data.unlockedSongs.contains("encavmaphobia")],
    ["B_TC", 100, FlxG.save.data.unlockedSongs.contains("take care")],
    ["WL_1992", 100, FlxG.save.data.unlockedSongs.contains("wonderland")],
    ["VC_P", 25, FlxG.save.data.unlockedSongs.contains("pursuit")],
    ["TMK_M", 25, FlxG.save.data.unlockedSongs.contains("manipulated")]
];

function create() {
    FlxG.cameras.add(camera = shopCam = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;
    FlxG.mouse.load(Assets.getBitmapData(Paths.image('menus/cursor/idle')), 0.625);
    FlxTween.num(0, 1, 0.25, null, function(a) shopCam.alpha = a);

    add(new FlxSprite(0, 0, Paths.image("menus/shop/PurchaseSubstate/Screen"))).screenCenter();
    add(text).font = Paths.font("ARCADE_N.TTF");
    add(text2).font = Paths.font("ARCADE_N.TTF");

    add(tapeOutline = new FunkinSprite(FlxG.width / 4 - 142, FlxG.height / 2 - 179/2, Paths.image("menus/shop/PurchaseSubstate/TapeOutline")));

    add(curTape = new FunkinSprite());

    for (a in 0...2) {
        var arrow:FunkinSprite = new FunkinSprite(0, 0, Paths.image("menus/shop/PurchaseSubstate/arrow"));
        arrow.addAnim("idle", "idle", 24);
        add(arrow).playAnim("idle");
        arrow.flipY = a == 1;
        arrow.origin.y = a == 0 ? arrow.height : 0;
        arrow.setPosition(tapeOutline.x + tapeOutline.width / 2 - arrow.width / 2, a == 0 ? tapeOutline.y - arrow.height - 25 : tapeOutline.y + tapeOutline.height + 25);
        arrows.push(arrow);
    }
    
    text.antialiasing = text2.antialiasing = Options.antialiasing;
    changeSelect(0);
}

function update() {
    if (controls.BACK)
        close();

    curTape.scale.x = curTape.scale.y = FlxMath.lerp(curTape.scale.x, 1.7, 0.04);
    curTape.angle = FlxMath.lerp(curTape.angle, 0, 0.04);
    tapeOutline.angle = FlxMath.lerp(tapeOutline.angle, 0, 0.04);

    for (a in arrows) {
        a.scale.x = lerp(a.scale.x, 1.25, 0.11);
        a.scale.y = lerp(a.scale.y, 1.25, 0.11);
        a.color = CoolUtil.lerpColor(a.color, FlxColor.WHITE, 0.11);
    }

    if((controls.UP_P || controls.DOWN_P) && shopCam.alpha == 1)
        changeSelect(controls.UP_P ? -1 : 1);

    if(controls.ACCEPT && shopCam.alpha == 1) {
        if(FlxG.save.data.cashMoney - shopData[curSelect][1] >= 0) {
            FlxG.save.data.cashMoney -= shopData[curSelect][1];
            FlxG.save.data.unlockedSongs.push(imlowkeyendingitallonmay3rd2025[shopData[curSelect][0]].toLowerCase());
            FlxG.save.flush();
            close();
            notMasonTalk(checkIfAllTapes() ? "And with that, we're out of stock." : FlxG.random.getObject(lines["purchase"]), "purchase");
        } else {
            close();
            notMasonTalk(FlxG.random.getObject(lines["fail"]), "fail");
        }
    }
}

function changeSelect(a:Int) {
    curSelect = FlxMath.wrap(curSelect + a, 0, shopData.length - 1);
    if (shopData[curSelect][2]) {
        changeSelect(a == 0 ? 1 : a);
        break;
    }
    arrows[a == -1 ? 0 : 1].scale.set(0.5, 0.5);
    arrows[a == -1 ? 0 : 1].color = 0xff7a7a7a;

    FlxG.sound.play(Paths.sound('shop_select'));
    text.text = shopData[curSelect][0];
    text2.text = "WOULD YOU LIKE TO\nPURCHASE THIS TAPE\nFOR $" + shopData[curSelect][1] + "?";

    curTape.loadGraphic(Paths.image("menus/shop/Tapes/" + shopData[curSelect][0]));
    curTape.scale.x = curTape.scale.y = 1.5;
    curTape.angle = a == -1 ? 15 : -15;

    tapeOutline.angle = a == -1 ? 15 : -15;

    curTape.setPosition(FlxG.width/4 - curTape.width/2, FlxG.height/2 - curTape.height/2);
}

function destroy() {
    doTapeShit();
}