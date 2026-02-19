function onCreate()
	-- background
	
	makeLuaSprite('back', 'bg_skyphase3', -650, -450);
	setScrollFactor('back', 0.8, 0.8);
	scaleObject('back', 1, 1);

	makeAnimatedLuaSprite('fire', 'flame', -250, -200);
	setScrollFactor('fire', 0.8, 0.8);
	scaleObject('fire', 1.5, 1.5);
	addAnimationByPrefix('fire', 'FlamesBurn', 'FlamesBurn', 15, true)

	makeLuaSprite('front', 'bg_realphase3', -650, -450);
	setScrollFactor('front', 0.9, 0.9);
	scaleObject('front', 1, 1);

	addLuaSprite('back', false);
	addLuaSprite('fire', false);
	addLuaSprite('front', false);
	
	close(true);
end