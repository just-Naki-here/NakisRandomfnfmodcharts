local ndhowmanythinks = 1
local erdhowmanythinks = 1

function onCreatePost()

	halowalo = {}

halowalo[1] = 'halobits_1'
halowalo[2] = 'halobits_2'
halowalo[3] = 'halobits_3'

	spriteGroupin = {}
	
spriteGroupin[1] = '2ndhalobits_1'
spriteGroupin[2] = '2ndhalobits_2'
spriteGroupin[3] = '2ndhalobits_3'
spriteGroupin[4] = '2ndhalocircle'
	
	makeLuaSprite('2ndhalocircle','halcyon/halocircle', 500, -10)
	scaleObject('2ndhalocircle',0.8,0.8)
	addLuaSprite('2ndhalocircle',true)
	
	makeLuaSprite('2ndhalobits_1','halcyon/halobits_1', getProperty('2ndhalocircle.x'), getProperty('2ndhalocircle.y'))
	scaleObject('2ndhalobits_1',0.8,0.8)
	addLuaSprite('2ndhalobits_1',true)
	
	makeAnimatedLuaSprite('2ndhalobits_2','halcyon/halobits_2', getProperty('2ndhalocircle.x') - 1, getProperty('2ndhalocircle.y'))
		addAnimationByPrefix('2ndhalobits_2','2ndmovermover','halobits 3',24,true);
		objectPlayAnimation('2ndhalobits_2','2ndmovermover',true);
	addLuaSprite('2ndhalobits_2',false)
	scaleObject('2ndhalobits_2',0.8,0.8)
	
	makeAnimatedLuaSprite('2ndhalobits_3','halcyon/halobits_3', getProperty('2ndhalocircle.x') - 1, getProperty('2ndhalocircle.y'))
		addAnimationByPrefix('2ndhalobits_3','2ndmovermovermova','halobits2',24,true);
		objectPlayAnimation('2ndhalobits_3','2ndmovermovermova',true);
	addLuaSprite('2ndhalobits_3',false)
	scaleObject('2ndhalobits_3',0.8,0.8)
		for i = 1,4 do
			setSpriteShader(spriteGroupin[i], 'bloom')
			setObjectOrder(spriteGroupin[i], getObjectOrder('dad')+18)
			doTweenColor(spriteGroupin[i] .. 'colorin',spriteGroupin[i], 'ff9633', 0.1)
		end
		
	runTimer('halobits_1secondmove',0.1)
	runTimer('halobits_2secondmove',0.1)
	runTimer('halobits_3secondmove',0.1)
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
		if curStep >= 1808 then
	makeLuaSprite('2ndamethinksa' .. ndhowmanythinks, 'halcyon/thinks/thinks' .. getRandomInt(1,5), getProperty('2ndhalocircle.x') + 355, getProperty('2ndhalocircle.y') + 350)
	addLuaSprite('2ndamethinksa' .. ndhowmanythinks,false)
	setObjectOrder('2ndamethinksa' .. ndhowmanythinks, getObjectOrder('2ndhalocircle')-4)
	setProperty('2ndamethinksa' .. ndhowmanythinks .. '.angle', math.random(-270,270))
	setProperty('2ndaamethinksa' .. ndhowmanythinks .. '.flipX', flipped)
	setProperty('2ndamethinksa' .. ndhowmanythinks .. '.alpha', 0.9)
	setProperty('2ndamethinksa' .. ndhowmanythinks .. '.origin.y', -100)
	setProperty('2ndamethinksa' .. ndhowmanythinks .. '.origin.x', -100)
	setSpriteShader('2ndamethinksa' .. ndhowmanythinks, 'bloom')
	doTweenAlpha('2ndamethinksa' .. ndhowmanythinks .. 'baibai', '2ndamethinksa' .. ndhowmanythinks, 0, 0.4)
	doTweenColor('2ndamethinksa' .. ndhowmanythinks ..'colorin','2ndamethinksa' .. ndhowmanythinks, 'ff9633', 0.1)
	ndhowmanythinks = ndhowmanythinks + 1
		end
		if curStep >= 2080 then
	makeLuaSprite('erdamethinksa' .. erdhowmanythinks, 'halcyon/thinks/thinks' .. getRandomInt(1,5), getProperty('2ndhalocircle.x') + 355, getProperty('2ndhalocircle.y') + 350)
	addLuaSprite('erdamethinksa' .. erdhowmanythinks,false)
	setObjectOrder('erdamethinksa' .. erdhowmanythinks, getObjectOrder('2ndhalocircle')-4)
	setProperty('erdamethinksa' .. erdhowmanythinks .. '.angle', math.random(-270,270))
	setProperty('erdamethinksa' .. erdhowmanythinks .. '.flipX', flipped)
	setProperty('erdamethinksa' .. erdhowmanythinks .. '.alpha', 0.9)
	setProperty('erdamethinksa' .. erdhowmanythinks .. '.origin.y', -100)
	setProperty('erdamethinksa' .. erdhowmanythinks .. '.origin.x', -100)
	setSpriteShader('erdamethinksa' .. erdhowmanythinks, 'bloom')
	doTweenAlpha('erdamethinksa' .. erdhowmanythinks .. 'baibai', 'erdamethinksa' .. erdhowmanythinks, 0, 0.4)
	doTweenColor('erdamethinksa' .. erdhowmanythinks ..'colorin','erdamethinksa' .. erdhowmanythinks, 'ff9633', 0.1)
	erdhowmanythinks = erdhowmanythinks + 1
		end
	end
end

function onTimerCompleted(tag)
	for i = 1,3 do
		if tag == halowalo[i] .. 'secondmove' then
			doTweenAngle(halowalo[i] .. 'secondmovieng', '2nd' .. halowalo[i] ,math.random(-100,100) ,math.random(0.5,2), "elasticInOut")
			runTimer(halowalo[i] .. 'secondmove',1)
		end
	end
end

function onTweenCompleted(tag)
	if tag == 'erdamethinksa' .. erdhowmanythinks .. 'baibai' then 
		removeLuaSprite('erdamethinksa' .. erdhowmanythinks, true)
	end
end