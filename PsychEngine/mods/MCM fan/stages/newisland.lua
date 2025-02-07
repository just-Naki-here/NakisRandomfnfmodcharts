function onCreate()
	makeLuaSprite('sunset', 'background/plagerize/sunset', -400,-600);
	setLuaSpriteScrollFactor('sunset', 0.6, 0.6)
	scaleLuaSprite('sunset',1.6,1.6);
	addLuaSprite('sunset', false);
	
	makeLuaSprite('sun', 'background/plagerize/sun', -350,-20);
	setLuaSpriteScrollFactor('sun', 0.7, 0.7)
	scaleLuaSprite('sun',1.3,1.3);
	addLuaSprite('sun', false);

    makeLuaSprite('volcano', 'background/plagerize/volcano', -850,-20);
	setLuaSpriteScrollFactor('volcano', 0.7, 0.7)
	scaleLuaSprite('volcano',1.3,1.3);
	addLuaSprite('volcano', false);
	
	makeLuaSprite('tree1', 'background/plagerize/treeGroup1', -950,-200);
	setLuaSpriteScrollFactor('tree1', 0.9, 0.9)
	scaleLuaSprite('tree1',1.3,1.3);
	addLuaSprite('tree1', false);
	
	makeLuaSprite('tree2', 'background/plagerize/treeGroup2', -100,-200);
	setLuaSpriteScrollFactor('tree2', 1.3, 0.9)
	scaleLuaSprite('tree2',1.3,1.3);
	addLuaSprite('tree2', false);
	
	makeLuaSprite('tree3', 'background/plagerize/treeGroup3', 1050,-150);
	setLuaSpriteScrollFactor('tree3', 0.9, 0.9)
	scaleLuaSprite('tree3',1.3,1.3);
	addLuaSprite('tree3', false);
	
	makeLuaSprite('sand1', 'background/plagerize/sand1', -600,-350);
	setLuaSpriteScrollFactor('sand1', 0.8, 0.8)
	scaleLuaSprite('sand1',1.3,1.3);
	addLuaSprite('sand1', false);
	
	makeLuaSprite('trees2', 'background/plagerize/tree2', -550,-250);
	setLuaSpriteScrollFactor('trees2', 1.3, 0.8)
	scaleLuaSprite('trees2',1.2,1.2);
	addLuaSprite('trees2', false);
	
	makeLuaSprite('sandFG', 'background/plagerize/sand2', -450,-250);
	setLuaSpriteScrollFactor('sandFG', 1, 1)
	scaleLuaSprite('sandFG',1.3,1.3);
	addLuaSprite('sandFG', false);
	
    makeLuaSprite('treeFg', 'background/plagerize/treeFg', -600,-150);
	setLuaSpriteScrollFactor('treeFg', 1, 1)
	scaleLuaSprite('treeFg',1.3,1.3);
	addLuaSprite('treeFg', false);
	
doTweenAngle('tree1','tree1',180,0.000001)
doTweenAngle('tree2','tree2',180,0.0000011)
doTweenAngle('tree3','tree3',-180,0.0000011)
doTweenY('tree11','tree1',500,0.0000011)
doTweenY('tree22','tree2',500,0.0000011)
doTweenY('tree33','tree3',500,0.0000011)
doTweenY('sand1Y', 'sand1', -200, 0.0000011, 'bounceOut')
doTweenX('volcanoX', 'volcano', -350, 0.000001001, 'bounceOut')
doTweenY('volcanoY', 'volcano', 480, 0.000001001, 'bounceOut')
end
function onUpdate()

if curStep == 258 then
doTweenY('sand1Y', 'sand1', -450, 0.05, 'bounceOut')
end
if curStep == 260 then
doTweenY('sand1Y', 'sand1', -350, 0.05, 'bounceOut')
end
if curStep == 262 then
doTweenX('volcanoX', 'volcano', -850, 0.05, 'bounceOut')
doTweenY('volcanoY', 'volcano', -280, 0.05, 'bounceOut')
end
if curStep == 264 then
doTweenX('volcanoX', 'volcano', -850, 0.1, 'bounceOut')
doTweenY('volcanoY', 'volcano', -20, 0.1, 'bounceOut')
end
if curStep == 266 then
doTweenAngle('tree1','tree1',-20,0.05)
doTweenY('tree11','tree1',-200,0.1)
end
if curStep == 268 then
doTweenAngle('tree1','tree1',0,0.1)
end
if curStep == 270 then
doTweenAngle('tree3','tree3',30,0.05)
doTweenY('tree3','tree3',-150,0.1)
end
if curStep == 272 then
doTweenAngle('tree3','tree3',0,0.1)
end
if curStep == 274 then
doTweenAngle('tree2','tree2',-60,0.2)
doTweenY('tree22','tree2',-200,0.1)
setLuaSpriteScrollFactor('tree2', 0.9, 0.9)
end
if curStep == 277 then
doTweenAngle('tree2','tree2',30,0.4)
end
if curStep == 279 then
doTweenAngle('tree2','tree2',0,0.2)
end
end