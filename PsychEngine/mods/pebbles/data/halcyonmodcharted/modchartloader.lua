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
        runScript('halcyonmodcharted/modcharts/' .. scriptList[i])
    end
end