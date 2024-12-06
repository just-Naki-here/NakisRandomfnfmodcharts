-- credit script by cooldudecrafter
function onCreate()
	makeLuaText('creditTxt', 'Song cover: insert song here',0, 200, -95); -- change the "200" in order to center the text a bit more and change the "insert song here" to change the song credit
	setObjectCamera('creditTxt', 'other')
    addLuaText('creditTxt')
    setTextSize('creditTxt', 50);
    setProperty('creditTxt.color', getColorFromHex('FFFFFF'))

	makeLuaText('creditTxt2', 'Song cover: insert credits here',0, 200, -95); -- change the "200" in order to center the text a bit more and change the "insert credits here" to change the song credit
	setObjectCamera('creditTxt2', 'other')
    addLuaText('creditTxt2')
    setTextSize('creditTxt2', 50);
    setProperty('creditTxt2.color', getColorFromHex('FFFFFF'))

	makeLuaText('creditTxt3', 'ccresits idk: insert credits here',0, 200, -95); -- change the "200" in order to center the text a bit more and change the "insert credits here" to change the song credit
	setObjectCamera('creditTxt3', 'other')
    addLuaText('creditTxt3')
    setTextSize('creditTxt3', 50);
    setProperty('creditTxt3.color', getColorFromHex('FFFFFF'))
end
function onUpdate()
	if curBeat == 1 then
		doTweenY('crediTxt', "creditTxt", 100, 1, "quartOut")
		doTweenY('2cred2iTxt', "creditTxt2", 150, 1, "quartOut")
		doTweenY('3cred2iTxt', "creditTxt3", 200, 1, "quartOut")
	end
	if curBeat == 9 then
		doTweenY('crediTxt2', "creditTxt", -100, 1, "quartIn")
		doTweenY('cr2ed2Txt2', "creditTxt2", -100, 1, "quartIn")
		doTweenY('cr23d2Txt3', "creditTxt3", -100, 1, "quartIn")
	end
end