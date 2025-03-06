function onCreate()
	makeLuaSprite('stage1', 'MT/skyMETROPOLIS', 0, 0);
	setScrollFactor('stage1', 1, 1);
	addLuaSprite('stage1');
	
	makeLuaSprite('stage2', 'MT/cityMETROPOLIS', 0, 100);
	setScrollFactor('stage2', 1.1, 1.1);
	addLuaSprite('stage2');

	makeLuaSprite('stage3', 'MT/pillarsMETROPOLIS', 0, 0);
	setScrollFactor('stage3', 0.97, 0.97);
	addLuaSprite('stage3');

	makeLuaSprite('stage4', 'MT/wallMETROPOLIS', 0, 0);
	setScrollFactor('stage4', 0.97, 0.97);
	addLuaSprite('stage4');

	makeLuaSprite('stage5', 'MT/stageMETROPOLIS', 0, 0);
	addLuaSprite('stage5')

end