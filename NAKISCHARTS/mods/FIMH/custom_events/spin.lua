function onEvent(name, value1, value2)
    if name == 'spin' then
	doTweenAngle('bfspin','boyfriend', value1, value2, 'linear')
    end
end