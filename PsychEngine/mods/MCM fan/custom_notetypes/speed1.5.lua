function onCreate() --高速ノーツ
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'speed1.5' then
			setPropertyFromGroup("unspawnNotes", i, "multSpeed", 3); --デフォルトの数値は1.4です
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', -0.075); --デフォルトの数値は0.023です
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.0475); --デフォルトの数値は0.0475です

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --お父さん・相手のメモを無視させない
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --ミスにはペナルティーがある
			end
		end
	end
end
function opponentNoteHit(id,dir,type,sus)
if type == 'speed1.5' then
setProperty('health',getProperty('health') - 0.08)
    e = math.random(-20,20)
    ee = math.random(20,-20)
    a = 0.1
    doTweenY('Y', 'camGame', e, a, linear)
    doTweenY('Y1', 'camHUD', e, a, linear)
    --doTweenY('Y2', 'camGame', -e, a, linear)
    --doTweenY('Y3', 'camHUD', -e, a, linear)
    doTweenX('X', 'camGame', ee, a, linear)
    doTweenX('X1', 'camHUD', ee, a, linear)
    --doTweenX('X2', 'camGame', e, a, linear)
    --doTweenX('X3', 'camHUD', e, a, linear)
end end