function onCreate()
	-- Phase 1
	-- voy a usar el mismo stage para los dos satisfaction xd
	setProperty('gfGroup.visible', false);
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfmc-dead');
	
	makeLuaSprite('background', 'background/satisfaction/light', -700,-400);
	makeLuaSprite('kitchen', 'background/satisfaction/kitchen', -700,-400);
	if not lowQuality then
	makeLuaSprite('krabs', 'background/satisfaction/characters/krabs', 1300, -100);
	makeLuaSprite('light', 'background/satisfaction/light/light', -700,-400);
	makeLuaSprite('squidwardLight', 'background/satisfaction/light/squidwardLight', -700,-400);
	end
	
	scaleLuaSprite('krabs', 2.6, 2.6);
	scaleLuaSprite('kitchen', 2, 2);
	
	scaleLuaSprite('background', 2, 2);
	
	scaleLuaSprite('light', 2, 2);
	scaleLuaSprite('squidwardLight', 2, 2);

	addLuaSprite('background', false);
	addLuaSprite('kitchen', false);
	if not lowQuality then
	addLuaSprite('krabs', false);
	addLuaSprite('light', true);
	addLuaSprite('squidwardLight', true);
	end
	
	setProperty('squidwardLight.alpha', 0.00001);
	
	-- Squidward (Both Animations)
	if not lowQuality then
	makeAnimatedLuaSprite('squidward','background/satisfaction/characters/mc_squidfart', 700, -380)
	scaleLuaSprite('squidward', 2.2, 2.2);
	addAnimationByPrefix('squidward','idle', 'idle', 24, true)
	addAnimationByPrefix('squidward','hey', 'hey', 24, true)
	addLuaSprite('squidward', false);
	setProperty('squidward.alpha', 0.00001);

	makeAnimatedLuaSprite('squidward2','background/satisfaction/characters/mc_squidfart', 780, -330)
	scaleLuaSprite('squidward2', 2.2, 2.2);
	addAnimationByPrefix('squidward2','idle', 'idle', 24, true)
	addLuaSprite('squidward2', false);
	setProperty('squidward2.alpha', 0.00001);
	end
	
	-- Phase 2
	makeLuaSprite('standoff', 'background/satisfaction/front/standoff', -700,-400);
	if not lowQuality then
	makeLuaSprite('frontlight', 'background/satisfaction/front/light', -700,-400);
	end
	
	scaleLuaSprite('standoff', 2, 2);
	scaleLuaSprite('frontlight', 2, 2);

	addLuaSprite('standoff', false);
	if not lowQuality then
	addLuaSprite('frontlight', true);
	end
	
	setProperty('standoff.visible', false);	
	setProperty('frontlight.visible', false);	
end

