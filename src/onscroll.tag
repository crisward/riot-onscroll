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
      if newval != @inviewport
        @inviewport = newval
        @update()

    @inViewport = =>
      rect = @root.getBoundingClientRect()
      rect.bottom >= 0 &&
      rect.right >= 0 &&
      rect.top <= (window.innerHeight || document.documentElement.clientHeight) &&
      rect.left <= (window.innerWidth || document.documentElement.clientWidth)
