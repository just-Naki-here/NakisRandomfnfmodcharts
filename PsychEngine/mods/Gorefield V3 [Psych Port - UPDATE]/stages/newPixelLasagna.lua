function onCreatePost()
setProperty('gf.visible',false);
end

function onCreate()
makeLuaSprite('floor', 'stages/pixelLasagna/Lasagna_Boy_Stage_Floor', -580, -330)
addLuaSprite('floor', false)
scaleObject('floor', 5, 5)

makeLuaSprite('walls', 'stages/pixelLasagna/Lasagna_Boy_Stage_Walls', -580, -330)
addLuaSprite('walls', false)
scaleObject('walls', 5, 5)

makeAnimatedLuaSprite('cat', 'stages/pixelLasagna/LASAGNA_CAT', -600, -280)
addLuaSprite('cat', true)
addAnimationByPrefix('cat', 'LASAGNA_CAT _RUN', 'LASAGNA_CAT _RUN', 20, true)
scaleObject('cat', 0.45, 0.45)
setProperty('cat.alpha', 0)
end