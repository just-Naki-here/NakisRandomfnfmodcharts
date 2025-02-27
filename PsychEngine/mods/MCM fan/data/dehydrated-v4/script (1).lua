drainAmount = 0;
overTime = 0;
difficulties = 'hard'
fgi = 2
c = 0
f = 1
y = 50
function onCreate()
	addCharacterToList('dry_chase1', '1');
	addCharacterToList('dry_sponge-scream-1', '1');
	addCharacterToList('dry_sponge1', '1');
end
function onUpdate(elapsed)
health = getProperty('health')
if curStep < 1 then
if keyJustPressed('UP') then
fgi = fgi + 1
end
if keyJustPressed('DOWN') then
fgi = fgi - 1
end
if fgi == 1 then
difficulties = 'easy'
end
if fgi == 2 then
difficulties = 'hard'
end
if fgi == 3 then
difficulties = 'veryhard'
end
end
	
	makeLuaText('sub4333', difficulties, 0, 1000, y)
	setTextSize('sub4333', 52.5);
	setObjectCamera('sub4333', 'other')
	setObjectOrder('sub4333', 99999)
	if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
		objectPlayAnimation('spongebottom', 'left', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
		objectPlayAnimation('spongebottom', 'right', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'singUP' then
		objectPlayAnimation('spongebottom', 'up', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
		objectPlayAnimation('spongebottom', 'down', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
		objectPlayAnimation('spongebottom', 'left', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
		objectPlayAnimation('spongebottom', 'right', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
		objectPlayAnimation('spongebottom', 'up', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
		objectPlayAnimation('spongebottom', 'down', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
		objectPlayAnimation('spongebottom', 'idle', false);
	end
	if getProperty('dad.animation.curAnim.name') == 'idle' then
		objectPlayAnimation('spongebottom', 'idle', false);
	end
	if curStep > 1 and y > -50 then
        y = y - 5
        
    end
	ii = drainAmount;
	setProperty('c.alpha', 1+health/-2);
	setProperty('health', health - drainAmount * drainAmount * f);

	drainAmount = drainAmount + (overTime/10000);
end
function onStepHit()
if difficulties == 'veryhard' then
overTime = overTime + 0.005
end
if difficulties == 'easy' then
overTime = 0
end

    
    if drainAmount >= 0.05 then
    drainAmount =0.05
    end
    if curStep == 180 then
	    triggerEvent('Change Character', '1', 'dry_sponge-scream-1')
		triggerEvent('Play Animation', 'INEEDIT', 'dad') --omg la animacion
	end
	if curStep == 192 then
	    triggerEvent('Change Character', '1', 'dry_sponge1')
	    overTime = 1;
		 --omg la animacion
	end
	if curStep == 584 then
	overTime = 2;
		--when te borran
	end
	if curStep == 714 then
overTime = 0;
		drainAmount = -0.004;
	end
	if curStep == 728 then
drainAmount = -0.000003;
		health = 2;
		overTime = 3;
	end
	if curStep == 1032 then
		setProperty('dadGroup.visible', false)
		setProperty('spongebottom.alpha', 0)
		setProperty('spongedie.alpha', 1)
		objectPlayAnimation('spongedie', 'death', 48,true)
		overTime = 0;
		drainAmount = 0.1;
		f = -1
	end
	
end
function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'vase note' then
        drainAmount = 0;
	    e.healthGain = 0;
    end
end