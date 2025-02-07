trigger = 2

function onEvent(n,v1,v2)

if n == "trigger" then

trigger = tonumber(v1)

end

end
function onUpdate()
if curStep < 1504 then
if trigger == 1 then
	if mustHitSection then
	setProperty('defaultCamZoom', 0.6)
	triggerEvent('Camera Follow Pos','2100','1310')	
	else
	setProperty('defaultCamZoom', 0.7)
	triggerEvent('Camera Follow Pos','1100','1410')
	end
	end
	if trigger == 2 then
	triggerEvent('Camera Follow Pos','1700','1310')
	setProperty('defaultCamZoom', 0.5)
	end
	end
	if curStep >= 1504 then
if trigger == 1 then
	if mustHitSection then
	triggerEvent('Camera Follow Pos','2100','1510')	
	else
	triggerEvent('Camera Follow Pos','1100','1510')
	end
	end
	if trigger == 2 then
	triggerEvent('Camera Follow Pos','1550','1510')
	end
	end
	if curStep == 1504 then
	setProperty('defaultCamZoom', 0.3)
	end
end

function onCreate()
makeLuaSprite('bg1', 'background/served/phase1/Clear sky', -1000,-860);
	setLuaSpriteScrollFactor('bg1', 0.2, 0.2)
	scaleLuaSprite('bg1',1.1,1.1);
	addLuaSprite('bg1', false);
	
	makeLuaSprite('bg2', 'background/served/phase2/Fucked sky', -1000,-860);
	setLuaSpriteScrollFactor('bg2', 0.2, 0.2)
	scaleLuaSprite('bg2',1.1,1.1);
	addLuaSprite('bg2', false);
	setProperty('bg2.alpha', 0);
	
	makeLuaSprite('coral1', 'background/served/phase1/Clear corals', -220,-130);
	setLuaSpriteScrollFactor('coral1', 0.75, 0.75)
	scaleLuaSprite('coral1',0.8,0.8);
	addLuaSprite('coral1', false);
	
	makeLuaSprite('coral2', 'background/served/phase2/Fucked corals', -220,-130);
	setLuaSpriteScrollFactor('coral2', 0.75, 0.75)
	scaleLuaSprite('coral2',0.8,0.8);
	addLuaSprite('coral2', false);
	setProperty('coral2.alpha', 0);
	
	makeLuaSprite('ground1', 'background/served/phase1/Clear bg', -180,-20);
	setLuaSpriteScrollFactor('ground1', 1, 1)
	scaleLuaSprite('ground1',0.9,0.9);
	addLuaSprite('ground1', false);
	
	makeLuaSprite('ground2', 'background/served/phase2/Fucked bg', -180,-20);
	setLuaSpriteScrollFactor('ground2', 1, 1)
	scaleLuaSprite('ground2',0.9,0.9);
	addLuaSprite('ground2', false);
	setProperty('ground2.alpha', 0);
	
	makeLuaSprite('pillar1', 'background/served/platform/pillar', 300,1370);
	setLuaSpriteScrollFactor('pillar1', 1, 1)
	scaleLuaSprite('pillar1',2,2);
	addLuaSprite('pillar1', false);
	
	makeLuaSprite('pillar2', 'background/served/platform/pillar', 1680,1360);
	setLuaSpriteScrollFactor('pillar2', 1, 1)
	scaleLuaSprite('pillar2',2,2);
	addLuaSprite('pillar2', false);
	
	setProperty('pillar1.alpha', 0);
	setProperty('pillar2.alpha', 0);
end

--  Current Step Events (Stages Changes n' Such)
function onStepHit()
if curStep == 176 then
	setProperty('bg1.alpha', 0);
	setProperty('coral1.alpha', 0);
	setProperty('ground1.alpha', 0);
	
	setProperty('bg2.alpha', 1);
	setProperty('coral2.alpha', 1);
	setProperty('ground2.alpha', 1);
	end
	if curStep == 1504 then
	setProperty('bg1.alpha', 0);
	setProperty('coral1.alpha', 0);
	setProperty('ground1.alpha', 0);
	
	setProperty('bg2.alpha', 0);
	setProperty('coral2.alpha', 0);
	setProperty('ground2.alpha', 0);
	
	setProperty('pillar1.alpha', 1);
	setProperty('pillar2.alpha', 2);
	end
end