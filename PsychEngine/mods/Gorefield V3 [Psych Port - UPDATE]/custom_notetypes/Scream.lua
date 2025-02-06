function onCreatePost()
makeLuaSprite('Scream', 'mechanics/screamer-jumpscare', -250, 0)
addLuaSprite('Scream', true)
scaleObject('Scream', 0.7, 0.7)
setProperty('Scream.alpha', 0)
setObjectCamera('Scream', 'Other')
screenCenter('Scream')
end

function onUpdatePost()
    setProperty('Scream.x', -15 + getRandomFloat(-10, 10))
		setProperty('Scream.y', -25 + getRandomFloat(-10, 10))
end

function noteMiss(id, direction, noteType, isSustainNote)
   if noteType == 'Scream' then
    setProperty('Scream.alpha', 1)
    playSound('mechanics/scream', '1')
    runTimer('bye',1.5)
	end

function onTimerCompleted(tag)
if tag == 'bye' then
doTweenAlpha('byeScream', 'Scream', 0, 0.5, 'sineOut');
end
end
end
