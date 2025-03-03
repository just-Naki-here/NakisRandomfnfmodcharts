function onPlayerHit(e) {
    if (e.noteType == "vase note") {
			e.showSplash = true;
			if (!e.note.isSustainNote) {
				e.healthGain = 0;
			}
    }
}

function onPlayerMiss(e) {
	if (e.noteType == "vase note") {
		e.cancel();
		deleteNote(e.note); // Deletes the note when it goes offscreen
	}
}

function onNoteCreation(e) {
		switch (e.noteType) {
			case "vase note":
				/*
				If you're playing as the opponent (PlayState.opponentMode)
				and any strumlines AFTER dad (e.strumLineID >= 1)
				Hurt Note will be hittable for THOSE strumline characters
				doesn't matter if it's bf or other additionals strumlines, as long as it's after dads' strumline it's hittable
				*/
				if (PlayState.opponentMode && e.strumLineID >= 1) e.note.wasGoodHit = true;

				/*
				If you're playing solo (!PlayState.opponentMode)
				and any strumlines BEFORE the current character you're playing (e.strumLineID <= 0)
				Hurt Note will be hittable for THOSE strumline characters
				doesn't matter if it's bf or other additionals, as long as it's BEFORE dad's strumline
				*/
				if (!PlayState.opponentMode && e.strumLineID <= 0) e.note.wasGoodHit = true;
				e.noteSprite = "game/notes/vase note";
				e.noteScale = 0.15;
				e.mustHit = true;
				e.note.updateHitbox();
				e.note.y = 10;
				//e.note.earlyPressWindow = 0.4; // so you wouldn't hit it too early whilst also making it so you wouldn't hit it pixel perfect
				//e.note.latePressWindow = 0.1; // Same purpose as above
		}
}