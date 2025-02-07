local followchars = true
local xx = -12
local yy = -60
local xx2 = 105
local yy2 = -60
local ofs = 16
local del = 0
local del2 = 0

function onCreate()

	setProperty('gfGroup.visible', false);

	makeLuaSprite('sky', 'background/served/sky', -1437, -780)
	addLuaSprite('sky', false)
	setLuaSpriteScrollFactor('sky', 1, 1)
	scaleLuaSprite('sky',2,2);
	setScrollFactor('sky', 0.5, 0.5);

	makeLuaSprite('mountains', 'background/served/mountains', -1037, -320)
	addLuaSprite('mountains', false)
	setLuaSpriteScrollFactor('mountains', 1, 1)
	scaleLuaSprite('mountains',2,2);
	setScrollFactor('mountains', 0.8, 0.8);
	
	makeLuaSprite('floor', 'background/served/floor', -1337, 60)
	addLuaSprite('floor', false)
	setLuaSpriteScrollFactor('floor', 1, 1)
	scaleLuaSprite('floor',2,2);
	
	makeLuaSprite('platforms', 'background/served/platform/platforms', -1345, -85)
	addLuaSprite('platforms', false)
	setLuaSpriteScrollFactor('platforms', 1, 1)

	makeLuaSprite('bus', 'background/served/bus/bus', -4845, -885)
	addLuaSprite('bus', false)
	setLuaSpriteScrollFactor('bus', 1, 1)

	setProperty('sky.visible', true);	
	setProperty('mountains.visible', true);	
	setProperty('floor.visible', true);	
	setProperty('platforms.visible', false);
	setProperty('bus.visible', false);
end

function onUpdate(elapsed)
	if followchars == true then
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
		  if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
			triggerEvent('Camera Follow Pos',xx-ofs,yy)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
			triggerEvent('Camera Follow Pos',xx+ofs,yy)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
			triggerEvent('Camera Follow Pos',xx,yy-ofs)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
			triggerEvent('Camera Follow Pos',xx,yy+ofs)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
			triggerEvent('Camera Follow Pos',xx,yy)
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
		  if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
			triggerEvent('Camera Follow Pos',xx2,yy2)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			triggerEvent('Camera Follow Pos',xx2,yy2)
		  end
		end
	else
		triggerEvent('Camera Follow Pos','','')
	end
end

function onStepHit()
	if curStep == 1056 then
	xx = -102
	end
	if curStep == 1072 then
	xx = -12
	end
end