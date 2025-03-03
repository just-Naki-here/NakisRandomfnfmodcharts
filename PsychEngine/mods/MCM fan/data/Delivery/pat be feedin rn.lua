a = 0
r = 0
function onGameOver()
startVideo('delivery_game over');
setProperty('inCutscene', false);
end
function onCountdownTick()
r = r + 1
if r == 4 then
startVideo('deli-placeholder')
          setProperty('inCutscene', false);
          end
end
function onCreatePost()
--doTweenAlpha('camHUDOff' ,'camHUD', 0, 0.00000001, 'linear')
    doTweenAlpha('camGameOff' ,'camGame', 0, 0.00000001, 'linear')
		if version >= '1' then
		doTweenY('gfy', 'gf', 1680, 0.00001, elapsed)
		end
		

--doTweenAlpha('hudalpha', 'camHUD', 0, 0.00001, 'linear');
		--setProperty("coolhealthBar.antialiasing", true)
		
	makeLuaSprite('b', 'b1', 0, 0);
	scaleObject('b', 0.642, 0.642);
	setScrollFactor('b', 1, 1);
	setObjectOrder('b', 0);
    setObjectCamera('b', 'other')
    setObjectOrder('b', 10)
	doTweenX('4', 'b.scale', 1.45, 0.0001, elapsed)
doTweenY('44', 'b.scale', 1.45, 0.0001, elapsed)

	end
	function onUpdatePost()
	if x == 3 then
	
	x = 2
	end
	setProperty('iconP1.x', 895)
        setProperty('iconP2.x', 235)
        setProperty('iconP1.scale.x', 0.75)
        setProperty('iconP2.scale.x', 0.75)
        setProperty('iconP1.scale.y', 0.75)
        setProperty('iconP2.scale.y', 0.75)
        if a == 1 then
        setProperty('playbackRate', getProperty('playbackRate')-0.01)
        end
	end
i = 20.8 * 1000
local followchars = true;
local xx = 500;
local yy = 2100;
local xx2 = 800;
local yy2 = 2100;
local ofs = 10;
local del = 0;
local del2 = 0;
a = 0
function onStepHit()
if curStep == 10 then
--setPropertyFromClass('Conductor', 'songPosition', i  ) -- 13.6
	--setPropertyFromClass('flixel.FlxG', 'sound.music.time', i)
	--setProperty('vocals.time', i)
	--setProperty('defaultCamZoom', 1.1)
	doTweenAlpha('camHUDOff' ,'camHUD', 1, 0.00000001, 'linear')
    doTweenAlpha('camGameOff' ,'camGame', 1, 0.00000001, 'linear')
	end
	if curStep == 256 then
	doTweenAlpha('hudalpha', 'camHUD', 1, 0.00001, 'linear');
	end
	if curStep == 352 then
	followchars = false;
	setProperty('defaultCamZoom', 0.9)
	end
	if curStep == 384 then
	followchars = true;
	setProperty('defaultCamZoom', 1.1)
	end
	if curStep == 480 then
	followchars = false;
	setProperty('defaultCamZoom', 0.9)
	end
	if curStep == 512 then
doTweenY('44', 'b.scale', 1.2, 1, "linear")
doTweenAlpha('hudalpha', 'camHUD', 0, 1, 'linear');
	end
	if curStep == 560 then
	followchars = true;
	setProperty('defaultCamZoom', 1.1)
	doTweenAlpha('hudalpha', 'camHUD', 1, 1, 'linear');
	doTweenY('44', 'b.scale', 1.45, 1, "linear")
	end
	if curStep == 576 then
	setProperty('defaultCamZoom', 0.9)
	end
	if curStep == 640 then
	setProperty('defaultCamZoom', 1.1)
	end
	if curStep == 672 then
	followchars = false;
	setProperty('defaultCamZoom', 0.9)
	end
	if curStep == 704 then
	followchars = true;
	setProperty('defaultCamZoom', 1)
	end
	if curStep == 736 then
	followchars = false;
	end
	if curStep == 768 then
	followchars = true;
	end
	if curStep == 800 then
	setProperty('defaultCamZoom', 1.3)
	end
	if curStep == 832 then
	followchars = false;
	setProperty('defaultCamZoom', 1.1)
	doTweenY('44', 'b.scale', 1, 1, "linear")
doTweenAlpha('hudalpha', 'camHUD', 0, 1, 'linear');
	end
	if curStep == 864 then
	followchars = true;
	setProperty('defaultCamZoom', 1)
	setObjectCamera('b', 'hud')
	doTweenAlpha('hudalpha', 'camHUD', 1, 0.001, 'linear');
	end
	if curStep == 928 then
	setProperty('defaultCamZoom', 1.1)
	end
	if curStep == 960 then
	followchars = false;
	setProperty('defaultCamZoom', 0.9)
	end
	if curStep == 992 then
	followchars = true;
	setProperty('defaultCamZoom', 1.1)
	end
	if curStep == 1088 then
	followchars = false;
	setProperty('defaultCamZoom', 1)
	end
	if curStep == 1120 then
	setProperty('defaultCamZoom', 0.8)
	end
	if curStep == 1136 then
	setProperty('defaultCamZoom', 0.9)
	end
	if curStep == 1152 then
	followchars = true;
	setProperty('defaultCamZoom', 1.1)
	doTweenY('44', 'b.scale', 1.45, 0.0001, "linear")
	end
	if curStep == 1216 then
	setProperty('defaultCamZoom', 1)
	end
	if curStep == 1264 then
	followchars = false;
	setProperty('defaultCamZoom', 0.9)
	end
	if curStep == 1280 then
	followchars = true;
	setProperty('defaultCamZoom', 1.1)
	end
	if curStep == 1280 then
	setProperty('defaultCamZoom', 1)
	end
	if curStep == 1280 then
	followchars = false;
	end
	if curStep == 1424 then
	setProperty('defaultCamZoom', 1.2)
	doTweenY('44', 'b.scale', 1, 1, "linear")
	doTweenAlpha('hudalpha', 'camHUD', 0, 0.001, 'linear');
	setObjectCamera('b', 'other')
	end
	if curStep == 1404 then
    addLuaSprite('delivery_krabs2', false)
	addAnimationByPrefix('delivery_krabs2','krab', 'krab', 105, false)
    luaSpritePlayAnimation("delivery_krabs2", "krab")
    a = 0
	end
	if curStep == 1481 then
	doTweenY('44', 'b.scale', 1.2, 0.0001, "linear")
    doTweenZoom('screenZoom', 'camGame', 1.5, 0.0001, 'quadInOut');
    setProperty('defaultCamZoom', 1.5)
	end
	if curStep == 1498 then
	startVideo('deli-outro');
	end
end

function onCreate()
	-- background shit
--setProperty('skipCountdown', true)
makeAnimatedLuaSprite('delivery_krabs2','characters/MCM/Delivery/delivery_krabs2', 550, 1950)
	scaleLuaSprite('delivery_krabs2', 0.8, 0.8);
end
function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
	if followchars == false then
	triggerEvent('Camera Follow Pos',620-ofs,2100 - a)
	if mustHitSection == false then
	triggerEvent('Play Animation', 'bob', 'gf')
	else
	triggerEvent('Play Animation', 'bf', 'gf')
	end
	end
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
            triggerEvent('Play Animation', 'bob', 'gf')
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
            triggerEvent('Play Animation', 'bf', 'gf')
        end
    else
    end
end