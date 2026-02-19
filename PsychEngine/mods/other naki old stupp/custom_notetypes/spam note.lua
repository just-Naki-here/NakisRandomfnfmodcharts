lock = 0
key = 0
function onCreate()
    precacheSound('STOP')
    for i = 0,getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'spam note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'STATICNOTE_assets');
			setPropertyFromGroup('unspawnNotes', i, 'lowPriority', true);
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0);
            setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
            setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
		end
	end
end
function noteMiss(id, noteData, noteType, isSustainNote)
    if noteType == 'spam note' then
        lock = 10
        makeLuaSprite('lockscreen', nil, 0, 0)
        makeGraphic('lockscreen', screenWidth, screenHeight, '00990D')
        addLuaSprite('lockscreen')
        setObjectCamera('lockscreen', 'camOther')
        setProperty('lockscreen.alpha', 0.6)
        setProperty('boyfriend.stunned', true)
        playSound('STOP', 1)
        key = 1
    end
end

function onUpdate(name, elapsed)
    number = lock
    if keyJustPressed('up') or keyJustPressed('down') or keyJustPressed('left') or keyJustPressed('right') then
        lock = lock - key
    end
    if lock == 0 then
        opened()
        number = ''
    end
    makeLuaText('count', number, 0, 605, 100)
    setTextColor('count', 'ffffff')
    setTextSize('count', 100)
    addLuaText('count')
end

function opened()
    setProperty('boyfriend.stunned', false)
    doTweenAlpha('bye', 'lockscreen', 0, 0.1, 'linear')
    key = 0
end