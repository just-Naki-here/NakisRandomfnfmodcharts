import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxText.FlxTextFormat;

function create() {
    FlxG.cameras.add(camera = infoCam = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;
    infoCam.alpha = 0;
    infoCam.zoom = 720/FlxG.height;
    infoCam.y -= 27.5 * 720/FlxG.height;

    var infoBox:FunkinSprite = new FunkinSprite();
    infoBox.frames = Paths.getSparrowAtlas("menus/pauses/infoBox");
    infoBox.animation.addByPrefix('anim', 'anim', 12, true);
    infoBox.animation.play('anim');
    add(infoBox).screenCenter(FlxAxes.X);

    var songCredits:FunkinText = new FunkinText(infoBox.x + 75, infoBox.y + 175, 0, '', 32, false);
    add(songCredits).applyMarkup(PlayState.SONG.meta.customValues.credits, [new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF4444), "*")]);

    var songTitle:FunkinText = new FunkinText(infoBox.x + 500, infoBox.y + 175, 0, PlayState.SONG.meta.customValues.infoTitle, 56, false);
    add(songTitle);

    var songDesc:FunkinText = new FunkinText(infoBox.x + 500, infoBox.y + 250, 0, PlayState.SONG.meta.customValues.infoDesc, 28, false);
    add(songDesc).fieldWidth = 575;
    
    infoBox.antialiasing = songCredits.antialiasing = songTitle.antialiasing = songDesc.antialiasing = Options.antialiasing;

    FlxTween.tween(infoCam, {alpha: 1}, 0.5);
}

function update() {
    if (controls.BACK && infoCam.alpha == 1)
        FlxTween.tween(infoCam, {alpha: 0}, 0.5, {onComplete: (_) -> FlxTween.tween(pauseCam, {alpha: 1}, 0.5, {onComplete: (_) -> close()})});
}