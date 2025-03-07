function onCreatePost()
setProperty('introSoundsSuffix','-sans')
makeLuaSprite('sansFieldHUD', 'stages/sans/cuadro_ULTRA', 0, 0)
addLuaSprite('sansFieldHUD', true)
scaleObject('sansFieldHUD', 1, 1)

makeLuaSprite('vignette', 'stages/sans/pure_vignette', 0, 0)
addLuaSprite('vignette', true)
scaleObject('vignette', 1, 1)
setProperty('vignette.alpha', 0)
setObjectCamera("vignette", 'other')
screenCenter('vignette')

end

function onUpdatePost(elapsed)
for i=0, getProperty('opponentStrums.length')-1 do
setPropertyFromGroup('opponentStrums', i, 'x', 999999)
end
end

function onEvent(n, v1, v2)
	if n == '' then
  if v1 == 'zoom' then
  doTweenZoom('zoom1', 'camGame', 0.25, 12.5, 'sineInOut')
  end
  if v1 == 'end' then
doTweenAlpha('HUD', 'camHUD', 0, 0.3, "sineOut")
on = false
doTweenZoom('zoom', 'camGame', 0.45, 15, 'sineInOut')
setProperty('defaultCamZoom', 0.45)
   end
 end
end
