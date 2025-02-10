--DIGA BYE BYE
function onEvent(name, value1, value2)
	if name == 'mari disappear' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end

		targetAlpha = tonumber(value2);
		if duration == 0 then
			getProperty('dad.alpha');
			setProperty('dad.alpha', targetAlpha);
			getProperty('iconP2.alpha');
			setProperty('iconP2.alpha', targetAlpha);
		else
			doTweenAlpha('dadFadeEventTween', 'dad', targetAlpha, duration, 'quadOut');
			doTweenAlpha('iconDadFadeEventTween', 'iconP2', targetAlpha, duration, 'quadOut');
		end
	end
end