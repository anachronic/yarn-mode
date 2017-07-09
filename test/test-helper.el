(require 'f)

(let ((yarn-mode-dir (f-dirname (f-dirname (f-this-file)))))
  (add-to-list 'load-path yarn-mode-dir))
