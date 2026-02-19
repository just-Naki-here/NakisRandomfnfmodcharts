function onStepHit()
	if curStep == 3496 then
		makeVideoSprite('myCutscene', 'cutscene', 50, -75, 'camGame', false) -- tag, videoFile, x, y, camera, shouldLoop
		scaleObject('myCutscene', 1, 1);
		setProperty('myCutscene_video.alpha', 1) -- The _video is **REQUIRED**
	end
end