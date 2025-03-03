function onBeatHit()
    health = getProperty('health')
    if not sustain and getProperty('health') >= 0 then
        setProperty('health', health-2/450);
    end
end
function onCreate()
	setProperty('healthGain', 0.001)
	setProperty('healthLoss', 1)
	setProperty('health', 2)
end