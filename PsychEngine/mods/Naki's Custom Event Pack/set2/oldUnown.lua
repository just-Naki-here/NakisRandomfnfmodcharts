--Last updated 19/02/22
--epic tutorial-- this is a list for myself because i forget constantly what to do lmao
--step 1 - [onCreate]: make the lua sprite
--step 2 - [onEvent]: increase the max number for getRandomInt()
--step 3 - [checkAndHide, spriteWork, resetAlphas, hideWords, hide]: copy the format and replace the ? with your word's number
--step 4 - [onUpdate]: copy the format, change the TypedLett checker and setter, set the word on the flixel.flxg key getter function
--					   until it reaches the last letter, set the text string, set the finished variable to true, end

daFont = 'VCR.ttf' --font to use for the typing text

function onCreate()

	makeLuaText("showInputted", ' ', 600, 320, 500)
	setTextSize("showInputted", 30)
	setTextFont(daFont)

--variables
TypedLett = 0;

SetStun = 'false'

inType = false;

WordAlpha = 1;

Finished = false;
TimerFinish = false;

--Dying from pressin' R Prevention
setPropertyFromClass('ClientPrefs', 'noReset', true);

--make words' sprites
makeLuaSprite('w1', 'unown/w1', 370, 200);
setObjectCamera('w1', 'other');

makeLuaSprite('w2', 'unown/w2', 370, 200);
setObjectCamera('w2', 'other');

makeLuaSprite('w3', 'unown/w3', 300, 200);
setObjectCamera('w3', 'other');

makeLuaSprite('w4', 'unown/w4', 320, 200);
setObjectCamera('w4', 'other');

makeLuaSprite('w5', 'unown/w5', 320, 200);
setObjectCamera('w5', 'other');

makeLuaSprite('w6', 'unown/w6', 320, 200);
setObjectCamera('w6', 'other');

makeLuaSprite('w7', 'unown/w7', 220, 200);
setObjectCamera('w7', 'other');

makeLuaSprite('w8', 'unown/w8', 220, 200);
setObjectCamera('w8', 'other');

makeLuaSprite('w9', 'unown/w9', 220, 200);
setObjectCamera('w9', 'other');

makeLuaSprite('w10', 'unown/w10', 220, 200);
setObjectCamera('w10', 'other');

makeLuaSprite('redoverlay', 'unown/redoverlay', 0, 0);
setObjectCamera('redoverlay', 'other');
addLuaSprite('redoverlay', true);
setProperty('redoverlay.visible', false);
setProperty('redoverlay.alpha', 0.3);
scaleLuaSprite('redoverlay', 2, 1);

end

function onEvent(name, value1, value2)
if name == 'Unown' then

SetStun = (value2)
addLuaText('showInputted');
Word = string.format('w%i', getRandomInt(1, 10));
--Word = 'w10' for testing specific words
TypedLett = 0;
TimerFinish = false;
Timer = (value1)
runTimer('typingTime', Timer);
runTimer('botTime', 2)

spriteWork()
checkAndHide()
toStun()

inType = true;
debugPrint(SetStun)
end
end


--all the typing is handled in this function.
function onUpdate()

--DIE word
if inType == true and Word == 'w1' and TypedLett == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
TypedLett = 1
--fuck you
setProperty('w2.alpha', WordAlpha);
setTextString('showInputted', 'D');

elseif inType == true and Word == 'w1' and TypedLett == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.I') then
TypedLett = 2
--fuck you
setProperty('w2.alpha', WordAlpha);
setTextString('showInputted', 'DI');

elseif inType == true and Word == 'w1' and TypedLett == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then
TypedLett = 3
setTextString('showInputted', 'DIE');
Finished = true



-- DYING word
elseif inType == true and Word == 'w2' and TypedLett == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
TypedLett = 1
--fuck you
setProperty('w2.alpha', WordAlpha);
setTextString('showInputted', 'D');

elseif inType == true and Word == 'w2' and TypedLett == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') then
TypedLett = 2
--fuck you
setProperty('w2.alpha', WordAlpha);
setTextString('showInputted', 'DY');

elseif inType == true and Word == 'w2' and TypedLett == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.I') then
TypedLett = 3
--fuck you
setProperty('w2.alpha', WordAlpha);
setTextString('showInputted', 'DYI');

elseif inType == true and Word == 'w2' and TypedLett == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.N') then
TypedLett = 4
--fuck you
setProperty('w2.alpha', WordAlpha);
setTextString('showInputted', 'DYIN');

elseif inType == true and Word == 'w2' and TypedLett == 4 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.G') then
TypedLett = 6
Finished = true




-- IM DEAD word
elseif inType == true and Word == 'w3' and TypedLett == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.I') then
TypedLett = 1
--fuck you
setProperty('w3.alpha', WordAlpha);
setTextString('showInputted', 'I');

elseif inType == true and Word == 'w3' and TypedLett == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.M') then
TypedLett = 2
--fuck you
setProperty('w3.alpha', WordAlpha);
setTextString('showInputted', 'IM');

elseif inType == true and Word == 'w3' and TypedLett == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
TypedLett = 3
--fuck you
setProperty('w3.alpha', WordAlpha);
setTextString('showInputted', 'IM D');

elseif inType == true and Word == 'w3' and TypedLett == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then
TypedLett = 4
--fuck you
setProperty('w3.alpha', WordAlpha);
setTextString('showInputted', 'IM DE');

elseif inType == true and Word == 'w3' and TypedLett == 4 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
TypedLett = 5
--fuck you
setProperty('w3.alpha', WordAlpha);
setTextString('showInputted', 'IM DEA');

elseif inType == true and Word == 'w3' and TypedLett == 5 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
TypedLett = 6
Finished = true


--HELP ME word

elseif inType == true and Word == 'w4' and TypedLett == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.H') then
TypedLett = 1
--fuck you
setProperty('w4.alpha', WordAlpha);
setTextString('showInputted', 'H');

elseif inType == true and Word == 'w4' and TypedLett == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then
TypedLett = 2
--fuck you
setProperty('w4.alpha', WordAlpha);
setTextString('showInputted', 'HE');

elseif inType == true and Word == 'w4' and TypedLett == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.L') then
TypedLett = 3
--fuck you
setProperty('w4.alpha', WordAlpha);
setTextString('showInputted', 'HEL');

elseif inType == true and Word == 'w4' and TypedLett == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.P') then
TypedLett = 4
--fuck you
setProperty('w4.alpha', WordAlpha);
setTextString('showInputted', 'HELP');

elseif inType == true and Word == 'w4' and TypedLett == 4 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.M') then
TypedLett = 5
--fuck you
setProperty('w4.alpha', WordAlpha);
setTextString('showInputted', 'HELP M');

elseif inType == true and Word == 'w4' and TypedLett == 5 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then
TypedLett = 6
Finished = true


--BRUH word

elseif inType == true and Word == 'w5' and TypedLett == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.B') then
TypedLett = 1
--fuck you
setProperty('w5.alpha', WordAlpha);
setTextString('showInputted', 'B');

elseif inType == true and Word == 'w5' and TypedLett == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.R') then
TypedLett = 2
--fuck you
setProperty('w5.alpha', WordAlpha);
setTextString('showInputted', 'BR');

elseif inType == true and Word == 'w5' and TypedLett == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.U') then
TypedLett = 3
--fuck you
setProperty('w5.alpha', WordAlpha);
setTextString('showInputted', 'BRU');

elseif inType == true and Word == 'w5' and TypedLett == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.H') then
TypedLett = 4
Finished = true


--LEAVE word

elseif inType == true and Word == 'w6' and TypedLett == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.L') then
TypedLett = 1
--fuck you
setProperty('w6.alpha', WordAlpha);
setTextString('showInputted', 'L');

elseif inType == true and Word == 'w6' and TypedLett == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then
TypedLett = 2
--fuck you
setProperty('w6.alpha', WordAlpha);
setTextString('showInputted', 'LE');

elseif inType == true and Word == 'w6' and TypedLett == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
TypedLett = 3
--fuck you
setProperty('w6.alpha', WordAlpha);
setTextString('showInputted', 'LEA');

elseif inType == true and Word == 'w6' and TypedLett == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.V') then
TypedLett = 4
--fuck you
setProperty('w6.alpha', WordAlpha);
setTextString('showInputted', 'LEAV');

elseif inType == true and Word == 'w6' and TypedLett == 4 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then
TypedLett = 5
Finished = true


--THE HORROR word
elseif inType == true and Word == 'w7' and TypedLett == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T') then
TypedLett = 1
--fuck you
setProperty('w7.alpha', WordAlpha);
setTextString('showInputted', 'T');

elseif inType == true and Word == 'w7' and TypedLett == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.H') then
TypedLett = 2
--fuck you
setProperty('w7.alpha', WordAlpha);
setTextString('showInputted', 'TH');

elseif inType == true and Word == 'w7' and TypedLett == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then
TypedLett = 3
--fuck you
setProperty('w7.alpha', WordAlpha);
setTextString('showInputted', 'THE');

elseif inType == true and Word == 'w7' and TypedLett == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.H') then
TypedLett = 4
--fuck you
setProperty('w7.alpha', WordAlpha);
setTextString('showInputted', 'THE H');

elseif inType == true and Word == 'w7' and TypedLett == 4 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O') then
TypedLett = 5
--fuck you
setProperty('w7.alpha', WordAlpha);
setTextString('showInputted', 'THE HO');

elseif inType == true and Word == 'w7' and TypedLett == 5 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.R') then
TypedLett = 6
--fuck you
setProperty('w7.alpha', WordAlpha);
setTextString('showInputted', 'THE HOR');

elseif inType == true and Word == 'w7' and TypedLett == 6 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.R') then
TypedLett = 7
--fuck you
setProperty('w7.alpha', WordAlpha);
setTextString('showInputted', 'THE HORR');

elseif inType == true and Word == 'w7' and TypedLett == 7 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O') then
TypedLett = 8
--fuck you
setProperty('w7.alpha', WordAlpha);
setTextString('showInputted', 'THE HORRO');

elseif inType == true and Word == 'w7' and TypedLett == 8 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.R') then
TypedLett = 9
Finished = true

--v1.3
--ABANDONED | word	

elseif inType == true and Word == 'w8' and TypedLett == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
	TypedLett = (TypedLett + 1)
	setProperty('w8.alpha', WordAlpha);
	setTextString('showInputted', 'A');

elseif inType == true and Word == 'w8' and TypedLett == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.B') then
	TypedLett = (TypedLett + 1)
	setProperty('w8.alpha', WordAlpha);
	setTextString('showInputted', 'AB');

elseif inType == true and Word == 'w8' and TypedLett == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
	TypedLett = (TypedLett + 1)
	setProperty('w8.alpha', WordAlpha);
	setTextString('showInputted', 'ABA');

elseif inType == true and Word == 'w8' and TypedLett == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.N') then
	TypedLett = (TypedLett + 1)
	setProperty('w8.alpha', WordAlpha);
	setTextString('showInputted', 'ABAN');

elseif inType == true and Word == 'w8' and TypedLett == 4 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
	TypedLett = (TypedLett + 1)
	setProperty('w8.alpha', WordAlpha);
	setTextString('showInputted', 'ABAND');

elseif inType == true and Word == 'w8' and TypedLett == 5 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O') then
	TypedLett = (TypedLett + 1)
	setProperty('w8.alpha', WordAlpha);
	setTextString('showInputted', 'ABANDO');

elseif inType == true and Word == 'w8' and TypedLett == 6 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.N') then
	TypedLett = (TypedLett + 1)
	setProperty('w8.alpha', WordAlpha);
	setTextString('showInputted', 'ABANDON');

elseif inType == true and Word == 'w8' and TypedLett == 7 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then
	TypedLett = (TypedLett + 1)
	setProperty('w8.alpha', WordAlpha);
	setTextString('showInputted', 'ABANDONE');

elseif inType == true and Word == 'w8' and TypedLett == 8 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
	TypedLett = (TypedLett + 1)
	setProperty('w8.alpha', WordAlpha);
	setTextString('showInputted', 'ABANDONED');
	Finished = true

	--CELEBI | word

	elseif inType == true and Word == 'w9' and TypedLett == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.C') then
		TypedLett = (TypedLett + 1)
	setProperty('w9.alpha', WordAlpha);
	setTextString('showInputted', 'C');

	elseif inType == true and Word == 'w9' and TypedLett == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then
		TypedLett = (TypedLett + 1)
	setProperty('w9.alpha', WordAlpha);
	setTextString('showInputted', 'CE');

	elseif inType == true and Word == 'w9' and TypedLett == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.L') then
		TypedLett = (TypedLett + 1)
	setProperty('w9.alpha', WordAlpha);
	setTextString('showInputted', 'CEL');

	elseif inType == true and Word == 'w9' and TypedLett == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then
		TypedLett = (TypedLett + 1)
	setProperty('w9.alpha', WordAlpha);
	setTextString('showInputted', 'CELE');
	
	elseif inType == true and Word == 'w9' and TypedLett == 4 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.B') then
		TypedLett = (TypedLett + 1)
	setProperty('w9.alpha', WordAlpha);
	setTextString('showInputted', 'CELEB');

	elseif inType == true and Word == 'w9' and TypedLett == 5 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.I') then
	TypedLett = (TypedLett + 1)
	setProperty('w9.alpha', WordAlpha);
	setTextString('showInputted', 'CELEBI');
	Finished = true


	--GET OUT | word
	
	elseif inType == true and Word == 'w10' and TypedLett == 0 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.G') then
	TypedLett = (TypedLett + 1)
	setProperty('w10.alpha', WordAlpha);
	setTextString('showInputted', 'G');	

	elseif inType == true and Word == 'w10' and TypedLett == 1 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') then
	TypedLett = (TypedLett + 1)
	setProperty('w10.alpha', WordAlpha);
	setTextString('showInputted', 'GE');
	
    elseif inType == true and Word == 'w10' and TypedLett == 2 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T') then
	TypedLett = (TypedLett + 1)
	setProperty('w10.alpha', WordAlpha);
	setTextString('showInputted', 'GET');
		
	elseif inType == true and Word == 'w10' and TypedLett == 3 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O') then
	TypedLett = (TypedLett + 1)
	setProperty('w10.alpha', WordAlpha);
	setTextString('showInputted', 'GET O');
		
	elseif inType == true and Word == 'w10' and TypedLett == 4 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.U') then
	TypedLett = (TypedLett + 1)
	setProperty('w10.alpha', WordAlpha);
	setTextString('showInputted', 'GET OU');
		
	elseif inType == true and Word == 'w10' and TypedLett == 5 and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T') then
	TypedLett = (TypedLett + 1)
	setProperty('w10.alpha', WordAlpha);
	setTextString('showInputted', 'GET OUT');
	Finished = true


--finished writing?
elseif Finished == true then
inType = false;
setTextString('showInputted', ' ');
removeLuaText('showInputted', false);

resetAlphas()
hideWords()

playSound('BUZZER', 0.8);

TypedLett = 0;
Finished = false;
TimerFinish = true;
setProperty('boyfriend.stunned', false);
end
end

function checkAndHide()

--hide other words from appearing in typing state
--step 3 -- replace ? with your word number
--↓ format ↓

--elseif Word == 'w?' then
--hide()
--setProperty('w?.alpha', 1);


if Word == 'w1' then
	hide()
setProperty('w1.alpha', 1);

elseif Word == 'w2' then
	hide()
setProperty('w2.alpha', 1);

elseif Word == 'w3' then
	hide()
setProperty('w3.alpha', 1);

elseif Word == 'w4' then
	hide()
setProperty('w4.alpha', 1);

elseif Word == 'w5' then
	hide()
setProperty('w5.alpha', 1);

elseif Word == 'w6' then
	hide()
setProperty('w6.alpha', 1);

elseif Word == 'w7' then
	hide()
setProperty('w7.alpha', 1);

elseif Word == 'w8' then
	hide()
setProperty('w8.alpha', 1);

elseif Word == 'w9' then
	hide()
setProperty('w9.alpha', 1);

elseif Word == 'w10' then
	hide()
setProperty('w10.alpha', 1);

end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'typingTime' and TimerFinish == false then
setProperty('health', -500);

elseif tag == 'botTime' and getProperty('cpuControlled') then
	TimerFinish = true
	Finished = true
end
end

function spriteWork()
	setProperty('redoverlay.visible', true);
	--step 3 -- replace ? with your word number
	--format: setProperty('w?.visible', true);
	setProperty('w1.visible', true);
	setProperty('w2.visible', true);
	setProperty('w3.visible', true);
	setProperty('w4.visible', true);
	setProperty('w5.visible', true);
	setProperty('w6.visible', true);
	setProperty('w7.visible', true);
	setProperty('w8.visible', true);
	setProperty('w9.visible', true);
	setProperty('w10.visible', true);
	addLuaSprite(Word, true);
end

function toStun()
	if SetStun == 'true' then
		setProperty('boyfriend.stunned', true);
		--debugPrint('STUNNED BITCH') forgot to remove this lol
	end
end

function resetAlphas()
	--step 3 -- replace ? with your word number
	--format: setProperty('w?.alpha', 1);
	setProperty('w1.alpha', 1);
	setProperty('w2.alpha', 1);
	setProperty('w3.alpha', 1);
	setProperty('w4.alpha', 1);
	setProperty('w5.alpha', 1);
	setProperty('w6.alpha', 1);
	setProperty('w7.alpha', 1);
	setProperty('w8.alpha', 1);
	setProperty('w9.alpha', 1);
	setProperty('w10.alpha', 1);
end

function hideWords()
	setProperty('redoverlay.visible', false);
	--step 3 -- replace ? with your word number
	--format: setProperty('w?.visible', false);
	setProperty('w1.visible', false);
	setProperty('w2.visible', false);
	setProperty('w3.visible', false);
	setProperty('w4.visible', false);
	setProperty('w5.visible', false);
	setProperty('w6.visible', false);
	setProperty('w7.visible', false);
	setProperty('w8.visible', false);
	setProperty('w9.visible', false);
	setProperty('w10.visible', false);
end

function hide()
	--step 3 -- replace ? with your word number
	--format: setProperty('w?.alpha', 0);
	setProperty('w1.alpha', 0);
	setProperty('w2.alpha', 0);
	setProperty('w3.alpha', 0);
	setProperty('w4.alpha', 0);
	setProperty('w5.alpha', 0);
	setProperty('w6.alpha', 0);
	setProperty('w7.alpha', 0);
	setProperty('w8.alpha', 0);
	setProperty('w9.alpha', 0);
	setProperty('w10.alpha', 0);

end