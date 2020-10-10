;;; ax.el --- Personal repository of source-code


;;;;

(make-sparse-keymap)


(defun ax-browse-url-with-firefox (url)
  "Same as `browse-url-of-buffer' but using Firefox.
You need Firefox's path in the path environment variable within emacs.
e.g.
 (setenv \"PATH\" (concat \"C:/Program Files (x86)/Mozilla Firefox/\" \";\" (getenv \"PATH\") ) )
On Mac OS X, you don't need to. This command makes this shell call:
 「open -a Firefox.app http://example.com/」"
  (interactive "sURL: ")
  (browse-url-with-firefox url))



(defun browse-url-with-firefox (url)
  "Same as `browse-url-of-buffer' but using Firefox.
You need Firefox's path in the path environment variable within emacs.
e.g.
 (setenv \"PATH\" (concat \"C:/Program Files (x86)/Mozilla Firefox/\" \";\" (getenv \"PATH\") ) )
On Mac OS X, you don't need to. This command makes this shell call:
 「open -a Firefox.app http://example.com/」"
  (cond
   ((string-equal system-type "windows-nt") ; Windows
    (shell-command (concat "firefox file://" url)))
   ((string-equal system-type "gnu/linux")
    (shell-command (concat "firefox https://" url)))
   ((string-equal system-type "darwin") ; Mac
    (shell-command (concat "open -a Firefox.app file://" url)))))


(defun search-youtube (search)
  (browse-url-with-firefox (concat "www.youtube.com/results?search_query=" (url-hexify-string search))))


(defun construct-url-youtube-search (search)
  "Obsolete"
  (concat "https://www.youtube.com/results?search_query=" (url-hexify-string search)))


(defun ax-org-insert-journal-heading ()
  (interactive)
  (org-insert-heading)
  (insert (ax-journal-date-format) ))


(defun ax-journal-date-format ()
  (format-time-string "%D [%A]"))


;; (journal-date-format)













;; (construct-url "typical (")

;; Interactive Form
;; ----------------
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Interactive-Examples.html

;; :~| x, y, cos | { }

(provide 'ax)
