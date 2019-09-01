# Anatomy of a Smantic-UI example page Cover

## My way to learn Semantic-UI: Part I

## Part I

The official document of [Semantic-UI](https://semantic-ui.com/) says little about learning how to use Semantic-UI. Examples are given, but they are code only. None of them are described in detail.

I usually learn programming language by examples. Not only read the example code, but also **write** the example code **from scratch**. This way I can understand every single line of the code. I would like to use the same way to learn Semantic-UI.

The first example I want to know is [Cover](https://semantic-ui-forest.com/templates/bootstrap/cover) template. You can find the [source code](https://github.com/semantic-ui-forest/forest-templates/tree/master/bootstrap/cover). To examine the effect of every single line of the CSS code, you can use this [convenient tool](https://medium.com/@acncuc/a-very-basic-browser-sync-development-environment-based-on-docker-568e7a0c8c0f?source=friends_link&sk=14dd350203d90b19e51d3ee6be09f840).

I remove all the CSS code to get a semantically meaningful HTML file. THe HTML code can be roughly divided into three parts. They are a navigation bar, main content, and a footer, respectively. This plain HTML file is cover-plain.html.

Add CSS class to each element one by one. You can see the effect of every class.

Several critical Semantic-UI CSS classes are used. I list them below.

- `segment`: inflict margin and padding to an element.

- `inverted`: change an element's background to dark and text to white.

- `vertical`: when this class is combined with the class `segment`, it will remove margin, left padding, right padding and bottom border from an element with a class `segment`.

Features of the [Cover](https://semantic-ui-forest.com/templates/bootstrap/cover) template are:

- A full page design
