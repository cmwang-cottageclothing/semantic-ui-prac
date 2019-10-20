# Anatomy of a Smantic-UI example page Cover

## My way to learn Semantic-UI: Part I

## Part I

The official document of [Semantic-UI](https://semantic-ui.com/) says little about learning how to use Semantic-UI. Examples are given, but they are code only. None of them are described in detail.

I usually learn programming language by examples. Not only read the example code, but also **write** the example code **from scratch**. This way I can understand every single line of the code. I would like to use the same way to learn Semantic-UI.

The first example I want to learn is [Cover](https://semantic-ui-forest.com/templates/bootstrap/cover) template. You can find the [source code here](https://github.com/semantic-ui-forest/forest-templates/tree/master/bootstrap/cover). To examine the effect of every single line of the CSS code, you can use this [convenient tool](https://medium.com/@acncuc/a-very-basic-browser-sync-development-environment-based-on-docker-568e7a0c8c0f?source=friends_link&sk=14dd350203d90b19e51d3ee6be09f840).

First, I remove all the CSS code to get a semantically meaningful HTML file. THe HTML code can be roughly divided into three parts. They are a navigation bar, main content, and a footer, respectively. This plain HTML file is cover-plain.html.

Next, I, one by one, add CSS classes, which are provided by [Semantic-UI](https://semantic-ui.com/), to each element. You can see the effect of every class by using this [convenient tool](https://medium.com/@acncuc/a-very-basic-browser-sync-development-environment-based-on-docker-568e7a0c8c0f?source=friends_link&sk=14dd350203d90b19e51d3ee6be09f840).

## Two important components

Read the cover-plain.html line by line. Two important components are observed. They are `segment` and `menu`.

### A vertical segment

The [official definition of `segment`](https://semantic-ui.com/elements/segment.html) is

>to create a grouping of related content.

What does this mean? I use Developer Tools to examine the the element decorated with `segment`. Important properties of `segment` are:

```CSS
{
    position: relative;
    margin: 1rem 0;
    padding: 1em 1em;
}
```

Applying `"segment"` (this class often applys to a block element) inflicts padding, `margin-top`, and `margin-bottom` to an element. It also sets `position` to `relative`. Then descendent elements can be positioned relative to that element. Therefore, a segment is suitable to contain other elements.

One other important property is:

```CSS
.ui.segment:last-child {
    margin-bottom: 0;
}
```

It removes bottom margin of the last child element.

A `segment` can be combined with `vertical`.
> [A vertical segment formats content to be aligned as part of a vertical group](https://semantic-ui.com/elements/segment.html#vertical-segment)

In fact, it will remove margin, left padding, right padding and bottom border for an element.

### An `inverted` segment

As explained in [official document](https://semantic-ui.com/elements/segment.html#inverted), an `inverted` segment have its colors inverted for contrast. However, this class **does not apply to descendent elements**. It should be added to descendent elements to keep visual consistence. For example, the `<h1>` element in the `<nav>` has to be decorated with `inverted`. Otherwise, the color will not be consistent.

### Custom CSS code for layout

There is custom-written CSS code inside `<style>` tag. Most is for formatting text, color, and space, etc. It is not explained here. However, two points are worthy of mention. The first one is:

```CSS
.ui.inverted.vertical.segment {
    height: 100vh;
    background-color: rgb(51, 51, 51);
}
```

The above code first selects the outer-most element that encompass all other elements. This block element, by default, takes up all width of the viewport. __The code then sets this outer-most element to take up all the height of the viewport.__ In addition, when you type these code, you can find that the height of the `<footer>` is the same as the height of the outer-most element. **The selector selects both the outer-most element and the `<footer>` element.** You can find an undesired scroll bar beside the page.

The second one is:

```CSS
.ui.inverted.vertical.segment footer.ui.segment {
    height: 80px;
    width: 100%;
    position: absolute;
    bottom: 0;
    color: gray;
}
```

This instruction fixes the `footer` element at the bottom of the page. Since this instruction appears after the above instruction, it overwrites the height of the `<footer>` element. That is [cascade](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Cascade_and_inheritance). :) The layout seems perfect.

### A trap lurks in margin collapsing

Add only the above four lines of CSS code to  `<style>` tag. You can find that a scroll bar appears. This is not the expected behavior. According to the above CSS code, the height of the outer-most element should exactly equal to, but not exceed the height of the viewport.

I Googled and then found the cause might be [margin collapsing](https://www.bennadel.com/blog/3391-margin-collapsing-causes-unexpected-scrollbar-with-100vh-body-in-webkit.htm). Detail of margin collapsing can be found [here](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model/Mastering_margin_collapsing).




margin collapsing cause unexpected scrollbar

footer is the cause.

Features of the [Cover](https://semantic-ui-forest.com/templates/bootstrap/cover) template are:

- A full page design
