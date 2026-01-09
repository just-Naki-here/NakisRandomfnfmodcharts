class CustomIcons extends FunkinSprite
{

    public var curIcon:String = '';
    public function new(iconPath:String = 'face', isPlayer:Bool = false) 
    {
        changeChar(iconPath,isPlayer);
    }

    public function changeChar(newIcon:String,isPlayer:Bool) {
        var newGraphic = Paths.image('icons/' + newIcon);
        curIcon = newIcon;
        loadGraphic(newGraphic,true,Math.floor(newGraphic.width / 2), Math.floor(newGraphic.height));
        antialiasing = true;
        animation.add(newIcon, [0, 1], 0, false, isPlayer);
		animation.play(newIcon);
    }
}