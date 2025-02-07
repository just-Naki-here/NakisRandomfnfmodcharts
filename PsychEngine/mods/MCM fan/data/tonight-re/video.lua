
function onSongStart()
    coolVideoThing(1)
end

function onEvent(n,v1)
    if n == 'video' then
        coolVideoThing(1)
    end
end

function onTimerCompleted(t)
    if t == "pauselol" then setProperty('inCutscene', false) end
end

function coolVideoThing(alpha)
if version >= '1' then
    startVideo('name', false)
    setProperty('inCutscene', false)
    setObjectCamera('videoCutscene', 'hud')
    setObjectOrder('videoCutscene', 0)
    setProperty('videoCutscene.alpha',alpha)
    runTimer('pauselol',.1)
    end
end
function setObjectCamera(name,camera) -- yay no more bug thing
      local value
      if camera == "game" or camera == "camGame" then
          value = "camGame"
      elseif camera == "hud" or camera == "camHUD" then
          value = "camHUD"
      elseif camera == "other" or camera == "camOther" then
          value = "camOther"
      end
      setProperty(name..'.camera', instanceArg(value), false, true) -- thanks larryfrost
  end