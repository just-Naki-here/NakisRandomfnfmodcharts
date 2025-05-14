// THIS CODE IS SO ASS HELPPP
import flixel.addons.text.FlxTypeText;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxText.FlxTextFormat;
import StringTools;

var hellojohndoefnf:FunkinText = new FunkinText(10, 10, FlxG.width - 20, "", 64, false);

var shader:CustomShader = new CustomShader("Backgrounds/broadcast");

function postCreate() {
    for(i in 0...4) cpuStrums.members[i].visible = false;
    
    FlxG.cameras.add(camOther = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;
    add(hi = new FunkinText(0, 0, 0, "[CLICK THE POP-UPS TO MAKE THEM DISAPPEAR]", 40, false)).camera = camOther;
    hi.screenCenter();

    camGame.fade(FlxColor.BLACK, 0);
    camHUD.alpha = 0;
    FlxG.mouse.visible = !(window.resizable = false);

    iconP1.setIcon("bf");
    healthBar.createFilledBar(dad.iconColor, 0xff31b0d1);
    healthBar.percent = health;

    add(hellojohndoefnf);

    if (Options.gameplayShaders) {
        insert(0, back = new FunkinSprite(0, -FlxG.height).makeGraphic(FlxG.width, FlxG.height*2)).shader = shader;
        back.scrollFactor.x = back.scrollFactor.y = back.zoomFactor = back.alpha = 0;
    }
    hellojohndoefnf.scrollFactor.x = hellojohndoefnf.scrollFactor.y = 0;
}

function update(_:Float) {
    if(hellojohndoefnf.text != "") {
        shader.iTime = Conductor.songPosition / 500;
        window.title = StringTools.replace(StringTools.replace(hellojohndoefnf.text, "\n", " "), "*", " ");
    } else
        window.title = "Analog Funkin' : Broadcast";
}

function stepHit(_:Int) {
    if (_ % FlxG.random.int(32,124) == 0 && camHUD.alpha == 1)
        add(new HelloPopup(['awokenWorld', 'otherReceivers', 'signsAndWonders'][FlxG.random.int(0, 2)], FlxG.random.float(1, 5))).camera = camHUD;

    switch(_) {
        case 0:
            FlxTween.tween(camGame, {zoom: 0.68}, (Conductor.stepCrochet / 1000) * 16);
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 32, true);
            FlxTween.tween(camOther, {alpha: 0}, (Conductor.stepCrochet / 1000) * 32);
        case 32:
            remove(hi);
            defaultCamZoom = 0.75;
            FlxTween.tween(camHUD, {alpha: 1}, 0.65);
        case 64 | 128 | 224 | 288 | 800 | 832 | 896 | 992 | 1344 | 1408 | 1504 | 1568:
            defaultCamZoom = 0.75;
        case 42 | 106 | 208 | 272 | 544 | 810 | 874 | 976 | 1040 | 1322 | 1386 | 1488 | 1552 | 1834 | 1898 | 2000 | 2064:
            defaultCamZoom = 0.9;
        case 1056:
            defaultCamZoom = 1;
            FlxTween.tween(camHUD, {alpha: 0}, 0.65);
        case 1062:
            coolFlash(FlxColor.WHITE, 16, 0.5);
            if (Options.gameplayShaders) {
                back.alpha = 1;
                FlxTween.num(255, 6, (Conductor.stepCrochet / 1000) * 250, null, _ -> shader.colR = _);
                FlxTween.num(255, 6, (Conductor.stepCrochet / 1000) * 250, null, _ -> shader.colG = _);
                FlxTween.num(255, 31, (Conductor.stepCrochet / 1000) * 250, null, _ -> shader.colB = _);
            }
            hellojohndoefnf.text = "UNTHINKING,";
            dad.cameraOffset.x -= 350;
        case 1072: hellojohndoefnf.text += "\nTHEY";
        case 1074: hellojohndoefnf.text += "\nCAN";
        case 1076: hellojohndoefnf.text += "\nMOVE";
        case 1100:
            dad.cameraOffset.x += 700;
            hellojohndoefnf.alignment = "right";
            hellojohndoefnf.color = FlxColor.RED;
            hellojohndoefnf.text = "\n\n\n\n\n\n\n\n\nTO";
            // to cut his 
        case 1104: hellojohndoefnf.text += "\nCUT";
        case 1106: hellojohndoefnf.text += "\nHIS";
        case 1108: hellojohndoefnf.text += "\nTHROAT,";
        case 1120:
            hellojohndoefnf.alignment = "center";
            hellojohndoefnf.color = FlxColor.WHITE;
            dad.cameraOffset.x -= 350;
            dad.cameraOffset.y -= 150;
            hellojohndoefnf.text = "TO";
        case 1122: hellojohndoefnf.text += " ONLY";
        case 1126: hellojohndoefnf.text += " MAKE";
        case 1131: hellojohndoefnf.text += " A";
        case 1132: hellojohndoefnf.text += " THOUSAND";
        case 1140: hellojohndoefnf.text += " MOUTHS.";
        case 1158:
            hellojohndoefnf.alignment = "left";
            hellojohndoefnf.text = "\n\n\n\n\n\n\n\n\nIF";
            dad.cameraOffset.x -= 350;
            dad.cameraOffset.y += 150;
        case 1160: hellojohndoefnf.text += "\nHE";
        case 1162: hellojohndoefnf.text += "\nIS";
        case 1164: hellojohndoefnf.text += "\nSILENCED,";
        case 1177:
            dad.cameraOffset.x += 700;
            hellojohndoefnf.alignment = "right";
            hellojohndoefnf.color = FlxColor.RED;
            hellojohndoefnf.text = "WE";
        case 1179: hellojohndoefnf.text += "\nWILL";
        case 1182: hellojohndoefnf.text += "\nSPEAK";
        case 1186: hellojohndoefnf.text += "\nFOR";
        case 1190: hellojohndoefnf.text += "\nHIM.";
        case 1196:
            hellojohndoefnf.alignment = "center";
            hellojohndoefnf.color = FlxColor.WHITE;
            dad.cameraOffset.x -= 350;
            dad.cameraOffset.y -= 150;
            hellojohndoefnf.text = "STARS";
        case 1202: hellojohndoefnf.text += " AND"; 
        case 1204: hellojohndoefnf.text += " WONDERS";
        case 1215:
            hellojohndoefnf.color = FlxColor.RED;
            hellojohndoefnf.text = "FLOOD";
        case 1219: hellojohndoefnf.text += " OUR";
        case 1222: hellojohndoefnf.text += " LITTLE";
        case 1226: hellojohndoefnf.text += " SKY.";
        case 1234:
            hellojohndoefnf.alignment = "left";
            hellojohndoefnf.color = FlxColor.WHITE;
            hellojohndoefnf.text = "NO";
            dad.cameraOffset.x -= 350;
            dad.cameraOffset.y += 150;
        // no stars above us
        case 1238: hellojohndoefnf.text += "\nSTARS";
        case 1244: hellojohndoefnf.text += "\nABOVE";
        case 1248: hellojohndoefnf.text += "\nUS,";
        case 1254:
            dad.cameraOffset.x += 700;
            hellojohndoefnf.alignment = "right";
            hellojohndoefnf.text = "\n\n\n\n\n\n\n\n\n\n\nONLY";
        case 1258: hellojohndoefnf.text += "\nEYES";
        case 1272:
            // waiting to open
            hellojohndoefnf.alignment = "center";
            hellojohndoefnf.color = FlxColor.WHITE;
            dad.cameraOffset.x -= 350;
            dad.cameraOffset.y -= 150;
            hellojohndoefnf.text = "WAITING";
        case 1278: hellojohndoefnf.text += " TO";
        case 1280: hellojohndoefnf.text += " OPEN.";
        case 1292:
            camGame.alpha = 0;
            camOther.alpha = 1;
            dad.cameraOffset.y += 150;
            hellojohndoefnf.text = "THERE";
            hellojohndoefnf.camera = camOther;
            hellojohndoefnf.screenCenter();
        case 1294: hellojohndoefnf.text += " ARE";
        case 1296: hellojohndoefnf.applyMarkup("THERE ARE *OTHER*", [new FlxTextFormatMarkerPair(new FlxTextFormat(FlxColor.RED), "*")]);
        case 1302: hellojohndoefnf.applyMarkup("THERE ARE *OTHER RECIEVERS.*", [new FlxTextFormatMarkerPair(new FlxTextFormat(FlxColor.RED), "*")]);
        case 1312:
            camHUD.alpha = camGame.alpha = 1;
            back.alpha = camOther.alpha = 0;
            camHUD.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 16, true);
            hellojohndoefnf.text = "";
            remove(hellojohndoefnf);
        case 1824 | 1856 | 1920 | 2016:
            defaultCamZoom = 0.68;
        case 2080:
            if (Options.gameplayShaders) {
                var jpg:CustomShader = new CustomShader("jpg");
                for (a in [camGame, camHUD])
                    a.addShader(jpg);
                FlxTween.num(0.0000000001, 16, (Conductor.stepCrochet / 1000) * 64, null, _ -> jpg.pixel_size = _);
            }

            defaultCamZoom = 0.68;
            FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 64);
        case 2094:
            camGame.alpha = 0;

    }
}

function destroy() {
    FlxG.mouse.visible = !(window.resizable = true);
}

function onStrumCreation(e)
    e.strum.x = e.player == 0 ? - FlxG.width : FlxG.width * [0.125, 0.25, 0.75, 0.875][e.strumID] - Note.swagWidth / 2;

class HelloPopup extends FunkinSprite {
    private var canPress:Bool = true;

	public function new(helloString:String, speed:Float) {
		super();

        loadGraphic(Paths.image("game/broadcastPopUps/" + helloString));
        scale.x = scale.y = FlxG.random.float(1, 1.5);
        updateHitbox();
        x = FlxG.random.bool() ? 5 : FlxG.width - width - 5;
        y = FlxG.random.bool() ? 5 : FlxG.height - height - 5;
        moves = true;
        zoomFactor = scrollFactor.x = scrollFactor.y = 0;
        velocity.set(135 * speed, 95 * speed);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

        // """""borrowed""""" from yce partially
        if (x > FlxG.width - width || x < 0)
            velocity.x = -velocity.x;
        if (y > FlxG.height - height || y < 0)
            velocity.y = -velocity.y;

        // ty frakits for camera fixes
        var posthing = FlxG.mouse.getWorldPosition(camera);
        angle = FlxMath.inBounds(posthing.x, x, x + width) && FlxMath.inBounds(posthing.y, y, y + height) ? FlxG.random.float(-3, 3) : 0;

        if (FlxMath.inBounds(posthing.x, x, x + width) && FlxMath.inBounds(posthing.y, y, y + height) && FlxG.mouse.justPressed && canPress) {
            canPress = false;
            FlxTween.tween(this, {"scale.x": 0, "scale.y": 0}, 1, {onComplete: (_) -> this.destroy(), ease: FlxEase.cubeInOut});
        }
	}
}