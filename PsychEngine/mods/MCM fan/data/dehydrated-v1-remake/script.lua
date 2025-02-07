function onCreate()
	addCharacterToList('dry_chase', '1');
	addCharacterToList('dry_sponge-scream', '1');
end

function onUpdate(elapsed)
	if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
		objectPlayAnimation('spongebottom', 'left', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
		objectPlayAnimation('spongebottom', 'right', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'singUP' then
		objectPlayAnimation('spongebottom', 'up', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
		objectPlayAnimation('spongebottom', 'down', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
		objectPlayAnimation('spongebottom', 'left', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
		objectPlayAnimation('spongebottom', 'right', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
		objectPlayAnimation('spongebottom', 'up', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
		objectPlayAnimation('spongebottom', 'down', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
		objectPlayAnimation('spongebottom', 'idle', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'idle' then
		objectPlayAnimation('spongebottom', 'idle', false);
	end
end

function onStepHit()
    if curStep == 354 then
	    triggerEvent('Change Character', '1', 'dry_sponge-scream')
		triggerEvent('Play Animation', 'INEEDIT', 'dad') --omg la animacion
	end
	if curStep == 386 then
		--when te borran
	end
	if curStep == 1490 then
		setProperty('dadGroup.visible', false)
		setProperty('spongebottom.alpha', 0)
		setProperty('spongedie.alpha', 1)
		objectPlayAnimation('spongedie', 'death')
	end
end