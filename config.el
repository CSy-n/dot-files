
;; (setq inhibit-startup-echo-area-message (user-login-name))
;; (setq inhibit-startup-message t)
;;(setq inhibit-startup-screen t)
;; (setq inhibit-startup-message t inhibit-startup-echo-area-message "brody") 

;; PACKAGING

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(push (expand-file-name "~/.emacs.d/metrics/" "~/.emacs.d/org-mode") load-path)
(add-to-list 'load-path '"~/.emacs.d/metrics")
(add-to-list 'load-path '"~/.emacs.d/org-mode/")
(add-to-list 'load-path '"~/.emacs.d/ax/")

; CUSTOMIZATIONS

 (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
 (load custom-file)
 (load-theme 'alpha t)




;; (setq inhibit-startup-message t)
                                        ;external---------------
                                        ;architecture-----------
                                        ;origin-----------------
                                        ;source-----------------
                                        ;core-------------------
                                        ;exo-arch---------------

                                        ; The external operating environment
(setq base (expand-file-name "~/base/"))


;; (setq initial-buffer-choice 
;;       (expand-file-name "journal.org" base))


;; Open a default file if no command-line arguments
;; Otherwise visit instead
(let ((journal (expand-file-name "journal.org" base)))
  (if (> (length command-line-args) 1) 
      (find-file-noselect journal)
    (setq initial-buffer-choice journal))
  journal)

                                        ; Open file 
(find-file-noselect "~/base/Interim/thoughts.org")

;; (find-file-noselect
;;  (expand-file-name "journal.org" base)))

(setq emacs-development t)

(eval-after-load "config"
  (if (eq emacs-development t)
     (message "Development Mode enabled...")))

; Open file 
    (find-file-noselect "~/base/Interim/thoughts.org")

 
    ; Disable ringing-sound
    (setq ring-bell-function 'ignore)


    ;Scrolling (Smooth)
    (setq scroll-conservatively 10000)


    ; Emacs C source files...
    (setq find-function-C-source-directory "/usr/share/emacs/25.2/c")



    ;UTILITY

    ;Command-log mode to display or log commands?
    ;; (require 'command-log-mode)

    ;key-metrics
    ;==============================
    ;; When you want to know the command frequency, type “Alt+x command-frequency”.

    ;; (require 'command-frequency)
    ;(command-frequency-table-load)
    ;; (command-frequency-mode 1)
    ;; (command-frequency-autosave-mode 1);; make emacs aware of this package


 
(setq-default major-mode 'org-mode)




    ; MODES

    ;; Lisp interaction Mode


    (setq tab-always-indent 'complete)
    ;DEFAULT


    ;Allow narrow-to-region
    (put 'narrow-to-region 'disabled nil)



    ;Enable which-key-mode
    (which-key-mode)

(ido-mode t)
;; (setq ido-enable-flex-matching t)
;; (global-set-key (kbd "M-x") 'helm-M-x)

;THEMATICS

;Enable global highlight-line mode
(global-hl-line-mode)

;Menu Bar Toggle
(menu-bar-mode 1)

  ;Tool Bar Toggle
(tool-bar-mode -1)

;Scroll Bar Toggle
(toggle-scroll-bar -1)

(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(add-hook 'clojure-mode-hook           #'cider-mode)

;ORG MODE


   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; function to wrap blocks of text in org templates                       ;;
   ;; e.g. latex or src etc                                                  ;;
   ;; http://pragmaticemacs.com/emacs/wrap-text-in-an-org-mode-block/        ;;                             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   (defun ax-org-begin-template ()
     "Make a template at point."
     (interactive)
     (if (org-at-table-p)
         (call-interactively 'org-table-rotate-recalc-marks)
       (let* ((choices '(("s" . "SRC")
                         ("e" . "EXAMPLE")
                         ("q" . "QUOTE")
                         ("v" . "VERSE")
                         ("c" . "CENTER")
                         ("l" . "LaTeX")
                         ("h" . "HTML")
                         ("a" . "ASCII")))
              (key
               (key-description
                (vector
                 (read-key
                  (concat (propertize "Template type: " 'face 'minibuffer-prompt)
                          (mapconcat (lambda (choice)
                                       (concat (propertize (car choice) 'face 'font-lock-type-face)
                                               ": "
                                               (cdr choice)))
                                     choices
                                     ", ")))))))
         (let ((result (assoc key choices)))
           (when result
             (let ((choice (cdr result)))
               (cond
                ((region-active-p)
                 (let ((start (region-beginning))
                       (end (region-end)))
                   (goto-char end)
                   (insert "\n#+END_" choice)
                   (goto-char start)
                   (insert "#+BEGIN_" choice)
                   (if (equal choice "SRC")
                       (insert " emacs-lisp"))
                   (insert "\n")))
                (t
                 (insert "#+BEGIN_" choice "\n")
                 (save-excursion (insert "#+END_" choice))))))))))









  ;Setting a Global Tag system for org-mode
  ;; (:startgroup . nil)
  ;; (:endgroup . nil)
  ;; <Gramtically around the tag>
  ;; (:newline)
  ;; <To indicate a new line break>
  (set 'org-tag-persistent-alist '(("org_mode" . ?o )
                        ("documentation" . ?d)
                        ("emacs" . ?e)
                        ("project_management" . ?p)
                        ("journal_entry" . ?j)))









;; org-mode babel execution environment
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '())




  (setq org-babel-racket-command "~/.emacs.d/org-mode/ob-racket")


  ;Enable tabs in code-blocks for org-mode
  (setq org-src-tab-acts-natively t)

  ; Default Notes File
  (setq org-default-notes-file "~/base/Interim/thoughts.org")

  ; Enable syntax highlighting
  (setq org-src-fontify-natively t)


  ; Defines a keybinding for the source block template
  (define-key org-mode-map (kbd "C-<") 'ax-org-begin-template)


  ;; Global keys suggested for Org mode
  (global-set-key (kbd "\C-c l") 'org-store-link)
  (global-set-key (kbd "\C-c c") 'org-capture)
  (global-set-key (kbd "\C-c a") 'org-agenda)
  (global-set-key (kbd "\C-c p") 'org-iswitchb)
