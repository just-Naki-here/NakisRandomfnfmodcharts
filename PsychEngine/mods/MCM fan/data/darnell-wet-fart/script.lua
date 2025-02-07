function onCreate() -- iba a poner la mecanica pero recorde que la song no esta terminada xd
	
	
	makeLuaText('sub', '', 1000, 160, 143)
	setTextFont('sub', 'Krabby Patty.ttf')
	setTextColor('sub', '0015ff')
	setTextSize('sub', 35);
	setObjectCamera('sub', 'other')
	setTextAlignment('sub', 'center')
	addLuaText('sub')
	
	makeLuaText('suba', '', 1000, 160, 530)
	setTextFont('suba', 'Krabby Patty.ttf')
	setTextColor('suba', '0015ff')
	setTextSize('suba', 35);
	setObjectCamera('suba', 'other')
	setTextAlignment('suba', 'center')
	addLuaText('suba')
	
	
end

function onStepHit()
	if curStep == 30 then
	setTextString('sub', 'AHEM')
	setTextString('suba', 'AJEM')
end
if curStep == 35 then
	setTextString('sub', 'AHEM AHEM')
	setTextString('suba', 'AJEM AJEM')
end
if curStep == 50 then
	setTextString('sub', 'TONIGHT')
	setTextString('suba', 'ESTA NOCHE')
end
if curStep == 57 then
	setTextString('sub', 'TONIGHT WE')
	setTextString('suba', 'ESTA NOCHE ENSAYA')
end
if curStep == 60 then
	setTextString('sub', 'TONIGHT WE REHERSE')
	setTextString('suba', 'ESTA NOCHE ENSAYAREMOS')
end
if curStep == 66 then
	setTextString('sub', 'FOR THE')
	setTextString('suba', 'PARA EL')
end
if curStep == 71 then
	setTextString('sub', 'FOR THE GREATEST')
	setTextString('suba', 'PARA EL MAS GRANDE')
end
if curStep == 78 then
	setTextString('sub', 'FOR THE GREATEST CONCERT')
	setTextString('suba', 'PARA EL MAS GRANDE CONCIERTO')
end
if curStep == 84 then
	setTextString('sub', 'TO EVER')
	setTextString('suba', 'QUE SE HA')
end
if curStep == 90 then
	setTextString('sub', 'TO EVER BE HELD')
	setTextString('suba', 'QUE SE HA REALIZADO')
end
if curStep == 99 then
	setTextString('sub', 'CRUST')
	setTextString('suba', 'CAN')
end
if curStep == 104 then
	setTextString('sub', 'CRUSTACEAN')
	setTextString('suba', 'CANGREJO')
end
if curStep == 120 then
	setTextString('sub', 'A')
	setTextString('suba', 'UNA')
end
if curStep == 123 then
	setTextString('sub', 'A SYMP')
	setTextString('suba', 'UNA SIN')
end
if curStep == 125 then
	setTextString('sub', 'A SYMPHONY')
	setTextString('suba', 'UNA SINFONIA')
end
if curStep == 129 then
	setTextString('sub', 'UNMATCHED')
	setTextString('suba', 'INIGUALABLE')
end
if curStep == 129 then
	setTextString('sub', 'UNMATCHED BY')
	setTextString('suba', 'INIGUALABLE INCLUSO')
end
if curStep == 144 then
	setTextString('sub', 'UNMATCHED BY EVEN')
	setTextString('suba', 'INIGUALABLE INCLUSO PARA')
end
if curStep == 147 then
	setTextString('sub', 'UNMATCHED BY EVEN NEP')
	setTextString('suba', 'INIGUALABLE INCLUSO PARA')
end
if curStep == 150 then
	setTextString('sub', 'UNMATCHED BY EVEN NEPTUNE')
	setTextString('suba', 'INIGUALABLE INCLUSO PARA NEPTUNO')
end
if curStep == 154 then
	setTextString('sub', 'HIM')
	setTextString('suba', 'MIS')
end
if curStep == 158 then
	setTextString('sub', 'HIMSELF')
	setTextString('suba', 'MISMO')
end
if curStep == 171 then
	setTextString('sub', 'AND')
	setTextString('suba', 'Y')
end
if curStep == 175 then
	setTextString('sub', 'AND YOU')
	setTextString('suba', 'Y TU')
end
if curStep == 182 then
	setTextString('sub', 'AND YOU GOT')
	setTextString('suba', 'Y TU TIENES')
end
if curStep == 186 then
	setTextString('sub', 'AND YOU GOT THE LEADING')
	setTextString('suba', 'Y TU TIENES EL PAPEL')
end
if curStep == 192 then
	setTextString('sub', 'AND YOU GOT THE LEADING ROLE')
	setTextString('suba', 'Y TU TIENES EL PAPEL PRINCIPAL')
end
if curStep == 212 then
	setTextString('sub', 'WONT')
	setTextString('suba', 'TE')
end
if curStep == 218 then
	setTextString('sub', 'WONT YOU')
	setTextString('suba', 'TE UNIRAS')
end
if curStep == 224 then
	setTextString('sub', 'WONT YOU JOIN')
	setTextString('suba', 'TE UNIRAS A')
end
if curStep == 232 then
	setTextString('sub', 'WONT YOU JOIN ME?')
	setTextString('suba', 'TE UNIRAS A MI?')
end
if curStep == 240 then
doTweenAlpha('SI', 'sub', 0, 0.5)
doTweenAlpha('SI2', 'suba', 0, 0.5)
end
end