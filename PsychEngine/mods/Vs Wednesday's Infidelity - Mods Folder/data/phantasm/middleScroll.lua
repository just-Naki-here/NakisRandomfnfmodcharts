function onCreatePost()
    if not middlescroll then
        for strumLine = 0,7 do
            if strumLine < 2 then
                noteTweenX('StrumX'..strumLine,strumLine,168 + (112 * strumLine),0.4,'elasticOut')
            elseif strumLine >= 2 and strumLine < 4 then
                noteTweenX('StrumX'..strumLine,strumLine,664 + (112 * strumLine),0.4,'elasticOut')
            elseif strumLine >= 4 then
                noteTweenX('StrumX'..strumLine,strumLine,92 + (112 * (strumLine - 1)),0.4,'elasticOut')
            end
            if strumLine < 4 then
                setPropertyFromGroup('strumLineNotes',strumLine,'visible',false)
            end
        end
    end
end