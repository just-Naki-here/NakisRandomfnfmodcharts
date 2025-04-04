
function onCreatePost()
	--doTweenAlpha('hudalpha', 'camHUD', 0, 0.1, 'linear');
	makeAnimatedLuaSprite('corrupt', 'stages/tit/corrupt', 0, 0);
	addAnimationByPrefix("corrupt", "idle", "corrupt idle", 16, true)
	scaleLuaSprite('corrupt', 2.2, 2.2)
    setObjectCamera("corrupt", 'camHUD')
	addLuaSprite('corrupt', false);
	doTweenAlpha("corrupt", "corrupt", 0.4, 1, 'elasticInOut')
    playAnim('corrupt', 'idle')
end