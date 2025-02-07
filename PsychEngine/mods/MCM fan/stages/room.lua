function onCreate()
	-- background shit
	makeLuaSprite('roomback', 'roomback', -700,-400);
	addLuaSprite('roomback', false);
	scaleLuaSprite('roomback',2.5,2.5);

	makeLuaSprite('roomfront', 'roomfront', -650,-330);
	addLuaSprite('roomfront',false);
	scaleLuaSprite('roomfront',1.88,1.88);
	
	
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end