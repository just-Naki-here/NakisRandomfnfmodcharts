-- dusttoybonnie: this only make the charac fade so yeah its cool 
function onEvent(name, value1, value2)
	if name == 'Player Fade' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end

		targetAlpha = tonumber(value2);
		if duration == 0 then
			setProperty('boyfriend.alpha', targetAlpha);
			setProperty('iconP2.alpha', targetAlpha);
		else
			doTweenAlpha('boyfriendFadeEventTween', 'boyfriend', targetAlpha, duration, 'linear');
			doTweenAlpha('iconBoyfriendFadeEventTween', 'iconP1', targetAlpha, duration, 'linear');
		end
		--debugPrint('Event triggered: ', name, duration, targetAlpha);
	end
end