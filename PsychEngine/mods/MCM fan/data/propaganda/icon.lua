
function onUpdatePost(elapsed)
	iconWins=getProperty('healthBar.percent')
	bf()
	if curStep >= 992 then
	gf()
	end
	
	if curStep >= 1072 then
	bf()
	end
	
	if curStep >= 1088 then
	gf()
	end
	
	if curStep >= 1104 then
	bf()
	end
	
	if curStep >= 1120 then
	gf()
	end
	
	if curStep >= 1152 then
	bf()
	end
	
	if curStep >= 1184 then
	gf()
	end
	
	if curStep >= 1216 then
	bf()
	end
	
	if curStep >= 1376 then
	gf()
	end
	
	if curStep >= 1424 then
	bf()
	end
	
	if curStep >= 1676 then
	gf()
	end
	
	if curStep >= 1728 then
	bf()
	end
	
	if curStep >= 1920 then
	gf()
	end
	
	if curStep >= 2048 then
	bf()
	end
end

function bf()
setProperty('iconP1.offset.x', 125)
	setProperty('iconP1.offset.y', 0)
	
setHealthBarColors('#FFB5C071','#FFF4F40D')

	setProperty('iconP1._frame.frame.x', 0)
	setProperty('iconP1._frame.frame.width', 150)
	
	if iconWins<20 then
	setProperty('iconP1._frame.frame.x', 150)
	setProperty('iconP1._frame.frame.width', 150)
	setProperty('iconP1.offset.x', 120)
	end
end

function gf()
setProperty('iconP1.offset.x', 125)
	setProperty('iconP1.offset.y', 0)
	
setHealthBarColors('#FFB5C071','#d5616f')

	setProperty('iconP1._frame.frame.x', 300)
	setProperty('iconP1._frame.frame.width', 150)
	
	if iconWins<20 then
	setProperty('iconP1._frame.frame.x', 450)
	setProperty('iconP1._frame.frame.width', 150)
	setProperty('iconP1.offset.x', 120)
	end
end