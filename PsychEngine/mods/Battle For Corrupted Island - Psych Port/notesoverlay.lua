
function onCreatePost()
	--doTweenAlpha('hudalpha', 'camHUD', 0, 0.1, 'linear');
	makeLuaSprite('blackscreen', 'characters/blackscreen', 380, 0);
	scaleLuaSprite('blackscreen', 0.4, 1.1)
    setObjectCamera("blackscreen", 'camHUD')
	addLuaSprite('blackscreen', false);
	doTweenAlpha("blackscreen", "blackscreen", 0.9, 1, 'elasticInOut')

end