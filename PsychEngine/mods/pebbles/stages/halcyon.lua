function onCreatePost()
	-- background shit
	makeLuaSprite('AI', 'halcyon/pebsi_room1', -300, -800);
	makeLuaSprite('AI_angry', 'halcyon/pebsi_room2', -300, -800);
	makeLuaSprite('1AI', 'halcyon/pebsi_roomA1', -300, -800);
	makeLuaSprite('1AI_angry', 'halcyon/pebsi_roomA2', -300, -800);
	makeLuaSprite('dark', 'halcyon/vignette', 0, 0);
	setObjectCamera('dark', 'other')
	addLuaSprite('AI', false)
	addLuaSprite('AI_angry', false)
	addLuaSprite('1AI', false)
	addLuaSprite('1AI_angry', false)
	setProperty('AI_angry.alpha', 0)
	addLuaSprite('dark', false)
	setObjectOrder('dark',1)
	setObjectOrder('1AI_angry',getObjectOrder('1AI') - 1)
	setProperty('gf.visible', false)
	
	makeAnimatedLuaSprite('scugdetect','halcyon/scugdetect', 1010, -100)
		addAnimationByPrefix('scugdetect','scugdetect','scugdetect',5,true);
		addAnimationByPrefix('scugdetect','scugremove','scugremove',24,false);
		objectPlayAnimation('scugdetect','scugdetect',true);
	addLuaSprite('scugdetect',false)
	setProperty('scugdetect.antialiasing', false)
	setProperty('scugdetect.alpha', 0.7)
	
	makeAnimatedLuaSprite('microphone','halcyon/microphone', 1880, -100)
		addAnimationByPrefix('microphone','micdetect','micdetect',24,true);
	addLuaSprite('microphone',false)
	setProperty('microphone.antialiasing', false)
	setProperty('microphone.alpha', 0)
	
	makeAnimatedLuaSprite('strangescribbles','halcyon/strangescribbles', 1550, -110)
		addAnimationByPrefix('strangescribbles','pissed','pissed',24,false);
	addLuaSprite('strangescribbles',false)
	setProperty('strangescribbles.antialiasing', false)
	setProperty('strangescribbles.alpha', 0)
	
	makeAnimatedLuaSprite('iteratorstructure','halcyon/iteratorstructure', 450, -110)
		addAnimationByPrefix('iteratorstructure','tbh','tbh',24,false);
	addLuaSprite('iteratorstructure',false)
	setProperty('iteratorstructure.antialiasing', false)
	setProperty('iteratorstructure.alpha', 0)
	
	makeAnimatedLuaSprite('bfwikipedia','halcyon/bfwikipedia', 750, -110)
		addAnimationByPrefix('bfwikipedia','tbh lore','tbh lore',24,false);
	addLuaSprite('bfwikipedia',false)
	setProperty('bfwikipedia.antialiasing', false)
	setProperty('bfwikipedia.alpha', 0)

end