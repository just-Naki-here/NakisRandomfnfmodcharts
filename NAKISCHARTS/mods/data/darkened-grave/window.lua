local WindowDance = false
local SineElap = 0;
local windowx = 0;
local windowy = 0;
function onCreate()
	windowy = getPropertyFromClass("openfl.Lib", "application.window.y")
	windowx = getPropertyFromClass("openfl.Lib", "application.window.x")
end
function onPause()
	WindowDance = false 
end

function onResume()
	if curStep >= 3009 and curStep <= 3521 then
		WindowDance = true
	end
end
function onStepHit()
	if curStep >= 3009 and curStep <= 3521 then
		WindowDance = true
	end
	if curStep == 3522 then
		WindowDance = false 
	end
end
function onUpdatePost(elapsed)
	SineElap = SineElap + (elapsed * 3)
	if WindowDance == true then
		setPropertyFromClass('openfl.Lib', 'application.window.y', 100*math.sin(SineElap)/10+windowy)
		setPropertyFromClass('openfl.Lib', 'application.window.x', 100*math.cos(SineElap)/5+windowx)
	else
		setPropertyFromClass("openfl.Lib", "application.window.x", windowx)
		setPropertyFromClass("openfl.Lib", "application.window.y", windowy)
	end
end