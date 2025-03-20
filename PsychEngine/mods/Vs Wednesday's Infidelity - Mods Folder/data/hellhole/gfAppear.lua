function onCreatePost()
    setProperty('gf.alpha',0.01)
end
function onUpdate()
    if getProperty('gf.animation.curAnim.name') == 'bye' and getProperty('gf.animation.curAnim.finished') == true then
        setProperty('gf.alpha',0)
    elseif getProperty('gf.animation.curAnim.name') == 'spawn' then
        setProperty('gf.alpha',1)
    end
end