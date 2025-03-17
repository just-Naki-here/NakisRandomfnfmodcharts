local isCanPaused = true
local button = 1
local buttonMax = 4

-- should to 
function onUpdatePost()
    if keyJustPressed('pause') and isCanPaused then
        openCustomSubstate('gorePause', true)
		playSound('UIMetalHit', 1)
        pauseMusic = 'menuLOOP'
    end
end

--bai bai old shitty pause
function onPause()
    return Function_Stop
end

--other shit

function onGameOver()
    closeCustomSubstate('pauseMenu')
end

function onGameOverStart()
    isCanPaused = false
	closeCustomSubstate('pauseMenu')
end

function onSoundFinished(tag)
    if tag == pauseMusic then
        playSound(pauseMusic, 1, pauseMusic)
    end
end

function onCustomSubstateCreatePost(tag)
	if tag == 'gorePause' then
		playSound(pauseMusic, 0, pauseMusic)
        soundFadeIn(pauseMusic, 5, 0, 1)

		makeLuaSprite('bg', '', 0, 0)
        makeGraphic('bg', 1280, 720, '000000')
        setObjectCamera('bg', 'other')
        setProperty('bg.alpha', 0)
        addLuaSprite('bg', true)

        doTweenAlpha('BGISFADING', 'bg', 0.6, 0.4, 'quartInOut')

		makeLuaSprite('blackbar', '', 0, -50)
		makeGraphic('blackbar',3500,55,'000000')
        setObjectCamera('blackbar', 'other')
        addLuaSprite('blackbar', true)
        doTweenY('blackbarthings', 'blackbar', 0, 0.4, 'quartOut')
		
		makeLuaSprite('blackbardos', '', 0, 720)
		makeGraphic('blackbardos',3500,55,'000000')
        setObjectCamera('blackbardos', 'other')
        addLuaSprite('blackbardos', true)
        doTweenY('blackbarthingsdos', 'blackbardos', 670, 0.4, 'quartOut')

        makeLuaText('levelInfo', '♪ ~ Currently Playing: ' .. songName, 300, screenWidth - 310, 10)
		setTextAlignment('levelInfo', 'right')
		setTextColor('levelInfo', 'd4d4d4')
		setTextFont('levelInfo', 'ARIAL.TTF')
		setTextSize('levelInfo', 20)
		setTextBorder('levelInfo', 0, 'd4d4d4')
		addLuaText('levelInfo')
		setObjectCamera('levelInfo', 'other')
		setProperty('levelInfo.alpha', 0)
		startTween('levelInfoTween', 'levelInfo', {alpha = 1, y = getProperty('levelInfo.y') + 5}, 0.4, {ease = 'quartInOut', startDelay = '0.3 * 2'})
		
		makeLuaText('diffInfo', difficultyName, 300, getProperty('levelInfo.x'), getProperty('levelInfo.y') + 50)
		setTextFont('diffInfo', 'rain-world-menu.ttf')
		setTextSize('levelInfo', 20)
		setTextBorder('levelInfo', 0, 'FFFFFF')
		setTextAlignment('diffInfo', 'right')
		addLuaText('diffInfo')
		setObjectCamera('diffInfo', 'other')
		setProperty('diffInfo.alpha', 0)
		startTween('diffInfoTween', 'diffInfo', {alpha = 1, y = getProperty('diffInfo.y') + 5}, 0.4, {ease = 'quartInOut', startDelay = '0.6 * 2'})

		makeLuaText('deathCount', 'Cycle #  ' .. getPropertyFromClass('states.PlayState', 'deathCounter'), 300, getProperty('diffInfo.x'), getProperty('diffInfo.y') + 30)
		setTextFont('deathCount', 'rain-world-menu.ttf')
		setTextSize('levelInfo', 20)
		setTextBorder('levelInfo', 0, 'FFFFFF')
		setTextAlignment('deathCount', 'right')
		addLuaText('deathCount')
		setObjectCamera('deathCount', 'other')
		setProperty('deathCount.alpha', 0)
		startTween('deathCountTween', 'deathCount', {alpha = 1, y = getProperty('deathCount.y') + 5}, 0.4, {ease = 'quartInOut', startDelay = '0.8 * 2'})

		-- BUTTONS!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		makeLuaSprite('buttonresume','pause/RESUME', 1150, 679)
		setProperty('buttonresume.alpha',0)
		doTweenAlpha('buttonfadein', 'buttonresume', 0.6, 0.5,'circIn')
		scaleObject('buttonresume',0.8,0.8)
		addLuaSprite('buttonresume',true)
		setProperty('buttonresume.antialiasing', false)
		setObjectCamera('buttonresume', 'other')
				setProperty('buttonresume.scale.y', 0.83)
				setProperty('buttonresume.scale.x', 0.83)
				
		makeLuaSprite('buttonrestart','pause/RESTART', getProperty('buttonresume.x') - 120, 679)
		setProperty('buttonrestart.alpha',0)
		doTweenAlpha('button2fadein', 'buttonrestart', 0.6, 0.6,'circIn')
		scaleObject('buttonrestart',0.8,0.8)
		addLuaSprite('buttonrestart',true)
		setProperty('buttonrestart.antialiasing', false)
		setObjectCamera('buttonrestart', 'other')
		
		makeLuaSprite('buttonoptions','pause/OPTIONS', getProperty('buttonrestart.x') - 120, 679)
		setProperty('buttonoptions.alpha',0)
		doTweenAlpha('button3fadein', 'buttonoptions', 0.6, 0.7,'circIn')
		scaleObject('buttonoptions',0.8,0.8)
		addLuaSprite('buttonoptions',true)
		setProperty('buttonoptions.antialiasing', false)
		setObjectCamera('buttonoptions', 'other')
		
		makeLuaSprite('buttonexit','pause/EXIT', getProperty('buttonoptions.x') - 120, 679)
		setProperty('buttonexit.alpha',0)
		doTweenAlpha('button4fadein', 'buttonexit', 0.6, 0.8,'circIn')
		scaleObject('buttonexit',0.8,0.8)
		addLuaSprite('buttonexit',true)
		setProperty('buttonexit.antialiasing', false)
		setObjectCamera('buttonexit', 'other')
		
		makeLuaSprite('button','pause/button', 120, 140)
		scaleObject('button',0.38,0.38)
		addLuaSprite('button',true)
		setProperty('button.alpha',0)
		doTweenAlpha('buttonhi', 'button', 1, 0.8,'quartInOut')
		setProperty('button.antialiasing', false)
		setObjectCamera('button', 'other')
	end
end

--updating pause wtf

function onCustomSubstateUpdate(tag)
	if tag == 'gorePause' then
		if keyJustPressed('accept') then
            if button == 1 then
        		stopSound(pauseMusic)
				playSound('UIWood1', 1)
				runTimer('getridofthepause',0.5)
				doTweenAlpha('buttonfadein', 'buttonresume', 0, 0.5,'circOut')
				doTweenAlpha('button2fadein', 'buttonrestart', 0, 0.5,'circOut')
				doTweenAlpha('button3fadein', 'buttonoptions', 0, 0.5,'circOut')
				doTweenAlpha('button4fadein', 'buttonexit', 0, 0.5,'circOut')
				doTweenAlpha('levelInfobye', 'levelInfo', 0, 0.5,'circOut')
				doTweenAlpha('buttonbye', 'button', 0, 0.5,'circOut')
				doTweenAlpha('diffInfoBye', 'diffInfo', 0, 0.5,'circOut')
				doTweenAlpha('deathCountbye', 'deathCount', 0, 0.5,'circOut')
				doTweenAlpha('bgBYEIDIOT', 'bg', 0, 0.5,'circOut')
				doTweenY('byeblackbarthingsdos', 'blackbardos', 720, 0.5, 'quartOut')
				doTweenY('byeblackbarthings', 'blackbar', -50, 0.5, 'quartOut')
				
    		elseif button == 2 then
        		stopSound(pauseMusic)
				playSound('UIWood1', 1)
        		restartSong()
    		elseif button == 3 then
        		stopSound(pauseMusic)
				playSound('UIWood1', 1)
        		runHaxeCode([[
   	 				import options.OptionsState;
  	  				import backend.MusicBeatState;
  	  				game.paused = true;
 	   				game.vocals.volume = 0;
  	  				MusicBeatState.switchState(new OptionsState());
  	  				if (ClientPrefs.data.pauseMusic != 'None') {
    	    			FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.data.pauseMusic)), game.modchartSounds('pauseMusic').volume);
    	    			FlxTween.tween(FlxG.sound.music, {volume: 1}, 0.8);
      	    			FlxG.sound.music.time = game.modchartSounds('pauseMusic').time;
    	  			}
    				OptionsState.onPlayState = true;
				]])
    		elseif button == 4 then
        		stopSound(pauseMusic)
				playSound('UIWood1', 1)
        		exitSong()
    		end
        end

		if keyJustPressed('left') and button ~= buttonMax then
        	button = button + 1
        	playSound('UIMetal1', 1)
    	elseif keyJustPressed('left') and button == buttonMax then
        	button = 1
        	playSound('UIMetal1', 1)
    	elseif keyJustPressed('right') and button ~= 1 then
        	button = button - 1
        	playSound('UIMetal1', 1)
    	elseif keyJustPressed('right') and button == 1 then
        	button = buttonMax
        	playSound('UIMetal1', 1)
    	end

		if keyJustPressed('left') or keyJustPressed('right') then
        	if button == 1 then
				setProperty('buttonresume.alpha',1)
				doTweenAlpha('buttonfadein2', 'buttonrestart', 0.6, 0.05,'linear')
				doTweenAlpha('buttonfadein3', 'buttonoptions', 0.6, 0.05,'linear')
				doTweenAlpha('buttonfadein4', 'buttonexit', 0.6, 0.05,'linear')
				
				setProperty('buttonresume.scale.y', 0.83)
				setProperty('buttonresume.scale.x', 0.83)
				setProperty('buttonrestart.scale.y', 0.8)
				setProperty('buttonrestart.scale.x', 0.8)
				setProperty('buttonoptions.scale.y', 0.8)
				setProperty('buttonoptions.scale.x', 0.8)
				setProperty('buttonexit.scale.y', 0.8)
				setProperty('buttonexit.scale.x', 0.8)

        	elseif button == 2 then
        		doTweenX('restartLeft', 'restartSpr', 5, 0.25, 'cubeOut')
				doTweenAlpha('buttonfadein', 'buttonresume', 0.6, 0.05,'linear')
				setProperty('buttonrestart.alpha',1)
				doTweenAlpha('buttonfadein3', 'buttonoptions', 0.6, 0.05,'linear')
				doTweenAlpha('buttonfadein4', 'buttonexit', 0.6, 0.05,'linear')
				
				setProperty('buttonresume.scale.y', 0.8)
				setProperty('buttonresume.scale.x', 0.8)
				setProperty('buttonrestart.scale.y', 0.83)
				setProperty('buttonrestart.scale.x', 0.83)
				setProperty('buttonoptions.scale.y', 0.8)
				setProperty('buttonoptions.scale.x', 0.8)
				setProperty('buttonexit.scale.y', 0.8)
				setProperty('buttonexit.scale.x', 0.8)
        		
        	elseif button == 3 then
				doTweenAlpha('buttonfadein', 'buttonresume', 0.6, 0.05,'linear')
				doTweenAlpha('buttonfadein2', 'buttonrestart', 0.6, 0.05,'linear')
				setProperty('buttonoptions.alpha',1)
				doTweenAlpha('buttonfadein4', 'buttonexit', 0.6, 0.05,'linear')
        	   	doTweenX('resumeLeft', 'optionsSpr', 5, 0.25, 'cubeOut')
				
				setProperty('buttonresume.scale.y', 0.8)
				setProperty('buttonresume.scale.x', 0.8)
				setProperty('buttonoptions.scale.y', 0.83)
				setProperty('buttonoptions.scale.x', 0.83)
				setProperty('buttonrestart.scale.y', 0.8)
				setProperty('buttonrestart.scale.x', 0.8)
				setProperty('buttonexit.scale.y', 0.8)
				setProperty('buttonexit.scale.x', 0.8)
				
        	elseif button == 4 then
				doTweenAlpha('buttonfadein', 'buttonresume', 0.6, 0.05,'linear')
				doTweenAlpha('buttonfadein2', 'buttonrestart', 0.6, 0.05,'linear')
				setProperty('buttonexit.alpha',1)
				doTweenAlpha('buttonfadein3', 'buttonoptions', 0.6, 0.05,'linear')
        	    doTweenX('exitLeft', 'exitToMenu', 5, 0.25, 'cubeOut')
				
				setProperty('buttonresume.scale.y', 0.8)
				setProperty('buttonresume.scale.x', 0.8)
				setProperty('buttonexit.scale.y', 0.83)
				setProperty('buttonexit.scale.x', 0.83)
				setProperty('buttonrestart.scale.y', 0.8)
				setProperty('buttonrestart.scale.x', 0.8)
				setProperty('buttonoptions.scale.y', 0.8)
				setProperty('buttonoptions.scale.x', 0.8)
        	end
    	end
	end
end

--deleting buttons, text and garfield 😭😭😭
function onTimerCompleted(tag, _, loopsLeft)
    if tag == 'getridofthepause' then
	deleteObjects()
	end
end

function deleteObjects()
	for _, sprite in ipairs({'bg', 'buttonexit', 'buttonrestart', 'buttonoptions', 'buttonresume', 'blackbar','blackbardos','button'}) do
		removeLuaSprite(sprite, true)
	end

	for _, text in ipairs({'levelInfo', 'diffInfo', 'deathCount'}) do
		removeLuaText(text, true)
	end
	closeCustomSubstate('gorePause')
end