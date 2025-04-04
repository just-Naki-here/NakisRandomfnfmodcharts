x_position = 1050
-- OLD X POS: 100
y_position = 350

function onCreate()
    addLuaScript('scripts_unloaded/profforgotten', true);
end

function onCreatePost()
    precacheImage('characters/forgotten/profily', true)
	makeAnimatedLuaSprite('profilyimhere', 'characters/forgotten/profily', x_position, y_position);
	addAnimationByPrefix('profilyimhere', 'imhere', 'profily imhere', 24, false);
    addAnimationByPrefix('profilyimhere', 'ded', 'profily ded', 24, false);
    scaleObject('profilyimhere', 0.8, 0.8);
    setPropertyLuaSprite('profilyimhere', 'alpha', 0)
    addLuaSprite('profilyimhere', foreground)
end

function onStepHit()
	if curStep == 1279 then -- um... move the camera over?
    objectPlayAnimation('profilyimhere', 'imhere');
    setPropertyLuaSprite('profilyimhere', 'alpha', 1)
end
if curStep == 1295 then
    setPropertyLuaSprite('profilyforgotten', 'alpha', 1)
    setPropertyLuaSprite('profilyimhere', 'alpha', 0)
end
if curStep == 1943 then
    setPropertyLuaSprite('profilyimhere', 'alpha', 1)
    objectPlayAnimation('profilyimhere', 'ded');
end
end