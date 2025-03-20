function onCreate()
	for notesLength = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', notesLength, 'noteType') == 'Jeringe Note' then
			setPropertyFromGroup('unspawnNotes', notesLength, 'texture', 'SCREAMERNOTE_assets')
		end
	end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Jeringe Note' then
        local dadAnims = {'singLEFT-shoot','singDOWN-shoot','singUP-shoot','singRIGHT-shoot'}
        characterPlayAnim('dad',dadAnims[direction + 1],true)
        setProperty('dad.specialAnim',true)
        characterPlayAnim('boyfriend','dodge',true)
        setProperty('boyfriend.specialAnim',true)
	end
end
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Jeringe Note' then
        characterPlayAnim('boyfriend','hurt',true)
        setProperty('boyfriend.specialAnim',true)
        doEffect()
	end
end
function doEffect()
    for strumLieNotes = 0,7 do
        noteTweenAngle('glitchNoteAngle'..strumLieNotes,strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'angle') + math.random(-40,40),math.random(15,20),'quadInOut')
        noteTweenX('glitchNoteX'..strumLieNotes,strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'x') + math.random(-30,30),math.random(15,20),'quadInOut')
        noteTweenY('glitchNoteY'..strumLieNotes,strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'y') + math.random(-35,35),math.random(15,20),'quadInOut')
    end
    doTweenAngle('glicthHUD','camHUD',getProperty('camHUD.angle') + math.random(-4,14),math.random(15,20),'quadInOut')
end