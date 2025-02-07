function onCreate()
makeLuaSprite('sponge','background/slinger/sponge', 1400, 100)
setObjectCamera('sponge', 'hud')
setProperty('sponge.flipX', true);
addLuaSprite('sponge', false);

makeLuaSprite('squid','background/slinger/squid', 1420, 250)
setObjectCamera('squid', 'hud')
setProperty('squid.flipX', true)
addLuaSprite('squid', false);
end

function onBeatHit()
    -- triggered 2 times per section
    if curBeat % 1 == 0 then
        setProperty('sponge.angle', 20);
        doTweenAngle('bap', 'sponge', 0,0.2,'cubicOut');

        setProperty('squid.angle', 20);
        doTweenAngle('bep', 'squid', 0,0.2,'cubicOut');
    end
    -- triggered 4 times per section
    if curBeat % 2 == 0 then
        setProperty('sponge.angle', -20);
        doTweenAngle('bap', 'sponge', 0,0.2,'cubicOut');

        setProperty('squid.angle', -20);
        doTweenAngle('bep', 'squid', 0,0.2,'cubicOut');
    end
    --script made by Gazozoz
end

function onStepHit()
if curStep == 3890 then
doTweenX('lol', 'squid', 1120, 1, 'elasticInOut')
end
if curStep == 3923 then
doTweenX('lol2', 'sponge', 1100, 1, 'elasticInOut')
end
end