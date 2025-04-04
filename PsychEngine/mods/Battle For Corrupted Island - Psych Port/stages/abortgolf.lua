
function onCreate()
	-- background shit
	makeLuaSprite('b', 'characters/blackscreen', 0, 0);
	setScrollFactor('b', 0.9, 0.9);
	addLuaSprite('b', false);
	setObjectCamera('b', 'hud')

	makeLuaSprite('abort', 'stages/abort/abort', -899, 334);
	setScrollFactor('abort', 0.9, 0.9);
	scaleObject('abort', 1.2, 1.2)
	addLuaSprite('abort', false);
	setObjectOrder('abort', 0)


	makeLuaSprite('basketdark', 'stages/abort/basketdark', 57, 555);
	setScrollFactor('basketdark', 0.9, 0.9);
	scaleObject('basketdark', 0.9, 0.9)
	addLuaSprite('basketdark', false);
	setObjectOrder('basketdark', 1)

	setObjectOrder('dadGroup', 2)

	makeAnimatedLuaSprite('basketglitch', 'stages/abort/basketglitch', 57, 555)
	addAnimationByPrefix('basketglitch', 'bop', 'basketglitch idle', 26, true)
	setLuaSpriteScrollFactor('basketglitch', 0.9, 0.9)
	scaleObject('basketglitch', 0.9, 0.9)
	addLuaSprite('basketglitch', true)
	setObjectOrder('basketglitch', 3)

	makeAnimatedLuaSprite('announcerded', 'stages/abort/announcerded', -900, 788)
	addAnimationByPrefix('announcerded', 'idle', 'idle', 20, false)
	setLuaSpriteScrollFactor('announcerded', 0.9, 0.9)
	scaleObject('announcerded', -0.9, 0.9)
	addLuaSprite('announcerded', false)
	setObjectOrder('announcerded', 6)

	makeAnimatedLuaSprite('mmr', 'stages/abort/MutralMindReaderABORTED', 90, 2)
	addAnimationByPrefix('mmr', 'idle', 'mmr', 20, true)
	setLuaSpriteScrollFactor('mmr', 0.9, 0.9)
	playAnim('mmr', 'idle', true)
	scaleObject('mmr', 1.1, 1.1)
	addLuaSprite('mmr', true)
	setObjectOrder('flowerabort', 8)

	addLuaSprite('flowerabort', true)
	setObjectOrder('flowerabort', 7)
end
function onBeatHit()
	playAnim('announcerded', 'idle', true)
end
function onStepHit()
	if curStep == 1 then
        doTweenAlpha("fade", "b", 0, 10, "linear")
	end
	if curStep == 1024 then
        setProeprty('basketglitch.alpha', 0)
		setProperty('announcerded.color', '000000')
		setProperty('flowerabort.color', '000000')
	end
	if curStep == 1223 then
        setProeprty('basketglitch.alpha', 1)
		setProperty('announcerded.color', getColorFromHex('FFFFFF'))
		setProperty('flowerabort.color', getColorFromHex('FFFFFF'))
	end
	if curStep == 1619 then
        addLuaScript('scripts_unloaded/abortvideo', true)
	end
end