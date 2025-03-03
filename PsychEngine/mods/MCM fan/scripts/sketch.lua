time = 10
function onBeatHit()
i = math.random(0,0.3)
fun = math.random(-i,i)
--fun = 10
--r = math.random(-1,1)
fun2 = math.random(0,2000)
--fun2 = 2000
fun3 = math.random(0,2000)
end
function onUpdate(elapsed)
songPos = getSongPosition()
	local currentBeat = (songPos/10000)
r = 16*math.sin((currentBeat+8*0.1)*math.pi)
--fun = math.random(-0.1,0.1)
    setShaderFloat("sketch", "iTime", r)
    setShaderFloat("sketch", "funt",fun2)
    setShaderFloat("sketch", "funt2",fun)
	 if fun3 > 1900 then
	 fun = fun3
	 fun2 = i
	 time = time -1
	 elseif fun3 < 1900 then
	 time = 10
	 end
	 if time < 0 then
	 fun = 0
	 fun2 = 0
	 fun3 = 0
	 time = 10
	 end
	 --makeLuaText('by', time, 1275, 0, 0)
	--setTextSize('by', 52.5);
	--setObjectCamera('by', 'other')
--	setTextAlignment('by', 'center')
	--addLuaText('by')
	
	--makeLuaText('by1', fun3, 1275, 0, 50)
	--setTextSize('by1', 52.5);
--	setObjectCamera('by1', 'other')
	--setTextAlignment('by1', 'center')
--	addLuaText('by1')
 end
