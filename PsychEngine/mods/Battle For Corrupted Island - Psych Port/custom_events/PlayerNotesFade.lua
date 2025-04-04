function onEvent(name, value1, value2)

	Time = tonumber(value1)
	Alpha = tonumber(value2)
	
    if name == 'PlayerNotesFade' then
	
for i=4,7 do
    noteTweenAlpha(i+16, i, Alpha, Time, 'QuadOut')

    end
end
end