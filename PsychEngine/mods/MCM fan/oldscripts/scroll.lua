function onCreatePost()

    initLuaShader("scroll")
 
  setSpriteShader('timeTxt',"scroll")

  
 end
 
 function onUpdate()
  setShaderFloat("timeTxt", "iTime", os.clock())

  
 end
 
 -- to set the x or y speed u have to change it within the shader