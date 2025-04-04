-- Created by RamenDominoes (Feel free to credit or not I don't really care)
--Not bad for my first event created... I think

StartStop = 0

Speed = 0



function onCreate()
	

	--THE TOP BAR
	makeLuaSprite('UpperBar', 'empty', 0, -120)
	makeGraphic('UpperBar', 1280, 120, '000000')
	setObjectCamera('UpperBar', 'hud')
	addLuaSprite('UpperBar', false)


	--THE BOTTOM BAR
	makeLuaSprite('LowerBar', 'empty', 0, 720)
	makeGraphic('LowerBar', 1280, 120, '000000')
	setObjectCamera('LowerBar', 'hud')
	addLuaSprite('LowerBar', false)

end


function onUpdate()

	if StartStop == 1 then
	
	doTweenY('Cinematics1', 'UpperBar', 0, Speed, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 600, Speed, 'Linear')

	end

	if downscroll and StartStop == 1 then
	
	doTweenY('Cinematics1', 'UpperBar', 0, Speed, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 600, Speed, 'Linear')
	end


	if StartStop == 2 then
	
	doTweenY('Cinematics1', 'UpperBar', -120, Speed, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 720, Speed, 'Linear')
	
	end

	if downscroll and StartStop == 2 then
	
	doTweenY('Cinematics1', 'UpperBar', -120, Speed, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 720, Speed, 'Linear')
	
	end
	
end

function onEvent(name,value1,value2)
	if name == 'CinematicsNONOTE' then
		StartStop = tonumber(value1)
		Speed = tonumber(value2)
			end
	
		end
