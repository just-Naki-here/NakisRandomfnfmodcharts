function onUpdate()
	for i = 0, 7 do
		
if downscroll then
setPropertyFromGroup('opponentStrums', i, 'y', 550);
		setPropertyFromGroup('playerStrums', i, 'y', 550);
		setProperty('iconP1.y',20)
		setProperty('iconP2.y',10)
	end
	if not downscroll then
		setProperty('iconP1.y',580)
		setProperty('iconP2.y',570)
	end
	end
end

function onUpdatePost()
	health = getProperty('health')
	if curStep >= 1056 and curStep < 1312 then
	if downscroll then
		setProperty('iconP2.y',20)
	end
	if not downscroll then
		setProperty('iconP2.y',580)
	end
        end
	end
	