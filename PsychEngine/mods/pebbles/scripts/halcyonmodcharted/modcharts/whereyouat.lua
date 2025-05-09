function onCreate()
    debugPrint("whereyouat script is loaded")
end
function onCreatePost()
	makeLuaSprite('blackbarforthemusic', '', 0, 720)
	makeGraphic('blackbarforthemusic',3500,55,'000000')
    setObjectCamera('blackbarforthemusic', 'other')
    addLuaSprite('blackbarforthemusic', true)
	
	makeLuaText('whereyouat', '♪ ~ ' .. songName .. " - Five Pebbles", 400, -140, 690)
	setTextAlignment('whereyouat', 'right')
	setTextColor('whereyouat', 'd4d4d4')
	setTextFont('whereyouat', 'ARIAL.TTF')
	setTextSize('whereyouat', 20)
	setTextBorder('whereyouat', 0, 'd4d4d4')
	addLuaText('whereyouat')
	setObjectCamera('whereyouat', 'other')
	setProperty('whereyouat.antialiasing', false)
	setProperty('whereyouat.alpha',0)
	setProperty('camHUD.alpha',0)
end

function onUpdate()
	if curStep == 10 then
		doTweenY('blackbarforthemusichiiiii', 'blackbarforthemusic', 685, 0.4, 'quartOut')
	end
	if curStep == 14 then
		doTweenAlpha('hiiiwhereyou', 'whereyouat', 1, 0.4, 'quartOut')
		runTimer('youhave20secondstolive',6)
	end
end

function onTimerCompleted(tag, _, loopsLeft)
    if tag == 'youhave20secondstolive' then
	doTweenAlpha('byebyewhereyouat', 'whereyouat', 0, 0.2, 'quartOut')
	doTweenY('blackbarforthemusicbyeeee', 'blackbarforthemusic', 720, 0.7, 'quartOut')
	doTweenAlpha('thehudisbackyeye','camHUD',1,0.7,'quartOut')
	end
end