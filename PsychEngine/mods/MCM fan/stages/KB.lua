function onCreate()
	-- background shit
        makeLuaSprite('KB', 'KB', -250, -840);
	setScrollFactor('KB', 1, 1);

       makeLuaSprite('KB2', 'KB2', -250, -840);
	setScrollFactor('KB2', 1, 1);

       makeLuaSprite('darkness', 'darkness', -250, -840);
	setScrollFactor('darkness', 1, 1);

        addLuaSprite('darkness', true);
        addLuaSprite('KB2', true);
        addLuaSprite('KB', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end