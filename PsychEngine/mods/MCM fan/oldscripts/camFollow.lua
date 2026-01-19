enabled = true

multiplier = 0.7

followGF = true
gfCameraTimer = 4		--how much to wait to return to the normal cameras when gf is done singing (recommended: 4)


function onUpdate()

    doTweenColor('timeBar', 'timeBar', '89CFF0', 0.4, 'linear');

	if enabled == true and getProperty('paused') == false then
	
		camFollowX = getProperty('camFollowPos.x')
		camFollowY = getProperty('camFollowPos.y')
		
		if mustHitSection == true then
		
			if not (string.find(getProperty('boyfriend.animation.curAnim.name'), 'singLEFT') == nil) then
				setProperty('camFollowPos.x', camFollowX - multiplier)
			
			elseif not (string.find(getProperty('boyfriend.animation.curAnim.name'), 'singDOWN') == nil) then
				setProperty('camFollowPos.y', camFollowY + multiplier)
			
			elseif not (string.find(getProperty('boyfriend.animation.curAnim.name'), 'singUP') == nil) then
				setProperty('camFollowPos.y', camFollowY - multiplier)
			
			elseif not (string.find(getProperty('boyfriend.animation.curAnim.name'), 'singRIGHT') == nil) then
				setProperty('camFollowPos.x', camFollowX + multiplier)
			end
			
		else
		
			if not (string.find(getProperty('dad.animation.curAnim.name'), 'singLEFT') == nil) then
				setProperty('camFollowPos.x', camFollowX - multiplier)
			
			elseif not (string.find(getProperty('dad.animation.curAnim.name'), 'singDOWN') == nil) then
				setProperty('camFollowPos.y', camFollowY + multiplier)
			
			elseif not (string.find(getProperty('dad.animation.curAnim.name'), 'singUP') == nil) then
				setProperty('camFollowPos.y', camFollowY - multiplier)
			
			elseif not (string.find(getProperty('dad.animation.curAnim.name'), 'singRIGHT') == nil) then
				setProperty('camFollowPos.x', camFollowX + multiplier)
			end
		
		end
		
		
		--girlfriend stuff
		if followGF == true and not (getProperty('gf') == nil) then
		
			--move camera to gf position
			if not (string.find(getProperty('gf.animation.curAnim.name'), 'sing') == nil) then
				setProperty('camFollow.x', getMidpointX('gf'))
				setProperty('camFollow.y', getMidpointY('gf'))
			
				setProperty('camFollow.x', getProperty('camFollow.x') + getProperty('gf.cameraPosition')[1] + getProperty('girlfriendCameraOffset')[1])
				setProperty('camFollow.y', getProperty('camFollow.y') + getProperty('gf.cameraPosition')[2] + getProperty('girlfriendCameraOffset')[2])
			end


			if not (string.find(getProperty('gf.animation.curAnim.name'), 'singLEFT') == nil) then
				setProperty('camFollowPos.x', camFollowX - multiplier)
				
			elseif not (string.find(getProperty('gf.animation.curAnim.name'), 'singDOWN') == nil) then
				setProperty('camFollowPos.y', camFollowY + multiplier)
				
			elseif not (string.find(getProperty('gf.animation.curAnim.name'), 'singUP') == nil) then
				setProperty('camFollowPos.y', camFollowY - multiplier)
				
			elseif not (string.find(getProperty('gf.animation.curAnim.name'), 'singRIGHT') == nil) then
				setProperty('camFollowPos.x', camFollowX + multiplier)			
			end
				
				
			--move back to opponent/boyfriend
			if getProperty('gf.holdTimer') >= getPropertyFromClass('Conductor', 'stepCrochet') * 0.0011 * gfCameraTimer then
			
				if mustHitSection == true then
				
					setProperty('camFollow.x', getMidpointX('boyfriend') - 100)
					setProperty('camFollow.y', getMidpointY('boyfriend') - 100)
				
					setProperty('camFollow.x', getProperty('camFollow.x') - getProperty('boyfriend.cameraPosition')[1] - getProperty('boyfriendCameraOffset')[1])
					setProperty('camFollow.y', getProperty('camFollow.y') + getProperty('boyfriend.cameraPosition')[2] + getProperty('boyfriendCameraOffset')[2])
					
				else
				
					setProperty('camFollow.x', getMidpointX('dad') + 150)
					setProperty('camFollow.y', getMidpointY('dad') - 100)
				
					setProperty('camFollow.x', getProperty('camFollow.x') + getProperty('dad.cameraPosition')[1] + getProperty('opponentCameraOffset')[1])
					setProperty('camFollow.y', getProperty('camFollow.y') + getProperty('dad.cameraPosition')[2] + getProperty('opponentCameraOffset')[2])
					
				end
				
			end
		
		end
		
	end
	
end