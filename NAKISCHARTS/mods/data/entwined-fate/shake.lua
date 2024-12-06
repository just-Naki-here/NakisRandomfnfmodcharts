local anchorpos = {};
local shake = 2;
local maxshake = 5
local transitionspeed = 0
local spinspeed = 15.3

function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(anchorpos, {x,y})
    end
end
local floaty = 41.82;
local tailscircle = 'circle';
function onCreate()
	makeAnimatedLuaSprite('logodicon', "icons/icon-LOGOD", 561, 520)
	addAnimationByPrefix('logodicon','danger','icon-LOGOD lose', 24, true)
    addAnimationByPrefix('logodicon','normal','icon-LOGOD idle', 24, false)
	scaleObject('logodicon', 0.5, 0.5)
    setObjectCamera('logodicon', 'hud')
    addLuaSprite('logodicon', true)
end
function onUpdate()
	floaty = floaty+0.03

	if tailscircle == 'hovering' or tailscircle == 'circle' then
		setCharacterY('dad', getCharacterY('dad')+math.sin(floaty) * spinspeed);
	end
	if tailscircle == 'circle' then
		setCharacterX('dad', getCharacterX('dad')+math.cos(floaty) * spinspeed);
	end

	 local lol = math.random(1,4)
	if (lol >= 1) then
		doTweenAngle('tt', 'logodicon', -4, stepCrochet*0.00000000009, 'circOut')
	end
	if (lol >= 2) then
		doTweenAngle('tt', 'logodicon', -2, stepCrochet*0.00000000009, 'circOut')
	end
	if (lol >= 3) then
		doTweenAngle('tt', 'logodicon', 2, stepCrochet*0.00000000009, 'circOut')
	end
	if (lol >= 4) then
		doTweenAngle('tt', 'logodicon', 4, stepCrochet*0.00000000009, 'circOut')
	end
	if curBeat == 464 then
		luaSpritePlayAnimation('logodicon', 'danger')
	end
end
function onBeatHit()
	if curBeat < 464 then
		if curBeat % 2 == 0 then
		luaSpritePlayAnimation('logodicon', 'normal')
		end
	end
	if curBeat == 464 then
		spinspeed = 25
	end
end
function onUpdatePost()
	if curBeat < 464 then
		setProperty('timeTxt.y', getProperty('centerMark.y'))
		setProperty('centerMark.x', 70)
	end
	for i = 0,7 do
		setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1] + math.random(-shake,shake))
        setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2] + math.random(-shake,shake))
	end
	if difficultyName == 'Hell' then
		shake = 10
	end
end
function onCreatePost()
	if downscroll then
		setProperty('logodicon.y', 70)
	end
end
