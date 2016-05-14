
riot.tag2('onscroll', '<yield></yield>', '', '', function(opts) {
this.on('mount', function() {
  window.addEventListener('scroll', this.handleScroll);
  window.addEventListener('resize', this.handleScroll);
  this.inviewport = this.inViewport();
  this.prevPos = this.pos;
  return this.update();
});

this.on('unmount', function() {
  window.removeEventListener('scroll', this.handleScroll);
  return window.removeEventListener('resize', this.handleScroll);
});

this.handleScroll = (function(_this) {
  return function(e) {
    var newval;
    newval = _this.inViewport();
    _this.diff = _this.calcDiff();
    if (newval !== _this.inviewport || _this.diff > 5) {
      _this.prevPos = _this.pos;
      _this.inviewport = newval;
      return _this.update();
    }
  };
})(this);

this.calcDiff = (function(_this) {
  return function() {
    if (!_this.prevPos) {
      return 0;
    }
    return Math.abs(_this.pos.top - _this.prevPos.top) + Math.abs(_this.pos.left - _this.prevPos.left) + Math.abs(_this.pos.right - _this.prevPos.right) + Math.abs(_this.pos.bottom - _this.prevPos.bottom);
  };
})(this);

this.inViewport = (function(_this) {
  return function() {
    var pos, winheight, winwidth;
    pos = _this.root.getBoundingClientRect();
    winheight = window.innerHeight || document.documentElement.clientHeight;
    winwidth = window.innerWidth || document.documentElement.clientWidth;
    _this.pos = {
      top: pos.top,
      left: pos.left,
      right: winwidth - pos.right,
      bottom: winheight - pos.bottom
    };
    return pos.bottom >= 0 && pos.right >= 0 && pos.top <= winheight && pos.left <= winwidth;
  };
})(this);
});