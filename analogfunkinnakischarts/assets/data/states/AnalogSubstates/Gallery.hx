//
var jason = CoolUtil.parseJson(Paths.file("images/menus/gallery/data.json"));

var imgs:Array<FunkinSprite> = [];

var cur:Int = 0;

var topTxt:FunkinText;
var bottomTxt:FunkinText;
var counter:FunkinText;

function create() {
    window.title = "Analog Funkin' : Gallery";

    for (a in jason.gallery) {
        imgs.push(new FunkinSprite(0, 0, Paths.image("menus/gallery/" + a.image)));
        imgs[imgs.length - 1].antialiasing = Options.antialiasing;
        add(imgs[imgs.length - 1]).screenCenter();
    }

        // I got lazy and just put this here instead cause why the fuck not
    for (a in 0...imgs.length) imgs[a].scale.set(jason.gallery[cur].scale, jason.gallery[cur].scale);

    for(a in [
        counter = new FunkinText(12, 12, FlxG.width - 24, "10/10", 32, false)
        topTxt = new FunkinText(0, 24, FlxG.width, "oops", 48, false),
        bottomTxt = new FunkinText(0, FlxG.height - 60, FlxG.width, "oops", 48, false)
    ])
        add(a).antialiasing = Options.antialiasing;

    counter.alignment = "right";
    topTxt.alignment = bottomTxt.alignment = "center";

    changeSelect(0);
}

function update(elapsed:Float) {
    if(controls.BACK) {
        CoolUtil.playMenuSFX(2);
        window.title = "Analog Funkin' : Main Menu";
        close();
    }

    imgs[cur].scale.set(CoolUtil.fpsLerp(imgs[cur].scale.x, jason.gallery[cur].scale, 0.11), CoolUtil.fpsLerp(imgs[cur].scale.y, jason.gallery[cur].scale, 0.11));

    if(controls.LEFT_P || controls.RIGHT_P)
        changeSelect(controls.LEFT_P ? -1 : 1);
}

function changeSelect(a:Int) {
    cur = FlxMath.wrap(cur + a, 0, imgs.length - 1);
    CoolUtil.playMenuSFX();

    for (a in 0...imgs.length) imgs[a].visible = a == cur;

    imgs[cur].scale.set(jason.gallery[cur].scale - 0.2, jason.gallery[cur].scale - 0.2);

    topTxt.text = jason.gallery[cur].title;
    bottomTxt.text = jason.gallery[cur].desc;

    counter.text = (cur + 1) + "/" + imgs.length;
}