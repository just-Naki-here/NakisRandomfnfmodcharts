function onEvent(name,value1,value2)
if e > 0 then
     e = value1*-1
     end
    if name == "Screen Shake 123" then
    doTweenY('Y1', 'camHUD', e, value2, 'linear')
    doTweenX('X1', 'camHUD', e, value2, 'linear')
     
    end
end
function onTweenCompleted(name)



end