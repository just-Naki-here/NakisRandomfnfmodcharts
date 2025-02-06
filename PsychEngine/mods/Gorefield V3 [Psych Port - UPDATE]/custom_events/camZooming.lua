function onUpdate(elapsed)
	if on then
  setProperty('camZooming', true)
  end
  if not on then
  setProperty('camZooming', false)
		end
 end

function onEvent(n,v1)
if n == "camZooming" then        
if v1 == 'true' then
on = true
end
if v1 == 'false' then
on = false
end
end
end