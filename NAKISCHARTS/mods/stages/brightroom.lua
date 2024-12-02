
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	-- background shit
	makeLuaSprite('stairs', 'stairs', -720, 0);
	setScrollFactor('stairs', 0.7, 0.7);
	scaleObject('stairs', 0.6, 0.6);
	
	makeLuaSprite('room', 'room', -720, 0);
	setScrollFactor('room', 0.9, 0.9);
	scaleObject('room', 0.6, 0.6);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('brightchair', 'brightchair', -720, 0);
		setScrollFactor('brightchair', 0.9, 0.9);
		scaleObject('brightchair', 0.6, 0.6);

		makeLuaSprite('brighttable', 'brighttable', -650, 0);
		setScrollFactor('brighttable', 0.9, 0.9);
		scaleObject('brighttable', 0.6, 0.6);

		makeLuaSprite('brightdesk', 'brightdesk', -720, 0);
		setScrollFactor('brightdesk', 0.9, 0/9);
		scaleObject('brightdesk', 0.6, 0.6);

		makeLuaSprite('brightwall', 'brightwall', -650, 0);
		setScrollFactor('brightwall', 0.9, 0.9);
		scaleObject('brightwall', 0.6, 0.6);
		
		makeLuaSprite('jaidenythudzda', 'jaidenythudzda', -185, -102);
		setScrollFactor('jaidenythudzda', 0.0, 0.0);
		scaleObject('jaidenythudzda', 0.4, 0.4);
	end

	addLuaSprite('stairs', false);
	addLuaSprite('room', false);
	addLuaSprite('brightchair', true);
	addLuaSprite('brightdesk', true);
	addLuaSprite('brightwall', true);
	addLuaSprite('brighttable', true);
	addLuaSprite('jaidenythudzda', true);
end