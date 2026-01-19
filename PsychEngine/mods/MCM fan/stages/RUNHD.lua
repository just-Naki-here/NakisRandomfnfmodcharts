function onCreate()
	addCharacterToList('Leatherfactalt', 'dad')
	addCharacterToList('LFGFB', 'BF')
	addCharacterToList('LFGF', 'BF')
	addCharacterToList('Leatherfactblue', 'dad')

	makeLuaSprite('mainbg', 'funnipat/breh4k', -100, 100);
	setScrollFactor('mainbg', 1, 1);
	makeLuaSprite('hook', 'funnipat/Hooksv21', -100, 100);
	setScrollFactor('hook', 1, 1);
	
	scaleObject('mainbg', 0.9,0.9)
	scaleObject('hook', 0.9,0.9)


	addLuaSprite('mainbg', false);
	addLuaSprite('hook', true);
end

function onStepHit()

	--joe

	if getProperty('curStep') == 1280 then
		setProperty('hook.visible', false)
	end

	if getProperty('curStep') == 2303 then
		setProperty('hook.visible', true)
	end
end