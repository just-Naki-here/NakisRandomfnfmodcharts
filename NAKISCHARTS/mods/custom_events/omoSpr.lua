--This is an event for generating sprite. Just a masterlist of it for special cases
function onCreate()

end

function onEvent(name, value1, value2)
	if name == 'omoSpr' then
		directory = tostring(value1)
		inputstr = tostring(value2)
		
		--seperated by whitespace (pun intended): a way to cram more variables lmao
		--Type, Xoffset, Yoffset, Scale
		local t = {}
        for str in string.gmatch(inputstr, "([^%s]+)") do
            table.insert(t, str)
        end
		--convert the splitted string into number
		for i = 1,4 do
			if t[i] == nil then
				t[i] = 1
			else
				t[i] = tonumber(t[i])
			end
		end

		makeAnimatedLuaSprite('skillSpr', directory, -1000, 1000)
		addAnimationByPrefix('skillSpr', 'play', 'play', 24, false)
		addLuaSprite('skillSpr', true)
		scaleObject('skillSpr', t[4], t[4]);

		if t[1] == 0 then --on stage. like normal
			setProperty('skillSpr.x', t[2])
			setProperty('skillSpr.y', t[3])
		elseif t[1] == 1 then --dad char
			setProperty('skillSpr.x', getProperty('dad.x') + t[2])
			setProperty('skillSpr.y', getProperty('dad.y') + t[3])
		elseif t[1] == 2 then --bf char
			setProperty('skillSpr.x', getProperty('boyfriend.x') + t[2])
			setProperty('skillSpr.y', getProperty('boyfriend.y') + t[3])
		elseif t[1] == 3 then --dad icon
			setObjectCamera('skillSpr', 'other')
			setProperty('skillSpr.x', getProperty('iconP1.x') + t[2])
			setProperty('skillSpr.y', getProperty('iconP1.y') + t[3])
		elseif t[1] == 4 then --bf icon
			setObjectCamera('skillSpr', 'other')
			setProperty('skillSpr.x', getProperty('iconP2.x') + t[2])
			setProperty('skillSpr.y', getProperty('iconP2.y') + t[3])
		end

		objectPlayAnimation('skillSpr', 'play', true)
	end
end
