x_position = 150
-- OLD X POS: 100
y_position = 20

function onCreate()
    addLuaScript('scripts_unloaded/LeafyBITTEREND', true);
end

function onCreatePost()
	makeAnimatedLuaSprite('leafywalkmad', 'characters/leafywalkmad', x_position, y_position);
	addAnimationByPrefix('leafywalkmad', 'idle', 'leafywalkmad mad', 24, true);
    scaleObject('leafywalkmad', 0.9, 0.9);
    setPropertyLuaSprite('leafywalkmad', 'alpha', 0)
    addLuaSprite('leafywalkmad', foreground)
end

function onStepHit()
if curStep == 3253 then
    objectPlayAnimation('leafywalkmad', 'idle');
    setPropertyLuaSprite('leafywalkmad', 'alpha', 1)
end
if curStep == 3264 then
removeLuaSprite('leafywalkmad', foreground)
end
end