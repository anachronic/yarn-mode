;;; yarn-mode-test.el --- Tests for yarn-mode.
;;; Commentary:
;;; Code:

(require 'ert)
(require 'yarn-mode)

;; Test that yarn mode generates read only buffers
(ert-deftest yarn-mode-readonly-test ()
  (with-temp-buffer
    (yarn-mode)
    (should (eq buffer-read-only t))))

;; Fonts that should appear in a lock file
(defvar yarn-mode--test-fonts
  '(font-lock-string-face
    font-lock-comment-face
    yarn-mode-keywords-face
    yarn-mode-package-face
    yarn-mode-package-face
    yarn-mode-dependency-face))

(defvar yarn-mode--example-buffer
  "# A comment

babel-helper-call-delegate@^6.24.1:
  version \"6.24.1\"
  resolved \"https://registry.yarnpkg.com/babel-helper-call-delegate/-/babel-helper-call-delegate-6.24.1.tgz#ece6aacddc76e41c3461f88bfc575bd0daa2df8d\"
  dependencies:
    babel-helper-hoist-variables \"^6.24.1\"
    babel-runtime \"6.22.0\"
    babel-traverse \"^6.24.1\"
    babel-types \"^6.24.1\"")

(ert-deftest yarn-mode-allfonts-test ()
  (with-temp-buffer
    (insert yarn-mode--example-buffer)
    (yarn-mode)
    (font-lock-fontify-buffer)
    (goto-char (point-min))
    (let ((str-check yarn-mode--test-fonts))
      (while (not (eobp))
        (when (member (face-at-point)
                      str-check)
          (setq str-check (delete (face-at-point) str-check)))
        (forward-char))
      ;; This should mean all fonts are present
      (should (not str-check)))))

(ert-deftest yarn-mode--init-nofail ()
  (should (progn
            (yarn-mode)
            t)))

(provide 'yarn-mode-test)
;;; yarn-mode-test.el ends here
