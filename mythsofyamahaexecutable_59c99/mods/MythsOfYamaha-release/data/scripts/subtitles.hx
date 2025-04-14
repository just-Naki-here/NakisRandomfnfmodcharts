import funkin.game.cutscenes.dialogue.DialogueCharacter;
import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;

public var camCaptions:FlxCamera = new FlxCamera(0,0,1280,720);
camCaptions.visible = FlxG.save.data.mcm_subtitles;
camCaptions.bgColor = 0;

function postCreate() {
	FlxG.cameras.add(camCaptions, false);
	
	camCaptions.zoom = 1;
}

public var finishedLine:Bool;

var subtitleTxt:FlxText;

var fullText:String;
var separatedLines:Array = [];
var separatedStepStarts:Array = [];
var separatedStepEnds:Array = [];
public var separatedLinesGrp:FlxGroup;

public function textTest(aaa:String, ?line:Int, ?lineLength:Float){
	if (aaa == null) return;
	trace(aaa);
	fullText = null;
	separatedLines = [];
	stepStarts = [];
	stepEnds = [];

	fullText = Assets.getText(Paths.txt("subtitles/"+aaa));
	var splitText:String = fullText.split('::');
	var unseparatedLines:String = "";

    for (i in 0...splitText.length)
    {
        if(i % 3 == 0) {
			unseparatedLines += splitText[i];
		}
		stepStarts.push((1 + (i * 3)));
		for(j in 0...stepStarts.length){
			if(i == stepStarts[j]){
				separatedStepStarts.push(splitText[i]);
			}
		}
		stepEnds.push((2 + (i * 3)));
		for(k in 0...stepStarts.length){
			if(i == stepEnds[k]){
				separatedStepEnds.push(splitText[i]);
			}
		}
		//trace(i);
		//trace(i + " " + (1 + (i * 3)));
    }
	for(i in 0...separatedStepStarts.length){
		//trace(separatedStepStarts[i]);
	}
	//trace(unseparatedLines);
	var splitTextAgain:String = unseparatedLines.split('\n');
	for (i in 0...splitTextAgain.length)
	{
		separatedLines.push(splitTextAgain[i]);
		//trace(separatedLines[i]);
	}

	separatedLinesGrp = new FlxGroup();
	add(separatedLinesGrp);

	for (i in 0...separatedLines.length){
		dialogueTxt = new FlxText(0,0,FlxG.width - 100);
		dialogueTxt.setFormat(Paths.font("arial.ttf"), 35, FlxColor.YELLOW, FlxTextAlign.CENTER);
		dialogueTxt.autoSize = false;
		dialogueTxt.setBorderStyle(FlxTextBorderStyle.OUTLINE,FlxColor.BLACK,2);
		dialogueTxt.text = separatedLines[i];
		dialogueTxt.screenCenter();
		dialogueTxt.y += 300;
		dialogueTxt.cameras = [camCaptions];
		dialogueTxt.alpha = 0;
		separatedLinesGrp.add(dialogueTxt);
	}
}

function stepHit(){
	for (i in 0...separatedStepStarts.length) {
		if (curStep == Std.parseInt(separatedStepStarts[i])){
			//trace("hii!!!");
			FlxTween.tween(separatedLinesGrp.members[i],{alpha:1},0.2);
			//if (i > 0) FlxTween.tween(separatedLinesGrp.members[i - 1],{alpha:0},0.2);
			trace(separatedLines[i]);
		}
		if (curStep == Std.parseInt(separatedStepEnds[i])){
			FlxTween.tween(separatedLinesGrp.members[i],{alpha:0},0.2,{onComplete: function(){
				separatedLinesGrp.remove(separatedLinesGrp.members[i]);
			}});
		}
	}
}
