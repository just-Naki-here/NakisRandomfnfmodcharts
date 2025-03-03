function onCreate()

	makeLuaSprite("stagefront", 'stagefront', -300, -300);
	setLuaSpriteScrollFactor('stagefront', 1, 1);
	scaleObject('stagefront', 1.3, 1.3);
	
	makeLuaSprite('spotlight', 'spotlight', -300, -300);
	setLuaSpriteScrollFactor('spotlight', 1.05, 1.05);
	scaleObject('spotlight', 1.3, 1.3);

	addLuaSprite('stagefront', false);
	addLuaSprite('spotlight', false);
	
	close(true);
end