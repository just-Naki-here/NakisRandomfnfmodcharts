function onCreatePost()
	
	if downscroll == true then
		KarmaPos = 15
	else
		KarmaPos = 605
	end
	
	makeLuaSprite('sick','gui/sick', 25, KarmaPos)
	addLuaSprite('sick',true)
	scaleObject('sick',2,1.8)
	setProperty('sick.antialiasing', false)
	setObjectCamera('sick', 'hud')
	setProperty('sick.alpha', 0)
	
	makeLuaSprite('great','gui/great', 25, KarmaPos)
	addLuaSprite('great',true)
	scaleObject('great',2,1.8)
	setProperty('great.antialiasing', false)
	setObjectCamera('great', 'hud')
	setProperty('great.alpha', 0)
	
	makeLuaSprite('good','gui/good', 25, KarmaPos)
	addLuaSprite('good',true)
	scaleObject('good',2,1.8)
	setProperty('good.antialiasing', false)
	setObjectCamera('good', 'hud')
	setProperty('good.alpha', 0)
	
	makeLuaSprite('bad','gui/bad', 25, KarmaPos)
	addLuaSprite('bad',true)
	scaleObject('bad',2,1.8)
	setProperty('bad.antialiasing', false)
	setObjectCamera('bad', 'hud')
	setProperty('bad.alpha', 0)
	
	makeLuaSprite('shit','gui/shit', 25, KarmaPos)
	addLuaSprite('shit',true)
	scaleObject('shit',2,1.8)
	setProperty('shit.antialiasing', false)
	setObjectCamera('shit', 'hud')
	setProperty('shit.alpha', 0)
	
	makeAnimatedLuaSprite('trans','gui/trans', 0, 575)
		addAnimationByPrefix('trans','trans','trans',24,false);
	addLuaSprite('trans',false)
	setObjectCamera('trans', 'hud')
	setObjectOrder('trans',7)
	setProperty('trans.alpha',0)
	
	
	if downscroll == true then
		setProperty('trans.y', -15 )
	else
		setProperty('trans.y', 575 )
	end
	
end


function onUpdate()
	if rating >= 0.95 then
	ratechange = true
	trans()
	doTweenX('sickbiggX','sick.scale',2.05, 0.5, 'backOut')
	doTweenY('sickbiggY','sick.scale',2.05, 0.5, 'backOut')
	doTweenAlpha('sickbiggsee','sick',1,0.5, 'circOut')
	
	doTweenAlpha('greatbye','great',0,0.5, 'circOut')
	doTweenAlpha('goodbye','good',0,0.5, 'circOut')
	doTweenAlpha('badbye','bad',0,0.5, 'circOut')
	doTweenAlpha('shitbye','shit',0,0.5, 'circOut')
	
	setProperty('shit.scale.x',1.8)
	setProperty('bad.scale.x',1.8)
	setProperty('good.scale.x',1.8)
	setProperty('great.scale.x',1.8)

	
	setProperty('shit.scale.y',1.8)
	setProperty('bad.scale.y',1.8)
	setProperty('good.scale.y',1.8)
	setProperty('great.scale.y',1.8)

	
	elseif  rating >= 0.8 then
	ratechange = true
	trans()
	
	doTweenX('greatbiggX','great.scale',2.05, 0.5, 'backOut')
	doTweenY('greatbiggY','great.scale',2.05, 0.5, 'backOut')
	doTweenAlpha('greatbiggsee','great',1,0.5, 'circOut')
	
	doTweenAlpha('sickbye','sick',0,0.5, 'circOut')
	doTweenAlpha('goodbye','good',0,0.5, 'circOut')
	doTweenAlpha('badbye','bad',0,0.5, 'circOut')
	doTweenAlpha('shitbye','shit',0,0.5, 'circOut')
	
	setProperty('shit.scale.x',1.8)
	setProperty('bad.scale.x',1.8)
	setProperty('good.scale.x',1.8)
	setProperty('sick.scale.x',1.8)
	
	setProperty('shit.scale.y',1.8)
	setProperty('bad.scale.y',1.8)
	setProperty('good.scale.y',1.8)
	setProperty('sick.scale.y',1.8)
	
	elseif rating >= 0.6 then
	ratechange = true
	trans()
	doTweenX('goodbiggX','good.scale',2.05, 0.5, 'backOut')
	doTweenY('goodbiggY','good.scale',2.05, 0.5, 'backOut')
	doTweenAlpha('goodbiggsee','good',1,0.5, 'circOut')
	
	doTweenAlpha('sickbye','sick',0,0.5, 'circOut')
	doTweenAlpha('greatbye','great',0,0.5, 'circOut')
	doTweenAlpha('badbye','bad',0,0.5, 'circOut')
	doTweenAlpha('shitbye','shit',0,0.5, 'circOut')

	setProperty('shit.scale.x',1.8)
	setProperty('bad.scale.x',1.8)
	setProperty('great.scale.x',1.8)
	setProperty('sick.scale.x',1.8)
	
	setProperty('shit.scale.y',1.8)
	setProperty('bad.scale.y',1.8)
	setProperty('great.scale.y',1.8)
	setProperty('sick.scale.y',1.8)
	
	elseif rating >= 0.35 then
	ratechange = true
	trans()
	doTweenX('badbiggX','bad.scale',2.05, 0.5, 'backOut')
	doTweenY('badbiggY','bad.scale',2.05, 0.5, 'backOut')
	doTweenAlpha('badbiggsee','bad',1,0.5, 'circOut')
	
	doTweenAlpha('sickbye','sick',0,0.5, 'circOut')
	doTweenAlpha('greatbye','great',0,0.5, 'circOut')
	doTweenAlpha('goodbye','good',0,0.5, 'circOut')
	doTweenAlpha('shitbye','shit',0,0.5, 'circOut')

	setProperty('shit.scale.x',1.8)
	setProperty('good.scale.x',1.8)
	setProperty('great.scale.x',1.8)
	setProperty('sick.scale.x',1.8)
	
	setProperty('shit.scale.y',1.8)
	setProperty('good.scale.y',1.8)
	setProperty('great.scale.y',1.8)
	setProperty('sick.scale.y',1.8)
	
	elseif rating <= 0.35 then
	ratechange = true
	trans()
	doTweenX('shitbiggX','shit.scale',2.05, 0.5, 'backOut')
	doTweenY('shitbiggY','shit.scale',2.05, 0.5, 'backOut')
	doTweenAlpha('shitbiggsee','shit',1,0.5, 'circOut')
	
	doTweenAlpha('sickbye','sick',0,0.5, 'circOut')
	doTweenAlpha('greatbye','great',0,0.5, 'circOut')
	doTweenAlpha('goodbye','good',0,0.5, 'circOut')
	doTweenAlpha('badbye','bad',0,0.5, 'circOut')

	setProperty('bad.scale.x',1.8)
	setProperty('good.scale.x',1.8)
	setProperty('great.scale.x',1.8)
	setProperty('sick.scale.x',1.8)
	
	setProperty('bad.scale.y',1.8)
	setProperty('good.scale.y',1.8)
	setProperty('great.scale.y',1.8)
	setProperty('sick.scale.y',1.8)
	end
end

function onUpdateScore()

	if downscroll == true then
		ratescoreY = 80 
	else
		ratescoreY = 670 
	end

	makeLuaText('therates', 'Score : '..score.. ' | Misses : '..misses..' | Combo : ' .. combo ..' ( ' .. ratingFC .. ' )', 500, 135, ratescoreY)
	setTextAlignment('therates', 'left')
	setTextColor('therates', 'FFFFFF')
	setTextFont('therates', 'rain-world-menu.ttf')
	setTextSize('therates', 20)
	setTextBorder('therates', 0, 'd4d4d4')
	addLuaText('therates')
	setObjectCamera('therates', 'hud')
	setObjectOrder('therates',getObjectOrder('sick') + 2)

	
	if inGameOver then
		setProperty('therates.alpha',0)
	end
end

function trans()
	if ratechange == true then
	setProperty('trans.alpha',1)
	objectPlayAnimation('trans','trans',true);
	ratechange = false
	end
end