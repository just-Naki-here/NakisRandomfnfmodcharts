local xx = 420
local yy = 350
local xx2 = 420
local yy2 = 350
local ofs = 10
local followchars = true
local del = 0
local del2 = 0

function onCreate()
	setProperty('boyfriendGroup.visible', false)
	setProperty('gfGroup.visible', false)
	
	makeLuaSprite('bg', 'background/dehydrated/TreeDomeBG', -1020,-500)
	addLuaSprite('bg', false)
	scaleObject('bg', 1.75, 1.75)

	makeAnimatedLuaSprite('backroundrun', 'background/dehydrated/Dehydrated', -690, -300)
	scaleLuaSprite('backroundrun', 4, 4)
	addAnimationByPrefix('backroundrun', 'backroundrun idle', 'Dehydrated idle', 60, true)
	setProperty('backroundrun.alpha', 0.00001)
    addLuaSprite('backroundrun', false)
	
	makeAnimatedLuaSprite('spongedie','background/dehydrated/COMEHERE/DrySpongeDeath', getCharacterX('dad') - 580, getCharacterY('dad') - 240);
	addAnimationByPrefix('spongedie', 'death', ' die', 60, false);
	scaleObject('spongedie', 4, 4)
	addLuaSprite('spongedie', false);
	setProperty('spongedie.alpha', 0.00001)

	makeAnimatedLuaSprite('spongebottom', 'background/dehydrated/COMEHERE/DrySpongeBottom', getCharacterX('dad') - 580, getCharacterY('dad') - 240);
	addAnimationByPrefix('spongebottom', 'idle', ' idle' ,60, true);
	addAnimationByPrefix('spongebottom', 'down', ' down' ,60, false);
	addAnimationByPrefix('spongebottom', 'up', ' up' ,60, false);
	addAnimationByPrefix('spongebottom', 'left', ' left' ,60, false);
	addAnimationByPrefix('spongebottom', 'right', ' right' ,60, false);
	objectPlayAnimation('spongebottom', 'idle', false);
	scaleObject('spongebottom', 1, 1)
	addLuaSprite('spongebottom', false);
	setProperty('spongebottom.alpha', 0.00001);
	
	i = 0.6
	ii = 0.6
end
function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
			setProperty('defaultCamZoom', i)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos', xx - ofs, yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos', xx + ofs, yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos', xx, yy - ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos', xx, yy + ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos', xx - ofs, yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos', xx + ofs, yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos', xx, yy - ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos', xx, yy + ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos', xx, yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos', xx, yy)
            end
        else
			setProperty('defaultCamZoom', ii)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos', xx2 - ofs, yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos', xx2 + ofs, yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos', xx2, yy2 - ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos', xx2, yy2 + ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos', xx2, yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' then
			triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
			triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' then
			triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' then
			triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
		  end
        end
    else
        triggerEvent('Camera Follow Pos', '', '')
    end
    if curStep == 544 then
    i = 0.6
	ii = 0.6
    end
end