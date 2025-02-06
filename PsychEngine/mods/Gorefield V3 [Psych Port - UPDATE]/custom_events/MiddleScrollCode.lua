function onEvent(name, v1, v2)
    if name == 'MiddleScrollCode' then
	    if v1 == 'true' then
       if not middlescroll then
       noteTweenX('middle1', 4, defaultPlayerStrumX1 - 439, v2, 'quadInOut')
       noteTweenX('middle2', 5, defaultPlayerStrumX1 - 326, v2, 'quadInOut')
       noteTweenX('middle3', 6, defaultPlayerStrumX1 - 215, v2, 'quadInOut')
       noteTweenX('middle4', 7, defaultPlayerStrumX1 - 102, v2, 'quadInOut')
       noteTweenAlpha("NoteFade1", 0, 0, v2, quadInOut)
       noteTweenAlpha("NoteFade2", 1, 0, v2, quadInOut)
       noteTweenAlpha("NoteFade3", 2, 0, v2, quadInOut)
       noteTweenAlpha("NoteFade4", 3, 0, v2, quadInOut)
       end   
        end
       if v1 == 'false' then
       if not middlescroll then
       noteTweenX('middle1', 4, defaultPlayerStrumX0, v2, 'quadInOut')
       noteTweenX('middle2', 5, defaultPlayerStrumX1, v2, 'quadInOut')
       noteTweenX('middle3', 6, defaultPlayerStrumX2, v2, 'quadInOut')
       noteTweenX('middle4', 7, defaultPlayerStrumX3, v2, 'quadInOut')
       noteTweenAlpha("NoteFade1", 0, 1, v2, quadInOut)
       noteTweenAlpha("NoteFade2", 1, 1, v2, quadInOut)
       noteTweenAlpha("NoteFade3", 2, 1, v2, quadInOut)
       noteTweenAlpha("NoteFade4", 3, 1, v2, quadInOut)
       end   
        end
    end
end

