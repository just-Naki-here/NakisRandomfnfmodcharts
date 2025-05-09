function onCreate()
    debugPrint("halo script is loaded")
end
local howmanythinks = 1

function onCreatePost()

	halowalo = {}

halowalo[1] = 'halobits_1'
halowalo[2] = 'halobits_2'
halowalo[3] = 'halobits_3'

	exesnwhys = {}

exesnwhys[1] = 0
exesnwhys[2] = 1
exesnwhys[3] = 1

	spriteGroupin = {}
	
spriteGroupin[1] = 'halobits_1'
spriteGroupin[2] = 'halobits_2'
spriteGroupin[3] = 'halobits_3'
spriteGroupin[4] = 'halocircle'

	ismethinks = {}
	
ismethinks[1] = 'thinks1'
ismethinks[2] = 'thinks2'
ismethinks[3] = 'thinks3'
ismethinks[4] = 'thinks4'
ismethinks[5] = 'thinks5'
	
	makeLuaSprite('halocircle','halcyon/halocircle', 520, -20)
	scaleObject('halocircle',0.8,0.8)
	addLuaSprite('halocircle',true)
	
	makeLuaSprite('halobits_1','halcyon/halobits_1', getProperty('halocircle.x'), getProperty('halocircle.y'))
	scaleObject('halobits_1',0.8,0.8)
	addLuaSprite('halobits_1',true)
	
	makeAnimatedLuaSprite('halobits_2','halcyon/halobits_2', getProperty('halocircle.x') - 1, getProperty('halocircle.y'))
		addAnimationByPrefix('halobits_2','movermover','halobits 3',24,true);
		playAnim('halobits_2','movermover',true);
	addLuaSprite('halobits_2',false)
	scaleObject('halobits_2',0.8,0.8)
	
	makeAnimatedLuaSprite('halobits_3','halcyon/halobits_3', getProperty('halocircle.x') - 1, getProperty('halocircle.y'))
		addAnimationByPrefix('halobits_3','movermovermova','halobits2',24,true);
		playAnim('halobits_3','movermovermova',true);
	addLuaSprite('halobits_3',false)
	scaleObject('halobits_3',0.8,0.8)
		for i = 1,4 do
			if shadersEnabled  == true then
			setProperty(spriteGroupin[i] .. '.alpha', 0.04)
			setSpriteShader(spriteGroupin[i], 'bloom')
			else
			setProperty(spriteGroupin[i] .. '.alpha', 0.5)
			end
			setObjectOrder(spriteGroupin[i], 1)
		end
end


function onUpdate()
	if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
		setProperty('halocircle.x', 490)
		setProperty('halocircle.y', -40)
	elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
		setProperty('halocircle.x', 630)
		setProperty('halocircle.y', 130)
	elseif getProperty('dad.animation.curAnim.name') == 'singUP' then
		setProperty('halocircle.x', 525)
		setProperty('halocircle.y', -80)
	elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
		setProperty('halocircle.x', 640)
		setProperty('halocircle.y', -20)
	elseif getProperty('dad.animation.curAnim.name') == 'idle' then
		setProperty('halocircle.x', 525)
		setProperty('halocircle.y', -60)
	end
	
	for i = 1,3 do
		setProperty(halowalo[i] .. '.x', getProperty('halocircle.x') - exesnwhys[i])
		setProperty(halowalo[i] .. '.y', getProperty('halocircle.y'))
	end
	for i = 1,5 do
		setProperty('me' .. ismethinks[i] .. '.x', getProperty('halocircle.x') + 355)
		setProperty('me' .. ismethinks[i] .. '.y', getProperty('halocircle.y') + 350)
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
	makeLuaSprite('amethinksa' .. howmanythinks, 'halcyon/thinks/thinks' .. getRandomInt(1,5), getProperty('halocircle.x') + 355, getProperty('halocircle.y') + 350)
	addLuaSprite('amethinksa' .. howmanythinks,false)
	setObjectOrder('amethinksa' .. howmanythinks, 3)
	setProperty('amethinksa' .. howmanythinks .. '.angle', math.random(-270,270))
	setProperty('aamethinksa' .. howmanythinks .. '.flipX', flipped)
	setProperty('amethinksa' .. howmanythinks .. '.alpha', 0.9)
	setProperty('amethinksa' .. howmanythinks .. '.origin.y', -100)
	setProperty('amethinksa' .. howmanythinks .. '.origin.x', -100)
	doTweenAlpha('amethinksa' .. howmanythinks .. 'baibai', 'amethinksa' .. howmanythinks, 0, 0.4)
	howmanythinks = howmanythinks + 1
	end
end

function onTweenCompleted(tag)
	if tag == 'amethinksa' .. howmanythinks .. 'baibai' then 
		removeLuaSprite('amethinksa' .. howmanythinks, true)
	end
end