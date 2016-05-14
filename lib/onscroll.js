
riot.tag2('onscroll', '<yield></yield>', '', '', function(opts) {
this.on('mount', function() {
  window.addEventListener('scroll', this.handleScroll);
  this.inviewport = this.inViewport();
  return this.update();
});

this.on('unmount', function() {
  return window.removeEventListener('scroll', this.handleScroll);
});

this.handleScroll = (function(_this) {
  return function(e) {
    var diff, newval;
    newval = _this.inViewport();
    diff = Math.abs((_this.pos.top + _this.pos.left) - (_this.prevPos.top + _this.prevPos.left));
    if (newval !== _this.inviewport || diff > 5) {
      _this.prevPos = _this.pos;
      _this.inviewport = newval;
      return _this.update();
    }
  };
})(this);

this.inViewport = (function(_this) {
  return function() {
    _this.pos = _this.root.getBoundingClientRect();
    return _this.pos.bottom >= 0 && _this.pos.right >= 0 && _this.pos.top <= (window.innerHeight || document.documentElement.clientHeight) && _this.pos.left <= (window.innerWidth || document.documentElement.clientWidth);
  };
})(this);
});