function onCreate()
    precacheImage('flash')
	precacheSound('flashed')
    makeLuaSprite('flash', 'flash', -100, -200);
	scaleLuaSprite('flash', 10, 10);
end

function onEvent(name, value1, value2)
    if name == 'flashbang' then
	playSound('flashed', 0.6)
	addLuaSprite('flash', true);
	setProperty('camHUD.alpha', 0.20)
	runTimer('absd', 3, 20)
	end
end

function onTimerCompleted(tag, loop, loopsLeft)
    setProperty('camHUD.alpha', 1);
	removeLuaSprite('flash', false)
end