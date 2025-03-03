function onCreatePost()

    initLuaShader("scroll")
 
  setSpriteShader('timeTxt',"scroll")

  time=0
 end
 
 function onUpdate()
 time = time + 160/songLength
  setShaderFloat("timeTxt", "iTime", time-5)
  --songLength
 end
 
 -- to set the x or y speed u have to change it within the shader