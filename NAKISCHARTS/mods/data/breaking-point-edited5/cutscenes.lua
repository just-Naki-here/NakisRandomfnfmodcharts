function onCreatePost()
    makeAnimatedLuaSprite("jaidencutscene", 'jaicutscene', 0, 0)
    addAnimationByPrefix("jaidencutscene", "beginning", "thethang", 0, false)
    addAnimationByPrefix("jaidencutscene", "lookwhatyouvedone", "thethang", 24, false)
    setObjectCamera('jaidencutscene', 'HUD')
    scaleObject('jaidencutscene', 1.0, 1.0);
    screenCenter("jaidencutscene")
    setProperty("jaidencutscene.alpha", 0)
    playAnim('jaidencutscene', 'beginning', true, false, 0)
        addLuaSprite('jaidencutscene', true)

makeAnimatedLuaSprite("secondcutscene", 'jaicutscene2', 0, 0)
setObjectCamera('secondcutscene', 'HUD')
scaleObject('secondcutscene', 1.0, 1.0);
screenCenter("secondcutscene")
addAnimationByPrefix("secondcutscene", "thisisnt", "thang", 24, false)
addAnimationByPrefix("secondcutscene", "beginningthing", "thang", 0, false)
playAnim('secondcutscene', 'beginningthing', true, false, 0)
setProperty("secondcutscene.alpha", 0)
addLuaSprite('secondcutscene', true)

makeAnimatedLuaSprite("thirdcutscene", 'thirdcutscene', 0, 0)
setObjectCamera('thirdcutscene', 'HUD')
scaleObject('thirdutscene', 1.0, 1.0);
screenCenter("thirdcutscene")
addAnimationByPrefix("thirdcutscene", "ending", "thirdcutscene ending", 24, false)
addAnimationByPrefix("thirdcutscene", "beginningthing", "thirdcutscene ending", 0, false)
playAnim('thirdcutscene', 'beginningthing', true, false, 0)
setProperty("thirdcutscene.alpha", 0)
addLuaSprite('thirdcutscene', true)

addHaxeLibrary('ClientPrefs', 'backend')

runHaxeCode("Paths.image('jaicutscene', ClientPrefs.allowGPU);")
runHaxeCode("Paths.image('secondcutscene', ClientPrefs.allowGPU);")
runHaxeCode("Paths.image('thirdcutscene', ClientPrefs.allowGPU);")

end
function onStepHit()
if curStep == 1924 then
    doTweenAlpha('thetweenofthecentury', 'jaidencutscene', 0.5, 1.0, 'linear')
end
if curStep == 1936 then
    playAnim('jaidencutscene', 'lookwhatyouvedone', true, false, 0)
end
if curStep == 1952 then
    doTweenAlpha('thetweenofthecentury2', 'jaidencutscene', 0, 0.1, 'linear')
    cameraFlash('HUD', 'FFFFFF', 1.0, true)
end
if curStep == 1994 then
    doTweenAlpha('tweenofthecentury', 'secondcutscene', 0.5, 1.0, 'linear')
end
if curStep == 1998 then
    playAnim('secondcutscene', 'thisisnt', true, false, 0)
end
if curStep == 2016 then
    setProperty("secondcutscene.alpha", 0)
    cameraFlash('HUD', '000000', 1.0, true)
end
    if curStep == 2048 then
        doTweenAlpha('anothertweenofthecentury', 'thirdcutscene', 0.5, 1.0, 'linear')
    end
    if curStep == 2052 then
        playAnim('thirdcutscene', 'ending', true, false, 0)
    end
    if curStep == 2080 then
        setProperty("thirdcutscene.alpha", 0)
        cameraFlash('HUD', '000000', 1.0, true)
        end
end