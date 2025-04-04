
function onCreate()
	-- background shit
	makeLuaSprite('skythoughts', 'stages/thoughts/skythoughts', -233, 28);
	setScrollFactor('skythoughts', 0.9, 0.9);

	addLuaSprite('skythoughts', false);

	makeLuaSprite('skythoughts', 'stages/thoughts/skythoughts', -899, 28);
	setScrollFactor('skythoughts', 0.9, 0.9);
	scaleObject('skythoughts', 1.4, 1.4)
	addLuaSprite('skythoughts', false);

	makeLuaSprite('mount', 'mount', 455, 28);
	setScrollFactor('mount', -0.7, 0.9);

	addLuaSprite('mount', false);

	makeLuaSprite('foregroundthoughts', 'stages/thoughts/foregroundthoughts', -677, -98);
	setScrollFactor('foregroundthoughts', -0.2, 0.9);

	addLuaSprite('foregroundthoughts', false);

	makeLuaSprite('groundthoughts', 'stages/thoughts/groundthoughts', -877, -115);
	setScrollFactor('groundthoughts', 0.9, 0.9);

	addLuaSprite('groundthoughts', false);

	makeLuaSprite('bushthoughts', 'stages/thoughts/bushthoughts', -677, -99);
	setScrollFactor('bushthoughts', 0.9, 0.9);
	scaleObject('bushthoughts', -0.8 -0.8)
	addLuaSprite('bushthoughts', false);

	makeAnimatedLuaSprite('pienaily', 'stages/thoughts/pienaily', -722, 45)
	addAnimationByPrefix('pienaily', 'idle', 'pienaily idle', 26, false)
	setLuaSpriteScrollFactor('pienaily', 0.9, 0.9)
	scaleObject('pienaily', 0.9, 0.9)
	addLuaSprite('pienaily', false)

	makeAnimatedLuaSprite('thoughtsurv', 'stages/thoughts/thoughtsurv', 221, 275)
	addAnimationByPrefix('thoughtsurv', 'idle', 'thoughtsurv idle', 29, false)
	setLuaSpriteScrollFactor('thoughtsurv', 0.9, 0.9)
	scaleObject('thoughtsurv', 0.4, 0.4)
	addLuaSprite('thoughtsurv', false)

	makeAnimatedLuaSprite('frontchar', 'stages/thoughts/frontchar', -845, -23)
	addAnimationByPrefix('frontchar', 'idle', 'frontchar idle', 26, false)
	setLuaSpriteScrollFactor('frontchar', 0.9, 0.9)
	scaleObject('frontchar', 1.0, 1.0)
	addLuaSprite('frontchar', true)

	makeAnimatedLuaSprite('pillowcake', 'stages/thoughts/pillowcake', -1067, -167)
	addAnimationByPrefix('pillowcake', 'idle', 'pillowcake idle', 26, false)
	setLuaSpriteScrollFactor('pillowcake', 0.9, 0.9)
	scaleObject('pillowcake', 1.1, 1.1)
	addLuaSprite('pillowcake', false)

	makeAnimatedLuaSprite('basketgrass', 'stages/thoughts/basketgrass', -942, 45)
	addAnimationByPrefix('basketgrass', 'idle', 'basketgrass idle', 26, false)
	setLuaSpriteScrollFactor('basketgrass', 0.9, 0.9)
	scaleObject('basketgrass', 0.9, 0.9)
	addLuaSprite('basketgrass', false)
end
function onBeatHit()
	playAnim('thoughtsurv', 'idle', true)
	playAnim('frontchar', 'idle', true)
	playAnim('pienaily', 'idle', true)
	playAnim('basketgrass', 'idle', true)
	playAnim('pillowcake', 'idle', true)
end