function onEvent(n, v1, v2)

    if n == 'changeicon' then

 runHaxeCode([[game.iconP]] .. v2.. [[.changeIcon(']] .. v1 .. [[')]]);

    end

end