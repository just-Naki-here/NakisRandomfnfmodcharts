function onCreate()
makeLuaSprite('BIGOTESBG', 'stages/bigotes/BG_0', 50, -350)
addLuaSprite('BIGOTESBG', false)
scaleObject('BIGOTESBG', 1, 1)
setScrollFactor('BIGOTESBG', 0.7, 0.7)
setProperty('BIGOTESBG.alpha', 0.7)

makeAnimatedLuaSprite('tornado', 'stages/bigotes/BG_TORNADO', 1100, 0)
addLuaSprite('tornado', false)
addAnimationByPrefix('tornado', 'loop', 'BG TORNADO', 24, true)
scaleObject('tornado', 1, 1)
setScrollFactor('tornado', 0.85, 0.85)

makeLuaSprite('BG1', 'stages/bigotes/BG_01', 0, 0)
addLuaSprite('BG1', false)
scaleObject('BG1', 1, 1)
setScrollFactor('BG1', 0.8, 0.8)

makeLuaSprite('BG2', 'stages/bigotes/BG_AGUA', 200, 1200)
addLuaSprite('BG2', false)
scaleObject('BG2', 1, 1)

makeAnimatedLuaSprite('BGAGUA', 'stages/bigotes/agua', getProperty('dad.x'), getProperty('dad.y'))
addLuaSprite('BGAGUA', false)
addAnimationByPrefix('BGAGUA', 'loop', 'agua', 24, true)
scaleObject('BGAGUA', 1.1, 1.1)

makeLuaSprite("BlackBGPixel", nil, -500, -250)
makeGraphic("BlackBGPixel", 1280, 720, "0xFF362253")
addLuaSprite("BlackBGPixel", false)
scaleObject('BlackBGPixel', 10, 10)
setProperty('BlackBGPixel.alpha', 0)
setScrollFactor('BlackBGPixel', 0, 0)

makeAnimatedLuaSprite('BGAGUAPixel', 'stages/bigotes/BiGote', 1150, 500)
addLuaSprite('BGAGUAPixel', false)
addAnimationByPrefix('BGAGUAPixel', 'loop', 'BiGote water', 7, true)
scaleObject('BGAGUAPixel', 1.3, 0.5)
setProperty('BGAGUAPixel.alpha', 0)
end

function onCreatePost()
setScrollFactor('dad', 0.9, 0.9)
end

function onUpdate(elapsed)
setProperty('BGAGUA.y', getProperty('dad.y') + 1100)
setProperty('BGAGUA.x', getProperty('dad.x') + 90)
end

function onUpdatePost(elapsed)
for i=0, getProperty('opponentStrums.length')-1 do
setPropertyFromGroup('opponentStrums', i, 'x', 999999)
end
end
