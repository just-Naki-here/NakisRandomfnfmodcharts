local curFade = 'in'

function onCreate()
makeLuaSprite('bHUD', '', 0, 0)
makeGraphic('bHUD', screenWidth, screenHeight, '000000')
setProperty('bHUD.alpha', 0)
addLuaSprite('bHUD')
end

function onEvent(name,v1,v2)
if name == 'FadeInOut' then
	if curFade == 'in' then
		if v2 == '' then
		setObjectCamera('bHUD', 'hud')
		else
		setObjectCamera('bHUD', tostring(v2))
		end
		doTweenAlpha('fadein', 'bHUD', 1, v1)
		curFade = 'out'
	else
		doTweenAlpha('fadein', 'bHUD', 0, v1)
		curFade = 'in'
	end
end
end