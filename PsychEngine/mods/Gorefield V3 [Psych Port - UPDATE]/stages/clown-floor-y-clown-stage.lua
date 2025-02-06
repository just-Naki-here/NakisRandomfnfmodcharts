function onCreate()
makeLuaSprite('floor', 'stages/clown-floor-y-clown-stage/Clown_Stage_Floor', 0, 0)
addLuaSprite('floor', false)
scaleObject('floor', 6, 6)

makeLuaSprite('background', 'stages/clown-floor-y-clown-stage/Clown_Stage_face_1', 0, 0)
addLuaSprite('background', false) 
scaleObject('background', 6, 6)

makeLuaSprite('light', 'stages/clown-floor-y-clown-stage/Clown_Stage_Ligth', 0, 120)
addLuaSprite('light', true)
scaleObject('light', 7, 7)
setProperty('light.visible', false)
setProperty('light.alpha', 0.35)

createInstance('binky', 'flixel.addons.display.FlxBackdrop', {0x01, 0x01})
loadFrames('binky', 'characters/Binky_alt')
addAnimationByPrefix('binky', 'left', 'Binky_alt_ left', 12, false)
addAnimationByPrefix('binky', 'down', 'Binky_alt_ down', 12, false)
addAnimationByPrefix('binky', 'up', 'Binky_alt_ up', 12, false)
addAnimationByPrefix('binky', 'right', 'Binky_alt_ rigth', 12, false)
addAnimationByPrefix('binky', 'idle', 'Binky_alt_ Idle', 12, false)
setProperty('binky.velocity.x', -500)
addInstance('binky')
scaleObject('binky', 1.6, 1.6)
addOffset('binky', 'idle', 0, 0)
setProperty('binky.visible', false)
end

function onCreatePost()
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",1000)
setProperty("camFollow.y", 550)
end

function onTimerCompleted(tag)
if tag == 'idleA' then
idle = true
end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if noteData == 0 then
        idle = false
        runTimer('idleA',0.7)
        playAnim("binky","left",true);
       end
       if noteData == 1 then
        idle = false
        runTimer('idleA',0.7)
        playAnim("binky","down",true);
       end
       if noteData == 2 then
        idle = false
        runTimer('idleA',0.7)
        playAnim("binky","up",true);
       end
       if noteData == 3 then
        idle = false
        runTimer('idleA',0.7)
        playAnim("binky","right",true);
       end
    end

function onBeatHit()
if idle then 
		if curBeat % 2 == 0 then
       playAnim("binky","idle",true);
     end
   end
end

