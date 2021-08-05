<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	
.rlink{
  display: var(--rlink-display, inline-flex);
}

.rlink[href]{
  color: var(--rlink-color);
  text-decoration: var(--rlink-text-decoration, none);
}

.rlink:not([href]){
  pointer-events: none;
}

.rbutton{
  background-color: var(--rbutton-background-color, transparent);
  padding: var(--rbutton-padding, var(--rbutton-padding-top, 0) var(--rbutton-padding-right, 0) var(--rbutton-padding-bottom, 0) var(--rbutton-padding-left, 0));

  border-width: var(--rbutton-border-width, var(--rbutton-border-top-width, 0) var(--rbutton-border-right-width, 0) var(--rbutton-border-bottom-width, 0) var(--rbutton-border-left-width, 0));
  border-style: var(--rbutton-border-style, solid);
  border-color: var(--rbutton-border-color, currentcolor);

  font-family: var(--rbutton-font-family, inherit);
  font-size: var(--rbutton-font-size, 1em);
  font-weight: var(--rbutton-font-weight, inherit);
  
  color: var(--rbutton-color, currentcolor);
  text-align: var(--rbutton-text-align, center);
  text-transform: var(--rbutton-text-transform, inherit);
  letter-spacing: var(--rbutton-letter-spacing, inherit);
  word-spacing: var(--rbutton-word-spacing, inherit);

  text-shadow: var(--rbutton-text-shadow, none);
  display: var(--rbutton-display, inline-flex);
}

/*
1. pointer-events: none removes the any mouse events, i.e hover that works by default
2. user-select: none removes text selection
*/

.ui-button:disabled{
  pointer-events: none;
  user-select: none;
  opacity: var(--rbutton-opacity-disabled, 0.5);
}

.ui-button:not(:disabled){
  cursor: var(--uibutton-cursor, pointer);
}

/*
1. If users enables the prefers-reduced-motion: reduce mode all 
animations will be disabled

2. The transition property isn't used because there are limits of the 
transition property syntax, particularly multiple values can't be used.

3. The separate custom --ha-transition-pseudo-* properties are created 
to avoid conflicts of names when you will need to use --ha-transition-* 
and --ha-transition-pseudo-* at one moment
*/

@media (prefers-reduced-motion: no-preference) {

  .ha-transition{
    transition-property: var(--ha-transition-property);
    transition-duration: var(--ha-transition-duration);
    transition-timing-function: var(--ha-transition-timing-function);
    transition-delay: var(--ha-transition-delay);
    will-change: var(--ha-transition-property);
  }

  .ha-transition-pseudo::before,
  .ha-transition-pseudo::after{
    transition-property: var(--ha-transition-pseudo-property);
    transition-duration: var(--ha-transition-pseudo-duration);
    transition-timing-function: var(--ha-transition-pseudo-timing-function);
    transition-delay: var(--ha-transition-pseudo-delay);
    will-change: var(--ha-transition-pseudo-property);
  }
}

/*
=====
OUTLINED TEXT
=====
*/

/* 
basic
*/ 

.text-outlined{
  --ui-text-outlined-weight: var(--text-outlined-weight, 2px);
  --ui-text-outlined-line-color: var(--text-outlined-line-color, currentcolor);

  display: var(--text-outlined-display, inline-flex);
  position: var(--text-outlined-position, relative);
  padding: var(--text-outlined-padding, .25rem);
  color: var(--text-outlined-color, currentcolor);
}

.text-outlined__label{
  display: var(--text-outlined-label-display, block);
}

:is(.text-outlined, .text-outlined__label)::before,
:is(.text-outlined, .text-outlined__label)::after{ 
  content: "";     
  background-color: var(--ui-text-outlined-line-color);
  position: absolute; 
}

.text-outlined::before, 
.text-outlined::after{
  width: 100%;
  height: var(--ui-text-outlined-weight);
  left: 0;
}

.text-outlined__label::before,
.text-outlined__label::after{
  width: var(--ui-text-outlined-weight);
  height: 100%;
  top: 0;
}

.text-outlined::before{
  top: 0;
}

.text-outlined::after{
  bottom: 0;
}

.text-outlined__label::before{
  left: 0;
}

.text-outlined__label::after{
  right: 0;
}

/* 
text-outlined extension

1. opacity hides hide the lines so that they display the same regardless of what the 
element is. But I only show the line for interactive elements, i.e the 
button and the a
*/ 

/* extention #1 */

:is(.text-outlined, .text-outlined__label)::before,
:is(.text-outlined, .text-outlined__label)::after{ 
  opacity: var(--text-outlined-line-opacity, 0);
}


:is(a[href], button:not(:disabled)):hover .text-outlined{
  --text-outlined-line-opacity: var(--text-outlined-line-opacity-hover, 1);
}

/* extention #2 */

.text-outlined{
  --default-ui-text-outlined-line-transition-property: transform, opacity;
  --default-ui-text-outlined-line-transition-duration: .2s, .15s;
  --default-ui-text-outlined-line-transition-timing-function: ease-out;
  --default-ui-text-outlined-line-transition-delay: 0s, .15s;
  
  overflow: hidden;
}

.text-outlined::before{
  --ha-transition-pseudo-property: var(--ui-text-outlined-top-line-transition-property, var(--text-outlined-top-line-transition-property, var(--default-ui-text-outlined-line-transition-property)));
  --ha-transition-pseudo-duration: var(--ui-text-outlined-top-line-transition-duration, var(--text-outlined-top-line-transition-duration, var(--default-ui-text-outlined-line-transition-duration)));
  --ha-transition-pseudo-timing-function: var(--ui-text-outlined-top-line-transition-timing-function, var(--text-outlined-top-line-transition-timing-function, var(--default-ui-text-outlined-line-transition-timing-function)));
  --ha-transition-pseudo-delay: var(--ui-text-outlined-top-line-transition-delay, var(--text-outlined-top-line-transition-delay, var(--default-ui-text-outlined-line-transition-delay)));

  transform: var(--ui-text-outlined-top-line-transform, var(--text-outlined-top-line-transform, translate3d(-105%, 0, 0)));
}

.text-outlined::after{
  --ha-transition-pseudo-property: var(--ui-text-outlined-bottom-line-transition-property, var(--text-outlined-bottom-line-transition-property, var(--default-ui-text-outlined-line-transition-property)));
  --ha-transition-pseudo-duration: var(--ui-text-outlined-bottom-line-transition-duration, var(--text-outlined-bottom-line-transition-duration, var(--default-ui-text-outlined-line-transition-duration)));
  --ha-transition-pseudo-timing-function: var(--ui-text-outlined-bottom-line-transition-timing-function, var(--text-outlined-bottom-line-transition-timing-function, var(--default-ui-text-outlined-line-transition-timing-function)));
  --ha-transition-pseudo-delay: var(--ui-text-outlined-bottom-line-transition-delay, var(--text-outlined-bottom-line-transition-delay, var(--default-ui-text-outlined-line-transition-delay)));

  transform: var(--ui-text-outlined-bottom-line-transform, var(--text-outlined-bottom-line-transform, translate3d(105%, 0, 0)));
}

.text-outlined__label::before{ 
  --ha-transition-pseudo-property: var(--ui-text-outlined-left-line-transition-property, var(--text-outlined-left-line-transition-property, var(--default-ui-text-outlined-line-transition-property)));
  --ha-transition-pseudo-duration: var(--ui-text-outlined-left-line-transition-duration, var(--text-outlined-left-line-transition-duration, var(--default-ui-text-outlined-line-transition-duration)));
  --ha-transition-pseudo-timing-function: var(--ui-text-outlined-left-line-transition-timing-function, var(--text-outlined-left-line-transition-timing-function, var(--default-ui-text-outlined-line-transition-timing-function)));
  --ha-transition-pseudo-delay: var(--ui-text-outlined-left-line-transition-delay, var(--text-outlined-left-line-transition-delay, var(--default-ui-text-outlined-line-transition-delay)));

  transform: var(--ui-text-outlined-left-line-transform, var(--text-outlined-left-line-transform, translate3d(0%, -100%, 0)));
}

.text-outlined__label::after{ 
  --ha-transition-pseudo-property: var(--ui-text-outlined-right-line-transition-property, var(--text-outlined-right-line-transition-property, var(--default-ui-text-outlined-line-transition-property)));
  --ha-transition-pseudo-duration: var(--ui-text-outlined-right-line-transition-duration, var(--text-outlined-right-line-transition-duration, var(--default-ui-text-outlined-line-transition-duration)));
  --ha-transition-pseudo-timing-function: var(--ui-text-outlined-right-line-transition-timing-function, var(--text-outlined-right-line-transition-timing-function, var(--default-ui-text-outlined-line-transition-timing-function)));
  --ha-transition-pseudo-delay: var(--ui-text-outlined-right-line-transition-delay, var(--text-outlined-right-line-transition-delay, var(--default-ui-text-outlined-line-transition-delay)));
  
    transform: var(--ui-text-outlined-right-line-transform, var(--text-outlined-right-line-transform, translate3d(0%, 100%, 0)));
}

:is(a[href], button:not(:disabled)):hover > .text-outlined{
  --ui-text-outlined-top-line-transform: var(--text-outlined-top-line-transform-hover, translate3d(0, 0, 0));
  --ui-text-outlined-right-line-transform: var(--text-outlined-right-line-transform-hover, translate3d(0, 0, 0));
  --ui-text-outlined-bottom-line-transform: var(--text-outlined-bottom-line-transform-hover, translate3d(0, 0, 0));
  --ui-text-outlined-left-line-transform: var(--text-outlined-left-line-transform-hover, translate3d(0, 0, 0));

  --ui-text-outlined-top-line-transition-property: var(--text-outlined-top-line-transition-property-hover);
  --ui-text-outlined-right-line-transition-property: var(--text-outlined-right-line-transition-property-hover);
  --ui-text-outlined-bottom-line-transition-property: var(--text-outlined-bottom-line-transition-property-hover);
  --ui-text-outlined-left-line-transition-property: var(--text-outlined-left-line-transition-property-hover);
  
  --ui-text-outlined-top-line-transition-duration: var(--text-outlined-top-line-transition-duration-hover, .25s);
  --ui-text-outlined-right-line-transition-duration: var(--text-outlined-right-line-transition-duration-hover, .25s);
  --ui-text-outlined-bottom-line-transition-duration: var(--text-outlined-bottom-line-transition-duration-hover, .25s);
  --ui-text-outlined-left-line-transition-duration: var(--text-outlined-left-line-transition-duration-hover, .25s);

  --ui-text-outlined-top-line-transition-timing-function: var(--text-outlined-top-line-transition-timing-function-hover);
  --ui-text-outlined-right-line-transition-timing-function: var(--text-outlined-right-line-transition-timing-function-hover);
  --ui-text-outlined-bottom-line-transition-timing-function: var(--text-outlined-bottom-line-transition-timing-function-hover);
  --ui-text-outlined-left-line-transition-timing-function: var(--text-outlined-left-line-transition-timing-function-hover);  
  
  --ui-text-outlined-top-line-transition-delay: var(--text-outlined-top-line-transition-delay-hover, 0s);
  --ui-text-outlined-right-line-transition-delay: var(--text-outlined-right-line-transition-delay-hover, 0s);
  --ui-text-outlined-bottom-line-transition-delay: var(--text-outlined-bottom-line-transition-delay-hover, 0s);
  --ui-text-outlined-left-line-transition-delay: var(--text-outlined-left-line-transition-delay-hover, 0s);

  --ui-text-outlined-will-change: var(--text-outlined-will-change-hover);
}

/*
modifiers
*/

.text-outlined_v5{
  --text-outlined-top-line-transform: translate3d(-100%, 0, 0);
  --text-outlined-right-line-transform: translate3d(0, -100%, 0);  
  --text-outlined-bottom-line-transform: translate3d(100%, 0, 0);
  --text-outlined-left-line-transform: translate3d(0, 100%, 0);
  
  --text-outlined-top-line-transform-hover: translate3d(0, 0, 0);
  --text-outlined-right-line-transform-hover: translate3d(0 0, 0);  
  --text-outlined-bottom-line-transform-hover: translate3d(0, 0, 0);
  --text-outlined-left-line-transform-hover: translate3d(0, 0, 0);

  --text-outlined-top-line-transition-duration-hover: .25s;
  --text-outlined-right-line-transition-duration-hover: .25s;  
  --text-outlined-bottom-line-transition-duration-hover: .25s;  
  --text-outlined-left-line-transition-duration-hover: .25s;

  --text-outlined-top-line-transition-delay-hover: 0s;
  --text-outlined-right-line-transition-delay-hover: 0s;
  --text-outlined-bottom-line-transition-delay-hover: 0s;
  --text-outlined-left-line-transition-delay-hover: 0s;    
}

.text-outlined_v6{
  --text-outlined-top-line-transform: translate3d(-105%, 0, 0);
  --text-outlined-right-line-transform: translate3d(0, -105%, 0);  
  --text-outlined-bottom-line-transform: translate3d(105%, 0, 0);
  --text-outlined-left-line-transform: translate3d(0, 105%, 0);

  --text-outlined-top-line-transition-duration: .2s;
  --text-outlined-right-line-transition-duration: .2s;  
  --text-outlined-bottom-line-transition-duration: .2s;  
  --text-outlined-left-line-transition-duration: .2s;

  --text-outlined-top-line-transition-delay: .35s;
  --text-outlined-right-line-transition-delay: .25s;
  --text-outlined-bottom-line-transition-delay: .15s;
  --text-outlined-left-line-transition-delay: 0s;  
  
  --text-outlined-top-line-transform-hover: translate3d(0, 0, 0);
  --text-outlined-right-line-transform-hover: translate3d(0 0, 0);  
  --text-outlined-bottom-line-transform-hover: translate3d(0, 0, 0);
  --text-outlined-left-line-transform-hover: translate3d(0, 0, 0);

  --text-outlined-top-line-transition-delay-hover: 0s;
  --text-outlined-right-line-transition-delay-hover: .15s;
  --text-outlined-bottom-line-transition-delay-hover: .25s;
  --text-outlined-left-line-transition-delay-hover: .35s;    
}

/*
=====
UNDERLINED TEXT
=====
*/

/*
basic
*/

/*
1. I use pixels units because others units (em, rem, vw, vh, etc) can
lead to the mistake of displaying a circumcised line
*/

.text-underlined{
  --ui-text-underlined-line-height: var(--text-underlined-line-height, 2px);
  --ui-text-underlined-line-gap: var(--text-underlined-line-gap, .5rem);
  --ui-text-underlined-padding-bottom: calc(var(--ui-text-underlined-line-height) + var(--ui-text-underlined-line-gap));
  
  display: var(--text-underlined-display, inline-flex);
  padding-bottom: var(--ui-text-underlined-padding-bottom);
  position: var(--text-underlined-position, relative);
  color: var(--text-underlined-color, currentColor);
}

.text-underlined::after{
  content: "";
  width: var(--text-underlined-line-widht, 100%);
  height: var(--ui-text-underlined-line-height);

  background-color: var(--text-underlined-line-color, currentcolor);

  position: absolute;
  left: var(--text-underlined-line-left, 0);
  bottom: var(--text-underlined-line-bottom, 0);
}

/*
text-underlined extension

1. The transition property isn't used because there are limits of the 
transition property syntax, particularly multiple values can't be used. 
*/

.text-underlined{
  overflow: hidden;
}

.text-underlined::after{
  --ha-transition-pseudo-property: var(--ui-text-underlined-line-transition-property, var(--text-underlined-line-transition-property, transform));
  --ha-transition-pseudo-duration: var(--ui-text-underlined-line-transition-duration, var(--text-underlined-line-transition-duration, .2s));
  --ha-transition-pseudo-timing-function: var(--ui-text-underlined-line-transition-timing-function, var(--text-underlined-line-transition-timing-function, ease-in));
  --ha-transition-pseudo-delay: var(--ui-text-underlined-line-transition-delay, var(--text-underlined-line-transition-delay, 0s));
  
  transform: var(--ui-text-underlined-line-transform, var(--text-underlined-line-transform));
}

:is(a[href], button:not(:disabled)):hover > .text-underlined::after{  
  --ui-text-underlined-line-transform: var(--text-underlined-line-transform-hover);
  --ui-text-underlined-line-transition-property: var(--text-underlined-line-transition-property-hover);
  --ui-text-underlined-line-transition-duration: var(--text-underlined-line-transition-duration-hover);
  --ui-text-underlined-line-transition-timing-function: var(--text-underlined-line-transition-timing-function-hover);
  --ui-text-underlined-line-transition-delay: var(--text-underlined-line-transition-delay-hover);
  --ui-text-underlined-line-will-change: var(--text-underlined-line-will-change-hover);
}

/*
modifiers
*/

.text-underlined_v3{
  --text-underlined-line-transform: translate3d(-110%, 0, 0);
  --text-underlined-line-transform-hover: translate3d(0, 0, 0);
}

.text-underlined_v4{
  --text-underlined-line-transform: translate3d(0, 110%, 0);
  --text-underlined-line-transform-hover: translate3d(0, 0, 0);
}

/*
=====
FLAT TEXT
=====
*/

/* 
basic
*/ 

.text-flat{
  display: inline-flex;
  position: relative;
  z-index: 0;
  color: var(--ui-core-text-flat-color, var(--text-flat-color, #fff));
}

.text-flat::before, 
.text-flat::after{
  content: "";
  background-color: var(--ui-core-text-flat-background-color, var(--text-flat-background-color, #222)); 
  position: absolute;
  z-index: -1;
}

.text-flat::before{
  width: var(--ui-core-text-flat-first-plane-width, var(--text-flat-first-plane-width, 100%));
  height: var(--ui-core-text-flat-first-plane-height, var(--text-flat-first-plane-height, 100%));
  
  top: var(--ui-core-text-flat-first-plane-top, var(--text-flat-first-plane-top, auto));
  right: var(--ui-core-text-flat-first-plane-right, var(--text-flat-first-plane-right, auto));
  bottom: var(--ui-core-text-flat-first-plane-bottom, var(--text-flat-first-plane-bottom, auto));
  left: var(--ui-core-text-flat-first-plane-left, var(--text-flat-first-plane-left, auto));
}

.text-flat::after{
  width: var(--ui-core-text-flat-second-plane-width, var(--text-flat-second-plane-width, 100%));
  height: var(--ui-core-text-flat-second-plane-height, var(--text-flat-second-plane-height, 100%));
  
  top: var(--ui-core-text-flat-second-plane-top, var(--text-flat-second-plane-top, auto));
  right: var(--ui-core-text-flat-second-plane-right, var(--text-flat-second-plane-right, auto));
  bottom: var(--ui-core-text-flat-second-plane-bottom, var(--text-flat-second-plane-bottom, auto));
  left: var(--ui-core-text-flat-second-plane-left, var(--text-flat-second-plane-left, auto));  
}

.text-flat__label{
  display: block;
  padding: var(--text-flat-padding, .5rem .75rem);
}

/* 
flat text extension #1

1. The transition property isn't used because there are limits of the 
transition property syntax, particularly multiple values can't be used. 
*/ 

.text-flat{
  --default-ui-text-flat-planes-opacity: 0;
  --default-ui-text-flat-planes-transition-property: transform, opacity;
  --default-ui-text-flat-planes-transition-duration: .2s;  
  --default-ui-text-flat-planes-transition-timing-function: ease-out;
  --default-ui-text-flat-planes-transition-delay: 0, .03s;
  
  --ha-transition-property: var(--text-flat-transition-property, color);
  --ha-transition-duration: var(--text-flat-transition-duration, .3s);
  --ha-transition-timing-function: var(--text-flat-transition-timing-function, ease-out);
  --ha-transition-delay: var(--text-flat-transition-delay);
  
  overflow: hidden;
}

.text-flat::before{
  --ui-core-text-flat-first-plane-top: var(--ui-text-flat-first-plane-top);
  --ui-core-text-flat-first-plane-right: var(--ui-text-flat-first-plane-right);
  --ui-core-text-flat-first-plane-bottom: var(--ui-text-flat-first-plane-bottom);
  --ui-core-text-flat-first-plane-left: var(--ui-text-flat-first-plane-left);

  --ha-transition-pseudo-property: var(--ui-text-flat-first-plane-transition-property, var(--text-flat-first-plane-transition-property, var(--default-ui-text-flat-planes-transition-property)));
  --ha-transition-pseudo-duration: var(--ui-text-flat-first-plane-transition-duration, var(--text-flat-first-plane-transition-duration, var(--default-ui-text-flat-planes-transition-duration)));  
  --ha-transition-pseudo-timing-function: var(--ui-text-flat-first-plane-transition-timing-function, var(--text-flat-first-plane-transition-timing-function, var(--default-ui-text-flat-planes-transition-timing-function)));
  --ha-transition-pseudo-delay: var(--ui-text-flat-first-plane-transition-delay, var(--text-flat-first-plane-transition-delay, var(--default-ui-text-flat-planes-transition-delay)));
  
  opacity: var(--ui-text-flat-first-plane-opacity, var(--text-flat-first-plane-top, var(--default-ui-text-flat-planes-opacity))); 
  transform: var(--ui-text-flat-first-plane-transform, var(--text-flat-first-plane-transform));
}

.text-flat::after{
  --ui-core-text-flat-second-plane-top: var(--ui-text-flat-second-plane-top);
  --ui-core-text-flat-second-plane-right: var(--ui-text-flat-second-plane-right);
  --ui-core-text-flat-second-plane-bottom: var(--ui-text-flat-second-plane-bottom);
  --ui-core-text-flat-second-plane-left: var(--ui-text-flat-second-plane-left);

  --ha-transition-pseudo-property: var(--ui-text-flat-second-plane-transition-property, var(--text-flat-second-plane-transition-property, var(--default-ui-text-flat-planes-transition-property)));
  --ha-transition-pseudo-duration: var(--ui-text-flat-second-plane-transition-duration, var(--text-flat-second-plane-transition-duration, var(--default-ui-text-flat-planes-transition-duration)));  
  --ha-transition-pseudo-timing-function: var(--ui-text-flat-second-plane-transition-timing-function, var(--text-flat-second-plane-transition-timing-function, var(--default-ui-text-flat-planes-transition-timing-function)));
  --ha-transition-pseudo-delay: var(--ui-text-flat-second-plane-transition-delay, var(--text-flat-second-plane-transition-delay, var(--default-ui-text-flat-planes-transition-delay)));
  
  opacity: var(--ui-text-flat-second-plane-opacity, var(--text-flat-second-plane-top, var(--default-ui-text-flat-planes-opacity))); 
  transform: var(--ui-text-flat-second-plane-transform, var(--text-flat-second-plane-transform));
}

:is(a[href], button:not(:disabled)):hover > .text-flat{
  --ui-core-text-flat-color: var(--text-flat-color-hover, #fff);
  
  --ui-text-flat-first-plane-top: var(--text-flat-first-plane-top-hover);
  --ui-text-flat-first-plane-right: var(--text-flat-first-plane-right-hover);
  --ui-text-flat-first-plane-bottom: var(--text-flat-first-plane-bottom-hover);
  --ui-text-flat-first-plane-left: var(--text-flat-first-plane-left-hover);
  
  --ui-text-flat-first-plane-opacity: var(--text-flat-first-plane-opacity-hover);
  --ui-text-flat-first-plane-transform: var(--text-flat-first-plane-transform-hover);
  --ui-text-flat-first-plane-transition-property: var(--text-flat-first-plane-transition-property-hover);
  --ui-text-flat-first-plane-transition-duration: var(--text-flat-first-plane-transition-duration-hover);
  --ui-text-flat-first-plane-transition-timing-function: var(--text-flat-first-plane-transition-timing-function-hover);
  --ui-text-flat-first-plane-transition-delay: var(--text-flat-first-plane-transition-delay-hover);

  --ui-text-flat-second-plane-top: var(--text-flat-second-plane-top-hover);
  --ui-text-flat-second-plane-right: var(--text-flat-second-plane-right-hover);
  --ui-text-flat-second-plane-bottom: var(--text-flat-second-plane-bottom-hover);
  --ui-text-flat-second-plane-left: var(--text-flat-second-plane-left-hover);
  
  --ui-text-flat-second-plane-opacity: var(--text-flat-second-plane-opacity-hover);
  --ui-text-flat-second-plane-transform: var(--text-flat-second-plane-transform-hover);
  --ui-text-flat-second-plane-transition-property: var(--text-flat-second-plane-transition-property-hover);
  --ui-text-flat-second-plane-transition-duration: var(--text-flat-second-plane-transition-duration-hover);
  --ui-text-flat-second-plane-transition-timing-function: var(--text-flat-second-plane-transition-timing-function-hover);
  --ui-text-flat-second-plane-transition-delay: var(--text-flat-second-plane-transition-delay-hover);
}

/*
modifiers
*/

.text-flat_v9{
  --text-flat-first-plane-width: 51%;
  --text-flat-first-plane-top: 0;
  --text-flat-first-plane-left: 0;  
  --text-flat-first-plane-transform: translate3d(-100%, 0, 0);
  --text-flat-first-plane-transition-duration: .28s;
  --text-flat-first-plane-transition-delay: 0 .28s;
  --text-flat-second-plane-transition-delay: 0 .28s;

  --text-flat-second-plane-width: 51%;
  --text-flat-second-plane-top: 0;
  --text-flat-second-plane-right: 0;
  --text-flat-second-plane-transform: translate3d(100%, 0, 0);
  --text-flat-second-plane-transition-duration: .28s;

  --text-flat-first-plane-transform-hover: translate3d(0, 0, 0);
  --text-flat-first-plane-opacity-hover: 1;
  --text-flat-second-plane-transform-hover: translate3d(0, 0, 0);
  --text-flat-second-plane-transition-duration-hover: .18s;
  --text-flat-second-plane-opacity-hover: 1;
}

.text-flat_v10{
  --text-flat-first-plane-height: 51%;
  --text-flat-first-plane-top: 0;
  --text-flat-first-plane-left: 0;  
  --text-flat-first-plane-transform: translate3d(0, -50%, 0);
  --text-flat-first-plane-transition-duration: .28s;

  --text-flat-second-plane-height: 51%;
  --text-flat-second-plane-bottom: 0;
  --text-flat-second-plane-left: 0;
  --text-flat-second-plane-transform: translate3d(0, 50%, 0);
  --text-flat-second-plane-transition-duration: .28s;

  --text-flat-first-plane-transform-hover: translate3d(0, 0, 0);
  --text-flat-first-plane-opacity-hover: 1;
  --text-flat-second-plane-transform-hover: translate3d(0, 0, 0);
  --text-flat-second-plane-transition-duration-hover: .18s;
  --text-flat-second-plane-opacity-hover: 1;
}

.text-flat_v11{
  --text-flat-first-plane-width: 51%;
  --text-flat-first-plane-top: 0;
  --text-flat-first-plane-left: 0;
  --text-flat-first-plane-transform: rotate(360deg);
  --text-flat-first-plane-transition-duration: .35s;

  --text-flat-second-plane-width: 51%;
  --text-flat-second-plane-top: 0;
  --text-flat-second-plane-right: 0;
  --text-flat-second-plane-transform: rotate(360deg);
  --text-flat-second-plane-transition-duration: .35s;

  --text-flat-first-plane-transform-hover: rotate(0);
  --text-flat-first-plane-opacity-hover: 1;
  --text-flat-second-plane-transform-hover: rotate(0);
  --text-flat-second-plane-opacity-hover: 1;
}

.text-flat_v12{
  --text-flat-first-plane-width: 51%;
  --text-flat-first-plane-transform: translate3d(-100%, 0, 0) rotate(-45deg);
  --text-flat-first-plane-transition-duration: .35s;

  --text-flat-second-plane-width: 51%;
  --text-flat-second-plane-right: 0;
  --text-flat-second-plane-transform: translate3d(100%, 0, 0) rotate(-45deg);
  --text-flat-second-plane-transition-duration: .35s;

  --text-flat-first-plane-transform-hover: translate3d(0, 0, 0) rotate(0);
  --text-flat-first-plane-opacity-hover: 1;  
  --text-flat-second-plane-transform-hover: translate3d(0, 0, 0) rotate(0);
  --text-flat-second-plane-opacity-hover: 1;
}

/*
SETTINGS
*/

:root{
  --text-outlined-weight: 5px;
  --text-outlined-color: #243aab;
  --text-outlined-line-color: #243aab;
  --text-outlined-padding: 1rem 1.25rem;
  --text-underlined-line-height: 5px;
  --text-underlined-line-gap: .25rem;
  --text-underlined-line-color: #243aab;
  --text-underlined-color: #243aab;
  --text-flat-background-color: #243aab;
  --text-flat-padding: .75rem;
  --text-flat-color: #243aab;
}

/*
=====
DEMO
=====
*/

body{
  font-family: -apple-system, BlinkMacSystemFont, "Roboto", "Open Sans", "Helvetica Neue", "Segoe UI", "Arial", sans-serif;
  margin: 0;
}

.section{
  padding: 7.25rem 1rem 6.5rem;
  position: relative;
}

.section:nth-child(odd){
  background-color: #f1f4fa;
}

.section__label{
  padding: .5rem 1.5rem;
  
  font-size: 1rem;
  color: #4e4848;
  letter-spacing: .075rem;
  font-weight: 700;
  font-variant-caps: small-caps;
  
  position: absolute;
  top: 0;
  left: 0;

}

.section:nth-child(odd) .section__label{
  background-color: #fff;
}

.section:nth-child(even) .section__label{
  background-color: #f1f4fa;
}

.section__group{
  margin: .25rem;
  font-weight: 700;
  text-transform: uppercase;
  text-align: center;
}

@media (min-width: 641px){
  
  .section{
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    grid-gap: 1rem;
  }
}
</style>
</head>
<body>
	<div class="section">
  <span class="section__label">effect #1</span>
  <div class="section__group">
    <a href="#0" class="rlink">
      <span class="text-outlined text-outlined_v1 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the a</span>
      </span> 
    </a>
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button">
      <span class="text-outlined text-outlined_v1 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the button</span>
      </span>       
    </button>
  </div>
  <div class="section__group">
    <span>
      <span class="text-outlined text-outlined_v1 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the span</span>
      </span>
    </span>
  </div>
  <div class="section__group">
    <a class="rlink">
      <span class="text-outlined text-outlined_v1 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the logical a</span>
      </span>      
    </a>        
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button" disabled>
      <span class="text-outlined text-outlined_v1 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the disabled button</span>
      </span>       
    </button>
  </div>
</div>
<div class="section">
  <span class="section__label">effect #2</span>
  <div class="section__group">
    <a href="#0" class="rlink">
      <span class="ha-transition-pseudo text-underlined text-underlined_v3">
        <span class="text-underlined__label">I'm the a</span>
      </span> 
    </a>
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button" >
      <span class="ha-transition-pseudo text-underlined text-underlined_v3">
        <span class="text-underlined__label">I'm the button</span>
      </span>       
    </button>
  </div>
  <div class="section__group">
    <span>
      <span class="ha-transition-pseudo text-underlined text-underlined_v3">
        <span class="text-underlined__label">I'm the span</span>
      </span>
    </span>
  </div>
  <div class="section__group">
    <a class="rlink">
      <span class="ha-transition-pseudo text-underlined text-underlined_v3">
        <span class="text-underlined__label">I'm the logical a</span>
      </span> 
    </a>        
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button" disabled>
      <span class="ha-transition-pseudo text-underlined text-underlined_v3">
        <span class="text-outlined__label">I'm the disabled button</span>
      </span>       
    </button>
  </div>
</div>
<div class="section">
  <span class="section__label">effect #3</span>
  <div class="section__group">
    <a href="#0" class="rlink">
      <span class="ha-transition-pseudo text-underlined text-underlined_v4">
        <span class="text-underlined__label">I'm the a</span>
      </span> 
    </a>
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button" >
      <span class="ha-transition-pseudo text-underlined text-underlined_v4">
        <span class="text-underlined__label">I'm the button</span>
      </span>       
    </button>
  </div>
  <div class="section__group">
    <span>
      <span class="ha-transition-pseudo text-underlined text-underlined_v4">
        <span class="text-underlined__label">I'm the span</span>
      </span>
    </span>
  </div>
  <div class="section__group">
    <a class="rlink">
      <span class="ha-transition-pseudo text-underlined text-underlined_v4">
        <span class="text-underlined__label">I'm the logical a</span>
      </span> 
    </a>        
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button" disabled>
      <span class="ha-transition-pseudo text-underlined text-underlined_v4">
        <span class="text-outlined__label">I'm the disabled button</span>
      </span>       
    </button>
  </div>
</div>
<div class="section">
  <span class="section__label">effect #4</span>
  <div class="section__group">
    <a href="#0" class="rlink">
      <span class="text-outlined text-outlined_v5 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the a</span>
      </span> 
    </a>
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button">
      <span class="text-outlined text-outlined_v5 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the button</span>
      </span>       
    </button>
  </div>
  <div class="section__group">
    <span>
      <span class="text-outlined text-outlined_v5 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the span</span>
      </span>
    </span>
  </div>
  <div class="section__group">
    <a class="rlink">
      <span class="text-outlined text-outlined_v5 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the logical a</span>
      </span>      
    </a>        
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button" disabled>
      <span class="text-outlined text-outlined_v5 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the disabled button</span>
      </span>       
    </button>
  </div>
</div>
<div class="section">
  <span class="section__label">effect #5</span>
  <div class="section__group">
    <a href="#0" class="rlink">
      <span class="text-outlined text-outlined_v6 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the a</span>
      </span> 
    </a>
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button">
      <span class="text-outlined text-outlined_v6 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the button</span>
      </span>       
    </button>
  </div>
  <div class="section__group">
    <span>
      <span class="text-outlined text-outlined_v6 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the span</span>
      </span>
    </span>
  </div>
  <div class="section__group">
    <a class="rlink">
      <span class="text-outlined text-outlined_v6 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the logical a</span>
      </span>      
    </a>        
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button" disabled>
      <span class="text-outlined text-outlined_v6 ha-transition-pseudo">
        <span class="text-outlined__label ha-transition-pseudo">I'm the disabled button</span>
      </span>       
    </button>
  </div>
</div>
<div class="section">
  <span class="section__label">effect #6</span>
  <div class="section__group">
    <a href="#0" class="rlink">
      <span class="ha-transition-pseudo text-flat text-flat_v9">
        <span class="text-flat__label">I'm the a</span>
      </span>
    </a>
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button">
      <span class="ha-transition-pseudo text-flat text-flat_v9">
        <span class="text-flat__label">I'm the button</span>
      </span>
    </button>
  </div>
  <div class="section__group">
    <span>
      <span class="ha-transition-pseudo text-flat text-flat_v9">
        <span class="text-flat__label">I'm the span</span>
      </span>
    </span>    
  </div>
  <div class="section__group">
    <a class="rlink">
      <span class="ha-transition-pseudo text-flat text-flat_v9">
        <span class="text-flat__label">I'm the logical a</span>
      </span>
    </a>        
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button" disabled>
      <span class="ha-transition-pseudo text-flat text-flat_v9">
        <span class="text-flat__label">I'm the disabled button</span>
      </span>
    </button>
  </div>
</div>
<div class="section">
  <span class="section__label">effect #7</span>
  <div class="section__group">
    <a href="#0" class="rlink">
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v10">
        <span class="text-flat__label">I'm the a</span>
      </span>
    </a>
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button">
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v10">
        <span class="text-flat__label">I'm the button</span>
      </span>
    </button>
  </div>
  <div class="section__group">
    <span>
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v10">
        <span class="text-flat__label">I'm the span</span>
      </span>
    </span>    
  </div>
  <div class="section__group">
    <a class="rlink">
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v10">
        <span class="text-flat__label">I'm the logical a</span>
      </span>
    </a>        
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button" disabled>
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v10">
        <span class="text-flat__label">I'm the disabled button</span>
      </span>
    </button>
  </div>
</div>
<div class="section">
  <span class="section__label">effect #8</span>
  <div class="section__group">
    <a href="#0" class="rlink">
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v11">
        <span class="text-flat__label">I'm the a</span>
      </span>
    </a>
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button">
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v11">
        <span class="text-flat__label">I'm the button</span>
      </span>
    </button>
  </div>
  <div class="section__group">
    <span>
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v11">
        <span class="text-flat__label">I'm the span</span>
      </span>
    </span>    
  </div>
  <div class="section__group">
    <a class="rlink">
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v11">
        <span class="text-flat__label">I'm the logical a</span>
      </span>
    </a>        
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button" disabled>
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v11">
        <span class="text-flat__label">I'm the disabled button</span>
      </span>
    </button>
  </div>
</div>
<div class="section">
  <span class="section__label">effect #9</span>
  <div class="section__group">
    <a href="#0" class="rlink">
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v12">
        <span class="text-flat__label">I'm the a</span>
      </span>
    </a>
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button">
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v12">
        <span class="text-flat__label">I'm the button</span>
      </span>
    </button>
  </div>
  <div class="section__group">
    <span>
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v12">
        <span class="text-flat__label">I'm the span</span>
      </span>
    </span>    
  </div>
  <div class="section__group">
    <a class="rlink">
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v12">
        <span class="text-flat__label">I'm the logical a</span>
      </span>
    </a>        
  </div>
  <div class="section__group">
    <button class="rbutton ui-button" type="button" disabled>
      <span class="ha-transition ha-transition-pseudo text-flat text-flat_v12">
        <span class="text-flat__label">I'm the disabled button</span>
      </span>
    </button>
  </div>
</div>
</body>
</html>