function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
	
    precacheImage('spacebar');
    precacheSound('DODGE');
	precacheSound('Dodged');
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent" then
    --Get Dodge time
    DodgeTime = (value1);
	
    --Make Dodge Sprite
	makeAnimatedLuaSprite('spacebar', 'spacebar', 400, 200);
    addAnimationByPrefix('spacebar', 'spacebar', 'spacebar', 25, true);
	playAnim('spacebar', 'spacebar');
	setObjectCamera('spacebar', 'other');
	scaleObject('spacebar', 0.50, 0.50); 
    addLuaSprite('spacebar', true); 
    addLuaScript('scripts_unloaded/fastbeat',false)
	
	--Set values so you can dodge
    playSound('DODGE');
	canDodge = true;
	runTimer('Died', DodgeTime);
	
	end
end

function onUpdate()
   if canDodge == true and keyJustPressed('space') then
   Dodged = true;
   playSound('Dodged', 0.7);
   playAnim('boyfriend', 'dodge', true);
   setProperty('boyfriend.specialAnim', true);
   playAnim('pibbymanipulationzda', 'dodge', true)
   removeLuaSprite('spacebar');
   canDodge = false
   triggerEvent('Add Camera Zoom', '0.3', '')
   removeLuaScript("scripts_unloaded/fastbeat", false)
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   setProperty('health', 0);
   
   elseif tag == 'Died' and Dodged == true then
   Dodged = false
   
   end
end
function onBeatHit()
    playAnim('spacebar', 'spacebar', true)
end