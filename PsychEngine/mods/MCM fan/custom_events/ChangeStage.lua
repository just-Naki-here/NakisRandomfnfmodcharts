function onCreate()
	--background boi
	makeLuaSprite('stage', 'stageNevada', -280, -110)
	addLuaSprite('stage', false)

	makeLuaSprite( 'stage2', 'stageTricky', -280, -110)
	addLuaSprite('stage2', false)

	makeLuaSprite( 'stage3', 'stageGold', -280, -110)
	addLuaSprite('stage3', false)

	makeLuaSprite( 'stage4', 'stageCancer', -280, -110)
	addLuaSprite('stage4', false)

	setProperty('stage2.visible', false)
	setProperty('stage3.visible', false)
	setProperty('stage4.visible', false)
end

function onEvent(name,value1,value2)
	if name == 'ChangeStage' then 
		
		if value1 == 'changebg1' then
			setProperty('stage.visible', false);
			setProperty('stage2.visible', true);
			setProperty('stage3.visible', false);
			setProperty('stage4.visible', false)
		end
		if value1 == 'changebg2' then
			setProperty('stage3.visible', true);
			setProperty('stage.visible', false);
			setProperty('stage2.visible', false);
			setProperty('stage4.visible', false);
		end
		if value1 == 'changebg3' then
			setProperty('stage2.visible', false);
			setProperty('stage.visible', false);
			setProperty('stage3.visible', false);
			setProperty('stage4.visible', true)
		end
		if value1 == 'changebgnormal' then
			setProperty('stage2.visible', false);
			setProperty('stage.visible', true);
			setProperty('stage3.visible', false);
			setProperty('stage4.visible', false);
		end
	end
end