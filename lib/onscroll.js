
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
    var newval;
    newval = _this.inViewport();
    if (newval !== _this.inviewport) {
      _this.inviewport = newval;
      return _this.update();
    }
  };
})(this);

this.inViewport = (function(_this) {
  return function() {
    var rect;
    rect = _this.root.getBoundingClientRect();
    return rect.bottom >= 0 && rect.right >= 0 && rect.top <= (window.innerHeight || document.documentElement.clientHeight) && rect.left <= (window.innerWidth || document.documentElement.clientWidth);
  };
})(this);
});