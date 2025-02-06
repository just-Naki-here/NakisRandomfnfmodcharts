local stuff = {
disabled = false,
anims = {
['singleft'] = {-35, 'x'},
['singdown'] = {35, 'y'},
['singup'] = {-35, 'y'},
['singright'] = {35, 'x'},
['idle-loop'] = {0, 'x'},
['singleft-loop'] = {-30, 'x'},
['singdown-loop'] = {30, 'y'},
['singup-loop'] = {-30, 'y'},
['singright-loop'] = {30, 'x'},
},
check = {
[true] = 'boyfriend',
[false] = 'dad',
},
}
function onCreate()
makeLuaSprite('BG1', 'stages/prision/BG1', 0, 0)
addLuaSprite('BG1', false)

makeLuaSprite('Suelo', 'stages/prision/suelo', 0, 0)
addLuaSprite('Suelo', false)
setProperty('Suelo.visible', false)

makeAnimatedLuaSprite('lyman', 'characters/lyman_prison', 455, 100)
addLuaSprite('lyman', false)
addAnimationByPrefix('lyman', 'idle', 'lyman idle', 24, true)
scaleObject('lyman', 0.7, 0.7)
setProperty('lyman.visible', false)

makeLuaSprite('Entrada', 'stages/prision/entrada', 0, 0)
addLuaSprite('Entrada', false)
setProperty('Entrada.visible', false)

makeLuaSprite('Barriles', 'stages/prision/Barril', 0, 860)
addLuaSprite('Barriles', true)
setScrollFactor('Barriles', 1.1, 1)
scaleObject('Barriles', 1.1, 1.1)
setProperty('Barriles.visible', false)

makeLuaSprite('BG3', 'stages/prision/BG3', 0, 0)
addLuaSprite('BG3', false)
setProperty('BG3.visible', false)

makeAnimatedLuaSprite('rayo', 'stages/prision/trueno', 600, -20)
addLuaSprite('rayo', false)
addAnimationByPrefix('rayo', 'idle', 'truenito', 24, true)
scaleObject('rayo', 1.5, 1.5)
setProperty('rayo.visible', false)

makeLuaSprite('Warning', 'stages/prision/Peligro', 0, 0)
addLuaSprite('Warning', false)
setObjectCamera('Warning', 'hud')
setBlendMode('Warning', 'ADD');
setProperty('Warning.alpha', 0)

makeLuaSprite('RedOverlay', 'stages/prision/red_vignette', 0, 0)
addLuaSprite('RedOverlay', false)
setObjectCamera('RedOverlay', 'hud')
setProperty('RedOverlay.alpha', 0)
end

function onUpdate(elapsed)
if mustHitSection then
 setProperty('defaultCamZoom', 0.75)
else
 setProperty('defaultCamZoom', 0.9)
  end
end

function onUpdatePost(elapsed)
if not stuff.disabled then
local anim_info = stuff.anims[getProperty(stuff.check[mustHitSection]..'.animation.curAnim.name'):lower()]
if anim_info then
local var = ((version:find('0.7') and 'camGame.scroll' or 'camFollowPos')..'.')..(anim_info[2] or 'x')
local currentPos = getProperty(var);
setProperty(var,
lerp(currentPos,
currentPos + ((anim_info[1] or 0) * (1 / getProperty('camGame.zoom'))),
elapsed * getProperty('cameraSpeed') * playbackRate
)
);
end
end
end
function lerp(a, b, c) return a + (b - a) * c end
