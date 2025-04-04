function onCreatePost()
  precacheImage('corrupt');
end
function onEvent(n,v1,v2)
	if n == 'CorruptionOverlay' then
if v1 == "on" then
	makeAnimatedLuaSprite('corrupt', 'corrupt', 0, 0);
    setObjectCamera('corrupt', 'other')
    addAnimationByPrefix('corrupt', 'idle', 'corrupt idle', 24, true)
	scaleObject('corrupt', 1.1, 1.1)
   SetProperty('corrupt.alpha', '0.5');
    addLuaSprite('corrupt', false);
end
if v1 == "off" then
  removeLuaSprite('corrupt', false);  
end
end
end