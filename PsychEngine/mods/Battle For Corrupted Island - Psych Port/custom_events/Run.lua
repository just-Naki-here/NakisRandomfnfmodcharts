function onEvent(n,v1,v2)
    if n == 'Run' then
    	if v1 == '1' then
    	    makeAnimatedLuaSprite('mods/images/yoyle', -600, 0)
            addAnimationByPrefix('mods/images/yoyle', 12, true)
            objectPlayAnimation('mods/images/yoyle', true)
            setScrollFactor('mods/images/yoyle', 1, 1)
        	addLuaSprite('mods/images/yoyle', false)
        	makeAnimatedLuaSprite('Legz', 'characters/booklegs/booklegs', -350, -60)
            addAnimationByPrefix('Legz', 'characters/booklegs/booklegs', 'booklegs idle', 20, true)
            objectPlayAnimation('Legz', 'booklegs idle', true)
            setScrollFactor('Legz', 1, 1)
        	addLuaSprite('Legz', false)
        	setProperty('Legz.x', -550)
        	scaleObject('Legz',1.5,1.5)
        	makeAnimatedLuaSprite('Legz2', 'characters/Boyfriend/Shoes', 570, 110)
            addAnimationByPrefix('Legz2', 'characters/Boyfriend/Shoes', 'Bf Running idle', 16, true)
            objectPlayAnimation('Legz', 'Bf Running idle', true)
            setScrollFactor('Legz2', 1, 1)
        	addLuaSprite('Legz2', true)
        	
        	scaleObject('Legz2',1.1,1.1)
    	end
    	if v1 == '2' then
    		doTweenAlpha('void','void',0,v2,'linear')
     		doTweenAlpha('void2','void2',0,v2,'linear')
        end
    end
end