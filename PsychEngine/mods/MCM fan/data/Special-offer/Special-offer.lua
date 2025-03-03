function onCreate()
    
    song = 'Dehydrated'
    
    Delusional = 0
    
    freeplay = 1
    
    Camera = 385
    TextSize = 50
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
if keyJustPressed('UP') and TextSize < 100 then
TextSize = TextSize + 10
--setProperty('TextSize',TextSize+10)
playSound('scroll_Test');
end
if keyJustPressed('LEFT') then
freeplay = freeplay + -1
playSound('scroll_Test');
end
if keyJustPressed('RIGHT') then
freeplay = freeplay - -1
playSound('scroll_Test');
end
if keyJustPressed('DOWN') and TextSize > 10 then
TextSize = TextSize - 10
playSound('scroll_Test');
end
if freeplay < 1 and i ~= 0 then
freeplay = 17
end
if freeplay > 17 and i ~= 0 then
freeplay = 1
end

if freeplay == 1 then
text = 'The song that used to be called Sadness,\nObsolete because it was leaked'
by = 'Sandi'
song = 'Humiliation v1'
end
if freeplay == 2 then
text = 'The version used by module v1'
by = 'Sandi'
song = 'Humiliation v2'
end
if freeplay == 3 then
text = 'The version that should be used in module v2,\nbut due to leaks,\nit should no longer be used,\nBF doesn’t even have miss image'
by = 'Sublime(ft.Sandi)'
song = 'Humiliation v3'
end
if freeplay == 4 then
text = 'mcm predecessor Monday Morning Mist (mmm) version of mist\nIt was planned to appear as a bonus song until FLP was lost,\nalthough it was later discovered that FLP was not lost.'
by = '5th-gmj'
song = 'mist mmm'
end
if freeplay == 5 then
text ='Only minor differences from v2.'
by = 'Vruzzen'
song = 'mist v1'
end
if freeplay == 6 then
text = 'The story was supposed to end, \nbut due to the intervention of the boyfriend, \nSquidward death was delayed for a few minutes'
by = 'Vruzzen'
song = 'mist v2'
end
if freeplay == 7 then
text = 'Still playable in Friday Night Bloxxin(Roblox).\nUnused due to leaking\nAnd its never the first stage.'
by = 'Vruzzen'
song = 'doomsday v1'
end
if freeplay == 8 then
text = 'It was very surprising when I first saw it.\nIt can be said that it was the most anticipated song at that time.'
by = 'Vruzzen'
song = 'doomsday v2'
end
if freeplay == 9 then
text = 'Vruzzen has stated that this remaster of Doomsday is also unfinished. \nAs it lacks the guitar riffs for the finale. \nScrapped for unknown reasons.'
by = 'Vruzzen'
song = 'doomsday oldv2'
end
if freeplay == 9 then
text = 'Isn’t apart of the mod was only made for fun.\nThe name I gave this song in this mod has nothing to do with the original one,and it’s also a joke.'
by = 'poproxx(ft.Vruzzen)'
song = 'doomsday art'
end
if freeplay == 10 then
text = ''
by = ''
song = ''
end

    makeLuaText('sub4', freeplay, 0, 0, 0)
	setTextSize('sub4', 52.5);
	setObjectCamera('sub4', 'other')
	setTextAlignment('sub4', 'center')
	addLuaText('sub4')
	
	makeLuaText('TextSize', TextSiz, 1750, 0, 0)
	setTextSize('TextSize', 52.5);
	setObjectCamera('TextSize', 'other')
	setTextAlignment('TextSize', 'center')
	addLuaText('TextSize')
	
	makeLuaText('song', song, 1275, 0, 70)
	setTextSize('song', 52.5);
	--setTextFont('song', 52.5);
	setObjectCamera('song', 'other')
	setTextAlignment('song', 'center')
	addLuaText('song')
	
	makeLuaText('text', text, 1275, 0, 170)
	setTextSize('text', TextSize);
	setObjectCamera('text', 'other')
	setTextAlignment('text', 'left')
	addLuaText('text')
	setTextFont("text", 'vcr1.ttf')
	
	makeLuaText('by', by, 1275, 0, 570)
	setTextSize('by', 52.5);
	setObjectCamera('by', 'other')
	setTextAlignment('by', 'center')
	addLuaText('by')
end