function onCreate()
	-- background
	
	makeLuaSprite('fake', 'bg_fake', -650, -450);
	setScrollFactor('fake', 1, 1);
	scaleObject('fake', 1, 1);


	addLuaSprite('fake', false);
	
	close(true);
end