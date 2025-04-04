function onEvent(name, value1, value2)
	if name == 'flowercamera' and value1 == 'a' then
    triggerEvent("Camera Follow Pos", 1600, 753)
	end
	if name == 'flowercamera' and value1 == 'b' then
		triggerEvent("Camera Follow Pos")
	end
end