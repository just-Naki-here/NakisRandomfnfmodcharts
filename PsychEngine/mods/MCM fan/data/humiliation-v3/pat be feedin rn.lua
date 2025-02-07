function onCreatePost()

		
		makeLuaSprite('b', 'b1', -20, -10);
	scaleObject('b', 0.642, 0.642);
	setScrollFactor('b', 1, 1);
	setObjectOrder('b', 0);
    setObjectCamera('b', 'hud')
    setObjectOrder('b', 10)
    
    makeLuaSprite('black', 'b', 0, 0);
	setScrollFactor('black', 1, 1);
    setObjectCamera('black', 'other')
    setObjectOrder('black', 10)
    
    doTweenX('4', 'b.scale', 1.55, 0.0001, elapsed)
doTweenY('44', 'b.scale', 1.45, 0.0001, elapsed)
		--setProperty("coolhealthBar.antialiasing", true)
	end
	function onUpdatePost()
	setProperty('iconP1.x', 900)
        setProperty('iconP2.x', 225)
        setProperty('iconP1.scale.x', 0.85)
        setProperty('iconP2.scale.x', 0.85)
        setProperty('iconP1.scale.y', 0.85)
        setProperty('iconP2.scale.y', 0.85)
        if downscroll then
		setProperty('iconP1.y', 13)
        setProperty('iconP2.y', 13)
		end
		if not downscroll then
		setProperty('iconP1.y', 576)
        setProperty('iconP2.y', 576)
		end
	end
	function onStepHit()
	if curStep == 1 then
	doTweenZoom('screenZoom', 'camGame', 0.3, 19.2, 'ONESHOT');
    setProperty('defaultCamZoom', 0.325)
    doTweenAlpha('black', 'black', 0, 5, 'linear');
    end
if curStep == 128 then
doTweenY('44', 'b.scale', 1, 0.00001, 'quadInOut')
doTweenZoom('screenZoom', 'camGame', 0.55, 0.00001, 'circOut');
    setProperty('defaultCamZoom', 0.55)
end
if curStep == 160 then
    setProperty('defaultCamZoom', 0.45)
end
if curStep == 176 then
    setProperty('defaultCamZoom', 0.65)
end
if curStep == 184 then
    setProperty('defaultCamZoom', 0.55)
end
if curStep == 192 then
    setProperty('defaultCamZoom', 0.45)
end
if curStep == 224 then
    setProperty('defaultCamZoom', 0.55)
end
if curStep == 244 then
    setProperty('defaultCamZoom', 0.45)
end
if curStep == 248 then
doTweenY('44', 'b.scale', 0.64, 1, 'smoothstepin')
end
if curStep == 250 then
doTweenZoom('screenZoom', 'camGame', 0.7, 1, 'smoothstepin');
    setProperty('defaultCamZoom', 0.7)
end
if curStep == 256 then
doTweenY('44', 'b.scale', 1.45, 0.0001, elapsed)
doTweenZoom('screenZoom', 'camGame', 0.3, 0.000001, 'smoothstepin');
    setProperty('defaultCamZoom', 0.325)
end
if curStep == 320 then
    setProperty('defaultCamZoom', 0.375)
end
if curStep == 352 then
    setProperty('defaultCamZoom', 0.425)
end
if curStep == 368 then
    setProperty('defaultCamZoom', 0.375)
end
if curStep == 372 then
    setProperty('defaultCamZoom', 0.4)
end
if curStep == 376 then
    setProperty('defaultCamZoom', 0.45)
end
if curStep == 380 then
    setProperty('defaultCamZoom', 0.5)
end
if curStep == 384 then
    setProperty('defaultCamZoom', 0.4)
end
if curStep == 416 then
    setProperty('defaultCamZoom', 0.35)
end
if curStep == 448 then
    setProperty('defaultCamZoom', 0.45)
end
if curStep == 480 then
    setProperty('defaultCamZoom', 0.4)
end
if curStep == 512 then
doTweenY('44', 'b.scale', 1, 0.5, elapsed)
setProperty('defaultCamZoom', 0.55)
end
if curStep == 544 then
setProperty('defaultCamZoom', 0.6)
end
if curStep == 640 then
setProperty('defaultCamZoom', 0.7)
end
if curStep == 644 then
setProperty('defaultCamZoom', 0.35)
end
if curStep == 644 then
doTweenY('44', 'b.scale', 1.45, 0.0001, elapsed)
end
if curStep == 704 then
setProperty('defaultCamZoom', 0.4)
end
if curStep == 768 then
setProperty('defaultCamZoom', 0.5)
end
if curStep == 776 then
setProperty('defaultCamZoom', 0.4)
end
if curStep == 784 then
doTweenY('44', 'b.scale', 1, 0.0001, elapsed)
end
if curStep == 816 then
setProperty('defaultCamZoom', 0.45)
end
if curStep == 832 then
setProperty('defaultCamZoom', 0.475)
end
if curStep == 848 then
setProperty('defaultCamZoom', 0.4)
end
if curStep == 880 then
setProperty('defaultCamZoom', 0.45)
end
if curStep == 904 then
setProperty('defaultCamZoom', 0.5)
end
if curStep == 912 then
setProperty('defaultCamZoom', 0.35)
doTweenY('44', 'b.scale', 1.45, 0.0001, elapsed)
end
if curStep == 944 then
setProperty('defaultCamZoom', 0.4)
end
if curStep == 976 then
setProperty('defaultCamZoom', 0.375)
end
if curStep == 1008 then
setProperty('defaultCamZoom', 0.35)
end
if curStep == 1024 then
setProperty('defaultCamZoom', 0.55)
end
if curStep == 1032 then
doTweenY('44', 'b.scale', 0.64, 1, elapsed)
setProperty('defaultCamZoom', 0.75)
end
if curStep == 1040 then
doTweenY('44', 'b.scale', 1.45, 0.0001, elapsed)
setProperty('defaultCamZoom', 0.35)
end
if curStep == 1072 then
setProperty('defaultCamZoom', 0.4)
end
if curStep == 1088 then
setProperty('defaultCamZoom', 0.35)
end
if curStep == 1104 then
setProperty('defaultCamZoom', 0.4)
end
if curStep == 1120 then
setProperty('defaultCamZoom', 0.375)
end
if curStep == 1136 then
setProperty('defaultCamZoom', 0.35)
end

if curStep == 1152 then
setProperty('defaultCamZoom', 0.375)
end
if curStep == 1156 then
setProperty('defaultCamZoom', 0.4)
end
if curStep == 1160 then
setProperty('defaultCamZoom', 0.425)
end
if curStep == 1164 then
setProperty('defaultCamZoom', 0.5)
end
if curStep == 1168 then
for i = 0, 3 do
		setPropertyFromGroup('opponentStrums', i, 'x', -900);
	end

	setPropertyFromGroup('playerStrums', 0, 'x', 4140);
	setPropertyFromGroup('playerStrums', 1, 'x', 570);
	setPropertyFromGroup('playerStrums', 2, 'x', 6370);
	setPropertyFromGroup('playerStrums', 3, 'x', 7500);
	doTweenAlpha('hud', 'camHUD', 0, 5, 'linear');
	doTweenZoom('screenZoom', 'camGame', 0.35, 9, 'circOut');
    setProperty('defaultCamZoom', 0.35)
end
end