local shouldFollow = true
local ogCamX
local ogCamY
local ogCamAng
local camX = 0
local camY = 0
local camAngle = 0

-- Setting the script up
function onCreate()
	addLuaScript('zCameraFix')
	return Function_Stop
end
function onStartCountdown()
	shouldFollow = false
	-- In case of they being used early, this'll set them to the right value
	camX = ogCamX
	camY = ogCamY
end

-- Resets base variables, that are used by the variables that actually are moving the camera
function onMoveCamera()
	ogCamX = getProperty('camFollow.x')
	ogCamY = getProperty('camFollow.y')
	ogCamAng = 0
end
function onTimerCompleted(t)
	if t == 'justSang' then
		camX = ogCamX
		camY = ogCamY
		camAngle = 0
	end
end

-- Sets the values on how the camera is going to move
function opponentNoteHit(i, dir)
	if not shouldFollow then shouldFollow = true end
	if not mustHitSection and shouldFollow then
		if dir == 0 then
			camX = ogCamX - 15
			camY = ogCamY
		elseif dir == 1 then
			camX = ogCamX
			camY = ogCamY + 15
		elseif dir == 2 then
			camX = ogCamX
			camY = ogCamY - 15
		elseif dir == 3 then
			camX = ogCamX + 15
			camY = ogCamY
		end

		runTimer('justSang', getProperty('dad.singDuration') - 2.65)
	end
end
function goodNoteHit(i, dir)
	if not shouldFollow then shouldFollow = true end -- In case BF goes first
	if mustHitSection and shouldFollow then
		if dir == 0 then
			camX = ogCamX - 15
			camY = ogCamY
		elseif dir == 1 then
			camX = ogCamX
			camY = ogCamY + 15
		elseif dir == 2 then
			camX = ogCamX
			camY = ogCamY - 15
		elseif dir == 3 then
			camX = ogCamX + 15
			camY = ogCamY
		end

		runTimer('justSang', getProperty('boyfriend.singDuration') - 3.65)
	end
end
function onEvent(n, v1, v2) -- Fix for some events
	if n == 'Camera Follow Pos' then
		if not (v1 == '') and not (v2 == '') then
			camX = tonumber(v1)
			camY = tonumber(v2)
			camAngle = 0
		else
			camX = ogCamX
			camY = ogCamY
			camAngle = ogCamAng
		end
	end
end

function onUpdatePost()
	if shouldFollow then
		setProperty('camFollow.x', camX)
		setProperty('camFollow.y', camY)

		doTweenAngle('camAngleTwn', 'camFollow', camAngle, 2.8, 'circOut')
		setProperty('camGame.angle', getProperty('camFollow.angle'))
	end

	if luaDebugMode then
		debugPrint('camFollow: x - '..camX..', ogX - '..ogCamX)
		debugPrint('camFollow: y - '..camY..', ogY - '..ogCamY)
		debugPrint('camFollow: ang - '..camAngle..', ogAng - '..ogCamAng)
	end
end

function onGameOver()
	shouldFollow = false
	camX = ogCamX
	camY = ogCamY
	onMoveCamera()
end