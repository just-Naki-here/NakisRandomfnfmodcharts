function onEvent(name,v1,v2)

    if name == "ZoomSection" then
		
      bfZoom = v1

			dadZoom = v2

	end

end

function onUpdate(elapsed)
if mustHitSection then
        setProperty('defaultCamZoom', bfZoom)
      else
       setProperty('defaultCamZoom', dadZoom)
   end
end
