
local xx2 = 0;
local yy2 = 330;
local xx = 0;
local yy =  330;
local ofs = 150;
local ofs2 = 150;
local followchars = true;

function onUpdate()
    setTextString('botplayTxt', "FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE FIRE IN THE HOLE ") 
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs2)
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
            if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
        end
    else
        triggerEvent('Camera Follow Pos', '', '')
    end
end