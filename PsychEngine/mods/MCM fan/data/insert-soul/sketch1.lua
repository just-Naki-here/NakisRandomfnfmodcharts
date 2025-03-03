r = 1
time = 10
function onStepHit()
fun = math.random(-0.1,0.1)
fun2 = math.random(0,2000)
fun3 = math.random(0,2000)
end
function onUpdate(elapsed)
i = getProperty('')
    setShaderFloat("sketch", "iTime", r)
    r = r - 0.1
    setShaderFloat("sketch", "funt",fun2)
    setShaderFloat("sketch", "funt2",fun)
    if fun3 <1950 then
    time = 10
    end
	 if fun3 > 1950 and time > 0 then
	 fun = fun3
	 fun2 = i
	 time = time -1
	 end
 end
