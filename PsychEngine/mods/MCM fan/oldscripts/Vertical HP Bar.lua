local where = 'right' -- left, right, or center
local bfIconOnly = false -- only bf's icon is shown

local gravity = false -- constant down (health drain) heheh | cool, but needs some tweakin for higher bpms
local lowestHp = 0.09 -- absolute lowest hp can drain (don't make it kill you please, I'm beggin ya) 
local droppinPowr = 0.005 -- every step hit, hp goes down by


local winnin = false
local losin = false
local okin = false

function onCreatePost()
	if bpm <= 115 then
		if droppinPowr < 0.01 then
			droppinPowr = droppinPowr * 2
		end
	end
	makeLuaText('arro', ">>", 100, 100, 100)
	setProperty('arro.angle', 90)
    setObjectCamera("arro", 'other');
    setTextColor('arro', '0xffffff')
    setTextSize('arro', 20);
    addLuaText("arro");
    setTextFont('arro', "vcr.ttf")
    setTextAlignment('arro', 'left')
	setProperty('arro.visible', false)

	if where == 'left' then
		where = -240
		setProperty('iconP1.flipX', true)
	elseif where == 'center' then
		where = 345
		-- timebar in front so stupid icons don't block it
		setObjectOrder('timeBarBG', getObjectOrder('iconP2')+1)
		setObjectOrder('timeBar', getObjectOrder('iconP2')+2)
		setObjectOrder('timeTxt', getObjectOrder('iconP2')+3)

	elseif where == 'right' then
		where = 925
		setProperty('iconP2.flipX', true)
	end

	if bfIconOnly == true then
		setProperty('iconP2.visible', false)
	end

	setProperty('healthBar.angle', 90)
	setProperty('healthBar.x', where) -- right is 920 | center is 345 | left is -240
	setProperty('healthBar.y', 360)

	setProperty('healthBar.scale.x', 0.93) -- initial size is a bit too big
	setProperty('healthBar.scale.y', 0.93)

	setProperty('healthBarBG.scale.x', 0.93)
	setProperty('healthBarBG.scale.y', 0.93)
end

function onStepHit()
	if gravity == true then
		--if curStep % 2 == 0 then
			if getProperty('health') > lowestHp then
				if curBpm <= 115 then
					setProperty('health', getProperty('health')- droppinPowr) -- works, but needs tweakin for higher bpm songs
				else
					setProperty('health', getProperty('health')- droppinPowr * (stepCrochet/50)) -- works, but needs tweakin for higher bpm songs
				end
			end
		--end
	end	
end

function goodNoteHit()
	setProperty('health', getProperty('health')+ 0)
end

function onUpdatePost()
	-- so you can actually see the losing icons for yourself or opponents
	if getProperty('healthBar.percent') >= 95 then
		if winnin == false then
			winnin = true
			doTweenY('win', 'healthBar', 360 + 30, 0.2 + (crochet/5000), 'circOut')
		end
	else
		winnin = false
	end

	if getProperty('healthBar.percent') <= 5 then
		if losin == false then
			losin = true
			doTweenY('oops', 'healthBar', 360 - 30, 0.2 + (crochet/5000), 'circOut')
		end
	else
		losin = false
	end

	if getProperty('healthBar.percent') < 95 and getProperty('healthBar.percent') > 5 then
		if okin == false and getProperty('healthBar.y') ~= 360 then
			okin = true
			doTweenY('reg', 'healthBar', 360, 0.2 + (crochet/5000), 'circOut')
		end

	else
		okin = false
	end

	if bfIconOnly == true then -- this works only with the size I have it set to, if changed, this will probably break | by break I mean the icon'll be off
		P1Mult = getProperty('healthBar.y') - ((getProperty('healthBar.width') * (getProperty('healthBar.percent') / getProperty('healthBar.scale.y') - 0.005) * 0.01) + (150 * getProperty('iconP1.scale.x') - 150)) + 290
	else
		P1Mult = getProperty('healthBar.y') - ((getProperty('healthBar.width') * getProperty('healthBar.percent') * getProperty('healthBar.scale.y') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150)) + 270
	end

	P2Mult = getProperty('healthBar.y') - ((getProperty('healthBar.width') * getProperty('healthBar.percent') * getProperty('healthBar.scale.y') * 0.01) - (150 * getProperty('iconP2.scale.x')))


	setProperty('iconP1.x', getProperty('healthBar.x') + 220)
	setProperty('iconP1.origin.y', -100) -- stops sussy icon bop
	setProperty('iconP1.y', P1Mult)

	setProperty('iconP2.x', getProperty('healthBar.x') + 220)
	setProperty('iconP2.origin.y', 200)
	setProperty('iconP2.y', P2Mult)

	if gravity == true then
		setProperty('arro.visible', true)
		setProperty('arro.x', getProperty('iconP1.x') - 20)
		setProperty('arro.y', getProperty('iconP1.y') + 100)
		if getProperty('health') <= lowestHp then
			setTextString('arro', '||')
			setProperty('arro.angle', 90)
			setProperty('arro.y', 676)
		else
			setTextString('arro', '>>')
			setProperty('arro.angle', 90)
		end
	else
		setProperty('arro.visible', false)
	end
end