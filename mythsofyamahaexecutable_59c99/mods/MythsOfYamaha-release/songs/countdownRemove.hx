var currentSong = PlayState.instance.SONG.meta.name.toLowerCase();

function create(){
  if (currentSong != 'surrogate') {introLength = 1; trace('not surrogate');}
    
}

function onCountdown(event:CountdownEvent) event.cancel();
function onStrumCreation(_) _.__doAnimation = false;