function onCreate()
	-- background
	
	makeLuaSprite('back', 'bg_skyphase2', -650, -450);
	setScrollFactor('back', 0.8, 0.8);
	scaleObject('back', 1, 1);

	makeLuaSprite('front', 'bg_realphase2', -650, -450);
	setScrollFactor('front', 0.9, 0.9);
	scaleObject('front', 1, 1);


	addLuaSprite('back', false);
	addLuaSprite('front', false);
	
	close(true);
end