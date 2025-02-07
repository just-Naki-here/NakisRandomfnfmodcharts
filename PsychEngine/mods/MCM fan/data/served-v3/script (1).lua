
function onGameOver()
    setProperty('health', -500);
    math.randomseed(os.clock()/4.0)
    local num = math.random(2,3,4,5,6)
    local name = (num)
    playSound(name, 1, 'deathquote')
end