eT = 0 --elapsed time
eL = 0
reach = {
  x = 9.6,
  y = 9.6
}
speed = {
  x = 3,
  y = 3
}

function onCreatePost()

pearlamou = {}

pearlamou[1] = 'pearl1'
pearlamou[2] = 'pearl2'
pearlamou[3] = 'pearl3'
pearlamou[4] = 'pearl4'
pearlamou[5] = 'pearl5'
pearlamou[6] = 'pearl6'

pearlex = {}

pearlex[1] = 1
pearlex[2] = 2
pearlex[3] = 3
pearlex[4] = 4
pearlex[5] = 5
pearlex[6] = 6

bgpearl = {}

bgpearl[1] = 'bgpearl1'
bgpearl[2] = 'bgpearl2'
bgpearl[3] = 'bgpearl3'
bgpearl[4] = 'bgpearl4'
bgpearl[5] = 'bgpearl5'
bgpearl[6] = 'bgpearl6'

pearleY = {}

pearleY[1] = 1
pearleY[2] = 2
pearleY[3] = 3
pearleY[4] = 4
pearleY[5] = 5
pearleY[6] = 6
end

function onUpdate(e)
	eT = eT + e
	for i = 1,6 do
	setProperty(pearlamou[i] .. '.x', getProperty(pearlamou[i] .. '.x') + math.sin((eT * speed.x) + math.random(0,1) + pearlex[i]) * 4)
	setProperty(pearlamou[i] .. '.y', getProperty(pearlamou[i] .. '.y') + math.cos((eT * speed.y) + math.random(0,1) + pearlex[i]) * 4)
	end
	
	eL = eL + e
	for t = 1,6 do
	setProperty(bgpearl[t] .. '.x', getProperty(bgpearl[t] .. '.x') + math.sin((eT * 2) + math.random(0,1) + pearleY[t]) * 4)
	setProperty(bgpearl[t] .. '.y', getProperty(bgpearl[t] .. '.y') + math.cos((eT * 2) + math.random(0,1) + pearleY[t]) * 4)
	end
end

stepHitFuncs = {
	
	[1808] = function()
		for i = 1,6 do
		makeLuaSprite(pearlamou[i],'halcyon/pearl/pearl' .. getRandomInt(1,3), 200 , 380)
	setObjectOrder(pearlamou[i], getObjectOrder('2ndhalocircle')+1)
	addLuaSprite(pearlamou[i],false)
	setProperty(pearlamou[i] .. '.alpha', 0.2)
	setProperty(pearlamou[i] .. '.scale.x', 1.1)
	setProperty(pearlamou[i] .. '.scale.y', 1.1)
	setSpriteShader(pearlamou[i], 'bloom')
	
		makeLuaSprite(bgpearl[i],'halcyon/pearl/pearl' .. getRandomInt(1,3),1200, 380)
	addLuaSprite(bgpearl[i],false)
	setObjectOrder(bgpearl[i], getObjectOrder('2ndhalocircle') + getRandomInt(-2,-1))
	setProperty(bgpearl[i] .. '.alpha', 0.2)
	setProperty(bgpearl[i] .. '.scale.x', 1.1)
	setProperty(bgpearl[i] .. '.scale.y', 1.1)
	setSpriteShader(bgpearl[i], 'bloom')
		
		end
	end
}

function onStepHit()
    if stepHitFuncs[curStep] then 
        stepHitFuncs[curStep]() 
    end 
end