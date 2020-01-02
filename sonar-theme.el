(deftheme sonar
  "A theme based on solarized-dark | Created 2019-06-25.")

(custom-theme-set-variables
 'sonar
 '(send-mail-function (quote smtpmail-send-it))
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(ansi-color-names-vector ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(custom-safe-themes (quote ("33d5dcb8e99bf2ca583aa861a3236fdf362051aa438b746e8a110d76c5b2b4e6" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (geiser solarized-theme command-log-mode paradox))))

(custom-theme-set-faces
 'sonar
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :width normal :height 128 :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "white smoke" :background "#002b36" :stipple nil :inherit nil))))
 '(cursor ((((class color) (min-colors 89)) (:foreground "#002b36" :background "#839496" :inverse-video t))))
 '(highlight ((((class color) (min-colors 89)) (:background "#073642"))))
 '(isearch ((((class color) (min-colors 89)) (:foreground "#002b36" :background "#d33682" :weight normal))))
 '(menu ((((class color) (min-colors 89)) (:foreground "#839496" :background "#002b36"))))
 '(minibuffer-prompt ((((class color) (min-colors 89)) (:foreground "#839496"))))
 '(mode-line ((((class color) (min-colors 89)) (:inverse-video unspecified :overline "#073642" :underline "#284b54" :foreground "#839496" :background "#073642" :box (:line-width 1 :color "#073642" :style unspecified)))))
 '(mode-line-buffer-id ((((class color) (min-colors 89)) (:foreground "#93a1a1" :weight bold))))
 '(org-level-1 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#cb4b16" :height 1.3))))
 '(org-level-2 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#859900" :height 1.2))))
 '(org-level-3 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#268bd2" :height 1.15))))
 '(region ((((class color) (min-colors 89)) (:foreground "#002b36" :background "#93a1a1"))))
 '(show-paren-match ((((class color) (min-colors 89)) (:foreground "#d33682" :background unspecified :weight bold))))
 '(default ((((class color) (min-colors 89)) (:foreground "#839496" :background "#002b36"))))
 '(button ((t (:underline t))))
 '(error ((((class color) (min-colors 89)) (:foreground "#cb4b16"))))
 '(escape-glyph ((((class color) (min-colors 89)) (:foreground "#6c71c4"))))
 '(fringe ((((class color) (min-colors 89)) (:foreground "#586e75" :background "#002b36"))))
 '(header-line ((((class color) (min-colors 89)) (:inverse-video unspecified :overline nil :underline "#073642" :foreground "#839496" :background "#002b36" :box (:line-width 2 :color "#002b36" :style unspecified)))))
 '(lazy-highlight ((((class color) (min-colors 89)) (:foreground "#002b36" :background "#b58900" :weight normal))))
 '(link ((((class color) (min-colors 89)) (:foreground "#b58900" :underline t :weight bold))))
 '(link-visited ((((class color) (min-colors 89)) (:foreground "#b58900" :underline t :weight normal))))
 '(match ((((class color) (min-colors 89)) (:background "#073642" :foreground "#93a1a1" :weight bold))))
 '(mode-line-inactive ((((class color) (min-colors 89)) (:inverse-video unspecified :overline "#073642" :underline "#284b54" :foreground "#586e75" :background "#002b36" :box (:line-width 1 :color "#002b36" :style unspecified)))))
 '(secondary-selection ((((class color) (min-colors 89)) (:background "#073642"))))
 '(shadow ((((class color) (min-colors 89)) (:foreground "#586e75"))))
 '(success ((((class color) (min-colors 89)) (:foreground "#859900"))))
 '(trailing-whitespace ((((class color) (min-colors 89)) (:background "#dc322f"))))
 '(vertical-border ((((class color) (min-colors 89)) (:foreground "#284b54"))))
 '(warning ((((class color) (min-colors 89)) (:foreground "#b58900"))))
 '(completions-annotations ((t (:foreground "#586e75"))))
 '(diary ((((class color) (min-colors 89)) (:foreground "#b58900"))))
 '(dired-directory ((((class color) (min-colors 89)) (:foreground "#268bd2" :weight normal))))
 '(dired-flagged ((((class color) (min-colors 89)) (:foreground "#dc322f"))))
 '(dired-header ((((class color) (min-colors 89)) (:foreground "#002b36" :background "#268bd2"))))
 '(dired-ignored ((((class color) (min-colors 89)) (:inherit shadow))))
 '(dired-mark ((((class color) (min-colors 89)) (:foreground "#b58900" :weight bold))))
 '(dired-marked ((((class color) (min-colors 89)) (:foreground "#d33682" :weight bold))))
 '(dired-perm-write ((((class color) (min-colors 89)) (:foreground "#839496" :underline t))))
 '(dired-symlink ((((class color) (min-colors 89)) (:foreground "#2aa198" :weight normal :slant italic))))
 '(dired-warning ((((class color) (min-colors 89)) (:foreground "#cb4b16" :underline t))))
 '(isearch-fail ((((class color) (min-colors 89)) (:foreground "#dc322f" :background "#002b36" :bold t))))
 '(widget-field ((((class color) (min-colors 89)) (:background "#073642"))))
 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "#839496" :weight bold :slant normal))))
 '(font-lock-comment-delimiter-face ((((class color) (min-colors 89)) (:foreground "#586e75" :slant normal))))
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:foreground "#586e75"))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "#268bd2" :weight bold))))
 '(font-lock-doc-face ((((class color) (min-colors 89)) (:foreground "#2aa198" :slant normal))))
 '(font-lock-function-name-face ((((class color) (min-colors 89)) (:foreground "#268bd2"))))
 '(font-lock-keyword-face ((((class color) (min-colors 89)) (:foreground "#859900" :weight bold))))
 '(font-lock-negation-char-face ((((class color) (min-colors 89)) (:foreground "#b58900" :weight bold))))
 '(font-lock-preprocessor-face ((((class color) (min-colors 89)) (:foreground "#268bd2"))))
 '(font-lock-regexp-grouping-construct ((((class color) (min-colors 89)) (:foreground "#b58900" :weight bold))))
 '(font-lock-regexp-grouping-backslash ((((class color) (min-colors 89)) (:foreground "#859900" :weight bold))))
 '(font-lock-string-face ((((class color) (min-colors 89)) (:foreground "#2aa198"))))
 '(font-lock-type-face ((((class color) (min-colors 89)) (:foreground "#b58900"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:foreground "#268bd2"))))
 '(font-lock-warning-face ((((class color) (min-colors 89)) (:inherit error :weight bold))))
 '(custom-face-tag ((((class color) (min-colors 89)) (:inherit variable-pitch :height 1.2 :foreground "#6c71c4" :weight normal))))
 '(custom-variable-tag ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#2aa198" :height 1.2))))
 '(custom-comment-tag ((((class color) (min-colors 89)) (:foreground "#586e75"))))
 '(custom-group-tag ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#268bd2" :height 1.2))))
 '(custom-group-tag-1 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#dc322f" :height 1.2))))
 '(custom-state ((((class color) (min-colors 89)) (:foreground "#859900"))))
 '(custom-button ((((class color) (min-colors 89)) (:background "#073642" :foreground "#93a1a1" :box (:line-width 2 :style released-button)))))
 '(custom-button-mouse ((((class color) (min-colors 89)) (:background "#586e75" :foreground "#073642" :box (:line-width 2 :style released-button)))))
 '(custom-button-pressed ((((class color) (min-colors 89)) (:background "#586e75" :foreground "#93a1a1" :box (:line-width 2 :style pressed-button)))))
 '(custom-button-unraised ((((class color) (min-colors 89)) (:inherit underline))))
 '(custom-button-pressed-unraised ((((class color) (min-colors 89)) (:inherit custom-button-unraised :foreground "#d33682"))))
 '(hl-line ((((class color) (min-colors 89)) (:background "#073642"))))
 '(info-title-1 ((((class color) (min-colors 89)) (:foreground "#93a1a1" :weight bold))))
 '(info-title-2 ((((class color) (min-colors 89)) (:foreground "#93a1a1" :weight bold))))
 '(info-title-3 ((((class color) (min-colors 89)) (:weight bold))))
 '(info-title-4 ((((class color) (min-colors 89)) (:weight bold))))
 '(info-node ((((class color) (min-colors 89)) (:foreground "#93a1a1" :slant italic :weight bold))))
 '(info-header-node ((((class color) (min-colors 89)) (:inherit info-node))))
 '(info-header-xref ((((class color) (min-colors 89)) (:inherit info-xref))))
 '(info-index-match ((((class color) (min-colors 89)) (:inherit match))))
 '(info-menu-header ((((class color) (min-colors 89)) (:inherit variable-pitch :weight bold))))
 '(info-menu-star ((((class color) (min-colors 89)) (:foreground "#cb4b16"))))
 '(info-xref ((((class color) (min-colors 89)) (:inherit link))))
 '(info-xref-visited ((((class color) (min-colors 89)) (:inherit (link-visited info-xref)))))
 '(org-agenda-structure ((((class color) (min-colors 89)) (:foreground "#93a1a1" :background "#073642" :weight bold :slant normal :inverse-video nil :height 1.1 :underline nil :box (:line-width 2 :color "#002b36")))))
 '(org-agenda-calendar-event ((((class color) (min-colors 89)) (:foreground "#93a1a1"))))
 '(org-agenda-calendar-sexp ((((class color) (min-colors 89)) (:foreground "#839496" :slant italic))))
 '(org-agenda-date ((((class color) (min-colors 89)) (:foreground "#586e75" :background "#002b36" :weight normal :box (:line-width 2 :color "#002b36") :inverse-video nil :overline nil :slant normal :height 1.0))))
 '(org-agenda-date-weekend ((((class color) (min-colors 89)) (:inherit org-agenda-date :inverse-video nil :background unspecified :foreground "#586e75" :weight unspecified :underline t :overline nil :box unspecified))))
 '(org-agenda-date-today ((((class color) (min-colors 89)) (:inherit org-agenda-date :inverse-video t :weight bold :underline unspecified :overline nil :box unspecified :foreground "#268bd2" :background "#002b36"))))
 '(org-agenda-done ((((class color) (min-colors 89)) (:foreground "#586e75" :slant italic))))
 '(org-archived ((((class color) (min-colors 89)) (:foreground "#586e75" :weight normal))))
 '(org-block ((((class color) (min-colors 89)) nil)))
 '(org-block-begin-line ((((class color) (min-colors 89)) (:inherit org-meta-line :underline t))))
 '(org-block-end-line ((((class color) (min-colors 89)) (:inherit org-meta-line :overline t))))
 '(org-checkbox ((((class color) (min-colors 89)) (:background "#002b36" :foreground "#839496" :box (:line-width 1 :style released-button)))))
 '(org-code ((((class color) (min-colors 89)) (:foreground "#586e75"))))
 '(org-date ((((class color) (min-colors 89)) (:foreground "#268bd2" :underline t))))
 '(org-done ((((class color) (min-colors 89)) (:weight bold :foreground "#859900"))))
 '(org-ellipsis ((((class color) (min-colors 89)) (:foreground "#586e75"))))
 '(org-formula ((((class color) (min-colors 89)) (:foreground "#b58900"))))
 '(org-headline-done ((((class color) (min-colors 89)) (:foreground "#859900"))))
 '(org-hide ((((class color) (min-colors 89)) (:foreground "#002b36"))))
 '(org-level-4 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#b58900" :height 1.1))))
 '(org-level-5 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#2aa198"))))
 '(org-level-6 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#859900"))))
 '(org-level-7 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#dc322f"))))
 '(org-level-8 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#268bd2"))))
 '(org-link ((((class color) (min-colors 89)) (:foreground "#b58900" :underline t))))
 '(org-meta-line ((((class color) (min-colors 89)) (:foreground "#586e75" :slant italic))))
 '(org-macro ((((class color) (min-colors 89)) (:foreground "#93a1a1"))))
 '(org-sexp-date ((((class color) (min-colors 89)) (:foreground "#6c71c4"))))
 '(org-scheduled ((((class color) (min-colors 89)) (:foreground "#859900"))))
 '(org-scheduled-previously ((((class color) (min-colors 89)) (:foreground "#2aa198"))))
 '(org-scheduled-today ((((class color) (min-colors 89)) (:foreground "#268bd2" :weight normal))))
 '(org-special-keyword ((((class color) (min-colors 89)) (:foreground "#586e75" :weight bold))))
 '(org-table ((((class color) (min-colors 89)) (:foreground "#859900"))))
 '(org-tag ((((class color) (min-colors 89)) (:weight bold))))
 '(org-time-grid ((((class color) (min-colors 89)) (:foreground "#586e75"))))
 '(org-todo ((((class color) (min-colors 89)) (:foreground "#2aa198" :weight bold))))
 '(org-upcoming-deadline ((((class color) (min-colors 89)) (:foreground "#b58900" :weight normal :underline nil))))
 '(org-warning ((((class color) (min-colors 89)) (:foreground "#cb4b16" :weight normal :underline nil))))
 '(org-agenda-dimmed-todo-face ((((class color) (min-colors 89)) (:foreground "#586e75"))))
 '(org-agenda-restriction-lock ((((class color) (min-colors 89)) (:background "#b58900"))))
 '(org-clock-overlay ((((class color) (min-colors 89)) (:background "#073642"))))
 '(org-column ((((class color) (min-colors 89)) (:background "#073642" :strike-through nil :underline nil :slant normal :weight normal :inherit default))))
 '(org-column-title ((((class color) (min-colors 89)) (:background "#073642" :underline t :weight bold))))
 '(org-date-selected ((((class color) (min-colors 89)) (:foreground "#dc322f" :inverse-video t))))
 '(org-document-info ((((class color) (min-colors 89)) (:foreground "#839496"))))
 '(org-document-title ((((class color) (min-colors 89)) (:foreground "#93a1a1" :weight bold :height 1.3))))
 '(org-drawer ((((class color) (min-colors 89)) (:foreground "#2aa198"))))
 '(org-footnote ((((class color) (min-colors 89)) (:foreground "#d33682" :underline t))))
 '(org-mode-line-clock-overrun ((((class color) (min-colors 89)) (:inherit mode-line :background "#dc322f"))))
 '(outline-1 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#cb4b16" :height 1.3))))
 '(outline-2 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#859900" :height 1.2))))
 '(outline-3 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#268bd2" :height 1.15))))
 '(outline-4 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#b58900" :height 1.1))))
 '(outline-5 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#2aa198"))))
 '(outline-6 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#859900"))))
 '(outline-7 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#dc322f"))))
 '(outline-8 ((((class color) (min-colors 89)) (:inherit variable-pitch :foreground "#268bd2"))))
 '(show-paren-mismatch ((((class color) (min-colors 89)) (:foreground "#073642" :background "#dc322f" :weight bold))))
 '(tooltip ((((class color) (min-colors 89)) (:background "#7B6000" :foreground "#DEB542" :inherit variable-pitch)))))

(provide-theme 'sonar)
