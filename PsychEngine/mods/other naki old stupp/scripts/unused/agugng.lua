local followchars = false
function onCreate()
    -- background shit
    makeLuaSprite('discord', 'discord', -1000, 0)
    addLuaSprite('discord', true)
    scaleObject('discord', 4, 4)

end
function onEvent(n,v1,v2)
      if n == 'focus' then
            if v1 == 'enable' then
                  followchars = true
            end
            if v1 == 'disable' then
                  followchars = false
            end
      end
end
function onUpdate()
      if followchars == true then
            triggerEvent('Camera Follow Pos',-100, 0) -- insert different values here to be in the center
      end 
end