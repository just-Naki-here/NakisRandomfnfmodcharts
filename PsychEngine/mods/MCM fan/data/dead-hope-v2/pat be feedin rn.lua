function onCreatePost()
		
		makeLuaSprite('light', 'background/deadhope-Room/light', -1050, -350)
	scaleLuaSprite('light', 0.8, 0.8);
	addLuaSprite('light', false)
		
		setObjectOrder('light', 11)
		
		
		--setProperty("coolhealthBar.antialiasing", true)
		
	
	initLuaShader("bloom")
 
  
  
  --setProperty('light.color', '#FFFFFFFF')
	end
 
	function onUpdatePost()
	setProperty('iconP1.x', 900)
        setProperty('iconP2.x', 225)
        setProperty('iconP1.scale.x', 0.85)
        setProperty('iconP2.scale.x', 0.75)
        setProperty('iconP1.scale.y', 0.85)
        setProperty('iconP2.scale.y', 0.75)
        setSpriteShader('light',"bloom")
        
        if curBeat % getRandomInt(1,0.2) == 0 then
        doTweenAlpha('light','light',getRandomInt(1,0.15),1)
       end
       setShaderFloat("light", "u_samples", os.clock())
	end
	function onUpdate(elapsed)
	songPos = getSongPosition()
	local currentBeat = (songPos/2000)

	doTweenY('1', 'dad', 350 - 100*math.sin((currentBeat+2*0.1)*math.pi), 2)
	doTweenY('2', 'gf', 260 + 100*math.sin((currentBeat+4*0.2)*math.pi), 2)
	doTweenX('3', 'dad', -270 - 25*math.sin((currentBeat+4*0.1)*math.pi), 0.00001)
	doTweenX('4', 'gf', 800 + 25*math.sin((currentBeat+4*0.2)*math.pi), 0.00002)
	for i=0,4,1 do
		setPropertyFromGroup('opponentStrums', i, 'visible', false)
	end
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then	
			setPropertyFromGroup('unspawnNotes', i, 'visible', false); --Change texture
			end
		end
end