onscroll
  <yield />
     
  script(type="coffee").
    @on 'mount',->
      window.addEventListener('scroll',@handleScroll)
      window.addEventListener('resize',@handleScroll)
      @inviewport = @inViewport()
      @prevPos = @pos
      @update()
      
    @on 'unmount',->
      window.removeEventListener('scroll',@handleScroll)
      window.removeEventListener('resize',@handleScroll)


    @handleScroll = (e)=>
      newval = @inViewport()
      @diff = @calcDiff()
      if newval != @inviewport || @diff>5
        @prevPos = @pos
        @inviewport = newval
        @update()

    @calcDiff = =>
      return 0 if !@prevPos
      Math.abs(@pos.top-@prevPos.top)+
      Math.abs(@pos.left-@prevPos.left)+
      Math.abs(@pos.right-@prevPos.right)+
      Math.abs(@pos.bottom-@prevPos.bottom)

    @inViewport = =>
      pos = @root.getBoundingClientRect()
      winheight = (window.innerHeight || document.documentElement.clientHeight)
      winwidth = (window.innerWidth || document.documentElement.clientWidth)
      @pos = 
        top:pos.top
        left:pos.left
        right:winwidth-pos.right
        bottom:winheight-pos.bottom
      pos.bottom >= 0 && pos.right >= 0 && pos.top <= winheight && pos.left <= winwidth
