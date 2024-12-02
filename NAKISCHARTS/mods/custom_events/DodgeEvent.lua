function onCreatePost()
    
	initSaveData('newoptions', 'Settings Savedata')
	pussymode = getDataFromSave('newoptions', 'indiecross')
    if pussymode then
        precacheImage('spacebar');
	    precacheSound('Dodged');
	    makeAnimatedLuaSprite('spacebar', 'spacebar', 400, 200);
        luaSpriteAddAnimationByPrefix('spacebar', 'spacebar', 'spacebar', 25, true);
	    luaSpritePlayAnimation('spacebar', 'spacebar');
	    setObjectCamera('spacebar', 'other');
	    scaleLuaSprite('spacebar', 0.50, 0.50); 
        addLuaSprite('spacebar', true); 
        setProperty('spacebar.visible', false)
	
        --variables
	    Dodged = false;
        canDodge = false;
        DodgeTime = 0;
    end
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent" and pussymode then
    --Get Dodge time
    DodgeTime = (value1);
	playSound('notice', 1.9);
	
    --Make Dodge Sprite
    setProperty('spacebar.visible', true)
	
	--Set values so you can dodge
	canDodge = true;
	runTimer('Died', DodgeTime);
	
	end
end


function onUpdate()
    shit = "SPACE"
    if botPlay then
        shit = "auto"
    else
        shit = "SPACE"
    end
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.'..shit) then
   if canDodge == true then
   
   Dodged = true;
   playSound('Dodged', 1);
   characterPlayAnim('boyfriend', 'dodge', true);
   setProperty('boyfriend.specialAnim', true);
   setProperty('spacebar.visible', false)
   canDodge = false
   
      end
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   setProperty('health', 0);
   
   elseif tag == 'Died' and Dodged == true then
   Dodged = false
   
   end
end