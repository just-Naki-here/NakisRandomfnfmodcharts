function onUpdate()
    if getProperty('missThing.animation.curAnim.finished') then
        removeLuaSprite('missThing', false)
    end
	if daBlueIntro then
	    if getProperty('bluebabyintro.animation.curAnim.finished') then
	        removeLuaSprite('bluebabyintro', true)
			daBlueIntro = false
			if getPropertyFromClass('ClientPrefs', 'flashing') == true then
		        cameraFlash('hud','FFFFFF',0.6)
		    end
			setProperty('dad.alpha', 1)
		    
			makeAnimatedLuaSprite('acce', 'chest/acce',200,150)
	        addAnimationByPrefix('acce','acc','acc',24,false)
	        objectPlayAnimation('acce','acc',true)
    
	        setObjectCamera('acce', 'hud')
	
	        addLuaSprite('acce', true);
			
	        makeAnimatedLuaSprite('chestidle', 'chest/chestidle',-300,-400)
	        addAnimationByPrefix('chestidle','idle','idle',24,true)
	        objectPlayAnimation('chestidle','idle',true)
	        scaleObject('chestidle', 0.75, 0.75)
		
		    addLuaSprite('chestidle', false)
		
	        startCountdown()
	    end
	end
	    if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
end