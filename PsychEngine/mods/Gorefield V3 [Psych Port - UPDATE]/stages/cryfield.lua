function onCreate()
makeLuaSprite('BG_C', 'stages/cryfield/BG_C', -276, -428)
addLuaSprite('BG_C', false)
scaleObject('BG_C', 1, 1)

makeLuaSprite('black_overlay', 'stages/cryfield/black_vignette', -276, -428)
addLuaSprite('black_overlay')
scaleObject('black_overlay', 1, 1)
setProperty('black_overlay.alpha', 0.75)
screenCenter('black_overlay')
setObjectCamera('black_overlay', 'hud')
end


