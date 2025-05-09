function onCreate()
    debugPrint("imwarningyou script is loaded")
end
local buttstons = 1
local buttstonsMax = 3
local scalebuttones = 0.93
local botonesnorman = 0.88
local whyes = 460
local alphawolf = 0.5

function onSongStart()
openCustomSubstate('warning', true)
end

function onCustomSubstateCreate(tag)
	if tag == 'warning' then
		playSound('notif')
		makeLuaSprite('WarningText', 'shared/warningwindow/Warn', 0, 0)
		addLuaSprite('WarningText', false)
		setObjectOrder('WarningText',0)
		setObjectCamera('WarningText', 'camOther')
		
		makeLuaSprite('GlowWarningText', 'shared/warningwindow/Warn', 0, 0)
		addLuaSprite('GlowWarningText', false)
		setObjectCamera('GlowWarningText', 'camOther')
		setSpriteShader('GlowWarningText', 'bloom')
		setObjectOrder('GlowWarningText',getObjectOrder('WarningText') + 1)
		setProperty('GlowWarningText.alpha',0.2)
		doTweenAlpha('GlowWarning', 'GlowWarningText', 0, 1, 'linear')
		
		makeLuaSprite('anothebuttstonsresume','shared/warningwindow/RESUME', 705, whyes)
		addLuaSprite('anothebuttstonsresume',true)
		setObjectCamera('anothebuttstonsresume', 'other')
		setObjectOrder('anothebuttstonsresume',getObjectOrder('GlowWarningText') + 2)
		scaleObject('anothebuttstonsresume',botonesnorman,botonesnorman)
		setProperty('anothebuttstonsresume.scale.x',0.93)
		setProperty('anothebuttstonsresume.scale.y',0.93)
		
		makeLuaSprite('anothebuttstonsoptions','shared/warningwindow/OPTIONS', getProperty('anothebuttstonsresume.x') - 140, whyes)
		addLuaSprite('anothebuttstonsoptions',true)
		setObjectCamera('anothebuttstonsoptions', 'other')
		setObjectOrder('anothebuttstonsoptions',getObjectOrder('GlowWarningText') + 2)
		scaleObject('anothebuttstonsoptions',botonesnorman,botonesnorman)
		setProperty('anothebuttstonsoptions.alpha', alphawolf)
		
		makeLuaSprite('anothebuttstonsexit','shared/warningwindow/EXIT', getProperty('anothebuttstonsoptions.x') - 140, whyes)
		addLuaSprite('anothebuttstonsexit',true)
		setObjectCamera('anothebuttstonsexit', 'other')
		setObjectOrder('anothebuttstonsexit',getObjectOrder('GlowWarningText') + 2)
		scaleObject('anothebuttstonsexit',botonesnorman,botonesnorman)
		setProperty('anothebuttstonsexit.alpha', alphawolf)
	end
end

function onCustomSubstateUpdate(tag)
	if tag == 'warning' then
		if keyJustPressed('accept') then
		
			if buttstons == 1 then
				touch = false
			playSound('textAppear')
			setProperty('GlowWarningText.alpha',0.3)
			doTweenAlpha('GlowWarning', 'GlowWarningText', 0, 1, 'linear')
			runTimer('a', 1)
				
				elseif buttstons == 2 then
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
    	    			FlxTween.tween(FlxG.sound.music, {volume: 1}, botonesnorman);
      	    			FlxG.sound.music.time = game.modchartSounds('pauseMusic').time;
    	  			}
    				OptionsState.onPlayState = true;
				]])
    		elseif buttstons == 3 then
        		stopSound(pauseMusic)
				playSound('UIWood1', 1)
        		exitSong()
    		end
        end

		if keyJustPressed('left') and buttstons ~= buttstonsMax then
        	buttstons = buttstons + 1
        	playSound('UIMetal1', 1)
    	elseif keyJustPressed('left') and buttstons == buttstonsMax then
        	buttstons = 1
        	playSound('UIMetal1', 1)
    	elseif keyJustPressed('right') and buttstons ~= 1 then
        	buttstons = buttstons - 1
        	playSound('UIMetal1', 1)
    	elseif keyJustPressed('right') and buttstons == 1 then
        	buttstons = buttstonsMax
        	playSound('UIMetal1', 1)
    	end
		
		if keyJustPressed('left') or keyJustPressed('right') then
        	if buttstons == 1 then
				setProperty('anothebuttstonsresume.scale.y', scalebuttones)
				setProperty('anothebuttstonsresume.scale.x', scalebuttones)
				setProperty('anothebuttstonsexit.scale.y', botonesnorman)
				setProperty('anothebuttstonsexit.scale.x', botonesnorman)
				setProperty('anothebuttstonsoptions.scale.y', botonesnorman)
				setProperty('anothebuttstonsoptions.scale.x', botonesnorman)
				setProperty('anothebuttstonsoptions.alpha', alphawolf)
				setProperty('anothebuttstonsexit.alpha', alphawolf)
				setProperty('anothebuttstonsresume.alpha', 1)

        	elseif buttstons == 2 then
				setProperty('anothebuttstonsexit.scale.y', botonesnorman)
				setProperty('anothebuttstonsexit.scale.x', botonesnorman)
				setProperty('anothebuttstonsoptions.scale.y', scalebuttones)
				setProperty('anothebuttstonsoptions.scale.x', scalebuttones)
				setProperty('anothebuttstonsresume.scale.y', botonesnorman)
				setProperty('anothebuttstonsresume.scale.x', botonesnorman)
				setProperty('anothebuttstonsresume.alpha', alphawolf)
				setProperty('anothebuttstonsexit.alpha', alphawolf)
				setProperty('anothebuttstonsoptions.alpha', 1)
        		
        	elseif buttstons == 3 then				
				setProperty('anothebuttstonsoptions.scale.y', botonesnorman)
				setProperty('anothebuttstonsoptions.scale.x', botonesnorman)
				setProperty('anothebuttstonsexit.scale.y', scalebuttones)
				setProperty('anothebuttstonsexit.scale.x', scalebuttones)
				setProperty('anothebuttstonsresume.scale.y', botonesnorman)
				setProperty('anothebuttstonsresume.scale.x', botonesnorman)
				setProperty('anothebuttstonsresume.alpha', alphawolf)
				setProperty('anothebuttstonsoptions.alpha', alphawolf)
				setProperty('anothebuttstonsexit.alpha', 1)
			end
		end
	end
end

function onTimerCompleted(tag)
	if tag == 'a' and touch == false then
		doTweenAlpha('warn', 'WarningText', 0, 1, 'linear')
		doTweenAlpha('anothebuttstonsexitbye', 'anothebuttstonsexit', 0, 1, 'linear')
		doTweenAlpha('anothebuttstonsoptionsbye', 'anothebuttstonsoptions', 0, 1, 'linear')
		doTweenAlpha('anothebuttstonsresumebye', 'anothebuttstonsresume', 0, 1, 'linear')
		startCountdown()
		touch = true
		closeCustomSubstate('warning')
	end
end