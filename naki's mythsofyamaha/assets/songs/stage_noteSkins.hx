
var noteSkinBf:String = "default";
var noteSkinDad:String = "default";
var splashSkin:String = "default";

function create() {
	if (boyfriend != null && boyfriend.xml != null){
		if (boyfriend.xml.exists("noteSkin")) noteSkinBf = boyfriend.xml.get("noteSkin");
		if (boyfriend.xml.exists("splashSkin")) splashSkin = boyfriend.xml.get("splashSkin");
	}

	if (dad != null && dad.xml != null){
		if (dad.xml.exists("noteSkin")) noteSkinDad = dad.xml.get("noteSkin");
	}

	//if your song uses bf.xml
	switch(curStage){
		case 'premed':
			noteSkinBf = 'smile';
		case 'insomnia':
			noteSkinBf = 'insomnia';
	}
}

function onStrumCreation(strumEvent){
	switch(strumEvent.player){
		case 0: 
			strumEvent.sprite = "game/notes/" + noteSkinDad;
		case 1: 
			strumEvent.sprite = "game/notes/" + noteSkinBf;
	}
}

function onNoteCreation(e) {
	if (e.noteType != null && Assets.exists(Paths.image("game/notes/types/" + e.noteType)))
		e.noteSprite = "game/notes/types/" + e.noteType;
	else {
		switch(e.note.strumLine.ID){
			case 0:
				e.noteSprite = "game/notes/" + noteSkinDad;
			case 1:
				e.noteSprite = "game/notes/" + noteSkinBf;
				e.note.splash = splashSkin;
			default:
				// trace("error");
		}		
	}
}