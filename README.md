<img src="https://cdn.rawgit.com/crisward/riot-onscroll/master/riot-onscroll.svg" height="140"/>

This riot tag changes a local property on specific scroll criteria

This adds the ability to position, animate and fade in components
as the page scrolls. 

## Install

```
npm install riot-onscroll
```

## Demo

http://crisward.github.io/riot-onscroll/

## Usage

```html
<style>
  .show{
    opacity:1;
    transition: all 1s;
  }
  .hide{
    opacity:0;
    transition: all 1s;
  }
</style>
<onscroll>
  <p class="{show:inviewport,hide:!inviewport}">Your Content</p>
</onscroll>
```

|Attribute  |Description
|-----      |-----
|inviewport | true if your onscroll tag in in the viewport
|pos.top    | distance between the top of the onscroll tag and the viewport top
|pos.right  | distance between the right of the onscroll tag and the viewport right
|pos.bottom | distance between the bottom of the onscroll tag and the viewport bottom
|pos.left   | distance between the left of the onscroll tag and the viewport left


## License

(The MIT License)

Copyright (c) 2015 Cris Ward

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

