//
var vhs:CustomShader = new CustomShader("VHS/vhs2015");

function create()
    if (Options.gameplayShaders) {
        camGame.addShader(vhs);
        vhs.theBloom = 0.1;
    }

function postCreate()
    bg1.alpha = 0.5;

function update()
    if (Options.gameplayShaders)
        vhs.iTime = Conductor.songPosition/1000;