local downscrollNotePos = 570
local upscrollNotePos = 50

--default note position is 50

function onBeatHit()
	if dancing1 == true then
		if curBeat % 2 == 0 then
			if not downscroll then
				noteTweenY('danceUp1', 4, upscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceUp2', 6, upscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceDown1', 5, upscrollNotePos + 15, 0.1, linear);
				noteTweenY('danceDown2', 7, upscrollNotePos + 15, 0.1, linear);
			else 
				noteTweenY('danceUp1', 4, downscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceUp2', 6, downscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceDown1', 5, downscrollNotePos + 15, 0.1, linear);
				noteTweenY('danceDown2', 7, downscrollNotePos + 15, 0.1, linear);
			end
		else
			if not downscroll then
				noteTweenY('danceUp1', 5, upscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceUp2', 7, upscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceDown1', 4, upscrollNotePos + 15, 0.1, linear);
				noteTweenY('danceDown2', 6, upscrollNotePos + 15, 0.1, linear);
			else 
				noteTweenY('danceUp1', 5, downscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceUp2', 7, downscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceDown1', 4, downscrollNotePos + 15, 0.1, linear);
				noteTweenY('danceDown2', 6, downscrollNotePos + 15, 0.1, linear);
			end
		end
	elseif dancing2 == true then
		if curBeat % 2 == 0 then
			if not downscroll then
				noteTweenY('danceUp1', 4, upscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceUp2', 5, upscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceDown1', 6, upscrollNotePos + 15, 0.1, linear);
				noteTweenY('danceDown2', 7, upscrollNotePos + 15, 0.1, linear);
			else 
				noteTweenY('danceUp1', 4, downscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceUp2', 5, downscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceDown1', 6, downscrollNotePos + 15, 0.1, linear);
				noteTweenY('danceDown2', 7, downscrollNotePos + 15, 0.1, linear);
			end
		else
			if not downscroll then
				noteTweenY('danceUp1', 6, upscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceUp2', 7, upscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceDown1', 4, upscrollNotePos + 15, 0.1, linear);
				noteTweenY('danceDown2', 5, upscrollNotePos + 15, 0.1, linear);
			else 
				noteTweenY('danceUp1', 6, downscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceUp2', 7, downscrollNotePos - 15, 0.1, linear);
				noteTweenY('danceDown1', 4, downscrollNotePos + 15, 0.1, linear);
				noteTweenY('danceDown2', 5, downscrollNotePos + 15, 0.1, linear);
			end
		end
	end
end

function onEvent(name, value1, value2)
	if name == 'ModchartOptions' then
		if value1 == 'initialize' then
			noteTweenX('initNote0', 4, 415, 0.1, 'quadInOut');
			noteTweenX('initNote1', 5, 525, 0.1, 'quadInOut');
			noteTweenX('initNote2', 6, 635, 0.1, 'quadInOut');
			noteTweenX('initNote3', 7, 745, 0.1, 'quadInOut');

		elseif value1 == 'reset' then
			noteTweenY('resetY0', 4, 50, value2, linear);
			noteTweenY('resetY1', 5, 50, value2, linear);
			noteTweenY('resetY2', 6, 50, value2, linear);
			noteTweenY('resetY3', 7, 50, value2, linear);

			noteTweenX('resetX0', 4, 415, value2, linear);
			noteTweenX('resetX1', 5, 525, value2, linear);
			noteTweenX('resetX2', 6, 635, value2, linear);
			noteTweenX('resetX3', 7, 745, value2, linear);

		elseif value1 == 'resetY' then
			noteTweenY('resetY0', 4, 50, value2, linear);
			noteTweenY('resetY1', 5, 50, value2, linear);
			noteTweenY('resetY2', 6, 50, value2, linear);
			noteTweenY('resetY3', 7, 50, value2, linear);

		elseif value1 == 'resetX' then
			noteTweenX('resetX0', 4, 415, value2, linear);
			noteTweenX('resetX1', 5, 525, value2, linear);
			noteTweenX('resetX2', 6, 635, value2, linear);
			noteTweenX('resetX3', 7, 745, value2, linear);

		elseif value1 == 'noteBounce' then
			for i = 4,7 do
				if not downscroll then
					noteTweenY('bounceUp'..i, i, 10, 0.001, 'quadInOut');
					noteTweenY('fallDown'..i, i, 50, 0.2, 'quadInOut');	
				else 
					noteTweenY('bounceUp'..i, i, downscrollNotePos - 40, 0.001, 'quadInOut');
					noteTweenY('fallDown'..i, i, downscrollNotePos, 0.2, 'quadInOut');	
				end
			end
		elseif value1 == 'noteDance1' then
			if value2 == '1' then
				noteTweenY('danceUp1', 4, 35, 0.1, linear);
				noteTweenY('danceUp2', 6, 35, 0.1, linear);
				noteTweenY('danceDown1', 5, 65, 0.1, linear);
				noteTweenY('danceDown2', 7, 65, 0.1, linear);
			elseif value2 == '2' then
				noteTweenY('danceUp1', 5, 35, 0.1, linear);
				noteTweenY('danceUp2', 7, 35, 0.1, linear);
				noteTweenY('danceDown1', 4, 65, 0.1, linear);
				noteTweenY('danceDown2', 6, 65, 0.1, linear);
			elseif value2 == '3' then
				dancing1 = true
			elseif value2 == '4' then
				dancing1 = false
			end

		elseif value1 == 'noteDance2' then
			if value2 == '1' then
				noteTweenY('danceUp1', 4, 35, 0.1, linear);
				noteTweenY('danceUp2', 5, 35, 0.1, linear);
				noteTweenY('danceDown1', 6, 65, 0.1, linear);
				noteTweenY('danceDown2', 7, 65, 0.1, linear);
			elseif value2 == '2' then
				noteTweenY('danceUp1', 6, 35, 0.1, linear);
				noteTweenY('danceUp2', 7, 35, 0.1, linear);
				noteTweenY('danceDown1', 4, 65, 0.1, linear);
				noteTweenY('danceDown2', 5, 65, 0.1, linear);
			elseif value2 == '3' then
				dancing2 = true
			elseif value2 == '4' then
				dancing2 = false
			end

		elseif value1 == 'spreadBounce' then
			noteTweenX('bounceOut0', 4, 355, 0.001, linear);
			noteTweenX('bounceOut1', 5, 495, 0.001, linear);
			noteTweenX('bounceOut2', 6, 665, 0.001, linear);
			noteTweenX('bounceOut3', 7, 805, 0.001, linear);
			noteTweenX('bounceIn0', 4, 415, 0.15, linear);
			noteTweenX('bounceIn1', 5, 525, 0.15, linear);
			noteTweenX('bounceIn2', 6, 635, 0.15, linear);
			noteTweenX('bounceIn3', 7, 745, 0.15, linear);

		elseif value1 == 'dropAway' then
			noteTweenY('drop0', 4, 1100, 0.5, sineOut);
			noteTweenX('fall0', 4, 355, 0.5, sineOut);
			noteTweenY('drop1', 5, 1230, 0.5, sineOut);
			noteTweenX('fall1', 5, 495, 0.5, sineOut);
			noteTweenY('drop2', 6, 1030, 0.5, sineOut);
			noteTweenX('fall2', 6, 665, 0.5, sineOut);
			noteTweenY('drop3', 7, 1070, 0.5, sineOut);
			noteTweenX('fall3', 7, 805, 0.5, sineOut);

		elseif value1 == 'dropInReady' then
			if value2 == 'left' then
				noteTweenX('readyX0', 4, 115, 0.001, instant);
				noteTweenX('readyX1', 5, 225, 0.001, instant);
				noteTweenX('readyX2', 6, 335, 0.001, instant);
				noteTweenX('readyX3', 7, 445, 0.001, instant);
				noteTweenY('readyY0', 4, -150, 0.001, instant);
				noteTweenY('readyY1', 5, -150, 0.001, instant);
				noteTweenY('readyY2', 6, -150, 0.001, instant);
				noteTweenY('readyY3', 7, -150, 0.001, instant);
			elseif value2 == 'mid' then
				noteTweenX('readyX0', 4, 415, 0.001, instant);
				noteTweenX('readyX1', 5, 525, 0.001, instant);
				noteTweenX('readyX2', 6, 635, 0.001, instant);
				noteTweenX('readyX3', 7, 745, 0.001, instant);
				noteTweenY('readyY0', 4, -150, 0.001, instant);
				noteTweenY('readyY1', 5, -150, 0.001, instant);
				noteTweenY('readyY2', 6, -150, 0.001, instant);
				noteTweenY('readyY3', 7, -150, 0.001, instant);
			elseif value2 == 'right' then
				noteTweenX('readyX0', 4, 715, 0.001, instant);
				noteTweenX('readyX1', 5, 825, 0.001, instant);
				noteTweenX('readyX2', 6, 935, 0.001, instant);
				noteTweenX('readyX3', 7, 1045, 0.001, instant);
				noteTweenY('readyY0', 4, -150, 0.001, instant);
				noteTweenY('readyY1', 5, -150, 0.001, instant);
				noteTweenY('readyY2', 6, -150, 0.001, instant);
				noteTweenY('readyY3', 7, -150, 0.001, instant);
			end
		
		elseif value1 == 'dropIn' then
			noteTweenY('drop0', 4, 50, value2, linear);
			noteTweenY('drop1', 5, 50, value2-0.1, linear);
			noteTweenY('drop2', 6, 50, value2-0.2, linear);
			noteTweenY('drop3', 7, 50, value2-0.3, linear);

		elseif value1 == 'spin' then
			noteTweenAngle ('spin0', 4, 360, 0.1, linear);
			noteTweenAngle ('spin1', 5, 360, 0.1, linear);
			noteTweenAngle ('spin2', 6, 360, 0.1, linear);
			noteTweenAngle ('spin3', 7, 360, 0.1, linear);
			noteTweenAngle ('spinReset0', 4, 0, 0.1, instant);
			noteTweenAngle ('spinReset1', 5, 0, 0.1, instant);
			noteTweenAngle ('spinReset2', 6, 0, 0.1, instant);
			noteTweenAngle ('spinReset3', 7, 0, 0.1, instant);

			noteTweenAngle ('spina', 0, 360, 0.1, linear);
			noteTweenAngle ('spinb', 1, 360, 0.1, linear);
			noteTweenAngle ('spinc', 2, 360, 0.1, linear);
			noteTweenAngle ('spind', 3, 360, 0.1, linear);
			noteTweenAngle ('spinReseta', 0, 0, 0.1, instant);
			noteTweenAngle ('spinResetb', 1, 0, 0.1, instant);
			noteTweenAngle ('spinResetc', 2, 0, 0.1, instant);
			noteTweenAngle ('spinResetd', 3, 0, 0.1, instant);

		elseif value1 == 'noteSwap' then
			if value2 == 'left' then
				noteTweenX('moving0', 4, 115, 0.2, linear);
				noteTweenX('moving1', 5, 225, 0.2, linear);
				noteTweenX('moving2', 6, 335, 0.2, linear);
				noteTweenX('moving3', 7, 445, 0.2, linear);
			elseif value2 == 'mid' then
				noteTweenX('moving0', 4, 415, 0.2, linear);
				noteTweenX('moving1', 5, 525, 0.2, linear);
				noteTweenX('moving2', 6, 635, 0.2, linear);
				noteTweenX('moving3', 7, 745, 0.2, linear);
			elseif value2 == 'right' then
				noteTweenX('moving0', 4, 715, 0.2, linear);
				noteTweenX('moving1', 5, 825, 0.2, linear);
				noteTweenX('moving2', 6, 935, 0.2, linear);
				noteTweenX('moving3', 7, 1045, 0.2, linear);

			elseif value2 == 'leftSmall' then
				noteTweenX('moving0', 4, 315, 0.35, linear);
				noteTweenX('moving1', 5, 425, 0.35, linear);
				noteTweenX('moving2', 6, 535, 0.35, linear);
				noteTweenX('moving3', 7, 645, 0.35, linear);
			elseif value2 == 'rightSmall' then
				noteTweenX('moving0', 4, 515, 0.35, linear);
				noteTweenX('moving1', 5, 625, 0.35, linear);
				noteTweenX('moving2', 6, 735, 0.35, linear);
				noteTweenX('moving3', 7, 845, 0.35, linear);
			end

		elseif value1 == 'duet' then
			noteTweenX('player0', 4, 115, 0.001, instant);
			noteTweenX('player1', 5, 225, 0.001, instant);
			noteTweenX('player2', 6, 335, 0.001, instant);
			noteTweenX('player3', 7, 445, 0.001, instant);
			
			noteTweenX('opponentX0', 0, 715, 0.001, instant);
			noteTweenX('opponentX1', 1, 825, 0.001, instant);
			noteTweenX('opponentX2', 2, 935, 0.001, instant);
			noteTweenX('opponentX3', 3, 1045, 0.001, instant);
			noteTweenY('opponentY0', 0, 50, 0.001, instant);
			noteTweenY('opponentY1', 1, 50, 0.001, instant);
			noteTweenY('opponentY2', 2, 50, 0.001, instant);
			noteTweenY('opponentY3', 3, 50, 0.001, instant);

		elseif value1 == 'duetEnd' then
			noteTweenX('opponentX0', 0, 3000, 1.3, linear);
			noteTweenX('opponentX1', 1, 3000, 1.3, linear);
			noteTweenX('opponentX2', 2, 3000, 1.3, linear);
			noteTweenX('opponentX3', 3, 3000, 1.3, linear);

			noteTweenX('moving0', 4, 415, 1, linear);
			noteTweenX('moving1', 5, 525, 1, linear);
			noteTweenX('moving2', 6, 635, 1, linear);
			noteTweenX('moving3', 7, 745, 1, linear);
		
		elseif value1 == 'Bye' then
			noteTweenAlpha('E',0, 0, 0, 0.0001)
			noteTweenAlpha('F',1, 0, 0, 0.0001)
			noteTweenAlpha('G',2, 0, 0, 0.0001)
			noteTweenAlpha('H',3, 0, 0, 0.0001)
			noteTweenAlpha('A',4, 0, 0, 0.0001)
			noteTweenAlpha('B',5, 0, 0, 0.0001)
			noteTweenAlpha('C',6, 0, 0, 0.0001)
			noteTweenAlpha('D',7, 0, 0, 0.0001)


		end
	end
end