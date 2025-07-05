--CODE I STOLE
function onCreate()
   precacheImage('jumpscare')
   precacheSound('cagaste')
end

function onEvent(name, value1, value2)
	if name == "NO MORE JUMPSCARE ! !" and value1 == '' then
		makeLuaSprite('image', 'jumpscare', 0, 0);
		scaleLuaSprite('image', 0.90, 0.90);
		addLuaSprite('image', true);
		setObjectCamera('image', 'other');
		runTimer('wait', 0.5);
		
		elseif name == "jumpscare" and value1 == '1' then
		playSound('cagaste');
		makeLuaSprite('image', 'jumpscare', 0, 0);
		addLuaSprite('image', true);
		setObjectCamera('image', 'other');
		runTimer('wait', 0.5);
		
	end
end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'wait' then
		doTweenAlpha('byebye', 'image', 1, 0.1, 'linear');
	end
end

function onTweenCompleted(tag)
	if tag == 'byebye' then
		removeLuaSprite('image', true);
	end
end



--OLD CODE BY MYSELF
--function onCreate()
    --precacheImage('jumpscare')
	--precacheSound('cagaste')
    --makeLuaSprite ('jumpscare', 'jumpscare', -900, -100);
	--scaleLuaSprite('jumpscare', 0.90, 0.90);
--end

--function onEvent(name, value1, value2)
--    if name == 'jumpscare' then
	--addLuaSprite('jumpscare', true);
	--setProperty('camHUD.visible', false)
	--cameraShake('camGame', 0.04, 0.40)
--	runTimer('time', 0.40, 20);
--	playSound('cagaste', 1)
	
--	end
--end

--function onTimerCompleted(tag, loops, loopsLeft)
 --   removeLuaSprite('jumpscare', false);
--	setProperty('camHUD.visible', true)
--end