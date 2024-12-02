function onCreate()
    makeLuaText('vidTitle',"I Finally Saw the Light and It Looks Beautiful...", 0, 10, 5); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('vidTitle', 30);
    addLuaText('vidTitle');
    setTextFont("vidTitle", "roboto")

	makeLuaSprite('p', 'pause', 10.5, 643.15);
	setScrollFactor('p', 0, 0);
    setProperty('p.scale.x', 0.6)
    setProperty('p.scale.y', 0.3)
	setProperty('p.antialiasing',false)

	addLuaSprite('p', false);
	setObjectCamera('p','hud')
	makeLuaSprite('v', 'vol', -120.5, 440.15);
	setScrollFactor('v', 0, 0);
    setProperty('v.scale.x', 0.06)
    setProperty('v.scale.y', 0.053)

	addLuaSprite('v', false);
	setObjectCamera('v','hud')

	makeLuaText('timer', 'error', 0, 170, 681)
	addLuaText('timer')
	setTextColor('timer', 'FFFFFF')

	addLuaSprite('s', false);
	setObjectCamera('s','hud')

    setTextFont("vidTitle", "roboto.ttf");
	setProperty('vidTitle.borderSize', 0.4)
	setProperty('vidTitle.antialiasing', 1)
	setProperty('timer.borderSize', 0.4)
    setTextFont("timer", "roboto.ttf");
	setProperty('timer.antialiasing', 1)
    setTextSize('timer', 20);
end
function onCreatePost()
setTextFont("scoreTxt", "roboto.ttf")
setProperty('healthBar.alpha', 1)
setProperty('iconP1.alpha', 1)
setProperty('iconP2.alpha', 1)
	setProperty('timeBarBG.visible', false);
	setProperty('timeTxt.visible', false);
	setProperty('timeBar.y', 663);
    setProperty('timeBar.scale.x', 3.1)
    setProperty('timeBar.scale.y', 0.7)
	setProperty('timeBar.color', getColorFromHex('FF0000'))
    setObjectCamera('s','HUD')
    setObjectCamera('v','HUD')
    setObjectCamera('f','HUD')
    setObjectCamera('vidTitle','HUD')
    setObjectCamera('timeBar','HUD')
    setObjectCamera('timer','HUD')
    setObjectCamera('p','HUD')
    setObjectOrder('s', 5)
    setObjectOrder('v', 5)
    setObjectOrder('f', 5)
    setObjectOrder('p', 5)
end

function onUpdate(elapsed)
setTextString('timer', ' ' .. getTextString('timeTxt'))
end

function onUpdatePost()

    local  timeElapsed = math.floor(getProperty('songTime')/1000)
    local  timeTotal = math.floor(getProperty('songLength')/1000)

    --timerTxt updates (string.format puts it into mm:ss format)
    setTextString('timeTxt', string.format("%.2d:%.2d", timeElapsed/60%60, timeElapsed%60) .. '/' .. string.format("%.2d:%.2d", timeTotal/60%60, timeTotal%60))
-- timerTxt edit part 1
    end

function onBeatHit()
if curBeat >= 32 then
	doTweenAlpha('fadeWarn', 'vidTitle', 0, 2.5, 'circIn')
	end
end
-- timerTxt edit part 2
function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end