function onCreate()
    setProperty('skipCountdown', true)
    makeLuaSprite('title', 'corrosionbymilo', 200, -50, 'camGame', false) -- tag, videoFile, x, y, camera, shouldLoop
end
function onStepHit()
	if curStep == 6147 then
		addLuaSprite('title');
		scaleObject('myCutscene', 1, 1);
		setProperty('title.alpha', 1) -- The _video is **REQUIRED**
	end
end