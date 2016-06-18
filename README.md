## Elm Recipes

This set of tutorials is intended to demonstrate example code and explanations for common tasks in Elm.

If you haven't already, I highly recommend going through the official [Elm Guide](http://guide.elm-lang.org/) which explains the most important fundamental concepts.

The goal of Elm Recipes is to provide example projects that demonstrate how to accomplish a wide variety of tasks using Elm. If you have any requests for tutorials, please contact me on [twitter](https://twitter.com/alexspurling).

*(All of these tutorials were written for Elm 0.17.0. If you are using a more recent version of the language, please note some details may now be out of date.)*

#### Recipes

**Basics**
* [Hello World](hello-world)
* Rendering HTML
* Rendering CSS Styles
* Formatting Dates
* Formatting Numbers
* Get timestamp for events (clicks etc)

**Elm API**
* [Parsing Json](json-parsing)
* [Generating Random Values](random)
* Making Http Requests
* Animation
* Generating Random Values
* Rendering SVG

**Architecture**
* Creating re-usable components with the Elm Architecture
* Routing

**Testing**
* Unit testing

**Data Storage**
* [Using Localstorage](localstorage)
* Elm and Firebase

**Client and Server Applications**
* Elm and Phoenix

#### Set up notes

The instructions for running the example code in these tutorials is always the same, unless otherwise stated:

```
$ git clone https://github.com/alexspurling/elm-recipes
$ cd elm-recipes
$ cd json-parsing
$ elm package install
$ elm make src/Main.elm
$ open index.html
```

#### Contribution

Ultimately I would like this repository to be a single resource for answering those "How do I do x in Elm?" questions. If you have a topic you think other people should learn about, then please feel free to submit a pull request. Spelling/grammar/code fixes are equally welcome.
