function onEvent(name, v1, v2)
	if name == 'UI Fade' then
		local easing = 'linear'
		local duration = 1
		local target = ''
		local leaveNotes = 'false'
		--local hudArray = {'healthBar','iconP1','iconP2','scoreTxt','timeBar','timeBarTxt'}--normal hud
		local hudArray = {
			'healthBar',
			'iconP1',
			'iconP2',
			'scoreTxt',
			'timeBar',
			'timeBarTxt',
			'songTimeMickey',
			'songNameTextMickey',
			'scoreTextMickey',
			'missesTextMickey',
			'acurracyTextMickey',
			'sickTextMickey',
			'goodTextMickey',
			'badTextMickey',
			'shitTextMickey',
			--'timeBarBG'
			--'timePercentMickey',
			}--mickey hud
		if version < '0.7' then
			table.insert(hudArray,'timeBarBG')
			table.insert(hudArray,'healthBarBG')
		end
		if v1 ~= '' then
			local v1split = split(v1,',')
			target = v1split[1]
			leaveNotes = v1split[2]
			if leaveNotes == nil then
				leaveNotes = 'false'
			end
		end
		if v2 ~= '' then
			local v2split = split(v2,',')
			duration = tonumber(v2split[1])
			if duration == nil then
				if v2split[1] == '0' then
					duration = 0
				else
					duration = 1
				end
			end
			easing = v2split[2]
		end

		if easing == '.' or easing == nil then
			easing = 'linear'
		end
		if target == nil or target == '' then
			target = 1
		end
		if leaveNotes ~= 'true' then
			for strums = 0,7 do
				cancelTween('UiFadeNote'..strums)
				if duration > 0 then
					if middlescroll then
						if strumLineLength < 4 then
							noteTweenAlpha('UiFadeNote'..strums, strums, target*0.3, duration, easing)
						else
							noteTweenAlpha('UiFadeNote'..strums, strums, target, duration, easing)
						end
					else
						noteTweenAlpha('UiFadeNote'..strums, strums, target, duration, easing)
					end
				else
					if middlescroll then
						if strumLineLength < 4 then
							setPropertyFromGroup('strumLineNotes', strums,'alpha',target*0.3);
						else
							setPropertyFromGroup('strumLineNotes', strums,'alpha',target);
						end
					else
						setPropertyFromGroup('strumLineNotes', strums,'alpha',target);
					end
					
				end
			end
		end
		for hudLength = 1,#hudArray do
			if duration > 0 then
				doTweenAlpha('UiFade'..hudArray[hudLength],hudArray[hudLength], target, duration, easing)
			else
				cancelTween('UiFade'..hudArray[hudLength])
				setProperty(hudArray[hudLength]..'.alpha', target)
			end
		end
	end
end
function split(text,argument)
	local array = {}
	local founded = true
	local pos = 0
	while founded == true do
		founded = false
		local split,_ = string.find(text,argument,pos,true)
		local number = string.sub(text,pos)
		if split then
			number = string.sub(text,pos,split-1)
			founded = true
			pos = _+1
		else
			if pos == 0 then
				array = {number}
				break
			end
		end
		table.insert(array,number)
	end

	return array
end