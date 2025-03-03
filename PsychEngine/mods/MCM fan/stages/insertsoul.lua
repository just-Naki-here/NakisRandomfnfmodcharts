trigger = 1
i = 2
e = -275
ii = 225
function onEvent(n,v1,v2)

if n == "trigger" then

trigger = tonumber(v1)
end
end

function onCreate()
	--debugPrint('Script started!')
	--background shit
	makeAnimatedLuaSprite('IS', 'insertsoul/insertsoulbg', 200, 220);
	addAnimationByPrefix('IS', 'wow', 'bg', 24, true)
	setScrollFactor('IS', 1, 1);
	setProperty('IS.antialiasing', false); 
	addLuaSprite('IS', false);
	objectPlayAnimation('IS', 'wow', false)
	scaleLuaSprite('IS',1.5,1.5);
	
	addCharacterToList('glitchyghostbf', 'bf');
	
	makeLuaSprite('b', 'b', -250, -290)
addLuaSprite('b', true)
scaleObject('b', 0.2, 1)
setScrollFactor('b', 1, 1)
setObjectCamera('b', 'other')

makeLuaSprite('b1', 'b', 1100, -160)
addLuaSprite('b1', false)
scaleObject('b1', 0.2, 1)
setScrollFactor('b1', 1, 1)
setObjectCamera('b1', 'other')

initLuaShader("MirrorEffect")
--initLuaShader("MirrorEffect")
 
  setSpriteShader('IS',"MirrorEffect")

end
 

function onUpdate()
setPropertyFromGroup('opponentStrums', 0, 'x', 414+e);
	setPropertyFromGroup('opponentStrums', 1, 'x', 527+e);
	setPropertyFromGroup('opponentStrums', 2, 'x', 637+e);
	setPropertyFromGroup('opponentStrums', 3, 'x', 750+e);

	setPropertyFromGroup('playerStrums', 0, 'x', 414+ii);
	setPropertyFromGroup('playerStrums', 1, 'x', 527+ii);
	setPropertyFromGroup('playerStrums', 2, 'x', 637+ii);
	setPropertyFromGroup('playerStrums', 3, 'x', 750+ii);
	
	
	setShaderFloat("IS", "x", 1)
	setShaderFloat("IS", "y", 1)
if trigger == 1 then
triggerEvent('Change Character', 'bf', 'ghostbf')
setProperty('defaultCamZoom',3.5)
setShaderFloat("IS", "zoom", 1)
end
if trigger == 2 then
triggerEvent('Change Character', 'bf', 'glitchyghostbf')
setProperty('defaultCamZoom',3)
--setShaderFloat("IS", "zoom", 0.000001)
end
if i > 4 then
i = 2
end
if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                setProperty('defaultCamZoom',i-1)
                i = i + 1
               -- setShaderFloat("IS", "y", 1000)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                setProperty('defaultCamZoom',i-1)
           --     setShaderFloat("IS", "y", 1000)
                i = i + 1
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
                setProperty('defaultCamZoom',i-1)
              --  setShaderFloat("IS", "y", 1000)
                i = i + 1
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                setProperty('defaultCamZoom',i-1)
             --   setShaderFloat("IS", "y", 1000)
                i = i + 1
            end
	if curStep == 1088 then
	setScrollFactor('IS', 0.3, 0.3);
	doTweenX('isx', 'IS.scale', 1.1, 0.1, elapsed)
	doTweenX('isx1', 'IS', 250, 0.1, elapsed)
	doTweenY('isy1', 'IS', 160, 0.1, elapsed)
doTweenY('isy', 'IS.scale', 1.1, 0.1, elapsed)
setProperty('cameraSpeed', 1)
	end
	if curStep >= 2112 then
	setProperty('defaultCamZoom',2)
	doTweenAlpha('camHUDOff' ,'camHUD', 0, 1, 'linear')
    --doTweenAlpha('camGameOff' ,'camGame', 0, 1, 'linear')
	end
end