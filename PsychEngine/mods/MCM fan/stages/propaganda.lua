local ofs = 15
local lockcam = true
local del = 0
local del2 = 0
t = 0
function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-spongebobcage-dead');
    
	
	makeLuaSprite('showroom', 'background/propaganda/propaganda', -1200,-400)
	addLuaSprite('showroom', false)
	scaleObject('showroom', 1, 1)
	
    makeAnimatedLuaSprite("ford", "background/propaganda/Ford1", 400, 0)
    addAnimationByPrefix("ford", "Ford1", "Ford1", 24, false)
    addLuaSprite("ford", false)
	
	makeAnimatedLuaSprite("Bubble", "background/propaganda/bubblesidle", 1300, 190)
    addAnimationByPrefix("Bubble", "Bubble", "BGBubbles", 24, false)
    addLuaSprite("Bubble", false)
    
    makeAnimatedLuaSprite("butter", "background/propaganda/buttercup", 850, 190)
    addAnimationByPrefix("butter", "butter", "BGButtercup", 24, false)
    addLuaSprite("butter", false)
	
	makeAnimatedLuaSprite("escena", "background/propaganda/intro1", 0, 0)
	addAnimationByPrefix("escena", "lol", "scene", 10, false)
	setObjectCamera('escena', 'other')
	setGraphicSize('escena', 1280, 720)
	setProperty('escena.visible', false)
	addLuaSprite("escena", false)
	
	makeAnimatedLuaSprite("escena2", "background/propaganda/intro2", 0, 0)
	addAnimationByPrefix("escena2", "lol2", "scene2", 11, false)
	setObjectCamera('escena2', 'other')
	setGraphicSize('escena2', 1280, 720)
	setProperty('escena2.visible', false)
	addLuaSprite("escena2", false)
	
	makeAnimatedLuaSprite("escena3", "background/propaganda/intro3", 0, 0)
	addAnimationByPrefix("escena3", "lol3", "scene3", 11, false)
	setObjectCamera('escena3', 'other')
	setGraphicSize('escena3', 1280, 720)
	setProperty('escena3.visible', false)
	addLuaSprite("escena3", false)
	
	makeAnimatedLuaSprite("escena4", "background/propaganda/final1", 0, 0)
	addAnimationByPrefix("escena4", "lol4", "scene4", 11, false)
	setObjectCamera('escena4', 'hud')
	setGraphicSize('escena4', 1280, 720)
	setProperty('escena4.visible', false)
	addLuaSprite("escena4", false)
	
	makeAnimatedLuaSprite("escena5", "background/propaganda/final2", 0, 0)
	addAnimationByPrefix("escena5", "lol5", "scene5", 15, false)
	setObjectCamera('escena5', 'hud')
	setGraphicSize('escena5', 1280, 720)
	setProperty('escena5.visible', false)
	addLuaSprite("escena5", false)
	
	makeLuaSprite('fondo','', 0, 0)
	makeGraphic('fondo', 1280, 720, '000000')
	setObjectCamera('fondo', 'hud');
	addLuaSprite('fondo',false)
	
	--makeAnimatedLuaSprite("escena6", "background/propaganda/final3", 0, 0)
	--addAnimationByPrefix("escena6", "lol6", "scene6", 11, true)
	--setObjectCamera('escena6', 'other')
	--setGraphicSize('escena6', 1280, 720)
	--setProperty('escena6.visible', false)
	--addLuaSprite("escena6", false)
	makeLuaSprite('b', 'b', -250, -290)
addLuaSprite('b', true)
scaleObject('b', 0.2, 1)
setScrollFactor('b', 1, 1)
setObjectCamera('b', 'other')

makeLuaSprite('b1', 'b', 1100, -160)
addLuaSprite('b1', false)
scaleObject('b1', 0.2, 1)
setScrollFactor('b1', 1, 1)
setObjectCamera('b1', 'other')

if version >= '1' then
t = 4
end
end

i = -275
ii = 225
r = 0

function onUpdate(elapsed)

	songPos = getSongPosition()
	local currentBeat = (songPos/1000)
	doTweenY('1', 'Bubble', 180 - 150*math.sin((currentBeat+2*0.1)*math.pi), 2)
	doTweenY('2', 'butter', 190 - 150*math.sin((currentBeat+4*0.1)*math.pi), 1.7)
	doTweenY('3', 'gf', 0 - 150*math.sin((currentBeat+8*0.1)*math.pi), 1.5)
	
end

function onCountdownStarted()
    setPropertyFromGroup('opponentStrums', 0, 'x', 414+i);
	setPropertyFromGroup('opponentStrums', 1, 'x', 527+i);
	setPropertyFromGroup('opponentStrums', 2, 'x', 637+i);
	setPropertyFromGroup('opponentStrums', 3, 'x', 750+i);

	setPropertyFromGroup('playerStrums', 0, 'x', 414+ii);
	setPropertyFromGroup('playerStrums', 1, 'x', 527+ii);
	setPropertyFromGroup('playerStrums', 2, 'x', 637+ii);
	setPropertyFromGroup('playerStrums', 3, 'x', 750+ii);
	
	doTweenX('4', 'Bubble.scale', 0.84, 0.0001, elapsed)
doTweenY('44', 'Bubble.scale', 0.84, 0.0001, elapsed)
doTweenX('444', 'butter.scale', 0.84, 0.0001, elapsed)
doTweenY('4444', 'butter.scale', 0.84, 0.0001, elapsed)

doTweenAlpha('Bubble.alpha','Bubble',0,0.0001,'')
doTweenAlpha('butter.alpha','butter',0,0.0001,'')
end

function onBeatHit()
		if curBeat % 2 == 0 then
			luaSpritePlayAnimation("ford", "Ford1")
			luaSpritePlayAnimation("Bubble", "Bubble")
			luaSpritePlayAnimation("butter", "butter")			
		end
end
function onCountdownTick()
r = r + 1
if r == 3 + t/4 then
startVideo('propaganda-cutscene-1')
          setProperty('inCutscene', false);
          end
end
function onStepHit()
 if curStep == 1 then
 
 end
 if curStep == 25 then
-- objectPlayAnimation("escena", "lol", true)
-- setProperty('escena.visible', true)
 setProperty('fondo.visible', false)

 end
if curStep == 45 then
-- setProperty('escena.visible', false)
-- setProperty('escena2.visible', true)
-- objectPlayAnimation("escena2", "lol2", true)
end
if curStep == 103 then
-- setProperty('escena2.visible', false)
-- setProperty('escena3.visible', true)
-- objectPlayAnimation("escena3", "lol3", true)
end
 if curStep == 155 then
-- setProperty('escena3.visible', false)
-- setProperty('fondo.visible', true)
end
if curStep == 184 then
-- setProperty('fondo.visible', false)
end
 if curStep == 936+t then
-- setProperty('escena4.visible', true)
-- objectPlayAnimation("escena4", "lol4", true)
startVideo('propaganda-cutscene-2')
           setProperty('inCutscene', false);
end
if curStep == 964 then
-- setProperty('escena4.visible', false)
-- setProperty('escena5.visible', true)
-- objectPlayAnimation("escena5", "lol5", true)
triggerEvent('Change Character', 'gf', 'Blossom');
doTweenAlpha('Bubble.alpha','Bubble',1,0.0001,'')
doTweenAlpha('butter.alpha','butter',1,0.0001,'')
end
if curStep == 994 then
-- setProperty('escena5.visible', false)
-- setProperty('escena6.visible', true)
-- objectPlayAnimation("escena6", "lol6", false)
end
if curStep == 1496+t then
startVideo('propaganda-cutscene-3')
          setProperty('inCutscene', false);
end
if curStep == 2048 then
doTweenAlpha('Bubble.alpha','Bubble',0,0.0001,'')
doTweenAlpha('butter.alpha','butter',0,0.0001,'')
setProperty('gf.visible', false)
end
if curStep == 2220 then
--startVideo('propaganda-cutscene-4')
          setProperty('inCutscene', false);
end
end