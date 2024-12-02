function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'playvideo' then 
        precacheImage(value1, true)
        startVideo(value1)
        setProperty('inCutscene', false);
end
    return Function_Continue
end