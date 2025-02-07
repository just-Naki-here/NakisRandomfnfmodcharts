function onCreate()
makeLuaSprite('dead', 'background/starved/chamber/dead', 350, 350)
scaleObject('dead', 0.8, 0.8)
addLuaSprite('dead', false)
end

local timer = 0

function update(deltaTime)

  timer = timer + deltaTime
  

  if timer > 0.25 then 
    local alpha = (timer - 0.25) / 251
    alpha = math.min(alpha, 1)

    set_texture_alpha("ghfh", alpha) 
  end
end
function onEvent(name, value1, value2) --evento hecho en casa lal
	if name == 'Blammed Lights' then
	if value1 == '0' then 
	doTweenColor('231', 'dead', '0xffffffff', 0.00000001, 'quadInOut')
	end
	if value1 == '1' then 
	doTweenColor('23', 'dead', 'E21E00DC', 0.00000001, 'quadInOut')
	end
end
end

