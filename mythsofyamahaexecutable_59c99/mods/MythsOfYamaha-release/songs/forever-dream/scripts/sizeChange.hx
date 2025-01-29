
function create() {
	var b = FlxG.save.data.fdResolution == 'big';
    importScript("data/scripts/resizing");
	ratioThing(1120 / (b ? 1 : 1.34), b ? 960 : 720, false);
}

function destroy()
	ratioThing(1280, 720, true);
