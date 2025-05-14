public var memories:Array<FunkinSprite> = [];

function postCreate()
    if (Options.flashingMenu && !Options.lowMemoryMode)
        for (a in Paths.getFolderContent("images/stages/memorylane/memory/")) {
            var memory:FunkinSprite = new FunkinSprite(0, 0, Paths.file("images/stages/memorylane/memory/" + a));
            memory.scrollFactor.x = memory.scrollFactor.y = memory.zoomFactor = 0;
            memory.visible = false;
            memory.setGraphicSize(FlxG.width);
            insert(members.indexOf(dad), memory).screenCenter();
            memories.push(memory);
        }