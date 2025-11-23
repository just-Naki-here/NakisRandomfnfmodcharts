function onStepHit()
	if getProperty('curStep') == 1280 then
function goodNoteHit()
	health = getProperty('health')
	if getProperty('health') > 0.0 then	
         setProperty('health', health- 0.023);
         end
      end
   end 
end