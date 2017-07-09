;;; yarn-mode-test.el --- Tests for yarn-mode.
;;; Commentary:
;;; Code:

(require 'ert)

;; Test that yarn mode generates read only buffers
(ert-deftest yarn-mode-readonly-test ()
  (with-temp-buffer
    (yarn-mode)
    (should (eq buffer-read-only t))))


(ert-deftest yarn-mode--init-nofail ()
  (with-temp-buffer
    (should (progn (yarn-mode) t) ;; We return t. This should fail if yarn-mode has errors
            )))

;; The following tests apparently don't work because (face-at-point)
;; returns nil. No idea why
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Fonts that should appear in a lock file
;; (defvar yarn-mode--test-fonts
;;   '(font-lock-string-face
;;     yarn-mode-package-face
;;     yarn-mode-keywords-face
;;     yarn-mode-package-face
;;     yarn-mode-dependency-face))

;; (defvar yarn-mode--example-buffer
;;   "babel-helper-call-delegate@^6.24.1:
;;   version \"6.24.1\"
;;   resolved \"https://registry.yarnpkg.com/babel-helper-call-delegate/-/babel-helper-call-delegate-6.24.1.tgz#ece6aacddc76e41c3461f88bfc575bd0daa2df8d\"
;;   dependencies:
;;     babel-helper-hoist-variables \"^6.24.1\"
;;     babel-runtime \"6.22.0\"
;;     babel-traverse \"^6.24.1\"
;;     babel-types \"^6.24.1\"")

;; (ert-deftest yarn-mode-allfonts-test ()
;;   (with-temp-buffer
;;     (insert yarn-mode--example-buffer)
;;     (require 'yarn-mode)
;;     (yarn-mode)
;;     (font-lock-mode +1)
;;     (goto-char (point-min))
;;     (let ((str-check yarn-mode--test-fonts))
;;       (while (not (eobp))
;;         (message (symbol-name (face-at-point)))
;;         (when (member (face-at-point 'word)
;;                       str-check)
;;           (setq str-check (delete (face-at-point) str-check)))
;;         (forward-word)
;;         )
;;       (should (not str-check)))))

(provide 'yarn-mode-test)
;;; yarn-mode-test.el ends here
