function onCreatePost()
  precacheImage('corruption vig');
end
function onEvent(n,v1,v2)
	if n == 'The_Corruption' then
if v1 == "on" then
    makeAnimatedLuaSprite('corruption vig', 'corruption vig', 0, 0);
    scaleObject('corruption vig', 1, 1);
    addAnimationByPrefix('corruption vig', 'idle', 'corruption vig idle', 10, true)
    setObjectCamera("corruption vig", "camOther")
   -- setProperty('corruption vig.alpha', '0.5');
    addLuaSprite('corruption vig', false);
end
if v1 == "off" then
  removeLuaSprite('corruption vig', false);  
end
end
end