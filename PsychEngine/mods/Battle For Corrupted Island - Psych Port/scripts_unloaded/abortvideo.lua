-- change the video name here	->  var filepath = Paths.video('name');	
--												     		   ^^^^^^^
-- or put the video whit name " name" on videos folder

function onCreate()

	
	--setScrollFactor('black', 0, 0);
	
	setObjectCamera('videoSprite', 'hud');
	
	
	
		setProperty('skipCountdown', true)
	
		makeLuaSprite('videoSprite','',0,0)
		addLuaSprite('videoSprite', false)
		setObjectCamera('videoSprite', 'hud');
		addHaxeLibrary('MP4Handler','vlc')
		addHaxeLibrary('Event','openfl.events')
		scaleObject('videoSprite', 1, 1)
	
		runHaxeCode([[
			var filepath = Paths.video('ABORTVIDEO');		
			var video = new MP4Handler();
			video.playVideo(filepath);
			video.visible = false;
			setVar('video',video);
			FlxG.stage.removeEventListener('enterFrame', video.update); 
		]])
	end
	
	function onUpdatePost()
		runHaxeCode([[
			var video = getVar('video');
			game.getLuaObject('videoSprite').loadGraphic(video.bitmapData);
			video.volume = FlxG.sound.volume + 100;	
			if(game.paused)video.pause();
		]])
	end
	
	
	function onResume()
		runHaxeCode([[
			var video = getVar('video');
			video.resume();
		]])
	end
	function onCreatePost()
		getObjectOrder('videoSprite')
		setObjectOrder('videoSprite', 100000)
	end
	
	function onStepHit()
		if curStep == 1668 then
			removeLuaSprite('videoSprite', true)
		end
	end