# `yarn-mode` [![MELPA](https://melpa.org/packages/yarn-mode-badge.svg)](https://melpa.org/#/yarn-mode) [![Build Status](https://travis-ci.org/anachronic/yarn-mode.svg?branch=master)](https://travis-ci.org/anachronic/yarn-mode)

> This repository is going to be archived on Jan 31, 2020 because I have not been
> using Emacs for a long time now. If you wish to maintain this project. Please
> leave a comment [here](https://github.com/anachronic/yarn-mode/issues/3)

This package contains a major mode
for [Yarn](https://yarnpkg.com/)-generated `yarn.lock` files.

## Installation

### Using MELPA

``` emacs-lisp
M-x package-install RET yarn-mode RET
```

That should do it. If it doesn't highlight the files, try adding
`(require 'yarn-mode)` in your `init.el` file.


### Without MELPA

Copy `yarn-mode.el` to your load path and then:

``` emacs-lisp
(require 'yarn-mode)
```
Yes. It's that simple.

## Features

* Font locking in the buffer
* Automatic read-only when reading the buffer

## Related

If you'd like to manage Yarn through emacs, you might want to
check [yarn.el](https://github.com/jmfirth/yarn.el) also.

## Credits

This package was heavily influenced by

* [YAML mode](https://github.com/yoshiki/yaml-mode)
* [Nginx mode](https://github.com/ajc/nginx-mode)
* [Xah Lee guide](http://ergoemacs.org/emacs/elisp_syntax_coloring.html)
