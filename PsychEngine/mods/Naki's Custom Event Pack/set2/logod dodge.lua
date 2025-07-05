function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
	
    precacheImage('spacebar');
    precacheSound('DODGE');
	precacheSound('logod_laser');
end

function onEvent(name, value1, value2)
    if name == "logod dodge" then
    --Get Dodge time
    DodgeTime = (value1);
	
    --Make Dodge Sprite
	makeLuaSprite('spacebar', 'hous/lobotomy/logodomy/DODGE', 50, 0);
	setObjectCamera('spacebar', 'hud');
    setObjectOrder('spacebar', 0)
	scaleLuaSprite('spacebar', 0.50, 0.50); 
    addLuaSprite('spacebar', true); 

    makeAnimatedLuaSprite('laser', 'hous/lobotomy/logodomy/logod_red_laser', -1750, -1225);
    luaSpriteAddAnimationByPrefix('laser', 'laser', 'logod_red_laser fire', 24, false);
    setBlendMode('laser', 'add')
	scaleLuaSprite('laser', 1, 1); 
	
	--Set values so you can dodge
    playSound('DODGE');
	canDodge = true;
	runTimer('Died', DodgeTime);
	
	end
end

function onUpdate()
   if canDodge == true and  getPropertyFromClass("flixel.FlxG","keys.justPressed.SPACE") then
   
   Dodged = true;
   doTweenX('weeeeee', 'boyfriend', 30, 0.85, 'quartOut')
   addLuaSprite('laser', true); 
   luaSpriteAddAnimationByPrefix('laser', 'laser', 'logod_red_laser fire', 24, false);
   runTimer('laserbyebye', 0.9)
   runTimer('picoreturn', 0.5)
   playSound('logod_laser', 0.7);
   characterPlayAnim('boyfriend', 'hey', true);
   setProperty('boyfriend.specialAnim', true);
   removeLuaSprite('spacebar');
   canDodge = false
   
   end
   local lol = math.random(1,8)
   if (lol >= 1) then
       doTweenAngle('tet', 'spacebar', -4, stepCrochet*0.00000000009, 'circOut')
   end
   if (lol >= 2) then
       doTweenAngle('tet', 'spacebar', -2, stepCrochet*0.00000000009, 'circOut')
   end
   if (lol >= 3) then
       doTweenAngle('tet', 'spacebar', 2, stepCrochet*0.00000000009, 'circOut')
   end
   if (lol >= 4) then
       doTweenAngle('tet', 'spacebar', 4, stepCrochet*0.00000000009, 'circOut')
   end
   if (lol >= 5) then
        doTweenAngle('tet', 'spacebar', 1, stepCrochet*0.00000000009, 'circOut')
    end
    if (lol >= 6) then
        doTweenAngle('tet', 'spacebar', -1, stepCrochet*0.00000000009, 'circOut')
    end
    if (lol >= 7) then
        doTweenAngle('tet', 'spacebar', 3, stepCrochet*0.00000000009, 'circOut')
    end
    if (lol >= 8) then
        doTweenAngle('tet', 'spacebar', -3, stepCrochet*0.00000000009, 'circOut')
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   setProperty('health', -500);
   elseif tag == 'Died' and Dodged == true then
   Dodged = false
   end
    if tag == 'laserbyebye' then
        removeLuaSprite('laser');
    elseif tag == 'picoreturn' then
        doTweenX('weee2eee', 'boyfriend', -470, 1.5, 'quartInOut')
    end
end