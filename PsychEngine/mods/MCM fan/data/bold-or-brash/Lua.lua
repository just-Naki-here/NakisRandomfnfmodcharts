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