function onCreate()
	-- background shit
	makeLuaSprite('blackscreen', 'characters/blackscreen', 0, 0);
	setObjectCamera("blackscreen", "other")
	addLuaSprite('blackscreen', true);
	makeLuaSprite('manip', 'stages/manip/manip', -230, -300);
	setScrollFactor('manip', 0.9, 0.9);
	addLuaSprite('manip', false);
	makeAnimatedLuaSprite('pibbymanipulationzda', 'stages/manip/pibbymanipulationzda', 530, 180);
	scaleObject('pibbymanipulationzda', 0.8, 0.8);
	addAnimationByPrefix('pibbymanipulationzda', 'idle', 'pibbymanipulationzda idlenormal',20,false)
	addLuaSprite('pibbymanipulationzda', false);
	precacheImage('pibbymanipulationzda')
	precacheImage('corruption vig')
end
	function onStepHit()
		if curStep == 1 then
			doTweenAlpha('AlphaTween', 'blackscreen', 0, 3, 'linear');
		end 
		if curStep == 256 then
			doTweenAlpha('hudalpha', 'camHUD', 0, 0.1, 'linear');
		end
		if curStep == 415 then
			doTweenAlpha('hudalpha', 'camHUD', 1 , 0.1, 'linear');
		end
    if curStep == 415 then
		precacheImage('pibbymanipulationzda')
		addAnimationByPrefix('pibbymanipulationzda', 'idle', 'pibbymanipulationzda idlescared',20,false)
		addLuaSprite('pibbymanipulationzda', false);
	end
	if curStep == 1311 then
		doTweenAlpha('hudalpha', 'camHUD', 0, 0.1, 'linear');
	end
		if curStep == 1439 then
			doTweenAlpha('hudalpha', 'camHUD', 1, 0.1, 'linear');
			precacheImage('pibbymanipulationzda')
			scaleObject('pibbymanipulationzda', 0.8, 0.8);
			addAnimationByPrefix('pibbymanipulationzda', 'idle', 'pibbymanipulationzda idlesword',20,false)
			addAnimationByPrefix('pibbymanip', 'dodge', 'pibbymanipulationzda dodge',20,true)
			addLuaSprite('pibbymanipulationzda', false);
		end
    end
	
	function onBeatHit()
		playAnim('pibbymanipulationzda', 'idle', false);
	  end