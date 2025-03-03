function onCreate()
    makeAnimatedLuaSprite('bg','background/canon/static_bg', 0, 0)
    addLuaSprite('bg', false)
    scaleLuaSprite('bg', 1, 1);
	addAnimationByPrefix('bg','idle', 'doors', 24, true)
    luaSpritePlayAnimation("bg", "idle")
    setObjectCamera('bg', 'camOther')
    doTweenAlpha('bg', 'bg', 0, 0.5, 'linear');

    makeLuaSprite('tv', 'tv-vmake', 0, 0);
    scaleObject('tv',1,1)
    screenCenter('tv')
    addLuaSprite('tv')
    setObjectCamera('tv', 'camOther')
    
    setProperty('iconP1.x', 0)
setProperty('iconP2.x', 550)
    
    makeLuaSprite('Dehydrated', 'freeplay/Dehydrated', 340, 200);
    scaleObject('Dehydrated',2.5,2.5)
    addLuaSprite('Dehydrated')
    
    makeLuaSprite('Delusional', 'freeplay/Delusional', -329, 200);
    scaleObject('Delusional',0.5,0.5)
    addLuaSprite('Delusional')
    
    makeLuaSprite('DeadHope', 'freeplay/DeadHope', 1130, 180);
    scaleObject('DeadHope',2.5,2.5)
    addLuaSprite('DeadHope')
    
    makeLuaSprite('doomsday', 'freeplay/doomsday', 1940, 200);
    scaleObject('doomsday',1.7,1.7)
    addLuaSprite('doomsday')
    
    makeLuaSprite('mist', 'freeplay/mist', 2540, 220);
    scaleObject('mist',0.8,0.8)
    addLuaSprite('mist')
    
    makeAnimatedLuaSprite('Dumped','freeplay/Dumped', 3130, 200)
    addLuaSprite('Dumped', false)
    scaleLuaSprite('Dumped', 0.675, 0.675);
	addAnimationByPrefix('Dumped','Dumped', 'Dumped', 12, true)
    luaSpritePlayAnimation("Dumped", "Dumped")
   
   makeAnimatedLuaSprite('Sanguilacrimae','freeplay/Sanguilacrimae', 3690, 205)
    addLuaSprite('Sanguilacrimae', false)
    scaleLuaSprite('Sanguilacrimae', 0.675, 0.675);
	addAnimationByPrefix('Sanguilacrimae','Sanguilacrimae', 'Sanguilacrimae', 24, true)
    luaSpritePlayAnimation("Sanguilacrimae", "Sanguilacrimae")
    
    makeAnimatedLuaSprite('Tortured','freeplay/Tortured', 4290, 205)
    addLuaSprite('Tortured', false)
    scaleLuaSprite('Tortured', 2.5, 2.5);
	addAnimationByPrefix('Tortured','Tortured', 'Tortured', 12, true)
    luaSpritePlayAnimation("Tortured", "Tortured")
   
    setProperty('cameraSpeed', 8000)
    
    song = 'Dehydrated'
    
    Delusional = 0
    
    freeplay = 1
    
    Camera = 385
   end
   
   a = 0
function onUpdate()
--setPropertyFromClass('Conductor', 'songPosition', a  ) -- 13.6
	--setPropertyFromClass('flixel.FlxG', 'sound.music.time', a)
	--setProperty('vocals.time', a)
if Delusional > 66 then
i = 0
freeplay = 99999999
song = 'Delusional'
setProperty('cameraSpeed', 9999)
end	
if keyJustPressed('UP') and freeplay ~= 7 then
freeplay = freeplay + 1
playSound('scroll_Test');
doTweenAlpha('bg1', 'bg', 1, 0.00001, 'linear');
doTweenAlpha('bg', 'bg', 0, 0.5, '');
end
if keyJustPressed('DOWN') and freeplay ~= 1 then
freeplay = freeplay - 1
playSound('scroll_Test');
doTweenAlpha('bg1', 'bg', 1, 0.00001, 'linear');
doTweenAlpha('bg', 'bg', 0, 0.5, '');
end
if freeplay < 1 and i ~= 0 then
freeplay = 1
end
if freeplay > 7 and i ~= 0 then
freeplay = 7
end

if 
i == 0 then
triggerEvent('Camera Follow Pos','0',Camera)
playMusic('freakyMenu', 0.8, true)
end
if freeplay == 1 then
triggerEvent('Camera Follow Pos','650',Camera)
song = 'Dehydrated-v2'
end
if freeplay == 2 then
triggerEvent('Camera Follow Pos','1550',Camera)
song = 'Dead-Hope'
end
if freeplay == 3 then
triggerEvent('Camera Follow Pos','2250',Camera)
song = 'doomsday-v2'
end
if freeplay == 4 then
triggerEvent('Camera Follow Pos','2850',Camera)
song = 'mist-v2'
end
if freeplay == 5 then
triggerEvent('Camera Follow Pos','3450',Camera)
song = 'Dumped'
end
if freeplay == 6 then
triggerEvent('Camera Follow Pos','4000',Camera)
song = 'Sanguilacrimae-v2'
end
if freeplay == 7 then
triggerEvent('Camera Follow Pos','4600',Camera)
song = 'Tortured-v2'
end

if keyJustPressed('right') and i == 0 then
loadSong('Delusional');
end
if keyJustPressed('right') and freeplay == 1 then
loadSong('Dehydrated-v2');
end
if keyJustPressed('right') and freeplay == 2 then
loadSong('Dead-Hope-v1');
end
if keyJustPressed('right') and freeplay == 3 then
loadSong('doomsday-v2','');
end
if keyJustPressed('right') and freeplay == 4 then
loadSong('mist-v2');
end
if keyJustPressed('right') and freeplay == 5 then
loadSong('Dumped-v2');
end
if keyJustPressed('right') and freeplay == 6 then
loadSong('Sanguilacrimae-v2');
end
if keyJustPressed('right') and freeplay == 7 then
loadSong('Tortured-v2');
end
    makeLuaText('sub4', freeplay, 0, 0, 0)
	setTextSize('sub4', 52.5);
	setObjectCamera('sub4', 'other')
	setTextAlignment('sub4', 'center')
	addLuaText('sub4')
	
	makeLuaText('song', song, 1275, 0, 70)
	setTextSize('song', 52.5);
	setObjectCamera('song', 'other')
	setTextAlignment('song', 'center')
	addLuaText('song')
	
	if keyJustPressed('left') then
Delusional = Delusional + 1
end

end