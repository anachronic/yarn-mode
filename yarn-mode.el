;;; yarn-mode.el --- Major mode for yarn.lock files.
;;; Commentary:
;;; Code:

(defgroup yarn-mode nil
  "Major mode for yarn.lock files"
  :group 'convenience)

(defvar yarn-mode-syntax-table
  nil
  "Syntax table for `yarn-mode'.")

(defvar yarn-mode-attributes-re
  nil
  "Keywords of yarn-mode.")

(defvar yarn-mode-font-lock-defaults
  nil
  "List for font lock in `yarn-mode'.")

(defvar yarn-mode-package-re
  nil
  "Regular expression that defines a package.")

(defvar yarn-mode-dependencies-re
  nil
  "Regular expression that defines a package dependency.")

(setq yarn-mode-package-re "\\(^\\|,\\s-\\)\\([a-zA-Z-_0-9]+\\)@")
(setq yarn-mode-dependencies-re "\\s-\\{4,\\}\\([a-zA-Z-_0-9]+\\)\\s-")
(setq yarn-mode-attributes-re (regexp-opt '("version" "resolved" "dependencies")))

(setq yarn-mode-font-lock-defaults
      `((,yarn-mode-attributes-re . font-lock-builtin-face)
        (,yarn-mode-package-re . (2 'yarn-mode-package-face t)) ;; Direct deps
        (,yarn-mode-dependencies-re . (1 'yarn-mode-package-face t)) ;; Dep of another dep (nested)
        ))

(setq yarn-mode-syntax-table
      (let ((syntable (make-syntax-table)))
        (modify-syntax-entry ?# "<" syntable)
        (modify-syntax-entry ?\n ">" syntable)
        (modify-syntax-entry ?\" "\"" syntable)
        syntable))

;; Custom faces
(defface yarn-mode-package-face
  '((t :inherit default :weight bold))
  "Font lock face for package names."
  :group 'yarn-mode)

;;;###autoload
(define-derived-mode yarn-mode text-mode "Yarn"
  "Simple mode to highlight yarn.lock files."
  :syntax-table yarn-mode-syntax-table
  (setq font-lock-defaults '(yarn-mode-font-lock-defaults)))

;;;###autoload
(add-to-list 'auto-mode-alist '("yarn\\.lock\\'" . yarn-mode))

(provide 'yarn-mode)
;;; yarn-mode.el ends here
