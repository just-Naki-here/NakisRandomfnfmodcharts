function onCreatePost()
	    
	        makeLuaSprite('loading', 'freeplay/artbox_falling-apart', 490, 200)
	        addLuaSprite('loading', true)
	        setScrollFactor('loading', 1, 1)
	        scaleObject('loading', 1.0, 1.0);
	        setObjectCamera('loading', 'other')
	        runTimer('imageend', 1 , 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'imageend' then
        --doTweenAlpha('imageend', 'loading', 0, 1, 'linear')
    end
end
function onStepHit()
    if curStep == 16 then
    doTweenAlpha('imageend', 'loading', 0, 1, 'linear')
    end
    end