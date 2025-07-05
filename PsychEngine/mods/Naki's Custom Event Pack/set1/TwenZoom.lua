function onEvent(n, v1, v2)
if n == "TwenZoom" then    
   setProperty('camHUD.zoom', getProperty('camHUD.zoom') + v1) 
   setProperty('camGame.zoom', getProperty('camGame.zoom') + tonumber(v2)) 
   end

end