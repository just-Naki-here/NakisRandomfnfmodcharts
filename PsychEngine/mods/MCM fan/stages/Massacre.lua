function onCreate()
	-- background shit
	makeLuaSprite('Back', 'background/massacre/Back', -300, -50);
	setScrollFactor('Back', 1, 1);
	setProperty('back.antialiasing', false)
if not lowQuality then
	makeLuaSprite('Hooks', 'background/massacre/Hooks', -300, -50);
	setScrollFactor('Hooks', 0.9, 0.9);
	setProperty('hooks.antialiasing', false)
end
	
	scaleObject('Back', 2, 2)
if not lowQuality then
	scaleObject('Hooks', 2, 2)
end
if not lowQuality then
	addLuaSprite('Hooks', true);
end
	addLuaSprite('Back', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
