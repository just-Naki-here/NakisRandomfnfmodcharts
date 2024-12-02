function onCreatePost()
    setProperty('timeBar.color', getColorFromHex('FF32CD32'))

end

function onUpdatePost(elapsed)
    local currentBeat = (getSongPosition()/5000)*(curBpm/60)
    setProperty('timeTxt.text', 'TIME IS MEANINGLESS')
    setProperty('songPercent', randomTimeLength)
    --setProperty('camFollow.x', getProperty('camFollow.x') - getRandomFloat(0.5, 0.8)*math.sin((currentBeat+12)*math.pi)) nvm looks dumb with each sec
    --setProperty('camFollow.y', getProperty('camFollow.y') - getRandomFloat(0.5, 0.8)*math.cos((currentBeat+12)*math.pi))
end
