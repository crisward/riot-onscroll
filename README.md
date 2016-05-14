# Riot OnScroll

This riot tag changes a local property on specific scroll criteria

This adds the ability to position, animate and fade in components
as the page scrolls. 

## Install

```
npm install riot-onscroll
```


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
|pos        | position of your element relative to the viewport (pos.top,pos.left,pos.bottom,pos.right)
