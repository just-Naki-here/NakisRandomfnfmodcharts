local allowCountdown = false
function onCreate()
setPropertyFromClass('backend.ClientPrefs','data.middleScroll', true)

makeLuaSprite('sky', 'stages/cartoon-stage/gbStage_sky', -300, -200)
addLuaSprite('sky', false)
scaleObject('sky', 1, 1)
setScrollFactor('sky', 0.5, 0.5)

makeLuaSprite('buildings', 'stages/cartoon-stage/gbStage_buildings', 0, 0)
addLuaSprite('buildings', false) 
scaleObject('buildings', 1, 1)
setScrollFactor('buildings', 1, 0.9)

makeLuaSprite('base', 'stages/cartoon-stage/gbStage_base', 0, 0)
addLuaSprite('base', false)
scaleObject('base', 1, 1)

makeLuaSprite('blackvignette', 'stages/cartoon-stage/black_vignette', 0, 0)
addLuaSprite('blackvignette', false)
scaleObject('blackvignette', 1, 1)
setObjectCamera('blackvignette', 'other')
setProperty('blackvignette.alpha', 1)
end

function onDestroy()
if not middlescroll then
setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false)
end
end

function onCreatePost()
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",1470)
setProperty("camFollow.y", 850)
end

function onSongStart()
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",1470)
setProperty("camFollow.y", 850)
end

function onEndSong()
    if isStoryMode and not seenCutscene then
        startVideo('teaser')
        seenCutscene = true
        return Function_Stop
    end
    return Function_Continue
end
