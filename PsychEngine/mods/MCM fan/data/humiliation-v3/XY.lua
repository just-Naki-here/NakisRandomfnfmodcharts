local followchars = 3;
local del = 0;
local del2 = 0;
local yy = -250;
local yy2 = -250;
function onUpdate()
songPos = getSongPosition()
	local currentBeat = (songPos/4000)
	doTweenY('1', 'Jellyfish', -250 - 50*math.sin((currentBeat+2*0.1)*math.pi), 1)
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == 1 then
         xx = 350;
         xx2 = 850;
         ofs = 10;
    end
    if followchars == 2 then
         xx = -200;
         xx2 = 1300;
         ofs = 10;
    end
    if followchars == 3 then
         xx = 550;
         xx2 = 550;
         ofs = 10;
    end
    if followchars == 4 then
         xx = 1300;
         xx2 = 1300;
         ofs = 10;
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
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
end
function onStepHit()
if curStep == 128 then
	yy = 400
	yy2 = 400
	end
if curStep == 512 then
	followchars = 2;
	end
	if curStep == 640 then
	followchars = 4;
	end
	if curStep == 644 then
	followchars = 3;
	end
	if curStep == 784 then
	followchars = 2;
	end
	if curStep == 904 then
	followchars = 3;
	end
	if curStep == 1040 then
	setProperty('Jellyfish.alpha', 1)
	end
	end