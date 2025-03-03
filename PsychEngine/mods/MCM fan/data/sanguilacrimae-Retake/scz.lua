j = 0
function onEvent(name,value1,value2)

    if name == "SCZ" then
        
	
	doTweenZoom('camz','camGame',tonumber(value1)+1.2+j,tonumber(value2),'sineInOut')
	doTweenZoom('scz1','camGame',tonumber(value1)+1.2+j,tonumber(value2),'sineInOut')
            --doTweenZoom('camz1','camHUD',tonumber(value1)+0.7,0.2,'sineInOut')
            
            end
    


end
function onUpdate()
end
function onTweenCompleted(tag, loops, loopsLeft)

if tag == 'camz' then
if mustHitSection == false then
      	 j = 0
      	 else
      	 j = 0
      	 end
--setProperty("defaultCamZoom",getProperty('camGame.zoom')) 
doTweenZoom('scz1','camGame',tonumber(value1)+1.2+j,0.000000002,'sineInOut')
      	 --setProperty("defaultCamZoom",getProperty('camGame.zoom')) 
      	 --setProperty('camHUD.zoom', getProperty('camHUD.zoom'))

end

if tag == 'scz1' then


      	 setProperty("defaultCamZoom",1.2) 
      	 doTweenZoom('camz1','camGame',1.2,tonumber(value2)/2,'sineInOut')
      	 setProperty("defaultCamZoom",getProperty('camGame.zoom')) 
      	 --setProperty('camHUD.zoom', 0.95)
      	 --doTweenZoom('camz1','camHUD',0.95,0.2,'sineInOut')
      
end
end