function onCreate()
	makeLuaSprite('bg', 'hous/lobotomy/bg', -1500, -1500);
	setScrollFactor('bg', 0.5, 0.5);
	
	makeLuaSprite('gr', 'hous/lobotomy/gd ground', -1500, -320);
	scaleObject('gr', 2.5, 2.5)

	makeLuaSprite('thing', 'hous/lobotomy/thingamabobber', -20, -1500);
	setScrollFactor('thing', 1, 1);
	scaleObject('thing', 1.5, 1.5)
	setProperty('thing.alpha', 0)

	addLuaSprite('bg', false);
	addLuaSprite('gr', false);
	addLuaSprite('thing', true);
end
function onUpdate()
	if songName == 'the-best-song-ever' then
		setProperty('dad.alpha', 0)
		setProperty('gf.alpha', 0)
	end
end