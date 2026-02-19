-- keyGetter getPropertyFromClass('flixel.FlxG', 'keys.justPressed.?')
function onCreate()
	--variables--
	py = 250
	px = 200 + 50
	pxb = 400 + 50
	pxc = 600 + 50
	pxd = 800 + 50
	k1 = 'n/a'
	k2 = 'n/a'
	k3 = 'n/a'
	k4 = 'n/a'
	stun = false
	finished = false
	counter = 0;
	
	--sprites--
	--key1
	makeLuaSprite('arrow1', 'zardy/arrow1', px, py);
	makeLuaSprite('arrow2', 'zardy/arrow2', px, py);
	makeLuaSprite('arrow3', 'zardy/arrow3', px, py);
	makeLuaSprite('arrow4', 'zardy/arrow4', px, py);
	--key2
	makeLuaSprite('arrowb1', 'zardy/arrow1', pxb, py);
	makeLuaSprite('arrowb2', 'zardy/arrow2', pxb, py);
	makeLuaSprite('arrowb3', 'zardy/arrow3', pxb, py);
	makeLuaSprite('arrowb4', 'zardy/arrow4', pxb, py);
	--key3
	makeLuaSprite('arrowc1', 'zardy/arrow1', pxc, py);
	makeLuaSprite('arrowc2', 'zardy/arrow2', pxc, py);
	makeLuaSprite('arrowc3', 'zardy/arrow3', pxc, py);
	makeLuaSprite('arrowc4', 'zardy/arrow4', pxc, py);
	--key4
	makeLuaSprite('arrowd1', 'zardy/arrow1', pxd, py);
	makeLuaSprite('arrowd2', 'zardy/arrow2', pxd, py);
	makeLuaSprite('arrowd3', 'zardy/arrow3', pxd, py);
	makeLuaSprite('arrowd4', 'zardy/arrow4', pxd, py);
	
	setObjectCamera('arrow1', 'other');
	setObjectCamera('arrow2', 'other');
	setObjectCamera('arrow3', 'other');
	setObjectCamera('arrow4', 'other');
		
	setObjectCamera('arrowb1', 'other');
	setObjectCamera('arrowb2', 'other');
	setObjectCamera('arrowb3', 'other');
	setObjectCamera('arrowb4', 'other');
		
	setObjectCamera('arrowc1', 'other');
	setObjectCamera('arrowc2', 'other');
	setObjectCamera('arrowc3', 'other');
	setObjectCamera('arrowc4', 'other');
		
	setObjectCamera('arrowd1', 'other');
	setObjectCamera('arrowd2', 'other');
	setObjectCamera('arrowd3', 'other');
	setObjectCamera('arrowd4', 'other');
	
	--new sprite system
	addLuaSprite('arrow1', true);
	addLuaSprite('arrow2', true);
	addLuaSprite('arrow3', true);
	addLuaSprite('arrow4', true);
	
	addLuaSprite('arrowb1', true);
	addLuaSprite('arrowb2', true);
	addLuaSprite('arrowb3', true);
	addLuaSprite('arrowb4', true);
	
	addLuaSprite('arrowc1', true);
	addLuaSprite('arrowc2', true);
	addLuaSprite('arrowc3', true);
	addLuaSprite('arrowc4', true);
	
	addLuaSprite('arrowd1', true);
	addLuaSprite('arrowd2', true);
	addLuaSprite('arrowd3', true);
	addLuaSprite('arrowd4', true);
	
	setProperty('arrow1.visible', false);
	setProperty('arrow2.visible', false);
	setProperty('arrow3.visible', false);
	setProperty('arrow4.visible', false);
	
	setProperty('arrowb1.visible', false);
	setProperty('arrowb2.visible', false);
	setProperty('arrowb3.visible', false);
	setProperty('arrowb4.visible', false);
	
	setProperty('arrowc1.visible', false);
	setProperty('arrowc2.visible', false);
	setProperty('arrowc3.visible', false);
	setProperty('arrowc4.visible', false);
	
	setProperty('arrowd1.visible', false);
	setProperty('arrowd2.visible', false);
	setProperty('arrowd3.visible', false);
	setProperty('arrowd4.visible', false);
end

function onEvent(n, v1, v2)
	if n == 'ZardyEvent' and stun == false then
	
	cameraFlash('other', '0xFFFFFF', '0.2');
	
	k1 = string.format('arrow%i', getRandomInt(1, 4, true));
	k2 = string.format('arrowb%i', getRandomInt(1, 4, true));
	k3 = string.format('arrowc%i', getRandomInt(1, 4, true));
	k4 = string.format('arrowd%i', getRandomInt(1, 4, true));
	
	k1v = (k1..'.visible')
	k2v = (k2..'.visible')
	k3v = (k3..'.visible')
	k4v = (k4..'.visible')
	
	--debugPrint(k1..' '.. k2 ..' '.. k3 ..' '.. k4 )
	
	hidePrevious();
	showArrows();
	startPressin();
	
	elseif n == 'ZardyEvent' and stun == true then
	setProperty('health', -500);
	end
end

function hidePrevious()
	setProperty(k1v, false);
	setProperty(k2v, false);
	setProperty(k3v, false);
	setProperty(k4v, false);
end

function showArrows()
	setProperty(k1v, true);
	setProperty(k2v, true);
	setProperty(k3v, true);
	setProperty(k4v, true);
	debugPrint(k1v);
end

function startPressin()
	setProperty('boyfriend.stunned', true);
	triggerEvent('Screen Shake', '', '0.1, 0.009');
	stun = true;
	finished = false;
end

function heDone()
	counter = 0;
	stun = false;
	finished = false;
	setProperty('boyfriend.stunned', false);
	hidePrevious()
end

function onUpdatePost()
	--KEY 1
	if stun == true and k1 == 'arrow1' and counter == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.LEFT') then
	counter = (counter + 1)
	setProperty(k1v, false);
	
	elseif stun == true and k1 == 'arrow2' and counter == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') then
	counter = (counter + 1)
	setProperty(k1v, false);
	
	elseif stun == true and k1 == 'arrow3' and counter == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') then
	counter = (counter + 1)
	setProperty(k1v, false);
	
	elseif stun == true and k1 == 'arrow4' and counter == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.RIGHT') then
	counter = (counter + 1)
	setProperty(k1v, false);
	
	--KEY 2
	elseif stun == true and k2 == 'arrowb1' and counter == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.LEFT') then
	counter = (counter + 1)
	setProperty(k2v, false);
	
	elseif stun == true and k2 == 'arrowb2' and counter == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') then
	counter = (counter + 1)
	setProperty(k2v, false);
	
	elseif stun == true and k2 == 'arrowb3' and counter == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') then
	counter = (counter + 1)
	setProperty(k2v, false);
	
	elseif stun == true and k2 == 'arrowb4' and counter == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.RIGHT') then
	counter = (counter + 1)
	setProperty(k2v, false);
	
	
	--KEY 3
	elseif stun == true and k3 == 'arrowc1' and counter == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.LEFT') then
	counter = (counter + 1)
	setProperty(k3v, false);
	
	elseif stun == true and k3 == 'arrowc2' and counter == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') then
	counter = (counter + 1)
	setProperty(k3v, false);
	
	elseif stun == true and k3 == 'arrowc3' and counter == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') then
	counter = (counter + 1)
	setProperty(k3v, false);
	
	elseif stun == true and k3 == 'arrowc4' and counter == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.RIGHT') then
	counter = (counter + 1)
	setProperty(k3v, false);
	
	
	--KEY 4 (FINAL KEY)
	elseif stun == true and k4 == 'arrowd1' and counter == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.LEFT') then
	counter = (counter + 1)
	setProperty(k4v, false);
	finished = true;
	
	elseif stun == true and k4 == 'arrowd2' and counter == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') then
	counter = (counter + 1)
	setProperty(k4v, false);
	finished = true;
	
	elseif stun == true and k4 == 'arrowd3' and counter == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') then
	counter = (counter + 1)
	setProperty(k4v, false);
	finished = true;
	
	elseif stun == true and k4 == 'arrowd4' and counter == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.RIGHT') then
	counter = (counter + 1)
	setProperty(k4v, false);
	finished = true;
	
	elseif finished == true then
	heDone();
	end
end