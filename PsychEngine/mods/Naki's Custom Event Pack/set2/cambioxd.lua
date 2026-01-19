function onEvent(n,v1,v2,v3)
    if n == "cambioxd" then
        triggerEvent('Change Character', '1', 'dry_chase')
		setProperty('backroundrun.alpha', 1)
		objectPlayAnimation('backroundrun', 'backroundrun idle')
		setProperty('bg.alpha', 0.00001)
		setProperty('spongebottom.alpha', 1)
	end
	end