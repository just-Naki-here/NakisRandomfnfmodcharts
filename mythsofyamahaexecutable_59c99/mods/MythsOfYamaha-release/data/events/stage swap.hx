// only for opponent

function onEvent(e:EventGameEvent){
    if (e.event.name == "stage swap"){

		curStageLv = e.event.params[0];
		for (num => par in stagesArr){
			par.visible = (num == e.event.params[0] ? true : false);
		}
		trace("stage No: " + e.event.params[0]);
    }
}