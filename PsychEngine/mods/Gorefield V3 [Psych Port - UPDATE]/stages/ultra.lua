f = 1
function onCreate()
setPropertyFromClass('backend.ClientPrefs','data.middleScroll', true)

makeLuaSprite('BG1', 'stages/ultra/BG', -25, 0)
addLuaSprite('BG1', false)
scaleObject('BG1', 1.85, 1.85)
setScrollFactor('BG1', 0.7, 0.7)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)  
cameraShake('game', 0.003, 0.1)
cameraShake('hud', 0.001, 0.1)
end

function onStepHit()
	Particle()
end 

function Particle()
	songPos = getSongPosition()
	currentBeat = (songPos/400)
	f = f + 1
	sus = math.random(0.7, 800)
	sus2 = math.random(0.7, 800)
	makeLuaSprite('part' .. f, 'particles', math.random(500, 2000), 1600)
	doTweenY(sus, 'part' .. f, -900*math.tan((currentBeat+1*0.1)*math.pi), 15)
	doTweenX(sus2, 'part' .. f, -3000*math.sin((currentBeat+1*0.1)*math.pi), 15)
	scaleObject('part' .. f, 0.4, 0.4);
	addLuaSprite('part' .. f, true)
	if f >= 50 then
		f = 1
      	end
end

function onDestroy()
if not middlescroll then
setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false)
end
end

function onUpdatePost()
setProperty('showRating', false)
setProperty('showComboNum', false)
end

function onCountdownTick(counter)
if counter == 1 then
 loadGraphic('countdownReady','countdowns/ultra/UltraReady')
 elseif counter == 2 then
loadGraphic('countdownSet','countdowns/ultra/UltraSet')
 elseif counter == 3 then
 loadGraphic('countdownGo','countdowns/ultra/ORDIE')
	end
end

function onUpdate(elapsed)
if mustHitSection then
 setProperty('defaultCamZoom', 0.8)
else
 setProperty('defaultCamZoom', 0.6)
  end
end