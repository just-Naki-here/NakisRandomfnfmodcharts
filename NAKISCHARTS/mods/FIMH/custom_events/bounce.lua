function onEvent(name, value1, value2)
    if name == 'bounce' then
	if value1 == '1' then
		doTweenY('bfScaleTweenY', 'boyfriend.scale', 1.5, 0.01, 'easeIn')
	end
	if value1 == '2' then
		doTweenY('bfScaleTweenY', 'boyfriend.scale', 1, 0.1, 'easeIn')
	end
    end
end