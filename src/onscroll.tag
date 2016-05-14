onscroll
  <yield />
     
  script(type="coffee").
       
    @on 'mount',->
      window.addEventListener('scroll',@handleScroll)
      @inviewport = @inViewport()
      @update()
      
    @on 'unmount',->
      window.removeEventListener('scroll',@handleScroll)

    @handleScroll = (e)=>
      newval = @inViewport()
      diff = if @pos && @prevPos then Math.abs((@pos.top+@pos.left) - (@prevPos.top+@prevPos.left)) else 0
      if newval != @inviewport || diff>5
        @prevPos = @pos
        @inviewport = newval
        @update()

    @inViewport = =>

      @pos = @root.getBoundingClientRect()
      @pos.bottom >= 0 &&
      @pos.right >= 0 &&
      @pos.top <= (window.innerHeight || document.documentElement.clientHeight) &&
      @pos.left <= (window.innerWidth || document.documentElement.clientWidth)
