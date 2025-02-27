y = 0
i = 0
difficulties = 'hard'
fgi = 2
z = 0
function onUpdate()
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
difficulties = 'expert'
end
end
if curStep > 1 and y > -150 then
        y = y - 5
end
if difficulties == 'easy' then
setProperty('health', health + 0.0005);
z = z + i/11
end
	makeLuaText('sub4333', difficulties, 0, 1000, y)
	setTextSize('sub4333', 52.5);
	setObjectCamera('sub4333', 'other')
	setObjectOrder('sub4333', 99999)
	
	
	
	if difficulties == 'expert' and curStep > 0 then
	i = i + 0.0001
	 setProperty('healthGain', 1)
	 function opponentNoteHit()
	 health = getProperty('health')
	 if not sustain and health > 1.1 - i then
        setProperty('health', health - 0.01 - i/50);
        end
end
	 
	if i > 1 then
	i = 1
	end
	end
    end