function onCreate()
    IconPath = 'SAINT'
    windowname = '...'
    addHaxeLibrary('Application', 'lime.app')
    addHaxeLibrary('Image','lime.graphics')
    setPropertyFromClass('lime.app.Application', 'current.window.title', windowname)
    runHaxeCode([[
        var Icon:Image=Image.fromFile(Paths.modFolders('images/]]..IconPath..[[.png'));
        Application.current.window.setIcon(Icon);
    ]])
end