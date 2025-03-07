function onCreatePost()
setProperty('gf.visible',false);

setProperty('cat_BG.colorTransform.color', getColorFromHex('527F3A'))
doTweenColor('Color', 'cat_BG', '000000', 0.0001, 'linear')
end

function onCreate()
makeLuaSprite('BG2', 'stages/pixelLasagna/BG_2', -600, 130)
addLuaSprite('BG2', false)
scaleObject('BG2', 0.4, 0.4)

makeLuaSprite('BG1', 'stages/pixelLasagna/BG_1', -600, 130)
addLuaSprite('BG1', false)
scaleObject('BG1', 0.4, 0.4)

makeAnimatedLuaSprite('dodge-lasagna-cat', 'stages/pixelLasagna/dodge-lasagna-cat', -30, 220)
addLuaSprite('dodge-lasagna-cat', false)
addAnimationByPrefix('dodge-lasagna-cat', 'run', 'LASAGNA CAT SCAPE', 24, false)
addAnimationByPrefix('dodge-lasagna-cat', 'attack', 'LASAGNA CAT ATACK', 24, false)
addAnimationByPrefix('dodge-lasagna-cat', 'idle', 'LASAGNA CAT 0 IDLE', 24, true)
scaleObject('dodge-lasagna-cat', 0.4, 0.4)
setProperty('dodge-lasagna-cat.alpha', 0)

makeAnimatedLuaSprite('cat_BG', 'stages/pixelLasagna/LASAGNA_CAT_BG', -1600, 60)
addLuaSprite('cat_BG', true)
addAnimationByPrefix('cat_BG', 'cat', 'LASAGNA CAT RUN BG', 12, false)
setProperty('cat_BG.visible', false)
end