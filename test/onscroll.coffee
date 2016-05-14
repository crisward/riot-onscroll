require 'es5-shim' #needed for phantom js
window.riot = require 'riot'
require '../lib/onscroll.js'
simulant = require 'simulant'




describe 'onscroll',->

  beforeEach ->
    startTime = new Date().getTime()
    @domnode = document.createElement('div')
    @domnode.innerHTML = '<onscroll><div class="{show:inviewport,hide:!inviewport}",style="height:50px;width:300px;"><h1>Some Title</h1><p>Some text</p></div></onscroll><div style="height:10000px;width:10000px;border:1px solid red;"></div>'
    @node = document.body.appendChild(@domnode)
    @tag = riot.mount('onscroll')
    
  afterEach ->
    @tag[0].unmount()
    @domnode.innerHTML = ''

  describe "inviewport",->
  
    it "should have show class if in viewport",->
      expect(document.querySelectorAll('.show').length).to.equal(1)
      expect(document.querySelectorAll('.hide').length).to.equal(0)
      
    it "should have hide class after document in scrolled down",->
      window.scrollTo(0, 500);
      simulant.fire(document,'scroll')
      expect(document.querySelectorAll('.show').length).to.equal(0)
      expect(document.querySelectorAll('.hide').length).to.equal(1)    

    it "should have hide class after document in scrolled left",->
      window.scrollTo(5000,0);
      simulant.fire(document,'scroll')
      expect(document.querySelectorAll('.show').length).to.equal(0)
      expect(document.querySelectorAll('.hide').length).to.equal(1)
      
    it "should stay on until completly left",->
      window.scrollTo(0, 25);
      simulant.fire(document,'scroll')
      expect(document.querySelectorAll('.show').length).to.equal(1)
      expect(document.querySelectorAll('.hide').length).to.equal(0)
    