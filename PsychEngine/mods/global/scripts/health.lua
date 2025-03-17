function onCreate()
	setProperty('skipCountdown', true)
end

function onCreatePost()
	setProperty('health',0.1)
	setProperty('healthBar.angle', 180)
	setHealthBarColors('000000', 'FFFFFF');
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('healthBar.alpha', 0)
	setProperty('scoreTxt.visible', false)
	setProperty('showComboNum', false)
	setProperty('showRating', false)
	
pips = {}

pips[1] = 'pip1'
pips[2] = 'pip2'
pips[3] = 'pip3'
pips[4] = 'pip4'
pips[5] = 'pip5'
pips[6] = 'pip6'
pips[7] = 'pip7'
pips[8] = 'pip8'
pips[9] = 'pip9'
pips[10] = 'pip10'

pipslot = {}

pipslot[1] = 'pipslot1'
pipslot[2] = 'pipslot2'
pipslot[3] = 'pipslot3'
pipslot[4] = 'pipslot4'
pipslot[5] = 'pipslot5'
pipslot[6] = 'pipslot6'
pipslot[7] = 'pipslot7'
pipslot[8] = 'pipslot8'
pipslot[9] = 'pipslot9'
pipslot[10] = 'pipslot10'

if downscroll == true then
		pipY = 46
		pipSpace = 45
		pipslotY = 41
		pipSlotSpace = 45
	else
		pipY = 636
		pipSpace = 45
		pipslotY = 631
		pipSlotSpace = 45
	end
	
	makeLuaSprite('pip1','gui/pip', 140, pipY)
	makeLuaSprite('pip2','gui/pip', getProperty('pip1.x') + pipSpace, pipY)
	makeLuaSprite('pip3','gui/pip', getProperty('pip2.x') + pipSpace, pipY)
	makeLuaSprite('pip4','gui/pip', getProperty('pip3.x') + pipSpace, pipY)
	makeLuaSprite('pip5','gui/pip', getProperty('pip4.x') + pipSpace, pipY)
	makeLuaSprite('pip6','gui/pip', getProperty('pip5.x') + pipSpace, pipY)
	makeLuaSprite('pip7','gui/pip', getProperty('pip6.x') + pipSpace, pipY)
	makeLuaSprite('pip8','gui/pip', getProperty('pip7.x') + pipSpace, pipY)
	makeLuaSprite('pip9','gui/pip', getProperty('pip8.x') + pipSpace, pipY)
	makeLuaSprite('pip10','gui/pip', getProperty('pip9.x') + pipSpace, pipY)
	for i = 1, 10 do
		scaleObject(pips[i],1.2,1.2)
		addLuaSprite(pips[i],true)
		setProperty(pips[i] .. '.antialiasing', false)
		setObjectCamera(pips[i], 'hud')
		setProperty(pips[i] .. '.alpha', 0)
	end
	
	makeLuaSprite('pipslot1','gui/pipslot', 135, pipslotY)
	makeLuaSprite('pipslot2','gui/pipslot', getProperty('pipslot1.x') + pipSlotSpace, pipslotY)
	makeLuaSprite('pipslot3','gui/pipslot', getProperty('pipslot2.x') + pipSlotSpace, pipslotY)
	makeLuaSprite('pipslot4','gui/pipslot', getProperty('pipslot3.x') + pipSlotSpace, pipslotY)
	makeLuaSprite('pipslot5','gui/pipslot', getProperty('pipslot4.x') + pipSlotSpace, pipslotY)
	makeLuaSprite('pipslot6','gui/pipslot', getProperty('pipslot5.x') + pipSlotSpace, pipslotY)
	makeLuaSprite('pipslot7','gui/pipslot', getProperty('pipslot6.x') + pipSlotSpace, pipslotY)
	makeLuaSprite('pipslot8','gui/pipslot', getProperty('pipslot7.x') + pipSlotSpace, pipslotY)
	makeLuaSprite('pipslot9','gui/pipslot', getProperty('pipslot8.x') + pipSlotSpace, pipslotY)
	makeLuaSprite('pipslot10','gui/pipslot', getProperty('pipslot9.x') + pipSlotSpace, pipslotY)
	
	for i = 1, 10 do
		scaleObject(pipslot[i],1.2,1.2)
		addLuaSprite(pipslot[i],true)
		setProperty(pipslot[i] .. '.antialiasing', false)
		setObjectCamera(pipslot[i], 'hud')
	end
end

local pipTweenDuration = 0.4

function onUpdate()
	if getProperty('healthBar.percent') > 99 then
		growPip(10)
		
	elseif getProperty('healthBar.percent') < 99 then
		losePip(10)
	end
	
	if getProperty('healthBar.percent') > 89 then
		growPip(9)
		
	elseif getProperty('healthBar.percent') < 89 then
		losePip(9)
	end
	
	if getProperty('healthBar.percent') > 79 then
		growPip(8)
		
	elseif getProperty('healthBar.percent') < 79 then
		losePip(8)
	end
	
	if getProperty('healthBar.percent') > 69 then
		growPip(7)
		
	elseif getProperty('healthBar.percent') < 69 then
		losePip(7)
	end
	
	if getProperty('healthBar.percent') > 59 then
		growPip(6)
		
	elseif getProperty('healthBar.percent') < 59 then
		losePip(6)
	end
	
	if getProperty('healthBar.percent') > 49 then
		growPip(5)
		
	elseif getProperty('healthBar.percent') < 49 then
		losePip(5)
	end
	
	if getProperty('healthBar.percent') > 39 then
		growPip(4)
		
	elseif getProperty('healthBar.percent') < 39 then
		losePip(4)
	end
	
	if getProperty('healthBar.percent') > 29 then
		growPip(3)
		
	elseif getProperty('healthBar.percent') < 29 then
		losePip(3)
	end
	
	if getProperty('healthBar.percent') > 19 then
		growPip(2)
		
	elseif getProperty('healthBar.percent') < 19 then
		losePip(2)
	end
	
	if getProperty('healthBar.percent') > 9 then
		growPip(1)
		
	elseif getProperty('healthBar.percent') < 1 then
		losePip(1)
	end
end

function growPip(tag)
	doTweenAlpha('pip' .. tag ..'hi','pip' .. tag,1,0.2, 'linear')
		
	doTweenX('pip' .. tag .. 'growx','pip' .. tag .. '.scale',1.2,pipTweenDuration, 'backOut')
	doTweenY('pip' .. tag .. 'growy','pip' .. tag .. '.scale',1.2,pipTweenDuration, 'backOut')
end

function losePip(tag)
	doTweenAlpha('pip' .. tag .. 'bye','pip' .. tag,0,0.2, 'linear')
end