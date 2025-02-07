	local allowCountdown = false
function onStartCountdown()
	if not allowCountdown then
		runTimer('startText', 0);
		allowCountdown = true;
		startCountdown();
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startText' then
		makeLuaSprite('blackscreen', 'blackscreen', 0, 0)
		makeGraphic('blackscreen', 1500, 1200, '000000')
		setObjectCamera('blackscreen', 'hud');
		addLuaSprite('blackscreen', true);
		makeLuaSprite('circle', 'circle', 1500, 230);
		setObjectCamera('circle', 'hud');
		setProperty('circle.color', getColorFromHex('EEF738'))
		addLuaSprite('circle', true);
		makeLuaText('text', 'Road Rage', 0, -350, 250)
        setTextFont('text', 'Krabby Patty.ttf')
        setTextSize('text', 100);
		setTextAlignment('text', 'left')
		setProperty('text.color', getColorFromHex('FFFFFF'))
        addLuaText('text')
		makeLuaText('act', 'FT. HASSENX', 0, -150, 420)
        setTextFont('act', 'Krabby Patty.ttf')	
        setTextSize('act', 50);
		setTextAlignment('act', 'left')
		setProperty('act.color', getColorFromHex('ffd1bd'))
        addLuaText('act')
		makeLuaText('actNumber', 'by WASSABISOJA', 0, -350, 380)
        setTextFont('actNumber', 'Krabby Patty.ttf')	
        setTextSize('actNumber', 50);
		setTextAlignment('actNumber', 'left')
		setProperty('actNumber.color', getColorFromHex('EE4FEA'))
        addLuaText('actNumber')
		runTimer('appear', 0.2, 1);
		runTimer('fadeout', 2.2, 2);
	elseif tag == 'appear' then
		doTweenX('circletween', 'circle', 500, 0.5, 'linear');
		doTweenX('texttween', 'text', 400, 0.5, 'linear');
		doTweenX('acttween', 'act', 550, 0.5, 'linear');
		doTweenX('actNumber', 'actNumber', 530, 0.5, 'linear');
	elseif tag == 'fadeout' then
		doTweenAlpha('circlefade', 'circle', 0, 0.5, 'linear');
		doTweenAlpha('textfade', 'text', 0, 0.5, 'linear');
		doTweenAlpha('blackfade', 'blackscreen', 0, 0.5, 'linear');
		doTweenAlpha('acttween', 'act', 0, 0.5, 'linear');
		doTweenAlpha('actNumber', 'actNumber', 0, 0.5, 'linear');
	end
end
