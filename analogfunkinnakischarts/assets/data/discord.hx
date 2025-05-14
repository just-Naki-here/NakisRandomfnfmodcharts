import funkin.backend.utils.DiscordUtil;
import Sys;
import sys.Http;

function onDiscordPresenceUpdate(e) {
	var data = e.presence;

	if(data.button1Label == null) data.button1Label = "Analog Funkin' Twitter";
	if(data.button1Url == null) data.button1Url = "https://twitter.com/AnalogFunkinFNF";
	if(data.button2Label == null) data.button2Label = "Play the mod";
	if(data.button2Url == null) data.button2Url = "https://gamebanana.com/mods/381966";

	data.largeImageKey = Std.isOfType(FlxG.state, PlayState) ? StringTools.replace(PlayState.SONG.meta.displayName.toLowerCase(), " ", "_") : "icon";
}

function onPlayStateUpdate() {
	DiscordUtil.changePresence(
		PlayState.isStoryMode ? "Playing A Boxset:" : "Rewinding A Tape:",
		PlayState.isStoryMode ? ["WALTEN FILES - ", "BACKROOMS - ", "PETSCOP - ", "LOCAL58 - "][Std.int(PlayState.storyWeek.id)] + PlayState.SONG.meta.displayName : PlayState.SONG.meta.displayName,
		PlayState.instance.inst
	);
}

function onMenuLoaded(name:String) {
	DiscordUtil.changePresenceSince("", "");
}

function onEditorTreeLoaded(name:String) {
	DiscordUtil.changePresenceSince("", "");
}

function onEditorLoaded(name:String, editingThing:String) {
	DiscordUtil.changePresenceSince("", "");
}

function onGameOver() {
	DiscordUtil.changePresence("", "");
}