
function onCreate()
	-- background shit
	makeLuaSprite('sky', 'background/outside/Humiliation BG', -2500,-1800);
	scaleLuaSprite('sky', 2.22222222, 2.22222222);
	setScrollFactor('sky', 1, 1);
	addLuaSprite('sky', false);
	
	makeAnimatedLuaSprite('Jellyfish','characters/MCM/Humiliation/Jellyfish', -720, -200)
    addLuaSprite('Jellyfish', false)
    scaleLuaSprite('Jellyfish', 2.6666666666, 2.6666666666);
	addAnimationByPrefix('Jellyfish','idle', 'crowd', 24, true)
    luaSpritePlayAnimation("Jellyfish", "idle")
    setProperty('Jellyfish.alpha', 0)
end

