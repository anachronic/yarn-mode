;;; yarn-mode.el --- Major mode for yarn.lock files.
;;; Commentary:
;;; Code:

(defvar yarn-mode-syntax-table nil "Syntax table for `yarn-mode'.")

(defvar yarn-mode-keywords-re
  (regexp-opt '("version" "resolved" "dependencies"))
  "Keywords of yarn-mode.")

(defvar yarn-mode-font-lock-defaults nil
  "List for font lock in `yarn-mode'.")

(setq yarn-mode-font-lock-defaults
      `(,yarn-mode-keywords-re . (1 font-lock-builtin-face)))

(setq yarn-mode-syntax-table
      (let ((syntable (make-syntax-table)))
        (modify-syntax-entry ?# "<" syntable)
        (modify-syntax-entry ?\n ">" syntable)
        (modify-syntax-entry ?\" "\"" syntable)
        syntable))

(define-derived-mode yarn-mode text-mode "Yarn"
  "Simple mode to highlight yarn.lock files."
  :syntax-table yarn-mode-syntax-table
  (setq font-lock-defaults '(yarn-mode-font-lock-defaults)))

(provide 'yarn-mode)
;;; yarn-mode.el ends here
