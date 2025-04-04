function onEvent(n,v1,v2)
-- Checks to see if the event is named: "" yeah.
	if n == 'ScreenEffects' then
if v1 == "Tilting" then
addLuaScript('scripts_unloaded/otherfastbeat', false);
end

if v1 == "OnBeatBop" then
    addLuaScript('scripts_unloaded/andanotherbeat', false);
end

if v2 == "OnBeatBopOff" then
removeLuaScript('scripts_unloaded/andanotherbeat', false);
end

if v2 == "TiltingOff" then
	removeLuaScript('scripts_unloaded/otherfastbeat', false);
	doTweenAngle('turn', 'camHUD', 0, stepCrochet*0.002, 'circOut')
    doTweenX('tuin', 'camHUD', -0, crochet*0.001, 'linear')
    doTweenAngle('tt', 'camGame', 0, stepCrochet*0.002, 'circOut')
    doTweenX('ttrn', 'camGame', 0, crochet*0.001, 'linear')
	setProperty('camHUD.angle',0)
    setProperty('camGame.angle',0)

	end
end