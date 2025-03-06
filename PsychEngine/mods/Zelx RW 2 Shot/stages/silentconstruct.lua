function onCreate()
	makeLuaSprite('stage1', 'SC/skySILENTCONSTRUCT', -600, -700);
	setScrollFactor('stage1', 1, 1);
	addLuaSprite('stage1');
	
	makeLuaSprite('stage2', 'SC/rebarSILENTCONSTRUCT', -600, -700);
	setScrollFactor('stage2', 1, 1);
	addLuaSprite('stage2');

	makeLuaSprite('stage3', 'SC/wallSILENTCONSTRUCT', -600, -700);
	setScrollFactor('stage3', 0.97, 0.97);
	addLuaSprite('stage3');

	makeLuaSprite('stage4', 'SC/stageSILENTCONSTRUCT', -600, -700);
	addLuaSprite('stage4')

	makeAnimatedLuaSprite('snowfall', 'saintSNOW', 500, -500)
	addAnimationByPrefix('snowfall', 'snowe', 'snow',24,true)
	setScrollFactor('stage5', 1, 1);
	addLuaSprite('snowfall',false)
	objectPlayAnimation('snowfall', 'snowe',false)

	makeLuaSprite('stage10', 'SC/foregroundSILENTCONSTRUCT', -600, -700)
	setScrollFactor('stage10', 0.8, 0.8)
	addLuaSprite('stage10', true)

end