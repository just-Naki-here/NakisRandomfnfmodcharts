local scriptList = { 
    'ChaosInsanity',
    'forcemiddlescroll',
    'halo',
    'halothesequel',
    'imwarningyou',
    'Modchart',
    'movenote',
    'pcinfo',
    'scrollspeedfckery',
    'SEMITRANSPARENTOPPONENTNOTES',
    'stagescript',
    'themodchart',
    'timermechanic',
    'whereyouat'
}

function onCreate()
    for i = 1, #scriptList do
        addLuaScript('scripts/halcyonmodcharted/modcharts/' .. scriptList[i])
        debugPrint('Loaded: ' .. scriptList[i])
    end
end