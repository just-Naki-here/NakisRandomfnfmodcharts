local scriptList = {
    'halo',
    'halothesequel',
    'imwarningyou',
    'stagescript',
    'timermechanic',
    'whereyouat'
}

function onCreate()
    for i = 1, #scriptList do
        runScript('halcyon/modcharts/' .. scriptList[i])
    end
end