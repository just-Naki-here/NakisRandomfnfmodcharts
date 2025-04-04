-- change the video name here	->  var filepath = Paths.video('name');	
--												     		   ^^^^^^^
-- or put the video whit name " name" on videos folder

function onCreate()

	
	--setScrollFactor('black', 0, 0);
	
	setObjectCamera('videoSprite2', 'hud');
	
	

	
		makeLuaSprite('videoSprite2','',0,0)
		addLuaSprite('videoSprite2')
		setObjectCamera('videoSprite2', 'other');
		addHaxeLibrary('MP4Handler','vlc')
		addHaxeLibrary('Event','openfl.events')
		scaleObject('videoSprite2', 0.7, 0.7)
	
		runHaxeCode([[
			var filepath = Paths.video('TFTCUTSCENE1');		
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
			game.getLuaObject('videoSprite2').loadGraphic(video.bitmapData);
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
		getObjectOrder('videoSprite2')
		setObjectOrder('videoSprite2', 100000)
	end
	
	if curStep == 4137 then
removeLuaSprite('videoSprite2', false)
	end