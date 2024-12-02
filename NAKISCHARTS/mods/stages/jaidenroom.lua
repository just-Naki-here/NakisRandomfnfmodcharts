function onCreate()

makeAnimatedLuaSprite("arizda", 'arizda', 0, 0)
addAnimationByPrefix("arizda", "arizda", "arizda idle")
playAnim("arizda", "arizda", true, false, 0)
scaleObject("arizda", 1.4, 1.4)
setProperty("arizda.visible", false)
    --hud stuff, thanks for letting me do this zaydash ur the best!!!!
    makeLuaSprite("thehud", 'jaidenythudzda', 0, 0)
    --screenCenter("thehud", 0)
    addLuaSprite('thehud', false)
    setObjectCamera('thehud', 'HUD')
    scaleObject('thehud', 0.334, 0.334, true)
    -- background shit
    makeLuaSprite('stairs', 'stairs', -720, 0);
    setScrollFactor('stairs', 0.7, 0.7);
    scaleObject('stairs', 0.6, 0.6);
    
    makeLuaSprite('room', 'room', -720, 0);
    setScrollFactor('room', 0.9, 0.9);
    scaleObject('room', 0.6, 0.6);

            -- background shit 2 
            makeLuaSprite('stairs2', 'stairs', -720, 0);
            setScrollFactor('stairs2', 0.7, 0.7);
            scaleObject('stairs2', 0.6, 0.6);
            
            makeLuaSprite('room2', 'room', -720, 0);
            setScrollFactor('room2', 0.9, 0.9);
            scaleObject('room2', 0.6, 0.6);
            
    makeLuaSprite('chair', 'chair', -720, 0);
    setScrollFactor('chair', 0.9, 0.9);
    scaleObject('chair', 0.6, 0.6);
    
    makeLuaSprite('glowy1', 'glowy1', -720, 0);
    setScrollFactor('glowy1', 0.9, 0.9);
    scaleObject('glowy1', 0.6, 0.6);
    
    makeLuaSprite('table', 'table', -650, 0);
    setScrollFactor('table', 0.9, 0.9);
    scaleObject('table', 0.6, 0.6);
    
    makeLuaSprite('pc', 'pc', -720, 0);
    setScrollFactor('pc', 0.9, 0.9);
    scaleObject('pc', 0.6, 0.6);
    
    makeLuaSprite('wall', 'wall', -650, 0);
    setScrollFactor('wall', 0.9, 0.9);
    scaleObject('wall', 0.6, 0.6);

    makeLuaSprite('brightwall', 'brightwall', -650, 0);
        setScrollFactor('brightwall', 0.9, 0.9);
        scaleObject('brightwall', 0.6, 0.6);

                makeLuaSprite('brightchair', 'brightchair', -720, 0);
                setScrollFactor('brightchair', 0.9, 0.9);
                scaleObject('brightchair', 0.6, 0.6);
                
                makeLuaSprite('brightdesk', 'brightdesk', -720, 0);
                setScrollFactor('brightdesk', 0.9, 0.9);
                scaleObject('brightdesk', 0.6, 0.6);
                
                makeLuaSprite('wall2', 'wall', -650, 0);
                setScrollFactor('wall2', 0.9, 0.9);
                scaleObject('wall2', 0.6, 0.6);

                makeLuaSprite('brighttable', 'brighttable', -650, 0);
                setScrollFactor('brighttable', 0.9, 0.9);
                scaleObject('brighttable', 0.6, 0.6);


                makeAnimatedLuaSprite("theroomglitch", 'goopybgzda', -710, -40)
                addAnimationByPrefix("theroomglitch", "idle", "goopybgzda idle", 24, true)
                playAnim('theroomglitch', 'idle', true, false, 0)
                scaleObject('theroomglitch', 1.8, 2.0);
                setScrollFactor('theroomglitch', 0.9, 0.9);
                setProperty('camGame.antialiasing', true)

                makeAnimatedLuaSprite("jaidencutscene", 'jaicutscene', 0, 0)
                addAnimationByPrefix("jaidencutscene", "beginning", "thethang", 0, false)
                addAnimationByPrefix("jaidencutscene", "lookwhatyouvedone", "thethang", 24, false)
                setObjectCamera('jaidencutscene', 'HUD')
                scaleObject('jaidencutscene', 1.0, 1.0);
                screenCenter("jaidencutscene")
                setProperty('jaidencutscene.alpha', 0)

                addLuaSprite('stairs', false);
                addLuaSprite('room', false);
                addLuaSprite('chair', true);
                addLuaSprite('glowy1', true);
                addLuaSprite('pc', true);
                addLuaSprite('wall', true);
                addLuaSprite('table', true);
            
                addLuaSprite('stairs2', false);
                addLuaSprite('room2', false);
                addLuaSprite('brightchair', true);
                addLuaSprite('brightdesk', true);
                addLuaSprite('wall2', true);
                addLuaSprite('brightwall', true);
                addLuaSprite('brighttable', true);
                addLuaSprite('theroomglitch', false)
                addLuaSprite('jaidencutscene', true);
                addLuaSprite("arizda", false)
                precacheImage('mods/images/jaicutscene')
end
    function onStepHit()
            if curStep == 1928 then
        doTweenAlpha('thetweenofthecentury', 'jaidencutscene', 0.5, 1.0, 'circIn')
        playAnim('jaidencutscene', 'beginning', true, false, 0)
        end
            if curStep == 1936 then
                playAnim('jaidencutscene', 'lookwhatyouvedone', true, false, 0)
        end
            if curStep == 1952 then
                doTweenAlpha('thetweenofthecentury2', 'jaidencutscene', 0, 0.1, 'linear')
                cameraFlash('HUD', 'FFFFFF', 1.0, true)
            end
    if curStep <= 800 then
        setProperty('stairs2.visible', false)
        setProperty('room2.visible', false)
        setProperty('brightchair.visible', false)
        setProperty('brightdesk.visible', false)
        setProperty('wall2.visible', false)
        setProperty('brighttable.visible', false)
        setProperty('brightwall.visible', false);
        setProperty('theroomglitch.visible', false)
    else
        setProperty('theroomglitch.visible', true)
        setProperty('stairs2.visible', true)
        setProperty('room2.visible', true)
        setProperty('brightchair.visible', true)
        setProperty('brightdesk.visible', true)
        setProperty('wall2.visible', true)
        setProperty('brighttable.visible', true)
        setProperty('brightwall.visible', true);

        setProperty('stairs.visible', false);
        setProperty('room.visible', false);
        setProperty('chair.visible', false);
        setProperty('glowy1.visible', false);
        setProperty('pc.visible', false);
        setProperty('wall.visible', false);
        setProperty('table.visible', false);
    end
    if curStep == 2720 then
        setProperty("arizda.visible", true)
    end
end

function onCreatePost() runHaxeCode("game.camHUD.bgColor = 0xFF000000;") end
function onSongStart()
	--Credits to Ghostglowdev for this code here below.
	runHaxeCode([[
		FlxTween.color(null, 20.5, 0xFF000000, 0x0, {onUpdate: 
			function(tween:FlxTween) {
				game.camHUD.bgColor = tween.color;
			}
		});
	]])
end