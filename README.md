# `yarn-mode`

This package contains a major mode
for [Yarn](https://yarnpkg.com/)-generated `yarn.lock` files.

## Installation

No MELPA just yet. Copy `yarn-mode.el` to your load path and then:

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
