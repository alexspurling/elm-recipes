## Elm Recipes

This set of tutorials is intended to demonstrate example code and explanations for common tasks in Elm.

If you haven't already, I highly recommend going through the official [Elm Guide](http://guide.elm-lang.org/) which explains the most important fundamental concepts.

The goal of Elm Recipes is to provide example projects that demonstrate how to accomplish a wide variety of tasks using Elm. If you have any requests for tutorials, please contact me on [twitter](https://twitter.com/alexspurling).

*(All of these tutorials were written for Elm 0.17.0. If you are using a more recent version of the language, please note some details may now be out of date.)*

#### Recipes

**Basics**
* [Hello World](hello-world)

**Elm API**
* [Parsing Json](json-parsing)
* Making Http Requests
* Animation
* Generating Random Values
* Rendering SVG

**Architecture**
* Creating re-usable components with the Elm Architecture
* Routing

**Testing**
* Unit testing

**Third-party-libraries**

* Using Localstorage
* Elm and Phoenix
* Formatting Numbers
* Elm and Firebase

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