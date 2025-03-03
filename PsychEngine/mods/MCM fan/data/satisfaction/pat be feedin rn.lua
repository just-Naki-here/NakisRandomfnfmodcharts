
	function onUpdatePost()
	health = getProperty('health')
	setProperty('iconP1.x', 900)
        setProperty('iconP2.x', 225)
        setProperty('iconP1.scale.x', 0.75)
        setProperty('iconP2.scale.x', 0.75)
        setProperty('iconP1.scale.y', 0.75)
        setProperty('iconP2.scale.y', 0.75)
        if curStep == 512 then
        doTweenAlpha('coolhealthBar.alpha','coolhealthBar',0,2,'')
        end
        if curStep == 1024 then
        doTweenAlpha('coolhealthBar.alpha','coolhealthBar',1,1,'')
        end
        if curStep == 1984 then
        doTweenAlpha('coolhealthBar.alpha','coolhealthBar',0,2,'')
        end
        if curStep == 2240 then
        doTweenAlpha('coolhealthBar.alpha','coolhealthBar',1,0.0001,'')
        end
        if health > 1.6 then
        setProperty('iconP2.x', 235)
        end
	end
	function goodNoteHit(id, direction, noteType, isSustainNote)
health = getProperty('health')
    if noteType == 'Sponge Note' then
        playSound('ringhit')
        setProperty('health', 2.0);
    end
end
	