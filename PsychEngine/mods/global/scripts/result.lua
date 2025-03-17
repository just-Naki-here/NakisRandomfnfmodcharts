local hits = 0

function goodNoteHit(i, d, n, sus)
	if not sus then
	hits = hits + 1
	end
end

function onEndSong()
	openCustomSubstate('Results', true)
	pauseMusic = 'menuLOOP'
	return Function_Stop
end

function onSoundFinished(tag)
    if tag == pauseMusic then
        playSound(pauseMusic, 1, pauseMusic)
    end
end

function onCustomSubstateCreatePost(tag)
	if tag == 'Results' then
	
	playSound('UIWood1')
	playSound(pauseMusic, 0, pauseMusic)
	soundFadeIn(pauseMusic, 5, 0, 1)
	
	makeLuaSprite('karmarow', 'results/karma row', 150, 180);
	setObjectCamera('karmarow', 'other')
	addLuaSprite('karmarow', true)
	setProperty('karmarow.scale.x',0.9)
	setProperty('karmarow.scale.y',0.9)
	setProperty('karmarow.alpha', 0)
	
	makeLuaSprite('glowkarmarow', 'results/karma row', 150, 140);
	setObjectCamera('glowkarmarow', 'other')
	addLuaSprite('glowkarmarow', true)
	setProperty('glowkarmarow.scale.x',0.9)
	setProperty('glowkarmarow.scale.y',0.9)
	setProperty('glowkarmarow.alpha', 0)
	setSpriteShader('glowkarmarow','bloom')
	
	makeLuaSprite('ratethings', 'results/karma', 253, -200);
	setObjectCamera('ratethings', 'other')
	addLuaSprite('ratethings', true)
	setProperty('ratethings.scale.x',1.2)
	setProperty('ratethings.scale.y',1.2)
	setProperty('ratethings.alpha', 0)
	
	makeLuaSprite('glowingratethings', 'results/karma', 253, -200);
	setObjectCamera('glowingratethings', 'other')
	addLuaSprite('glowingratethings', true)
	setProperty('glowingratethings.scale.x',1.2)
	setProperty('glowingratethings.scale.y',1.2)
	setProperty('glowingratethings.alpha', 0)
	setSpriteShader('glowingratethings','bloom')
	
	makeLuaSprite('fadegradient', 'results/fadegradient', -100, -130);
	setObjectCamera('fadegradient', 'other')
	addLuaSprite('fadegradient', true)
	setProperty('fadegradient.scale.x',0.8)
	setProperty('fadegradient.scale.y',0.8)
	setProperty('fadegradient.alpha', 0)
	
	makeLuaSprite('eepybf', 'results/sleepy guy', 400, 20);
	setObjectCamera('eepybf', 'other')
	addLuaSprite('eepybf', true)
	setProperty('eepybf.scale.x',0.5)
	setProperty('eepybf.scale.y',0.5)
	setProperty('eepybf.alpha', 0)
	
	setObjectCamera('resultbackgorundh', 'other')
    makeLuaSprite('resultbackgorundh', nil, -40, 0);
    makeGraphic('resultbackgorundh', 2280, 1720, '000000')
	addLuaSprite('resultbackgorundh', true);
	setProperty('resultbackgorundh.alpha', 0)
	
	makeLuaSprite('fcrateing','results/the perfectionist', 400, 190)
	setObjectCamera('fcrateing', 'other')
	addLuaSprite('fcrateing', true)
	setProperty('fcrateing.antialiasing', true)
	setProperty('fcrateing.scale.x',0.5)
	setProperty('fcrateing.scale.y',0.5)
	setProperty('fcrateing.alpha', 0)
	
	doTweenAlpha('darkerdarkeryetdarker','resultbackgorundh', 1, 0.3, 'linear')
	doTweenAlpha('fadegradienthiiii','fadegradient', 1, 1, 'linear')
	doTweenAlpha('eepybfwewe','eepybf', 1, 1, 'linear')
	doTweenAlpha('karmarowwqw','karmarow', 1, 1, 'quadOut')
	doTweenAlpha('byehudhaha','camHUD', 0, 0.1, 'linear')
	doTweenAlpha('garma','ratethings', 0.4, 1, 'linear')
	doTweenY('looktherow', 'karmarow', 140, 1, 'backOut')
	doTweenY('ohlookrating','ratethings', -474 , 1, 'quadOut')
	doTweenY('glowingohlookrating','glowingratethings', -474 , 1, 'quadOut')
	doTweenY('moveoutrow','eepybf', -40, 3, 'backOut')
	runTimer('waitforrate',2)
	
	spacing = 25
	positionTextsuh = 350
	TextSizer = 15
	
	
		makeLuaText('Song', songName .. ' - ' .. difficultyName, 0, positionTextsuh, 470)
		setObjectCamera('Song', 'other');
		setTextSize('Song', TextSizer)
		addLuaText('Song', true);
		setProperty('Song.alpha', 0)
		
		makeLuaText('Score', 'Score : '..score, 0,positionTextsuh, getProperty('Song.y') + spacing )
		setObjectCamera('Score', 'other');
		setTextSize('Score', TextSizer)
		addLuaText('Score', true);
		setProperty('Score.alpha', 0)
		
		makeLuaText('Misses','Misses : ' ..misses, 0, positionTextsuh, getProperty('Score.y') + spacing )
		setObjectCamera('Misses', 'other')
		setTextSize('Misses', TextSizer)
		addLuaText('Misses', true);
		setProperty('Misses.alpha', 0)
		
		makeLuaText('Comboewommbo', 'Hits : ' .. hits, 0, positionTextsuh, getProperty('Misses.y') + spacing )
		setObjectCamera('Comboewommbo', 'other')
		setTextSize('Comboewommbo', TextSizer)
		addLuaText('Comboewommbo', true);
		setProperty('Comboewommbo.alpha', 0)
		
		accuracy = string.format("%.2f%%", getProperty('ratingPercent') * 100)
		
		makeLuaText('Accuratecy', 'Accuracy : ' .. accuracy .. ' ' .. ratingFC, 0, positionTextsuh, getProperty('Comboewommbo.y') + spacing )
		setObjectCamera('Accuratecy', 'other')
		setTextSize('Accuratecy', TextSizer)
		addLuaText('Accuratecy', true);
		setProperty('Accuratecy.alpha', 0)
		
		makeLuaText('goawaynow', 'Press Enter To Continue', 0, 20, 470)
		setObjectCamera('goawaynow', 'other');
		setTextSize('goawaynow', TextSizer)
		addLuaText('goawaynow', true);
		setProperty('goawaynow.alpha', 0)
		
		makeLuaText('perfectionista', 'The Perfectionist', 0, getProperty('fcrateing.x') + 90, getProperty('fcrateing.y') + 41)
		setObjectCamera('perfectionista', 'other');
		setTextSize('perfectionista', TextSizer)
		addLuaText('perfectionista', true);
		setProperty('perfectionista.alpha', 0)
		setTextFont('perfectionista','rain-world-menu.ttf')
		
	end
	
	if  misses <= 0 then
		doTweenAlpha('startingpassageFC','fcrateing', 0.2, 3.5, 'linear')
	end
end

function onCustomSubstateUpdatePost(tag)
	if tag == 'Results' then
		if keyboardJustPressed('SPACE') then
		playSound('ruffian')
		end
		if keyboardJustPressed('ENTER') then
			exitSong()
		end
	end
end

function onCustomSubstateUpdate(tag)
	if rating >= 0.95 then
		ratesound = 'sick'
		ratetween = 370
	elseif rating >= 0.8 then
		ratesound = 'normal'
		ratetween = 160
	elseif rating >= 0.6 then
		ratesound = 'normal'
		ratetween = -50
	elseif rating >= 0.35 then
		ratesound = 'normal'
		ratetween = -270
	elseif rating <= 0.35 then
	ratesound = 'shit'
	end
end

function onTimerCompleted(tag)
	if tag == 'waitforrate' then
		if ratesound == 'shit' then
		doTweenY('whatwillitbe','ratethings',-400, 1.5, 'backInOut')
		doTweenY('glowingwhatwillitbe','glowingratethings',-400, 1.5, 'backInOut')
		runTimer('thatsashit',1.5)
		doTweenAlpha('itgoeswhite','ratethings', 1, 3, 'circIn')
		playSound(ratesound,1,'noway' .. ratesound)
		else
		doTweenY('whatwillitbe','ratethings',ratetween, 3, 'backInOut')
		doTweenY('glowingwhatwillitbe','glowingratethings',ratetween, 3, 'backInOut')
		doTweenAlpha('itgoeswhite','ratethings', 1, 3, 'circIn')
		playSound(ratesound,1,'noway' .. ratesound)
		runTimer('bullgombo',5.5)
		end
	end
	if tag == 'thatsashit' then
		doTweenY('gulpsthatsshit','ratethings',-474, 1.5, 'elasticInOut')
		doTweenY('gulpsthatsglowingshit','glowingratethings',-474, 1.5, 'elasticInOut')
	end
	if tag == 'bullgombo' and misses <= 0 then
		doTweenAlpha('lookpassageFC','fcrateing', 0.8, 2.5, 'backOut')
		doTweenAlpha('perfectionista','perfectionista', 0.8, 2.5, 'backOut')
		playSound('passage',1)
	end
	if tag == 'goawayglow' then
		shrinkingsize = 0.9
		doTweenAlpha('garmawrgbywbyw','glowingratethings', 0, 1, 'circIn')
		doTweenAlpha('garmarowwrgbywbyw','glowkarmarow', 0, 1, 'circIn')
		doTweenX('shrinkrowx','karmarow.scale',shrinkingsize, 1,'backOut')
		doTweenX('shrinkglowrowx','glowkarmarow.scale',shrinkingsize, 1,'backOut')
		doTweenY('shrinkrowy','karmarow.scale',shrinkingsize, 1,'backOut')
		doTweenY('shrinkglowrowy','glowkarmarow.scale',shrinkingsize, 1,'backOut')
		runTimer('moveoutoftheway', 1)
	end
	if tag == 'moveoutoftheway' then
		playSound('ratingMove',1)
			for _, text in ipairs({'Accuratecy', 'Comboewommbo', 'Misses', 'Score', 'Song', 'goawaynow'}) do
			doTweenAlpha(text .. 'hellothere', text, 1, 3, 'linear')
		end
	end
end

function onTweenCompleted(tag)
	if tag == 'whatwillitbe' then
		growingsize = 1.1
		doTweenAlpha('garmawrg','glowingratethings', 0.4, 1, 'backOut')
		doTweenAlpha('garmarowwrg','glowkarmarow', 0.4, 1, 'backOut')
		doTweenX('growrowx','karmarow.scale',growingsize, 1,'backInOut')
		doTweenY('growrowy','karmarow.scale',growingsize, 1,'backInOut')
		doTweenX('glowgrowrowx','glowkarmarow.scale',growingsize, 1,'backInOut')
		doTweenY('glowgrowrowy','glowkarmarow.scale',growingsize, 1,'backInOut')
		runTimer('goawayglow',0.2)
	end
end