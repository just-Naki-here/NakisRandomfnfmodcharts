-- ==================================

-- Hide Girlfriend Character (For Chart Modding)
-- Simply makes the GF invisible
-- ==================================

function onCreate()
    debugPrint("hi")
end
function onCreatePost()
    setProperty('gf.alpha', 0)
end