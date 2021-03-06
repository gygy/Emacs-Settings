(defvar search-link-cmd "~/gnulisp/searchlink/searchlink.rb")

(defun searchlink (start end)
(interactive "r")
(let* ((txt (delete-and-extract-region start end))
(quoted-txt (replace-regexp-in-string "\"" "\\\\\"" txt))
(shell-cmd (format "echo %s | %s" quoted-txt search-link-cmd))
(res (shell-command-to-string shell-cmd))
(clean-res (replace-regexp-in-string "\\[.*\\] isn't a Gem::Specification (NilClass instead)\\.\n" "" res))
(org-mode-res (replace-regexp-in-string "\\[\\(.*\\)\\](\\(.*\\))" "[[\\2][\\1]]" clean-res)))
(insert org-mode-res)))
