function onCreatePost()

		makeAnimatedLuaSprite('Bubble-Transition','Bubble-Transition', 0, 0)
    addLuaSprite('Bubble-Transition', false)
    scaleLuaSprite('Bubble-Transition', 1, 1);
	
    setObjectCamera("Bubble-Transition", "other")
    
	end
	function onUpdatePost()
	health = getProperty('health')
	
	setProperty('iconP1.x', 895)
        setProperty('iconP2.x', 250)
        setProperty('iconP1.scale.x', 0.75)
        setProperty('iconP2.scale.x', 0.75)
        setProperty('iconP1.scale.y', 0.75)
        setProperty('iconP2.scale.y', 0.75)
        if health >= 1.6 then
        setProperty('iconP2.x', 225)
        end
	end
	function onStepHit()
if curStep == 1588 then
addAnimationByPrefix('Bubble-Transition','idle', 'Bubble Transition', 24, false)
    luaSpritePlayAnimation("Bubble-Transition", "idle")
    end
    if curStep == 1598 then
    setProperty('Bubble-Transition.alpha', 0)
    end
end