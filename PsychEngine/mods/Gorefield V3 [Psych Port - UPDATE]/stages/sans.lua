function onCreatePost()
setProperty('gf.visible',false);
end

function onCreate()
makeLuaSprite('sansFieldHUD', 'stages/sans/marco_UNDERTALE_1', 0, 0)
addLuaSprite('sansFieldHUD', true)
scaleObject('sansFieldHUD', 1, 1)

makeAnimatedLuaSprite('sansFieldBones', 'stages/sans/bones', 70, -900)
addLuaSprite('sansFieldBones', false)
addAnimationByPrefix('sansFieldBones', 'idle', 'bones', 24, true)
scaleObject('sansFieldBones', 1, 1)
end


