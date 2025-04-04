function onCreate()
	-- background shit
	makeLuaSprite('bitter', 'stages/bitter/bitter', -230, -300);
	setScrollFactor('bitter', 0.9, 0.9);

	addLuaSprite('bitter', false);
	
end

function onStepHit()
	if curStep == 4028 then
		doTweenAlpha('bye', 'camHUD', 0, 0.5, 'linear');
		addLuaScript('scripts_unloaded/tryagain')
		close(true)
	end
end