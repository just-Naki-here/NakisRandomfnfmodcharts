function onCreate()
    debugPrint("stagescript script is loaded")
end
local shakeAmount = 0
local shakeSpeed = 2.0
local axes = "X","Y"
local easythere = "backInOut"
local amountofcirc = 1
local cocaclowing = 0.2

function onCreatePost()

	theSpriteGroop = {}
	
theSpriteGroop[1] = 'halobits_1'
theSpriteGroop[2] = 'halobits_2'
theSpriteGroop[3] = 'halobits_3'
theSpriteGroop[4] = 'halocircle'

	otherspitegroup = {}
	
otherspitegroup[1] = '2ndhalobits_1'
otherspitegroup[2] = '2ndhalobits_2'
otherspitegroup[3] = '2ndhalobits_3'
otherspitegroup[4] = '2ndhalocircle'
	
	halowalo = {}

halowalo[1] = 'halobits_1'
halowalo[2] = 'halobits_2'
halowalo[3] = 'halobits_3'

	rainworguiElem = {}

rainworguiElem[1] = 'pipslot1'
rainworguiElem[2] = 'pipslot2'
rainworguiElem[3] = 'pipslot3'
rainworguiElem[4] = 'pipslot4'
rainworguiElem[5] = 'pipslot5'
rainworguiElem[6] = 'pipslot6'
rainworguiElem[7] = 'pipslot7'
rainworguiElem[8] = 'pipslot8'
rainworguiElem[9] = 'pipslot9'
rainworguiElem[10] = 'pipslot10'

rainworguiElem[11] = 'pip1'
rainworguiElem[12] = 'pip2'
rainworguiElem[13] = 'pip3'
rainworguiElem[14] = 'pip4'
rainworguiElem[15] = 'pip5'
rainworguiElem[16] = 'pip6'
rainworguiElem[17] = 'pip7'
rainworguiElem[18] = 'pip8'
rainworguiElem[19] = 'pip9'
rainworguiElem[20] = 'pip10'

rainworguiElem[21] = 'sick'
rainworguiElem[22] = 'great'
rainworguiElem[23] = 'good'
rainworguiElem[24] = 'bad'
rainworguiElem[25] = 'shit'
rainworguiElem[26] = 'trans'
rainworguiElem[27] = 'therates'




	makeLuaSprite('blackblackblackbar','', 0, -130) -- -30
    makeGraphic('blackblackblackbar', 2000, 100, '000000')--colors dont work????
    screenCenter('blackblackblackbar', 'X')
    setScrollFactor('blackblackblackbar', 0, 0)
    setObjectCamera('blackblackblackbar', 'hud')
    addLuaSprite('blackblackblackbar', false)
	setObjectOrder('blackblackblackbar',1)

    makeLuaSprite('barthingie','', 0, 750) -- 650
    makeGraphic('barthingie', 2000, 100, '000000')--colors dont work????
    setScrollFactor('barthingie', 0, 0)
    screenCenter('barthingie', 'X')
    setObjectCamera('barthingie', 'hud')
    addLuaSprite('barthingie', false)
	setObjectOrder('barthingie',1)
	
	makeLuaSprite('cocacola', 'halcyon/coca_cola1', -600, -700)
	addLuaSprite('cocacola',false)
	setProperty('cocacola.alpha',0)
	
	makeLuaSprite('glowcocacola', 'halcyon/coca_cola1', -600, -700)
	addLuaSprite('glowcocacola',false)
	setProperty('glowcocacola.alpha',0)
		if shadersEnabled  == true then
		setSpriteShader('glowcocacola', 'bloom')
		else
		setBlendMode('glowcocacola','add')
		end
	
	makeLuaSprite('glocatransition', 'halcyon/coca_cola1', -600, -700)
	addLuaSprite('glocatransition',false)
	setProperty('glocatransition.alpha',0)
		if shadersEnabled  == true then
		setSpriteShader('glocatransition', 'bloom')
		else
		setBlendMode('glocatransition','add')
		end
	
	makeLuaSprite('blackoutpang', '', 0, 0)
	makeGraphic('blackoutpang',3500,1500,'000000')
    setObjectCamera('blackoutpang', 'other')
	setProperty('blackoutpang.alpha',0)
	addLuaSprite('blackoutpang',false)
	
	makeLuaSprite('lildarkmate', '', -500, -500)
	makeGraphic('lildarkmate',3500,1500,'000000')
	setProperty('lildarkmate.alpha',0)
	addLuaSprite('lildarkmate',false)
	setObjectOrder('lildarkmate', getObjectOrder('2ndhalocircle')-4)
	
	makeLuaSprite('redthrob', '', 0, 0)
	makeGraphic('redthrob',3500,1500,'a83232')
    setObjectCamera('redthrob', 'hud')
	addLuaSprite('redthrob',false)
	setBlendMode('redthrob','multiply')
	setProperty('redthrob.alpha',0)
	
	makeLuaSprite('whiteoutpang', '', 0, 0)
	makeGraphic('whiteoutpang',3500,1500,'FFFFFF')
    setObjectCamera('whiteoutpang', 'other')
	setProperty('whiteoutpang.alpha',0)
	addLuaSprite('whiteoutpang',false)
	
	makeLuaSprite('pang','halcyon/pang', 0 , 0)
	setObjectCamera('pang','other')
	addLuaSprite('pang',false)
	setProperty('pang.alpha', 0)
	setBlendMode('pang','add')
	
	makeLuaSprite('halcpearl','halcyon/pearl/halcpearl', 1020 , 40)
	addLuaSprite('halcpearl',false)
	setObjectOrder('halcpearl', getObjectOrder('2ndhalocircle')-1)
	
	makeAnimatedLuaSprite('texttoscream','halcyon/texttoscream', 520, -60)
		addAnimationByPrefix('texttoscream','texttoscream','texttoscream',10,false);
		playAnim('texttoscream','texttoscream',true);
	addLuaSprite('texttoscream',false)
	setProperty('texttoscream.antialiasing', false)
	setProperty('texttoscream.alpha', 0)
		if shadersEnabled  == true then
		setSpriteShader('texttoscream','bloom')
		end
	
	setObjectOrder('texttoscream', getObjectOrder('2ndhalocircle')-4)
	
	makeAnimatedLuaSprite('reindeer','halcyon/reindeer', 1245, -30)
		addAnimationByPrefix('reindeer','reindeer','reindeer',4,true);
		playAnim('reindeer','reindeer',true);
	addLuaSprite('reindeer',false)
	setProperty('reindeer.antialiasing', false)
	setProperty('reindeer.alpha', 0)
	if shadersEnabled  == true then
		setSpriteShader('reindeer','bloom')
		end
	setObjectOrder('reindeer', getObjectOrder('2ndhalocircle')-4)
	
	makeAnimatedLuaSprite('criesofscug','halcyon/criesofscug', -170, -360)
		addAnimationByPrefix('criesofscug','scugdies1','scugdies1',4,true);
		addAnimationByPrefix('criesofscug','scugdies2','scugdies2',4,true);
		addAnimationByPrefix('criesofscug','scugdies3','scugdies3',4,true);
		addAnimationByPrefix('criesofscug','scugX','scugX',4,true);
		playAnim('criesofscug','scugdies1',true)
	addLuaSprite('criesofscug',false)
	setProperty('criesofscug.antialiasing', false)
	setProperty('criesofscug.alpha', 0)
	if shadersEnabled  == true then
	setSpriteShader('criesofscug','bloom')
	end
	setObjectOrder('criesofscug', getObjectOrder('2ndhalocircle')-4)
	
	makeAnimatedLuaSprite('wetvoid','halcyon/wetvoid', -255, -130)
		addAnimationByPrefix('wetvoid','wetvoid','wetvoid',4,true);
		playAnim('wetvoid','wetvoid',true);
	addLuaSprite('wetvoid',false)
	setProperty('wetvoid.antialiasing', false)
	setProperty('wetvoid.alpha', 0)
	if shadersEnabled  == true then
	setSpriteShader('wetvoid','bloom')
	end
	setObjectOrder('wetvoid', getObjectOrder('2ndhalocircle')-4)
	
	for i = 0,getProperty('strumLineNotes.length')-1 do
		setPropertyFromGroup('strumLineNotes', i, 'scrollFactor.x', 1)
		setPropertyFromGroup('strumLineNotes', i, 'scrollFactor.y', 1)
	end

	setProperty('iconP1.scrollFactor.x', 1)
	setProperty('iconP1.scrollFactor.y', 1)
	setProperty('iconP2.scrollFactor.x', 1)
	setProperty('iconP2.scrollFactor.y', 1)
	setProperty('healthBar.scrollFactor.x', 1)
	setProperty('healthBar.scrollFactor.y', 1)
	setProperty('healthBarBG.scrollFactor.x', 1)
	setProperty('healthBarBG.scrollFactor.y', 1)

	setProperty('timeBar.scrollFactor.x', 1)
	setProperty('timeBar.scrollFactor.y', 1)
	setProperty('timeBarBG.scrollFactor.x', 1)
	setProperty('timeBarBG.scrollFactor.y', 1)
	setProperty('timeTxt.scrollFactor.x', 1)
	setProperty('timeTxt.scrollFactor.y', 1)

	setProperty('scoreTxt.scrollFactor.x', 1)
	setProperty('scoreTxt.scrollFactor.y', 1)

	setProperty('botplayTxt.scrollFactor.x', 1)
	setProperty('botplayTxt.scrollFactor.y', 1)
	
	runTimer('halobits_1move',0.1)
	runTimer('halobits_2move',0.1)
	runTimer('halobits_3move',0.1)
	
	for i = 1,4 do
		setProperty(otherspitegroup[i] .. '.visible', false)
	end
end
stepHitFuncs = {
	
	[16] = function()
		haloScale(0.901)
		
	end,
	
	[400] = function()
		haloScale(1)
	end,
	
	[528] = function()
		haloScale(0.8)
	end,
	
	[784] = function()
		haloScale(1)
	end,
	
	[1040] = function()
		playAnim('scugdetect','scugremove',true);
		haloScale(0.8)
		easythere = "elasticInOut"
	end,
	
	[1232] = function()
		setProperty('scugdetect.alpha', 0)
	end,
	[1296] = function()
		setProperty('microphone.alpha', 0.7)
		playAnim('microphone','micdetect',true);
		haloScale(1)
		easythere = "backInOut"
	end,
	[1320] = function()
		playAnim('strangescribbles','pissed',true);
	end,
	[1328] = function()
		setProperty('strangescribbles.alpha', 0.7)
	end,
	[1356] = function()
		setProperty('iteratorstructure.alpha', 0.7)
		playAnim('iteratorstructure','tbh',true);
	end,
	[1392] = function()
		setProperty('bfwikipedia.alpha', 0.7)
		playAnim('bfwikipedia','tbh lore',true);
	end,
	[1552] = function()
	haloScale(0.8)
	easythere = "elasticInOut"
	end,
	[1792] = function()
		noteTweenAlpha('0gone', 0, 0.2, 0.5, 'linear')
		noteTweenAlpha('1gone', 1, 0.2, 0.5, 'linear')
		noteTweenAlpha('2gone', 2, 0.2, 0.5, 'linear')
		noteTweenAlpha('3gone', 3, 0.2, 0.5, 'linear')
	end,
	[1798] = function()
		doTweenAlpha('hesangry','AI',0, 0.4,'circIn')
		doTweenAlpha('1hesangry','1AI',0, 0.4,'circIn')
	end,
	[1800] = function()
		doTweenX('movethestupidcamerax', 'camFollow', 500, 0.2, 'backOut');
		setProperty('isCameraOnForcedPos', true)
		setProperty('defaultCamZoom', 0.75)
		doTweenY('barboom', 'barthingie', 650, 1.5, 'elasticOut')
		doTweenY('baboom', 'blackblackblackbar', -30, 1.5, 'elasticOut')
		setProperty('bfwikipedia.alpha', 0)
		setProperty('iteratorstructure.alpha', 0)
	end,
	[1804] = function()
		triggerEvent('Camera Follow Pos', 775, 350)
		setProperty('microphone.alpha', 0)
		setProperty('strangescribbles.alpha', 0)
	end,
	[1806] = function()
	setProperty('blackoutpang.alpha',1)
	end,
	[1808] = function()
	setProperty('boyfriend.alpha',0)
	triggerEvent('Camera Follow Pos', 775, 320)
	setProperty('defaultCamZoom', 0.7)
	setProperty('pebblehalo.visible',false)
	doTweenAlpha('fadestouhhh','blackoutpang', 0, 4,'circOut')
	setProperty('cocacola.alpha',1)
	shakeAmount = 5
	pulsate = true
	berbeat = 4
	dweenduration = 2
	glowhaloScale(0.7)
	for i = 1,4 do
		setProperty(otherspitegroup[i] .. '.visible', true)
		end
	end,
	
	[2064] = function()
	glowhaloScale(0.6)
	doTweenAlpha('lildarkmatehuh','lildarkmate',0.4,0.5,"circOut")
	end,
	
	[2080] = function()
	setProperty('lildarkmate.alpha',0)
	setProperty('defaultCamZoom', 0.65)
	berbeat = 2
	dweenduration = 1
	shakeAmount = 8
	triggerEvent('Screen Shake','40.7, 0.002','')
	boomdramatic = true
	howdramatictho = 0.01
	glowhaloScale(0.9)
	circlestuff = 4
	shoulddocircle = true
	setProperty('glocatransition.alpha', 0.33)
	doTweenAlpha('glocatransition1','glocatransition',0,4,'linear')
	end,
	
	[2208] = function()
	berbeat = 2
	dweenduration = 1
	howdramatictho = 0.03
	playAnim('texttoscream','texttoscream',true);
	if shadersEnabled  == true then
			setProperty('texttoscream.alpha',0.3)
			else
			setProperty('texttoscream.alpha',0.9)
			end
	glowhaloScale(1)
	circlestuff = 2
	setProperty('glocatransition.alpha', 0.38)
	doTweenAlpha('glocatransition1','glocatransition',0,4,'linear')
	end,
	
	[2332] = function()
	setProperty('texttoscream.alpha',0)
	end,
	
	[2336] = function()
	if shadersEnabled  == true then
			doTweenAlpha('lemotifreference','reindeer',0.3,0.5,'backOut')
			else
			doTweenAlpha('lemotifreference','reindeer',0.9,0.5,'backOut')
			end
	playAnim('reindeer','reindeer',true);
	berBeat = 4
	dweenduration = 0.3
	howdramatictho = 0.05
	glowhaloScale(0.8)
	end,
	
	[2400] = function()
		if shadersEnabled  == true then
			doTweenAlpha('wetvoid','wetvoid',0.3,0.5,'backOut')
			else
			doTweenAlpha('wetvoid','wetvoid',0.9,0.5,'backOut')
			end
	playAnim('wetvoid','wetvoid',true);
	glowhaloScale(0.9)
	end,
	
	[2464] = function()
	glowhaloScale(0.8)
	end,
	
	
	[2560] = function()
	berbeat = 4
	dweenduration = 2
	setProperty('wetvoid.alpha',0)
	setProperty('reindeer.alpha',0)
	end,
	
	[2576] = function()
	setProperty('criesofscug.alpha',0.3)
	playAnim('criesofscug','scugdies1',true)
	setProperty('defaultCamZoom', 0.67)
	cocaclowing = 0.25
	shoulddocircle = false
	end,
	
	[2592] = function()
	berbeat = 2
	dweenduration = 1
	glowhaloScale(0.9)
	setProperty('criesofscug.alpha',0.6)
	playAnim('criesofscug','scugdies2',true)
	setProperty('defaultCamZoom', 0.62)
	cocaclowing = 0.3
	end,
	
	[2608] = function()
	berBeat = 1
	dweenduration = 0.3
	glowhaloScale(1)
	setProperty('criesofscug.alpha',0.9)
	playAnim('criesofscug','scugdies3',true)
	setProperty('defaultCamZoom', 0.58)
	cocaclowing = 0.35
	end,
	
	[2622] = function()
	playAnim('criesofscug','scugX',true)
	setProperty('criesofscug.x', getProperty('criesofscug.x') - 5)
	triggerEvent('Add Camera Zoom', '0.045', '0.03')
	for i = 1,4 do
		doTweenAlpha(otherspitegroup[i] .. 'fadedade',otherspitegroup[i], 0.01, 0.5)
		end
	for i = 1,27 do
		doTweenAlpha(rainworguiElem[i] .. 'visible',rainworguiElem[i], 0,0.2,'circOut')
		end
		noteTweenAlpha('0gone', 0, 0, 0.7, 'linear')
		noteTweenAlpha('1gone', 1, 0, 0.6, 'linear')
		noteTweenAlpha('2gone', 2, 0, 0.5, 'linear')
		noteTweenAlpha('3gone', 3, 0, 0.4, 'linear')
		noteTweenAlpha('4gone', 4, 0, 0.4, 'linear')
		noteTweenAlpha('5gone', 5, 0, 0.5, 'linear')
		noteTweenAlpha('6gone', 6, 0, 0.6, 'linear')
		noteTweenAlpha('7gone', 7, 0, 0.7, 'linear')
	end,
	
	[2624] = function()
	glowhaloScale(0.7)
	doTweenAlpha('uhohhesgonnakillyou','pang', 1, 0.6, 'circIn')
	doTweenAlpha('glowbump','glowcocacola',0.4,0.6,'linear')
	doTweenY('barboom', 'barthingie', 620, 1.5, 'sineIn')
	doTweenY('baboom', 'blackblackblackbar', 0, 1.5, 'sineIn')
	boomdramatic = false
	berBeat = 10
	dweenduration = 0.1
	glowhaloScale(0.7)
	cocaclowing = 0
	end,
	
	[2632] = function()
		setProperty('whiteoutpang.alpha',1)
		setProperty('blackoutpang.alpha',1)
		doTweenAlpha('fadestoblack','whiteoutpang', 0, 9,'circOut')
		setProperty('pang.visible', false)
	end,
	
}

function onStepHit()
    if stepHitFuncs[curStep] then 
        stepHitFuncs[curStep]() 
    end 
end

function onTweenCompleted(tag)
	for i = 1,27 do
		if tag == rainworguiElem[i] .. 'visible' then
			setProperty(rainworguiElem[i] .. '.visible', false)
		end
	end
end


function onUpdate()
	if pulsate == true then
		if curBeat % berbeat == 0 then
		if shadersEnabled  == true then
			setProperty('glowcocacola.alpha',cocaclowing)
			else
			setProperty('glowcocacola.alpha',cocaclowing * 10)
			end
		
			doTweenAlpha('glowbump','glowcocacola',0,dweenduration,'linear')
			setProperty('redthrob.alpha',0.2)
			doTweenAlpha('redglowbop','redthrob', 0, 1, "linear")
		end
	end
end

function onSpawnNote(i)
	setPropertyFromGroup('notes', i, 'scrollFactor.x', 1)
	setPropertyFromGroup('notes', i, 'scrollFactor.y', 1)
end

local shakeXIntensity = 0
local shakeYIntensity = 0
function opponentNoteHit(i, d, t, isSustainNote)
	local value = shakeAmount * (isSustainNote and 0.65 or 1.0)

	shakeXIntensity = (axes == "X" or axes == "XY") and value or shakeXIntensity
	shakeYIntensity = (axes == "Y" or axes == "XY") and value or shakeYIntensity
end

local time = 0
function onUpdatePost(elapsed)
	time = time + elapsed
	setProperty('camGame.targetOffset.x', math.sin(time * 225.0) * shakeXIntensity)
	setProperty('camHUD.scroll.x', math.cos(time * 225.0) * -shakeXIntensity)
	setProperty('camGame.targetOffset.y', math.cos(time * 225.0) * -shakeYIntensity)
	setProperty('camHUD.scroll.y', math.sin(time * 225.0) * shakeYIntensity)

	shakeXIntensity = math.max(shakeXIntensity - shakeSpeed, 0.0)
	shakeYIntensity = math.max(shakeYIntensity - shakeSpeed, 0.0)
	
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/200)
	doTweenY('pearlfloat1y', 'halcpearl', 200-20*math.sin((currentBeat*0.55)*math.pi),0.001)
end

function haloScale(amount)
	for i = 1,4 do
		doTweenX(theSpriteGroop[i] .. 'growX',theSpriteGroop[i] .. '.scale', amount , 1, 'circOut')
		doTweenY(theSpriteGroop[i] .. 'growY',theSpriteGroop[i] .. '.scale', amount , 1, 'circOut')
	end
end

function glowhaloScale(amount)
	for i = 1,4 do
		doTweenX(otherspitegroup[i] .. 'growX',otherspitegroup[i] .. '.scale', amount , 1, 'circOut')
		doTweenY(otherspitegroup[i] .. 'growY',otherspitegroup[i] .. '.scale', amount , 1, 'circOut')
	end
end

function onTimerCompleted(tag)
	for i = 1,3 do
		if tag == halowalo[i] .. 'move' then
			doTweenAngle(halowalo[i] .. 'movieng', halowalo[i] ,math.random(-100,100) ,math.random(2,5), easythere)
			runTimer(halowalo[i] .. 'move',4)
		end
	end
end

function onBeatHit()
	if shoulddocircle == true then
		if curBeat % circlestuff == 0 then
			whatthing = getRandomInt(1,3)
			makeAnimatedLuaSprite('justcircles' .. amountofcirc, 'halcyon/justcircle', getRandomInt(350,950), getRandomInt(-40,400))
				addAnimationByPrefix('justcircles' .. amountofcirc,'justcircles' .. whatthing,'justcircles' .. whatthing,24,true);
				playAnim('justcircles' .. amountofcirc,'justcircles' .. whatthing,true);
			addLuaSprite('justcircles' .. amountofcirc,false)
			setProperty('justcircles' .. amountofcirc .. '.scale.x', 0.8)
			setProperty('justcircles' .. amountofcirc .. '.scale.y', 0.8)
			doTweenX('justcircles' .. amountofcirc .. 'scalex', 'justcircles' .. amountofcirc .. '.scale', 1, 0.3, 'backOut')
			doTweenY('justcircles' .. amountofcirc .. 'scaley', 'justcircles' .. amountofcirc .. '.scale', 1, 0.3, 'backOut')
			setObjectOrder('justcircles' .. amountofcirc, getObjectOrder('2ndhalocircle')-4)
			if shadersEnabled  == true then
			setSpriteShader('justcircles' .. amountofcirc, 'bloom')
			setProperty('justcircles' .. amountofcirc .. '.alpha', 0.1)
			else
			setProperty('justcircles' .. amountofcirc .. '.alpha', 1)
			end
			doTweenAlpha('justcircles' .. amountofcirc .. "byebye", 'justcircles' .. amountofcirc, 0, 2, 'circIn')
			amountofcirc = amountofcirc + 1
		end
	end
	if boomdramatic == true then
		triggerEvent('Add Camera Zoom', '0.015', howdramatictho)
	end
end