## Hello World

*Elm Version: 0.17.0*

* How to create an Elm project from scratch
* How to use the Elm compiler
* Introduction to `elm-package.json`
* How to download packages
* How to launch your first Elm application

Write a file called `Main.elm`:

```
import Html exposing (text)

main =
  text "Hello, World!"
```

Run elm make:

```
$ elm make Main.elm
Some new packages are needed. Here is the upgrade plan.

  Install:
    elm-lang/core 4.0.1

Do you approve of this plan? (y/n)
```

Say yes (y) to allow Elm to download the [core package](http://package.elm-lang.org/packages/elm-lang/core/4.0.1/). This package is required by all Elm projects and provides common functionality and the basic Elm API.

```
$ elm make Main.elm
Some new packages are needed. Here is the upgrade plan.

  Install:
    elm-lang/core 4.0.1

Do you approve of this plan? (y/n) y
Downloading elm-lang/core
Packages configured successfully!
I cannot find module 'Html'.

Module 'Main' is trying to import it.

Potential problems could be:
  * Misspelled the module name
  * Need to add a source directory or new dependency to elm-package.json
```

Note how Elm make has automatically created the file `elm-package.json` which defines an Elm project's dependencies and other properties. If you're curious, take a look at the generated file and remember to fill in the relevant details for your project.

However, `elm make` warned us that it could not find the module 'Html' which is also required by our Hello World application. We need to tell Elm to download this dependency explicitly which is done using `elm package install`. Be sure to approve when asked to download packages:

(*Note: As of Elm 0.17.1, both elm-lang/core and elm-lang/html will become default packages. This means the only step required in this tutorial will be to run `elm make`*)

```
$ elm package install elm-lang/html
To install elm-lang/html I would like to add the following
dependency to elm-package.json:

    "elm-lang/html": "1.0.0 <= v < 2.0.0"

May I add that to elm-package.json for you? (y/n) y

Some new packages are needed. Here is the upgrade plan.

  Install:
    elm-lang/html 1.0.0
    elm-lang/virtual-dom 1.0.2

Do you approve of this plan? (y/n) y
Downloading elm-lang/html
Downloading elm-lang/virtual-dom
Packages configured successfully!
```

Now, let's try compiling again:

```
$ elm make Main.elm
Success! Compiled 30 modules.
Successfully generated index.html
```

Success. Elm has created an html file that contains your application along with all of Elm's library code compiled to Javascript. Just open the index.html file in your browser to see the result.

![](screen1.png)