;;; monokai-theme.el --- A fruity color theme for Emacs.

;; Copyright (C) 2011-2016

;; Author: Kelvin Smith <oneKelvinSmith@gmail.com>
;; URL: http://github.com/oneKelvinSmith/monokai-emacs
;; Version: 3.5.3

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A port of the popular Textmate theme Monokai for Emacs 24, built on top
;; of the new built-in theme support in Emacs 24.
;;
;;; Credits:
;;
;; Wimer Hazenberg created the original theme.
;; - http://www.monokai.nl/blog/2006/07/15/textmate-color-theme/
;;
;; Bozhidar Batsov created zenburn-theme.el and solarized-theme.el
;;  on which this file is based.
;; - https://github.com/bbatsov/zenburn-emacs
;;
;; Color Scheme Designer 3 for complementary colours.
;; - http://colorschemedesigner.com/
;;
;; Xterm 256 Color Chart
;; - https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
;;
;; K. Adam Christensen for his personal monokai theme that addresses 256 colours.
;; - https://github.com/pope/personal/blob/master/etc/emacs.d/monokai-theme.el
;;
;; Thomas Frössman for his work on solarized-emacs.
;; - http://github.com/bbatsov/solarized-emacs
;;
;;; Code:

(unless (>= emacs-major-version 24)
  (error "The detai theme requires Emacs 24 or later!"))

(deftheme detai "The Detai colour theme")

(defgroup detai nil
  "Detai theme options.
The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom detai-distinct-fringe-background nil
  "Make the fringe background different from the normal background color.
Also affects 'linum-mode' background."
  :type 'boolean
  :group 'detai)

(defcustom detai-use-variable-pitch nil
  "Use variable pitch face for some headings and titles."
  :type 'boolean
  :group 'detai)

(defcustom detai-doc-face-as-comment nil
  "Consider `font-lock-doc-face' as comment instead of a string."
  :type 'boolean
  :group 'detai
  :package-version "3.5.1")

(defcustom detai-height-minus-1 0.8
  "Font size -1."
  :type 'number
  :group 'detai)

(defcustom detai-height-plus-1 1.1
  "Font size +1."
  :type 'number
  :group 'detai)

(defcustom detai-height-plus-2 1.15
  "Font size +2."
  :type 'number
  :group 'detai)

(defcustom detai-height-plus-3 1.2
  "Font size +3."
  :type 'number
  :group 'detai)

(defcustom detai-height-plus-4 1.3
  "Font size +4."
  :type 'number
  :group 'detai)

;; Primary colors
(defcustom detai-yellow "#E6DB74"
  "Primary colors - yellow"
  :type 'string
  :group 'detai)

(defcustom detai-orange "#FD971F"
  "Primary colors - orange"
  :type 'string
  :group 'detai)

(defcustom detai-red "#F92672"
  "Primary colors - red"
  :type 'string
  :group 'detai)

(defcustom detai-magenta "#FD5FF0"
  "Primary colors - magenta"
  :type 'string
  :group 'detai)

(defcustom detai-blue "#66D9EF"
  "Primary colors - blue"
  :type 'string
  :group 'detai)

(defcustom detai-green "#A6E22E"
  "Primary colors - green"
  :type 'string
  :group 'detai)

(defcustom detai-cyan "#A1EFE4"
  "Primary colors - cyan"
  :type 'string
  :group 'detai)

(defcustom detai-violet "#AE81FF"
  "Primary colors - violet"
  :type 'string
  :group 'detai)

(defcustom detai-gray "#64645E"
  "Primary colors - gray"
  :type 'string
  :group 'detai)

(defcustom detai-foreground "#F8F8F2"
  "Adaptive colors - foreground"
  :type 'string
  :group 'detai)

(defcustom detai-background "#272822"
  "Adaptive colors - background"
  :type 'string
  :group 'detai)

(defcustom detai-comments "#75715E"
  "Adaptive colors - comments"
  :type 'string
  :group 'detai)

(defcustom detai-emphasis "#F8F8F0"
  "Adaptive colors - emphasis"
  :type 'string
  :group 'detai)

(defcustom detai-line-number "#8F908A"
  "Adaptive colors - line number"
  :type 'string
  :group 'detai)

(defcustom detai-highlight "#49483E"
  "Adaptive colors - highlight"
  :type 'string
  :group 'detai)

(defcustom detai-highlight-alt "#3E3D31"
  "Adaptive colors - highlight"
  :type 'string
  :group 'detai)

(defcustom detai-highlight-line "#3C3D37"
  "Adaptive colors - line highlight"
  :type 'string
  :group 'detai)

(defcustom detai-dark-blue "#268BD2"
  "Adaptive colors - Dark Blue"
  :type 'string
  :group 'detai)

(defcustom detai-dark-orange "#B58900"
  "Adaptive colors - Dark Orange"
  :type 'string
  :group 'detai)

(let* (;; Variable pitch
       (detai-pitch (if detai-use-variable-pitch
                          'variable-pitch
                        'default))

       ;; Definitions for guis that support 256 colors
       (detai-class '((class color) (min-colors 257)))

       ;; Functionality specific colors
       (detai-diff-blue-base      "#232438")
       (detai-diff-blue-emphasis  "#1F204E")
       (detai-diff-green-base     "#233E1E")
       (detai-diff-green-emphasis "#1F541A")
       (detai-diff-red-base       "#3D241E")
       (detai-diff-red-emphasis   "#53201A")

       ;; Darker and lighter accented colors
       (detai-yellow-d       "#BEB244")
       (detai-yellow-l       "#FFF7A8")
       (detai-orange-d       "#D47402")
       (detai-orange-l       "#FFAC4A")
       (detai-red-d          "#F70057")
       (detai-red-l          "#FA518D")
       (detai-magenta-d      "#FB35EA")
       (detai-magenta-l      "#FE8CF4")
       (detai-violet-d       "#945AFF")
       (detai-violet-l       "#C9ACFF")
       (detai-blue-d         "#40CAE4")
       (detai-blue-l         "#92E7F7")
       (detai-cyan-d         "#74DBCD")
       (detai-cyan-l         "#D3FBF6")
       (detai-green-d        "#86C30D")
       (detai-green-l        "#BBEF53")
       (detai-gray-d         "#35331D")
       (detai-gray-l         "#7B7962")
       ;; Adaptive higher/lower contrast accented colors
       (detai-foreground-hc  "#141414")
       (detai-foreground-lc  "#171A0B")
       ;; High contrast colors
       (detai-yellow-hc      "#FFFACE")
       (detai-yellow-lc      "#9A8F21")
       (detai-orange-hc      "#FFBE74")
       (detai-orange-lc      "#A75B00")
       (detai-red-hc         "#FEB0CC")
       (detai-red-lc         "#F20055")
       (detai-magenta-hc     "#FEC6F9")
       (detai-magenta-lc     "#F309DF")
       (detai-violet-hc      "#F0E7FF")
       (detai-violet-lc      "#7830FC")
       (detai-blue-hc        "#CAF5FD")
       (detai-blue-lc        "#1DB4D0")
       (detai-cyan-hc        "#D3FBF6")
       (detai-cyan-lc        "#4BBEAE")
       (detai-green-hc       "#CCF47C")
       (detai-green-lc       "#679A01")

       ;; Distinct fringe
       (detai-fringe-bg (if detai-distinct-fringe-background
                              detai-gray
                            detai-background))

       ;; Definitions for terminals that do not support 256 colors
       (detai-256-class '((class color) (min-colors 89)))

       ;; Functionality specific colors
       (detai-256-diff-blue-base      "#00005f")
       (detai-256-diff-blue-emphasis  "#000087")
       (detai-256-diff-green-base     "#005800")
       (detai-256-diff-green-emphasis "#008700")
       (detai-256-diff-red-base       "#5f0000")
       (detai-256-diff-red-emphasis   "#870000")

       ;; Primary colors
       (detai-256-yellow         "#CDC673")
       (detai-256-orange         "#FF8C00")
       (detai-256-red            "#FF1493")
       (detai-256-magenta        "#D700D7")
       (detai-256-violet         "#AF87FF")
       (detai-256-blue           "#5FD7FF")
       (detai-256-cyan           "#5FFFFF")
       (detai-256-green          "#87D700")
       (detai-256-gray           "#3D3D3D")
       ;; Darker and lighter accented colors
       (detai-256-yellow-d       "#878700")
       (detai-256-yellow-l       "#FFFF87")
       (detai-256-orange-d       "#AF5F00")
       (detai-256-orange-l       "#FFAF5F")
       (detai-256-red-d          "#870000")
       (detai-256-red-l          "#FF5F87")
       (detai-256-magenta-d      "#AF0087")
       (detai-256-magenta-l      "#FF87DF")
       (detai-256-violet-d       "#5F00AF")
       (detai-256-violet-l       "#AF87D7")
       (detai-256-blue-d         "#008787")
       (detai-256-blue-l         "#87D7FF")
       (detai-256-cyan-d         "#5FAFAF")
       (detai-256-cyan-l         "#AFFFFF")
       (detai-256-green-d        "#5F8700")
       (detai-256-green-l        "#AFD700")
       (detai-256-gray-d         "#333333")
       (detai-256-gray-l         "#707070")
       ;; Adaptive colors
       (detai-256-foreground     "#F5F5F5")
       (detai-256-background     "#1B1E1C")
       (detai-256-comments       "#8B8878")
       (detai-256-emphasis       "#FFFAFA")
       (detai-256-line-number    "#8F908A")
       (detai-256-highlight      "#474747")
       (detai-256-highlight-alt  "#3E3E3E")
       (detai-256-highlight-line "#000000")
       ;; Adaptive higher/lower contrast accented colors
       (detai-256-foreground-hc  "#171A0B")
       (detai-256-foreground-lc  "#141414")
       ;; High contrast colors
       (detai-256-yellow-hc      detai-256-yellow-d)
       (detai-256-yellow-lc      detai-256-yellow-l)
       (detai-256-orange-hc      detai-256-orange-d)
       (detai-256-orange-lc      detai-256-orange-l)
       (detai-256-red-hc         detai-256-red-d)
       (detai-256-red-lc         detai-256-red-l)
       (detai-256-magenta-hc     detai-256-magenta-d)
       (detai-256-magenta-lc     detai-256-magenta-l)
       (detai-256-violet-hc      detai-256-violet-d)
       (detai-256-violet-lc      detai-256-violet-l)
       (detai-256-blue-hc        detai-256-blue-d)
       (detai-256-blue-lc        detai-256-blue-l)
       (detai-256-cyan-hc        detai-256-cyan-d)
       (detai-256-cyan-lc        detai-256-cyan-l)
       (detai-256-green-hc       detai-256-green-d)
       (detai-256-green-lc       detai-256-green-l)

       ;; Distinct fringe
       (detai-256-fringe-bg (if detai-distinct-fringe-background
                                  detai-256-gray
                                detai-256-background)))

  ;; Define faces
  (custom-theme-set-faces
   'detai

   ;; font lock for syntax highlighting
   `(font-lock-builtin-face
     ((,detai-class (:foreground ,detai-red
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-red
                                        :weight normal))))

   `(font-lock-comment-delimiter-face
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(font-lock-comment-face
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(font-lock-constant-face
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   `(font-lock-doc-face
     ((,detai-class (:foreground ,(if detai-doc-face-as-comment
                                        detai-comments
                                      detai-yellow)))
      (,detai-256-class (:foreground ,(if detai-doc-face-as-comment
                                            detai-256-comments
                                          detai-256-yellow)))))

   `(font-lock-function-name-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(font-lock-keyword-face
     ((,detai-class (:foreground ,detai-red
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-red
                                        :weight normal))))

   `(font-lock-negation-char-face
     ((,detai-class (:foreground ,detai-yellow
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight bold))))

   `(font-lock-preprocessor-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(font-lock-regexp-grouping-construct
     ((,detai-class (:foreground ,detai-yellow
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight normal))))

   `(font-lock-regexp-grouping-backslash
     ((,detai-class (:foreground ,detai-violet
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-violet
                                        :weight normal))))

   `(font-lock-string-face
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(font-lock-type-face
     ((,detai-class (:foreground ,detai-blue
                                   :italic nil))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :italic nil))))

   `(font-lock-variable-name-face
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(font-lock-warning-face
     ((,detai-class (:foreground ,detai-orange
                                   :weight bold
                                   :italic t
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-orange
                                        :weight bold
                                        :italic t
                                        :underline t))))

   `(c-annotation-face
     ((,detai-class (:inherit font-lock-constant-face))
      (,detai-256-class (:inherit font-lock-constant-face))))

   ;; general colouring
   '(button ((t (:underline t))))

   `(default
      ((,detai-class (:foreground ,detai-foreground
                                    :background ,detai-background))
       (,detai-256-class (:foreground ,detai-256-foreground
                                         :background ,detai-256-background))))

   `(highlight
     ((,detai-class (:background ,detai-highlight))
      (,detai-256-class (:background ,detai-256-highlight))))

   `(lazy-highlight
     ((,detai-class (:inherit highlight
                                :background ,detai-highlight-alt))
      (,detai-256-class (:inherit highlight
                                     :background ,detai-256-highlight-alt))))

   `(region
     ((,detai-class (:inherit highlight
                                :background ,detai-highlight))
      (,detai-256-class (:inherit highlight
                                     :background ,detai-256-highlight))))

   `(secondary-selection
     ((,detai-class (:inherit region
                                :background ,detai-highlight-alt))
      (,detai-256-class (:inherit region
                                     :background ,detai-256-highlight-alt))))

   `(shadow
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(match
     ((,detai-class (:background ,detai-green
                                   :foreground ,detai-background
                                   :weight bold))
      (,detai-256-class (:background ,detai-256-green
                                        :foreground ,detai-256-background
                                        :weight bold))))

   `(cursor
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-foreground
                                   :inverse-video t))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-foreground
                                        :inverse-video t))))

   `(mouse
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-foreground
                                   :inverse-video t))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-foreground
                                        :inverse-video t))))

   `(escape-glyph
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(escape-glyph-face
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(fringe
     ((,detai-class (:foreground ,detai-foreground
                                   :background ,detai-fringe-bg))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :background ,detai-256-fringe-bg))))

   `(link
     ((,detai-class (:foreground ,detai-dark-orange
                                   :underline t
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :underline t
                                        :weight bold))))

   `(link-visited
     ((,detai-class (:foreground ,detai-violet
                                   :underline t
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-violet
                                        :underline t
                                        :weight normal))))

   `(success
     ((,detai-class (:foreground ,detai-green ))
      (,detai-256-class (:foreground ,detai-256-green ))))

   `(warning
     ((,detai-class (:foreground ,detai-yellow ))
      (,detai-256-class (:foreground ,detai-256-yellow ))))

   `(error
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(eval-sexp-fu-flash
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-green))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-green))))

   `(eval-sexp-fu-flash-error
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-red))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-red))))

   `(trailing-whitespace
     ((,detai-class (:background ,detai-red))
      (,detai-256-class (:background ,detai-256-red))))

   `(vertical-border
     ((,detai-class (:foreground ,detai-gray))
      (,detai-256-class (:foreground ,detai-256-gray))))

   `(menu
     ((,detai-class (:foreground ,detai-foreground
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :background ,detai-256-background))))

   `(minibuffer-prompt
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   ;; mode-line and powerline
   `(mode-line-buffer-id
     ((,detai-class (:foreground ,detai-yellow
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-green
                                        :weight bold))))

   `(mode-line
     ((,detai-class (:inverse-video unspecified
                                      :underline unspecified
                                      :foreground ,detai-emphasis
                                      :background ,detai-highlight
                                      :box (:line-width 1
                                                        :color ,detai-background
                                                        :style unspecified)))
      (,detai-256-class (:inverse-video unspecified
                                           :underline unspecified
                                           :foreground ,detai-256-foreground
                                           :background ,detai-256-background
                                           :box (:line-width 1
                                                             :color ,detai-256-highlight
                                                             :style unspecified)))))

   `(powerline-active1
     ((,detai-class (:background ,detai-gray-d))
      (,detai-256-class (:background ,detai-256-gray-d))))

   `(powerline-active2
     ((,detai-class (:background ,detai-background))
      (,detai-256-class (:background ,detai-256-background))))


   `(mode-line-inactive
     ((,detai-class (:inverse-video unspecified
                                      :underline unspecified
                                      :foreground ,detai-comments
                                      :background ,detai-background
                                      :box (:line-width 1
                                                        :color ,detai-gray
                                                        :style unspecified)))
      (,detai-256-class (:inverse-video unspecified
                                           :underline unspecified
                                           :foreground ,detai-256-comments
                                           :background ,detai-256-background
                                           :box (:line-width 1
                                                             :color ,detai-256-gray
                                                             :style unspecified)))))

   `(powerline-inactive1
     ((,detai-class (:background ,detai-gray-d))
      (,detai-256-class (:background ,detai-256-gray-d))))

   `(powerline-inactive2
     ((,detai-class (:background ,detai-background))
      (,detai-256-class (:background ,detai-256-background))))

   ;; header-line
   `(header-line
     ((,detai-class (:foreground ,detai-emphasis
                                   :background ,detai-highlight
                                   :box (:color ,detai-gray
                                                :line-width 1
                                                :style unspecified)))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :background ,detai-256-highlight
                                        :box (:color ,detai-256-gray
                                                     :line-width 1
                                                     :style unspecified)))))

   ;; cua
   `(cua-global-mark
     ((,detai-class (:background ,detai-yellow
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-yellow
                                        :foreground ,detai-256-background))))

   `(cua-rectangle
     ((,detai-class (:inherit region))
      (,detai-256-class (:inherit region))))

   `(cua-rectangle-noselect
     ((,detai-class (:inherit secondary-selection))
      (,detai-256-class (:inherit secondary-selection))))

   ;; diary
   `(diary
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   ;; dired
   `(dired-directory
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(dired-flagged
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(dired-header
     ((,detai-class (:foreground ,detai-blue
                                   :background ,detai-background
                                   :inherit bold))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :background ,detai-256-background
                                        :inherit bold))))

   `(dired-ignored
     ((,detai-class (:inherit shadow))
      (,detai-256-class (:inherit shadow))))

   `(dired-mark
     ((,detai-class (:foreground ,detai-green
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-green
                                        :weight bold))))

   `(dired-marked
     ((,detai-class (:foreground ,detai-violet
                                   :inherit bold))
      (,detai-256-class (:foreground ,detai-256-violet
                                        :inherit bold))))

   `(dired-perm-write
     ((,detai-class (:foreground ,detai-foreground
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :underline t))))

   `(dired-symlink
     ((,detai-class (:foreground ,detai-cyan
                                   :slant italic))
      (,detai-256-class (:foreground ,detai-256-cyan
                                        :slant italic))))

   `(dired-warning
     ((,detai-class (:foreground ,detai-orange
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-orange
                                        :underline t))))

   ;; dropdown
   `(dropdown-list-face
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-blue))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-blue))))

   `(dropdown-list-selection-face
     ((,detai-class (:background ,detai-green
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-green
                                        :foreground ,detai-256-background))))

   ;; ecb
   `(ecb-default-highlight-face
     ((,detai-class (:background ,detai-blue
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-blue
                                        :foreground ,detai-256-background))))

   `(ecb-history-bucket-node-dir-soure-path-face
     ((,detai-class (:inherit ecb-history-bucket-node-face
                                :foreground ,detai-yellow))
      (,detai-256-class (:inherit ecb-history-bucket-node-face
                                     :foreground ,detai-256-yellow))))

   `(ecb-source-in-directories-buffer-face
     ((,detai-class (:inherit ecb-directories-general-face
                                :foreground ,detai-foreground))
      (,detai-256-class (:inherit ecb-directories-general-face
                                     :foreground ,detai-256-foreground))))

   `(ecb-history-dead-buffer-face
     ((,detai-class (:inherit ecb-history-general-face
                                :foreground ,detai-comments))
      (,detai-256-class (:inherit ecb-history-general-face
                                     :foreground ,detai-256-comments))))

   `(ecb-directory-not-accessible-face
     ((,detai-class (:inherit ecb-directories-general-face
                                :foreground ,detai-comments))
      (,detai-256-class (:inherit ecb-directories-general-face
                                     :foreground ,detai-256-comments))))

   `(ecb-bucket-node-face
     ((,detai-class (:inherit ecb-default-general-face
                                :weight normal
                                :foreground ,detai-blue))
      (,detai-256-class (:inherit ecb-default-general-face
                                     :weight normal
                                     :foreground ,detai-256-blue))))

   `(ecb-tag-header-face
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-256-highlight-line))))

   `(ecb-analyse-bucket-element-face
     ((,detai-class (:inherit ecb-analyse-general-face
                                :foreground ,detai-green))
      (,detai-256-class (:inherit ecb-analyse-general-face
                                     :foreground ,detai-256-green))))

   `(ecb-directories-general-face
     ((,detai-class (:inherit ecb-default-general-face
                                :height 1.0))
      (,detai-256-class (:inherit ecb-default-general-face
                                     :height 1.0))))

   `(ecb-method-non-semantic-face
     ((,detai-class (:inherit ecb-methods-general-face
                                :foreground ,detai-cyan))
      (,detai-256-class (:inherit ecb-methods-general-face
                                     :foreground ,detai-256-cyan))))

   `(ecb-mode-line-prefix-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(ecb-tree-guide-line-face
     ((,detai-class (:inherit ecb-default-general-face
                                :foreground ,detai-gray
                                :height 1.0))
      (,detai-256-class (:inherit ecb-default-general-face
                                     :foreground ,detai-256-gray
                                     :height 1.0))))

   ;; ee
   `(ee-bookmarked
     ((,detai-class (:foreground ,detai-emphasis))
      (,detai-256-class (:foreground ,detai-256-emphasis))))

   `(ee-category
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(ee-link
     ((,detai-class (:inherit link))
      (,detai-256-class (:inherit link))))

   `(ee-link-visited
     ((,detai-class (:inherit link-visited))
      (,detai-256-class (:inherit link-visited))))

   `(ee-marked
     ((,detai-class (:foreground ,detai-magenta
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-magenta
                                        :weight bold))))

   `(ee-omitted
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(ee-shadow
     ((,detai-class (:inherit shadow))
      (,detai-256-class (:inherit shadow))))

   ;; grep
   `(grep-context-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(grep-error-face
     ((,detai-class (:foreground ,detai-red
                                   :weight bold
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-red
                                        :weight bold
                                        :underline t))))

   `(grep-hit-face
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(grep-match-face
     ((,detai-class (:foreground ,detai-green
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-green
                                        :weight bold))))

   ;; isearch
   `(isearch
     ((,detai-class (:inherit region
                                :foreground ,detai-background
                                :background ,detai-yellow))
      (,detai-256-class (:inherit region
                                     :foreground ,detai-256-background
                                     :background ,detai-256-yellow))))

   `(isearch-fail
     ((,detai-class (:inherit isearch
                                :foreground ,detai-red
                                :background ,detai-background
                                :bold t))
      (,detai-256-class (:inherit isearch
                                     :foreground ,detai-256-red
                                     :background ,detai-256-background
                                     :bold t))))


   ;; ace-jump-mode
   `(ace-jump-face-background
     ((,detai-class (:foreground ,detai-comments
                                   :background ,detai-background
                                   :inverse-video nil))
      (,detai-256-class (:foreground ,detai-256-comments
                                        :background ,detai-256-background
                                        :inverse-video nil))))

   `(ace-jump-face-foreground
     ((,detai-class (:foreground ,detai-yellow
                                   :background ,detai-background
                                   :inverse-video nil
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :background ,detai-256-background
                                        :inverse-video nil
                                        :weight bold))))

   ;; auctex
   `(font-latex-bold-face
     ((,detai-class (:inherit bold
                                :foreground ,detai-emphasis))
      (,detai-256-class (:inherit bold
                                     :foreground ,detai-256-emphasis))))

   `(font-latex-doctex-documentation-face
     ((,detai-class (:background unspecified))
      (,detai-256-class (:background unspecified))))

   `(font-latex-doctex-preprocessor-face
     ((,detai-class
       (:inherit (font-latex-doctex-documentation-face
                  font-lock-builtin-face
                  font-lock-preprocessor-face)))
      (,detai-class
       (:inherit (font-latex-doctex-documentation-face
                  font-lock-builtin-face
                  font-lock-preprocessor-face)))))

   `(font-latex-italic-face
     ((,detai-class (:inherit italic :foreground ,detai-emphasis))
      (,detai-256-class (:inherit italic :foreground ,detai-256-emphasis))))

   `(font-latex-math-face
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   `(font-latex-sectioning-0-face
     ((,detai-class (:inherit font-latex-sectioning-1-face
                                :height ,detai-height-plus-1))
      (,detai-256-class (:inherit font-latex-sectioning-1-face
                                     :height ,detai-height-plus-1))))

   `(font-latex-sectioning-1-face
     ((,detai-class (:inherit font-latex-sectioning-2-face
                                :height ,detai-height-plus-1))
      (,detai-256-class (:inherit font-latex-sectioning-2-face
                                     :height ,detai-height-plus-1))))

   `(font-latex-sectioning-2-face
     ((,detai-class (:inherit font-latex-sectioning-3-face
                                :height ,detai-height-plus-1))
      (,detai-256-class (:inherit font-latex-sectioning-3-face
                                     :height ,detai-height-plus-1))))

   `(font-latex-sectioning-3-face
     ((,detai-class (:inherit font-latex-sectioning-4-face
                                :height ,detai-height-plus-1))
      (,detai-256-class (:inherit font-latex-sectioning-4-face
                                     :height ,detai-height-plus-1))))

   `(font-latex-sectioning-4-face
     ((,detai-class (:inherit font-latex-sectioning-5-face
                                :height ,detai-height-plus-1))
      (,detai-256-class (:inherit font-latex-sectioning-5-face
                                     :height ,detai-height-plus-1))))

   `(font-latex-sectioning-5-face
     ((,detai-class (:inherit ,detai-pitch
                                :foreground ,detai-yellow
                                :weight bold))
      (,detai-256-class (:inherit ,detai-pitch :
                                     foreground ,detai-256-yellow
                                     :weight bold))))

   `(font-latex-sedate-face
     ((,detai-class (:foreground ,detai-emphasis))
      (,detai-256-class (:foreground ,detai-256-emphasis))))

   `(font-latex-slide-title-face
     ((,detai-class (:inherit (,detai-pitch font-lock-type-face)
                                :weight bold
                                :height ,detai-height-plus-3))
      (,detai-256-class (:inherit (,detai-pitch font-lock-type-face)
                                     :weight bold
                                     :height ,detai-height-plus-3))))

   `(font-latex-string-face
     ((,detai-class (:foreground ,detai-cyan))
      (,detai-256-class (:foreground ,detai-256-cyan))))

   `(font-latex-subscript-face
     ((,detai-class (:height ,detai-height-minus-1))
      (,detai-256-class (:height ,detai-height-minus-1))))

   `(font-latex-superscript-face
     ((,detai-class (:height ,detai-height-minus-1))
      (,detai-256-class (:height ,detai-height-minus-1))))

   `(font-latex-verbatim-face
     ((,detai-class (:inherit fixed-pitch
                                :foreground ,detai-foreground
                                :slant italic))
      (,detai-256-class (:inherit fixed-pitch
                                     :foreground ,detai-256-foreground
                                     :slant italic))))

   `(font-latex-warning-face
     ((,detai-class (:inherit bold
                                :foreground ,detai-orange))
      (,detai-256-class (:inherit bold
                                     :foreground ,detai-256-orange))))

   ;; auto-complete
   `(ac-candidate-face
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-blue))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-blue))))

   `(ac-selection-face
     ((,detai-class (:background ,detai-blue
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-blue
                                        :foreground ,detai-256-background))))

   `(ac-candidate-mouse-face
     ((,detai-class (:background ,detai-blue
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-blue
                                        :foreground ,detai-256-background))))

   `(ac-completion-face
     ((,detai-class (:foreground ,detai-emphasis
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :underline t))))

   `(ac-gtags-candidate-face
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-blue))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-blue))))

   `(ac-gtags-selection-face
     ((,detai-class (:background ,detai-blue
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-blue
                                        :foreground ,detai-256-background))))

   `(ac-yasnippet-candidate-face
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-yellow))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-yellow))))

   `(ac-yasnippet-selection-face
     ((,detai-class (:background ,detai-yellow
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-yellow
                                        :foreground ,detai-256-background))))

   ;; auto highlight symbol
   `(ahs-definition-face
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-blue))))

   `(ahs-edit-mode-face
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-highlight))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-highlight))))

   `(ahs-face
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-magenta
                                        :background unspecified))))

   `(ahs-plugin-bod-face
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-violet ))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-cyan ))))

   `(ahs-plugin-defalt-face
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-orange))))

   `(ahs-plugin-whole-buffer-face
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-green))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-green))))

   `(ahs-warning-face
     ((,detai-class (:foreground ,detai-red
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-red
                                        :weight bold))))

   ;; android mode
   `(android-mode-debug-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(android-mode-error-face
     ((,detai-class (:foreground ,detai-orange
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-orange
                                        :weight bold))))

   `(android-mode-info-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(android-mode-verbose-face
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(android-mode-warning-face
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   ;; anzu-mode
   `(anzu-mode-line
     ((,detai-class (:foreground ,detai-violet
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-violet
                                        :weight bold))))

   ;; bm
   `(bm-face
     ((,detai-class (:background ,detai-yellow-lc
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-yellow-lc
                                        :foreground ,detai-256-background))))

   `(bm-fringe-face
     ((,detai-class (:background ,detai-yellow-lc
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-yellow-lc
                                        :foreground ,detai-256-background))))

   `(bm-fringe-persistent-face
     ((,detai-class (:background ,detai-green-lc
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-green-lc
                                        :foreground ,detai-256-background))))

   `(bm-persistent-face
     ((,detai-class (:background ,detai-green-lc
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-green-lc
                                        :foreground ,detai-256-background))))

   ;; calfw
   `(cfw:face-day-title
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-256-highlight-line))))

   `(cfw:face-annotation
     ((,detai-class (:inherit cfw:face-day-title
                                :foreground ,detai-yellow))
      (,detai-256-class (:inherit cfw:face-day-title
                                     :foreground ,detai-256-yellow))))

   `(cfw:face-default-content
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(cfw:face-default-day
     ((,detai-class (:inherit cfw:face-day-title
                                :weight bold))
      (,detai-256-class (:inherit cfw:face-day-title
                                     :weight bold))))

   `(cfw:face-disable
     ((,detai-class (:inherit cfw:face-day-title
                                :foreground ,detai-comments))
      (,detai-256-class (:inherit cfw:face-day-title
                                     :foreground ,detai-256-comments))))

   `(cfw:face-grid
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(cfw:face-header
     ((,detai-class (:foreground ,detai-blue-hc
                                   :background ,detai-blue-lc
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-blue-hc
                                        :background ,detai-256-blue-lc
                                        :weight bold))))

   `(cfw:face-holiday
     ((,detai-class (:background nil
                                   :foreground ,detai-red
                                   :weight bold))
      (,detai-256-class (:background nil
                                        :foreground ,detai-256-red
                                        :weight bold))))

   `(cfw:face-periods
     ((,detai-class (:foreground ,detai-magenta))
      (,detai-256-class (:foreground ,detai-256-magenta))))

   `(cfw:face-select
     ((,detai-class (:background ,detai-magenta-lc
                                   :foreground ,detai-magenta-hc))
      (,detai-256-class (:background ,detai-256-magenta-lc
                                        :foreground ,detai-256-magenta-hc))))

   `(cfw:face-saturday
     ((,detai-class (:foreground ,detai-cyan-hc
                                   :background ,detai-cyan-lc))
      (,detai-256-class (:foreground ,detai-256-cyan-hc
                                        :background ,detai-256-cyan-lc))))

   `(cfw:face-sunday
     ((,detai-class (:foreground ,detai-red-hc
                                   :background ,detai-red-lc
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-red-hc
                                        :background ,detai-256-red-lc
                                        :weight bold))))

   `(cfw:face-title
     ((,detai-class (:inherit ,detai-pitch
                                :foreground ,detai-yellow
                                :weight bold
                                :height ,detai-height-plus-4))
      (,detai-256-class (:inherit ,detai-pitch
                                     :foreground ,detai-256-yellow
                                     :weight bold
                                     :height ,detai-height-plus-4))))

   `(cfw:face-today
     ((,detai-class (:weight bold
                               :background ,detai-highlight-line
                               :foreground nil))
      (,detai-256-class (:weight bold
                                    :background ,detai-256-highlight-line
                                    :foreground nil))))

   `(cfw:face-today-title
     ((,detai-class (:background ,detai-yellow-lc
                                   :foreground ,detai-yellow-hc
                                   :weight bold))
      (,detai-256-class (:background ,detai-256-yellow-lc
                                        :foreground ,detai-256-yellow-hc
                                        :weight bold))))

   `(cfw:face-toolbar
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-foreground))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-foreground))))

   `(cfw:face-toolbar-button-off
     ((,detai-class (:background ,detai-yellow-lc
                                   :foreground ,detai-yellow-hc
                                   :weight bold))
      (,detai-256-class (:background ,detai-256-yellow-lc
                                        :foreground ,detai-256-yellow-hc
                                        :weight bold))))

   `(cfw:face-toolbar-button-on
     ((,detai-class (:background ,detai-yellow-hc
                                   :foreground ,detai-yellow-lc
                                   :weight bold))
      (,detai-256-class (:background ,detai-256-yellow-hc
                                        :foreground ,detai-256-yellow-lc
                                        :weight bold))))

   ;; cider
   `(cider-enlightened
     ((,detai-class (:foreground ,detai-yellow
                                   :background nil
                                   :box (:color ,detai-yellow :line-width -1 :style nil)))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :background nil
                                        :box (:color ,detai-256-yellow :line-width -1 :style nil))) ))

   `(cider-enlightened-local
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(cider-instrumented-face
     ((,detai-class (:foreground ,detai-violet
                                   :background nil
                                   :box (:color ,detai-violet :line-width -1 :style nil)))
      (,detai-256-class (:foreground ,detai-256-violet
                                        :background nil
                                        :box (:color ,detai-256-violet :line-width -1 :style nil)))))

   `(cider-result-overlay-face
     ((,detai-class (:foreground ,detai-blue
                                   :background nil
                                   :box (:color ,detai-blue :line-width -1 :style nil)))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :background nil
                                        :box (:color ,detai-256-blue :line-width -1 :style nil)))))

   `(cider-test-error-face
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-orange))))

   `(cider-test-failure-face
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-red))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-red))))

   `(cider-test-success-face
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-green))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-green))))

   `(cider-traced-face
     ((,detai-class :box (:color ,detai-blue :line-width -1 :style nil))
      (,detai-256-class  :box (:color ,detai-256-blue :line-width -1 :style nil))))

   ;; clojure-test
   `(clojure-test-failure-face
     ((,detai-class (:foreground ,detai-red
                                   :weight bold
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-red
                                        :weight bold
                                        :underline t))))

   `(clojure-test-error-face
     ((,detai-class (:foreground ,detai-orange
                                   :weight bold
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-red
                                        :weight bold
                                        :underline t))))

   `(clojure-test-success-face
     ((,detai-class (:foreground ,detai-green
                                   :weight bold
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-green
                                        :weight bold
                                        :underline t))))

   ;; company-mode
   `(company-tooltip
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-emphasis))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-emphasis))))

   `(company-tooltip-selection
     ((,detai-class (:background ,detai-blue
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-blue
                                        :foreground ,detai-256-background))))

   `(company-tooltip-mouse
     ((,detai-class (:background ,detai-blue
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-blue
                                        :foreground ,detai-256-background))))

   `(company-tooltip-common
     ((,detai-class (:foreground ,detai-blue
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :underline t))))

   `(company-tooltip-common-selection
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-blue
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-blue
                                        :underline t))))

   `(company-preview
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-emphasis))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-emphasis))))

   `(company-preview-common
     ((,detai-class (:foreground ,detai-blue
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :underline t))))

   `(company-scrollbar-bg
     ((,detai-class (:background ,detai-gray))
      (,detai-256-class (:background ,detai-256-gray))))

   `(company-scrollbar-fg
     ((,detai-class (:background ,detai-comments))
      (,detai-256-class (:background ,detai-256-comments))))

   `(company-tooltip-annotation
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-green))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-green))))

   `(company-template-field
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-blue))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-blue))))

   ;; compilation
   `(compilation-column-face
     ((,detai-class (:foreground ,detai-cyan
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-cyan
                                        :underline nil))))

   `(compilation-column-number
     ((,detai-class (:inherit font-lock-doc-face
                                :foreground ,detai-cyan
                                :underline nil))
      (,detai-256-class (:inherit font-lock-doc-face
                                     :foreground ,detai-256-cyan
                                     :underline nil))))

   `(compilation-enter-directory-face
     ((,detai-class (:foreground ,detai-green
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-green
                                        :underline nil))))

   `(compilation-error
     ((,detai-class (:inherit error
                                :underline nil))
      (,detai-256-class (:inherit error
                                     :underline nil))))

   `(compilation-error-face
     ((,detai-class (:foreground ,detai-red
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-red
                                        :underline nil))))

   `(compilation-face
     ((,detai-class (:foreground ,detai-foreground
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :underline nil))))

   `(compilation-info
     ((,detai-class (:foreground ,detai-comments
                                   :underline nil
                                   :bold nil))
      (,detai-256-class (:foreground ,detai-256-comments
                                        :underline nil
                                        :bold nil))))

   `(compilation-info-face
     ((,detai-class (:foreground ,detai-blue
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :underline nil))))

   `(compilation-leave-directory-face
     ((,detai-class (:foreground ,detai-green
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-green
                                        :underline nil))))

   `(compilation-line-face
     ((,detai-class (:foreground ,detai-green
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-green
                                        :underline nil))))

   `(compilation-line-number
     ((,detai-class (:foreground ,detai-green
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-green
                                        :underline nil))))

   `(compilation-warning
     ((,detai-class (:inherit warning
                                :underline nil))
      (,detai-256-class (:inherit warning
                                     :underline nil))))

   `(compilation-warning-face
     ((,detai-class (:foreground ,detai-yellow
                                   :weight normal
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight normal
                                        :underline nil))))

   `(compilation-mode-line-exit
     ((,detai-class (:inherit compilation-info
                                :foreground ,detai-green
                                :weight bold))
      (,detai-256-class (:inherit compilation-info
                                     :foreground ,detai-256-green
                                     :weight bold))))

   `(compilation-mode-line-fail
     ((,detai-class (:inherit compilation-error
                                :foreground ,detai-red
                                :weight bold))
      (,detai-256-class (:inherit compilation-error
                                     :foreground ,detai-256-red
                                     :weight bold))))

   `(compilation-mode-line-run
     ((,detai-class (:foreground ,detai-orange
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-orange
                                        :weight bold))))

   ;; CSCOPE
   `(cscope-file-face
     ((,detai-class (:foreground ,detai-green
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-green
                                        :weight bold))))

   `(cscope-function-face
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(cscope-line-number-face
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(cscope-line-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(cscope-mouse-face
     ((,detai-class (:background ,detai-blue
                                   :foreground ,detai-foreground))
      (,detai-256-class (:background ,detai-256-blue
                                        :foreground ,detai-256-foreground))))

   ;; ctable
   `(ctbl:face-cell-select
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-emphasis
                                   :underline ,detai-emphasis
                                   :weight bold))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-emphasis
                                        :underline ,detai-256-emphasis
                                        :weight bold))))

   `(ctbl:face-continue-bar
     ((,detai-class (:background ,detai-gray
                                   :foreground ,detai-yellow))
      (,detai-256-class (:background ,detai-256-gray
                                        :foreground ,detai-256-yellow))))

   `(ctbl:face-row-select
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-foreground
                                   :underline t))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-foreground
                                        :underline t))))

   ;; coffee
   `(coffee-mode-class-name
     ((,detai-class (:foreground ,detai-yellow
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight bold))))

   `(coffee-mode-function-param
     ((,detai-class (:foreground ,detai-violet
                                   :slant italic))
      (,detai-256-class (:foreground ,detai-256-violet
                                        :slant italic))))

   ;; custom
   `(custom-face-tag
     ((,detai-class (:inherit ,detai-pitch
                                :height ,detai-height-plus-3
                                :foreground ,detai-violet
                                :weight bold))
      (,detai-256-class (:inherit ,detai-pitch
                                     :height ,detai-height-plus-3
                                     :foreground ,detai-256-violet
                                     :weight bold))))

   `(custom-variable-tag
     ((,detai-class (:inherit ,detai-pitch
                                :foreground ,detai-cyan
                                :height ,detai-height-plus-3))
      (,detai-256-class (:inherit ,detai-pitch
                                     :foreground ,detai-256-cyan
                                     :height ,detai-height-plus-3))))

   `(custom-comment-tag
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(custom-group-tag
     ((,detai-class (:inherit ,detai-pitch
                                :foreground ,detai-dark-blue
                                :height ,detai-height-plus-3))
      (,detai-256-class (:inherit ,detai-pitch
                                     :foreground ,detai-256-blue
                                     :height ,detai-height-plus-3))))

   `(custom-group-tag-1
     ((,detai-class (:inherit ,detai-pitch
                                :foreground ,detai-red
                                :height ,detai-height-plus-3))
      (,detai-256-class (:inherit ,detai-pitch
                                     :foreground ,detai-256-red
                                     :height ,detai-height-plus-3))))

   `(custom-state
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   ;; diff
   `(diff-added
     ((,detai-class (:foreground ,detai-green
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-green
                                        :background ,detai-256-background))))

   `(diff-changed
     ((,detai-class (:foreground ,detai-blue
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :background ,detai-256-background))))

   `(diff-removed
     ((,detai-class (:foreground ,detai-red
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-red
                                        :background ,detai-256-background))))

   `(diff-header
     ((,detai-class (:background ,detai-background))
      (,detai-256-class (:background ,detai-256-background))))

   `(diff-file-header
     ((,detai-class (:background ,detai-background
                                   :foreground ,detai-foreground
                                   :weight bold))
      (,detai-256-class (:background ,detai-256-background
                                        :foreground ,detai-256-foreground
                                        :weight bold))))

   `(diff-refine-added
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-green))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-green))))

   `(diff-refine-change
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-blue))))

   `(diff-refine-removed
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-red))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-red))))

   ;; diff-hl
   `(diff-hl-change
     ((,detai-class (:background ,detai-blue-lc
                                   :foreground ,detai-blue-hc))
      (,detai-256-class (:background ,detai-256-blue-lc
                                        :foreground ,detai-256-blue-hc))))

   `(diff-hl-delete
     ((,detai-class (:background ,detai-red-lc
                                   :foreground ,detai-red-hc))
      (,detai-256-class (:background ,detai-256-red-lc
                                        :foreground ,detai-256-red-hc))))

   `(diff-hl-insert
     ((,detai-class (:background ,detai-green-lc
                                   :foreground ,detai-green-hc))
      (,detai-256-class (:background ,detai-256-green-lc
                                        :foreground ,detai-256-green-hc))))

   `(diff-hl-unknown
     ((,detai-class (:background ,detai-violet-lc
                                   :foreground ,detai-violet-hc))
      (,detai-256-class (:background ,detai-256-violet-lc
                                        :foreground ,detai-256-violet-hc))))

   ;; ediff
   `(ediff-fine-diff-A
     ((,detai-class (:background ,detai-diff-red-emphasis))
      (,detai-256-class (:background ,detai-256-diff-red-emphasis))))

   `(ediff-fine-diff-B
     ((,detai-class (:background ,detai-diff-green-emphasis))
      (,detai-256-class (:background ,detai-256-diff-green-emphasis))))

   `(ediff-fine-diff-C
     ((,detai-class (:background ,detai-diff-blue-emphasis))
      (,detai-256-class (:background ,detai-256-diff-blue-emphasis))))

   `(ediff-current-diff-A
     ((,detai-class (:background ,detai-diff-red-base))
      (,detai-256-class (:background ,detai-256-diff-red-base))))

   `(ediff-current-diff-B
     ((,detai-class (:background ,detai-diff-green-base))
      (,detai-256-class (:background ,detai-256-diff-green-base))))

   `(ediff-current-diff-C
     ((,detai-class (:background ,detai-diff-blue-base))
      (,detai-256-class (:background ,detai-256-diff-blue-base))))

   `(ediff-even-diff-A
     ((,detai-class (:background ,detai-comments
                                   :foreground ,detai-foreground-lc ))
      (,detai-256-class (:background ,detai-256-comments
                                        :foreground ,detai-256-foreground-lc ))))

   `(ediff-odd-diff-A
     ((,detai-class (:background ,detai-comments
                                   :foreground ,detai-foreground-hc ))
      (,detai-256-class (:background ,detai-256-comments
                                        :foreground ,detai-256-foreground-hc ))))

   `(ediff-even-diff-B
     ((,detai-class (:background ,detai-comments
                                   :foreground ,detai-foreground-hc ))
      (,detai-256-class (:background ,detai-256-comments
                                        :foreground ,detai-256-foreground-hc ))))

   `(ediff-odd-diff-B
     ((,detai-class (:background ,detai-comments
                                   :foreground ,detai-foreground-lc ))
      (,detai-256-class (:background ,detai-256-comments
                                        :foreground ,detai-256-foreground-lc ))))

   `(ediff-even-diff-C
     ((,detai-class (:background ,detai-comments
                                   :foreground ,detai-foreground ))
      (,detai-256-class (:background ,detai-256-comments
                                        :foreground ,detai-256-foreground ))))

   `(ediff-odd-diff-C
     ((,detai-class (:background ,detai-comments
                                   :foreground ,detai-background ))
      (,detai-256-class (:background ,detai-256-comments
                                        :foreground ,detai-256-background ))))

   ;; edts
   `(edts-face-error-line
     ((,(append '((supports :underline (:style line))) detai-class)
       (:underline (:style line :color ,detai-red)
                   :inherit unspecified))
      (,detai-class (:foreground ,detai-red-hc
                                   :background ,detai-red-lc
                                   :weight bold
                                   :underline t))
      (,(append '((supports :underline (:style line))) detai-256-class )
       (:underline (:style line :color ,detai-256-red)
                   :inherit unspecified))
      (,detai-256-class (:foreground ,detai-256-red-hc
                                        :background ,detai-256-red-lc
                                        :weight bold
                                        :underline t))))

   `(edts-face-warning-line
     ((,(append '((supports :underline (:style line))) detai-class)
       (:underline (:style line :color ,detai-yellow)
                   :inherit unspecified))
      (,detai-class (:foreground ,detai-yellow-hc
                                   :background ,detai-yellow-lc
                                   :weight bold
                                   :underline t))
      (,(append '((supports :underline (:style line))) detai-256-class )
       (:underline (:style line :color ,detai-256-yellow)
                   :inherit unspecified))
      (,detai-256-class (:foreground ,detai-256-yellow-hc
                                        :background ,detai-256-yellow-lc
                                        :weight bold
                                        :underline t))))

   `(edts-face-error-fringe-bitmap
     ((,detai-class (:foreground ,detai-red
                                   :background unspecified
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-red
                                        :background unspecified
                                        :weight bold))))

   `(edts-face-warning-fringe-bitmap
     ((,detai-class (:foreground ,detai-yellow
                                   :background unspecified
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :background unspecified
                                        :weight bold))))

   `(edts-face-error-mode-line
     ((,detai-class (:background ,detai-red
                                   :foreground unspecified))
      (,detai-256-class (:background ,detai-256-red
                                        :foreground unspecified))))

   `(edts-face-warning-mode-line
     ((,detai-class (:background ,detai-yellow
                                   :foreground unspecified))
      (,detai-256-class (:background ,detai-256-yellow
                                        :foreground unspecified))))


   ;; elfeed
   `(elfeed-search-date-face
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(elfeed-search-feed-face
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(elfeed-search-tag-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(elfeed-search-title-face
     ((,detai-class (:foreground ,detai-cyan))
      (,detai-256-class (:foreground ,detai-256-cyan))))

   ;; elixir
   `(elixir-attribute-face
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(elixir-atom-face
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   ;; ein
   `(ein:cell-input-area
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-256-highlight-line))))
   `(ein:cell-input-prompt
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))
   `(ein:cell-output-prompt
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))
   `(ein:notification-tab-normal
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))
   `(ein:notification-tab-selected
     ((,detai-class (:foreground ,detai-orange :inherit bold))
      (,detai-256-class (:foreground ,detai-256-orange :inherit bold))))

   ;; enhanced ruby mode
   `(enh-ruby-string-delimiter-face
     ((,detai-class (:inherit font-lock-string-face))
      (,detai-256-class (:inherit font-lock-string-face))))

   `(enh-ruby-heredoc-delimiter-face
     ((,detai-class (:inherit font-lock-string-face))
      (,detai-256-class (:inherit font-lock-string-face))))

   `(enh-ruby-regexp-delimiter-face
     ((,detai-class (:inherit font-lock-string-face))
      (,detai-256-class (:inherit font-lock-string-face))))

   `(enh-ruby-op-face
     ((,detai-class (:inherit font-lock-keyword-face))
      (,detai-256-class (:inherit font-lock-keyword-face))))

   ;; erm-syn
   `(erm-syn-errline
     ((,(append '((supports :underline (:style wave))) detai-class)
       (:underline (:style wave :color ,detai-red)
                   :inherit unspecified))
      (,detai-class (:foreground ,detai-red-hc
                                   :background ,detai-red-lc
                                   :weight bold
                                   :underline t))
      (,(append '((supports :underline (:style wave))) detai-256-class )
       (:underline (:style wave :color ,detai-256-red)
                   :inherit unspecified))
      (,detai-256-class (:foreground ,detai-256-red-hc
                                        :background ,detai-256-red-lc
                                        :weight bold
                                        :underline t))))

   `(erm-syn-warnline
     ((,(append '((supports :underline (:style wave))) detai-class)
       (:underline (:style wave :color ,detai-orange)
                   :inherit unspecified))
      (,detai-class (:foreground ,detai-orange-hc
                                   :background ,detai-orange-lc
                                   :weight bold
                                   :underline t))
      (,(append '((supports :underline (:style wave))) detai-256-class )
       (:underline (:style wave :color ,detai-256-orange)
                   :inherit unspecified))
      (,detai-256-class (:foreground ,detai-256-orange-hc
                                        :background ,detai-256-orange-lc
                                        :weight bold
                                        :underline t))))

   ;; epc
   `(epc:face-title
     ((,detai-class (:foreground ,detai-blue
                                   :background ,detai-background
                                   :weight normal
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :background ,detai-256-background
                                        :weight normal
                                        :underline nil))))

   ;; erc
   `(erc-action-face
     ((,detai-class (:inherit erc-default-face))
      (,detai-256-class (:inherit erc-default-face))))

   `(erc-bold-face
     ((,detai-class (:weight bold))
      (,detai-256-class (:weight bold))))

   `(erc-current-nick-face
     ((,detai-class (:foreground ,detai-blue :weight bold))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :weight bold))))

   `(erc-dangerous-host-face
     ((,detai-class (:inherit font-lock-warning-face))
      (,detai-256-class (:inherit font-lock-warning-face))))

   `(erc-default-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(erc-highlight-face
     ((,detai-class (:inherit erc-default-face
                                :background ,detai-highlight))
      (,detai-256-class (:inherit erc-default-face
                                     :background ,detai-256-highlight))))

   `(erc-direct-msg-face
     ((,detai-class (:inherit erc-default-face))
      (,detai-256-class (:inherit erc-default-face))))

   `(erc-error-face
     ((,detai-class (:inherit font-lock-warning-face))
      (,detai-256-class (:inherit font-lock-warning-face))))

   `(erc-fool-face
     ((,detai-class (:inherit erc-default-face))
      (,detai-256-class (:inherit erc-default-face))))

   `(erc-input-face
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(erc-keyword-face
     ((,detai-class (:foreground ,detai-blue
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :weight bold))))

   `(erc-nick-default-face
     ((,detai-class (:foreground ,detai-yellow
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight bold))))

   `(erc-my-nick-face
     ((,detai-class (:foreground ,detai-red
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-red
                                        :weight bold))))

   `(erc-nick-msg-face
     ((,detai-class (:inherit erc-default-face))
      (,detai-256-class (:inherit erc-default-face))))

   `(erc-notice-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(erc-pal-face
     ((,detai-class (:foreground ,detai-orange
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-orange
                                        :weight bold))))

   `(erc-prompt-face
     ((,detai-class (:foreground ,detai-orange
                                   :background ,detai-background
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-orange
                                        :background ,detai-256-background
                                        :weight bold))))

   `(erc-timestamp-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(erc-underline-face
     ((t (:underline t))))

   ;; eshell
   `(eshell-prompt
     ((,detai-class (:foreground ,detai-blue
                                   :inherit bold))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :inherit bold))))

   `(eshell-ls-archive
     ((,detai-class (:foreground ,detai-red
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-red
                                        :inherit bold))))

   `(eshell-ls-backup
     ((,detai-class (:inherit font-lock-comment-face))
      (,detai-256-class (:inherit font-lock-comment-face))))

   `(eshell-ls-clutter
     ((,detai-class (:inherit font-lock-comment-face))
      (,detai-256-class (:inherit font-lock-comment-face))))

   `(eshell-ls-directory
     ((,detai-class (:foreground ,detai-blue
                                   :inherit bold))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :inherit bold))))

   `(eshell-ls-executable
     ((,detai-class (:foreground ,detai-green
                                   :inherit bold))
      (,detai-256-class (:foreground ,detai-256-green
                                        :inherit bold))))

   `(eshell-ls-unreadable
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(eshell-ls-missing
     ((,detai-class (:inherit font-lock-warning-face))
      (,detai-256-class (:inherit font-lock-warning-face))))

   `(eshell-ls-product
     ((,detai-class (:inherit font-lock-doc-face))
      (,detai-256-class (:inherit font-lock-doc-face))))

   `(eshell-ls-special
     ((,detai-class (:foreground ,detai-yellow
                                   :inherit bold))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :inherit bold))))

   `(eshell-ls-symlink
     ((,detai-class (:foreground ,detai-cyan
                                   :inherit bold))
      (,detai-256-class (:foreground ,detai-256-cyan
                                        :inherit bold))))

   ;; evil-ex-substitute
   `(evil-ex-substitute-matches
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-red-l
                                   :inherit italic))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-red-l
                                        :inherit italic))))
   `(evil-ex-substitute-replacement
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-green-l
                                   :inherit italic))
      (,detai-256-class (:background ,detai-256-highlight-line :foreground ,detai-256-green-l :inherit italic))))

   ;; evil-search-highlight-persist
   `(evil-search-highlight-persist-highlight-face
     ((,detai-class (:inherit region))
      (,detai-256-class (:inherit region))))

   ;; fic
   `(fic-author-face
     ((,detai-class (:background ,detai-background
                                   :foreground ,detai-orange
                                   :underline t
                                   :slant italic))
      (,detai-256-class (:background ,detai-256-background
                                        :foreground ,detai-256-orange
                                        :underline t
                                        :slant italic))))

   `(fic-face
     ((,detai-class (:background ,detai-background
                                   :foreground ,detai-orange
                                   :weight normal
                                   :slant italic))
      (,detai-256-class (:background ,detai-256-background
                                        :foreground ,detai-256-orange
                                        :weight normal
                                        :slant italic))))

   `(font-lock-fic-face
     ((,detai-class (:background ,detai-background
                                   :foreground ,detai-orange
                                   :weight normal
                                   :slant italic))
      (,detai-256-class (:background ,detai-256-background
                                        :foreground ,detai-256-orange
                                        :weight normal
                                        :slant italic))))

   ;; flx
   `(flx-highlight-face
     ((,detai-class (:foreground ,detai-blue
                                   :weight normal
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :weight normal
                                        :underline nil))))

   ;; flymake
   `(flymake-errline
     ((,(append '((supports :underline (:style wave))) detai-class)
       (:underline (:style wave :color ,detai-red)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,detai-class (:foreground ,detai-red-hc
                                   :background ,detai-red-lc
                                   :weight bold
                                   :underline t))
      (,(append '((supports :underline (:style wave))) detai-256-class )
       (:underline (:style wave :color ,detai-256-red)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,detai-256-class (:foreground ,detai-256-red-hc
                                        :background ,detai-256-red-lc
                                        :weight bold
                                        :underline t))))

   `(flymake-infoline
     ((,(append '((supports :underline (:style wave))) detai-class)
       (:underline (:style wave :color ,detai-green)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,detai-class (:foreground ,detai-green-hc
                                   :background ,detai-green-lc))
      (,(append '((supports :underline (:style wave))) detai-256-class )
       (:underline (:style wave :color ,detai-256-green)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,detai-256-class (:foreground ,detai-256-green-hc
                                        :background ,detai-256-green-lc))))

   `(flymake-warnline
     ((,(append '((supports :underline (:style wave))) detai-class)
       (:underline (:style wave :color ,detai-yellow)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,detai-class (:foreground ,detai-yellow-hc
                                   :background ,detai-yellow-lc
                                   :weight bold
                                   :underline t))
      (,(append '((supports :underline (:style wave))) detai-256-class )
       (:underline (:style wave :color ,detai-256-yellow)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,detai-256-class (:foreground ,detai-256-yellow-hc
                                        :background ,detai-256-yellow-lc
                                        :weight bold
                                        :underline t))))

   ;; flycheck
   `(flycheck-error
     ((,(append '((supports :underline (:style line))) detai-class)
       (:underline (:style line :color ,detai-red)))
      (,detai-class (:foreground ,detai-red
                                   :background ,detai-background
                                   :weight bold
                                   :underline t))
      (,(append '((supports :underline (:style line))) detai-256-class )
       (:underline (:style line :color ,detai-256-red)))
      (,detai-256-class (:foreground ,detai-256-red
                                        :background ,detai-256-background
                                        :weight bold
                                        :underline t))))

   `(flycheck-warning
     ((,(append '((supports :underline (:style line))) detai-class)
       (:underline (:style line :color ,detai-orange)))
      (,detai-class (:foreground ,detai-orange
                                   :background ,detai-background
                                   :weight bold
                                   :underline t))
      (,(append '((supports :underline (:style line))) detai-256-class )
       (:underline (:style line :color ,detai-256-orange)))
      (,detai-256-class (:foreground ,detai-256-orange
                                        :background ,detai-256-background
                                        :weight bold
                                        :underline t))))

   `(flycheck-info
     ((,(append '((supports :underline (:style line))) detai-class)
       (:underline (:style line :color ,detai-blue)))
      (,detai-class (:foreground ,detai-blue
                                   :background ,detai-background
                                   :weight bold
                                   :underline t))
      (,(append '((supports :underline (:style line))) detai-256-class )
       (:underline (:style line :color ,detai-256-blue)))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :background ,detai-256-background
                                        :weight bold
                                        :underline t))))

   `(flycheck-fringe-error
     ((,detai-class (:foreground ,detai-red-l
                                   :background unspecified
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-red-l
                                        :background unspecified
                                        :weight bold))))

   `(flycheck-fringe-warning
     ((,detai-class (:foreground ,detai-orange-l
                                   :background unspecified
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-orange-l
                                        :background unspecified
                                        :weight bold))))

   `(flycheck-fringe-info
     ((,detai-class (:foreground ,detai-blue-l
                                   :background unspecified
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-blue-l
                                        :background unspecified
                                        :weight bold))))

   ;; flyspell
   `(flyspell-duplicate
     ((,(append '((supports :underline (:style wave))) detai-class)
       (:underline (:style wave :color ,detai-yellow)
                   :inherit unspecified))
      (,detai-class (:foreground ,detai-yellow
                                   :weight bold
                                   :underline t))
      (,(append '((supports :underline (:style wave))) detai-256-class )
       (:underline (:style wave :color ,detai-256-yellow)
                   :inherit unspecified))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight bold
                                        :underline t))))

   `(flyspell-incorrect
     ((,(append '((supports :underline (:style wave))) detai-class)
       (:underline (:style wave :color ,detai-red)
                   :inherit unspecified))
      (,detai-class (:foreground ,detai-red
                                   :weight bold
                                   :underline t))
      (,(append '((supports :underline (:style wave))) detai-256-class )
       (:underline (:style wave :color ,detai-256-red)
                   :inherit unspecified))
      (,detai-256-class (:foreground ,detai-256-red
                                        :weight bold
                                        :underline t))))


   ;; git-gutter
   `(git-gutter:added
     ((,detai-class (:background ,detai-green
                                   :foreground ,detai-background
                                   :inherit bold))
      (,detai-256-class (:background ,detai-256-green
                                        :foreground ,detai-256-background
                                        :inherit bold))))

   `(git-gutter:deleted
     ((,detai-class (:background ,detai-red
                                   :foreground ,detai-background
                                   :inherit bold))
      (,detai-256-class (:background ,detai-256-red
                                        :foreground ,detai-256-background
                                        :inherit bold))))

   `(git-gutter:modified
     ((,detai-class (:background ,detai-blue
                                   :foreground ,detai-background
                                   :inherit bold))
      (,detai-256-class (:background ,detai-256-blue
                                        :foreground ,detai-256-background
                                        :inherit bold))))

   `(git-gutter:unchanged
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-background
                                   :inherit bold))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-background
                                        :inherit bold))))

   ;; git-gutter-fr
   `(git-gutter-fr:added
     ((,detai-class (:foreground ,detai-green
                                   :inherit bold))
      (,detai-256-class (:foreground ,detai-256-green
                                        :inherit bold))))

   `(git-gutter-fr:deleted
     ((,detai-class (:foreground ,detai-red
                                   :inherit bold))
      (,detai-256-class (:foreground ,detai-256-red
                                        :inherit bold))))

   `(git-gutter-fr:modified
     ((,detai-class (:foreground ,detai-blue
                                   :inherit bold))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :inherit bold))))

   ;; git-gutter+ and git-gutter+-fr
   `(git-gutter+-added
     ((,detai-class (:background ,detai-green
                                   :foreground ,detai-background
                                   :inherit bold))
      (,detai-256-class (:background ,detai-256-green
                                        :foreground ,detai-256-background
                                        :inherit bold))))

   `(git-gutter+-deleted
     ((,detai-class (:background ,detai-red
                                   :foreground ,detai-background
                                   :inherit bold))
      (,detai-256-class (:background ,detai-256-red
                                        :foreground ,detai-256-background
                                        :inherit bold))))

   `(git-gutter+-modified
     ((,detai-class (:background ,detai-blue
                                   :foreground ,detai-background
                                   :inherit bold))
      (,detai-256-class (:background ,detai-256-blue
                                        :foreground ,detai-256-background
                                        :inherit bold))))

   `(git-gutter+-unchanged
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-background
                                   :inherit bold))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-background
                                        :inherit bold))))

   `(git-gutter-fr+-added
     ((,detai-class (:foreground ,detai-green
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-green
                                        :weight bold))))

   `(git-gutter-fr+-deleted
     ((,detai-class (:foreground ,detai-red
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-red
                                        :weight bold))))

   `(git-gutter-fr+-modified
     ((,detai-class (:foreground ,detai-blue
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :weight bold))))

   ;; git-timemachine
   `(git-timemachine-minibuffer-detail-face
     ((,detai-class (:foreground ,detai-blue
                                   :background ,detai-highlight-line
                                   :inherit bold))
      (,detai-256-class (:foreground ,detai-blue
                                        :background ,detai-256-highlight-line
                                        :inherit bold))))

   ;; guide-key
   `(guide-key/highlight-command-face
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(guide-key/key-face
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(guide-key/prefix-command-face
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   ;; gnus
   `(gnus-group-mail-1
     ((,detai-class (:weight bold
                               :inherit gnus-group-mail-1-empty))
      (,detai-256-class (:weight bold
                                    :inherit gnus-group-mail-1-empty))))

   `(gnus-group-mail-1-empty
     ((,detai-class (:inherit gnus-group-news-1-empty))
      (,detai-256-class (:inherit gnus-group-news-1-empty))))

   `(gnus-group-mail-2
     ((,detai-class (:weight bold
                               :inherit gnus-group-mail-2-empty))
      (,detai-256-class (:weight bold
                                    :inherit gnus-group-mail-2-empty))))

   `(gnus-group-mail-2-empty
     ((,detai-class (:inherit gnus-group-news-2-empty))
      (,detai-256-class (:inherit gnus-group-news-2-empty))))

   `(gnus-group-mail-3
     ((,detai-class (:weight bold
                               :inherit gnus-group-mail-3-empty))
      (,detai-256-class (:weight bold
                                    :inherit gnus-group-mail-3-empty))))

   `(gnus-group-mail-3-empty
     ((,detai-class (:inherit gnus-group-news-3-empty))
      (,detai-256-class (:inherit gnus-group-news-3-empty))))

   `(gnus-group-mail-low
     ((,detai-class (:weight bold
                               :inherit gnus-group-mail-low-empty))
      (,detai-256-class (:weight bold
                                    :inherit gnus-group-mail-low-empty))))

   `(gnus-group-mail-low-empty
     ((,detai-class (:inherit gnus-group-news-low-empty))
      (,detai-256-class (:inherit gnus-group-news-low-empty))))

   `(gnus-group-news-1
     ((,detai-class (:weight bold
                               :inherit gnus-group-news-1-empty))
      (,detai-256-class (:weight bold
                                    :inherit gnus-group-news-1-empty))))

   `(gnus-group-news-2
     ((,detai-class (:weight bold
                               :inherit gnus-group-news-2-empty))
      (,detai-256-class (:weight bold
                                    :inherit gnus-group-news-2-empty))))

   `(gnus-group-news-3
     ((,detai-class (:weight bold
                               :inherit gnus-group-news-3-empty))
      (,detai-256-class (:weight bold
                                    :inherit gnus-group-news-3-empty))))

   `(gnus-group-news-4
     ((,detai-class (:weight bold
                               :inherit gnus-group-news-4-empty))
      (,detai-256-class (:weight bold
                                    :inherit gnus-group-news-4-empty))))

   `(gnus-group-news-5
     ((,detai-class (:weight bold
                               :inherit gnus-group-news-5-empty))
      (,detai-256-class (:weight bold
                                    :inherit gnus-group-news-5-empty))))

   `(gnus-group-news-6
     ((,detai-class (:weight bold
                               :inherit gnus-group-news-6-empty))
      (,detai-256-class (:weight bold
                                    :inherit gnus-group-news-6-empty))))

   `(gnus-group-news-low
     ((,detai-class (:weight bold
                               :inherit gnus-group-news-low-empty))
      (,detai-256-class (:weight bold
                                    :inherit gnus-group-news-low-empty))))

   `(gnus-header-content
     ((,detai-class (:inherit message-header-other))
      (,detai-256-class (:inherit message-header-other))))

   `(gnus-header-from
     ((,detai-class (:inherit message-header-other))
      (,detai-256-class (:inherit message-header-other))))

   `(gnus-header-name
     ((,detai-class (:inherit message-header-name))
      (,detai-256-class (:inherit message-header-name))))

   `(gnus-header-newsgroups
     ((,detai-class (:inherit message-header-other))
      (,detai-256-class (:inherit message-header-other))))

   `(gnus-header-subject
     ((,detai-class (:inherit message-header-subject))
      (,detai-256-class (:inherit message-header-subject))))

   `(gnus-summary-cancelled
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(gnus-summary-high-ancient
     ((,detai-class (:foreground ,detai-blue
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :weight bold))))

   `(gnus-summary-high-read
     ((,detai-class (:foreground ,detai-green
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-green
                                        :weight bold))))

   `(gnus-summary-high-ticked
     ((,detai-class (:foreground ,detai-orange
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-orange
                                        :weight bold))))

   `(gnus-summary-high-unread
     ((,detai-class (:foreground ,detai-foreground
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :weight bold))))

   `(gnus-summary-low-ancient
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(gnus-summary-low-read
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(gnus-summary-low-ticked
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(gnus-summary-low-unread
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(gnus-summary-normal-ancient
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(gnus-summary-normal-read
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(gnus-summary-normal-ticked
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(gnus-summary-normal-unread
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(gnus-summary-selected
     ((,detai-class (:foreground ,detai-yellow
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight bold))))

   `(gnus-cite-1
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(gnus-cite-2
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(gnus-cite-3
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(gnus-cite-4
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(gnus-cite-5
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(gnus-cite-6
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(gnus-cite-7
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(gnus-cite-8
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(gnus-cite-9
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(gnus-cite-10
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(gnus-cite-11
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(gnus-group-news-1-empty
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(gnus-group-news-2-empty
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(gnus-group-news-3-empty
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(gnus-group-news-4-empty
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(gnus-group-news-5-empty
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(gnus-group-news-6-empty
     ((,detai-class (:foreground ,detai-blue-lc))
      (,detai-256-class (:foreground ,detai-256-blue-lc))))

   `(gnus-group-news-low-empty
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(gnus-signature
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(gnus-x-face
     ((,detai-class (:background ,detai-foreground
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-foreground
                                        :foreground ,detai-256-background))))


   ;; helm
   `(helm-apt-deinstalled
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(helm-apt-installed
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(helm-bookmark-directory
     ((,detai-class (:inherit helm-ff-directory))
      (,detai-256-class (:inherit helm-ff-directory))))

   `(helm-bookmark-file
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(helm-bookmark-gnus
     ((,detai-class (:foreground ,detai-cyan))
      (,detai-256-class (:foreground ,detai-256-cyan))))

   `(helm-bookmark-info
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(helm-bookmark-man
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   `(helm-bookmark-w3m
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(helm-bookmarks-su
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(helm-buffer-file
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(helm-buffer-directory
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(helm-buffer-process
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(helm-buffer-saved-out
     ((,detai-class (:foreground ,detai-red
                                   :background ,detai-background
                                   :inverse-video t))
      (,detai-256-class (:foreground ,detai-256-red
                                        :background ,detai-256-background
                                        :inverse-video t))))

   `(helm-buffer-size
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(helm-candidate-number
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-emphasis
                                   :bold t))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-emphasis
                                        :bold t))))

   `(helm-ff-directory
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(helm-ff-executable
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(helm-ff-file
     ((,detai-class (:background ,detai-background
                                   :foreground ,detai-foreground))
      (,detai-256-class (:background ,detai-256-background
                                        :foreground ,detai-256-foreground))))

   `(helm-ff-invalid-symlink
     ((,detai-class (:background ,detai-background
                                   :foreground ,detai-orange
                                   :slant italic))
      (,detai-256-class (:background ,detai-256-background
                                        :foreground ,detai-256-orange
                                        :slant italic))))

   `(helm-ff-prefix
     ((,detai-class (:background ,detai-green
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-green
                                        :foreground ,detai-256-background))))

   `(helm-ff-symlink
     ((,detai-class (:foreground ,detai-cyan))
      (,detai-256-class (:foreground ,detai-256-cyan))))

   `(helm-grep-file
     ((,detai-class (:foreground ,detai-cyan
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-cyan
                                        :underline t))))

   `(helm-grep-finish
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(helm-grep-lineno
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(helm-grep-match
     ((,detai-class (:inherit helm-match)))
     ((,detai-256-class (:inherit helm-match))))

   `(helm-grep-running
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(helm-header
     ((,detai-class (:inherit header-line))
      (,detai-256-class (:inherit terminal-header-line))))

   `(helm-lisp-completion-info
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(helm-lisp-show-completion
     ((,detai-class (:foreground ,detai-yellow
                                   :background ,detai-highlight-line
                                   :bold t))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :background ,detai-256-highlight-line
                                        :bold t))))

   `(helm-M-x-key
     ((,detai-class (:foreground ,detai-orange
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-orange
                                        :underline t))))

   `(helm-moccur-buffer
     ((,detai-class (:foreground ,detai-cyan
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-cyan
                                        :underline t))))

   `(helm-match
     ((,detai-class (:foreground ,detai-green :inherit bold))
      (,detai-256-class (:foreground ,detai-256-green :inherit bold))))

   `(helm-match-item
     ((,detai-class (:inherit helm-match))
      (,detai-256-class (:inherit helm-match))))

   `(helm-selection
     ((,detai-class (:background ,detai-highlight
                                   :inherit bold
                                   :underline nil))
      (,detai-256-class (:background ,detai-256-highlight
                                        :inherit bold
                                        :underline nil))))

   `(helm-selection-line
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-emphasis
                                   :underline nil))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-emphasis
                                        :underline nil))))

   `(helm-separator
     ((,detai-class (:foreground ,detai-gray))
      (,detai-256-class (:foreground ,detai-256-gray))))

   `(helm-source-header
     ((,detai-class (:background ,detai-violet-l
                                   :foreground ,detai-background
                                   :underline nil))
      (,detai-256-class (:background ,detai-256-violet-l
                                        :foreground ,detai-256-background
                                        :underline nil))))

   `(helm-swoop-target-line-face
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-256-highlight-line))))

   `(helm-swoop-target-line-block-face
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-256-highlight-line))))

   `(helm-swoop-target-word-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(helm-time-zone-current
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(helm-time-zone-home
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(helm-visible-mark
     ((,detai-class (:background ,detai-background
                                   :foreground ,detai-magenta :bold t))
      (,detai-256-class (:background ,detai-256-background
                                        :foreground ,detai-256-magenta :bold t))))

   ;; helm-ls-git
   `(helm-ls-git-modified-not-staged-face
     ((,detai-class :foreground ,detai-blue)
      (,detai-256-class  :foreground ,detai-256-blue)))

   `(helm-ls-git-modified-and-staged-face
     ((,detai-class :foreground ,detai-blue-l)
      (,detai-256-class  :foreground ,detai-256-blue-l)))

   `(helm-ls-git-renamed-modified-face
     ((,detai-class :foreground ,detai-blue-l)
      (,detai-256-class  :foreground ,detai-256-blue-l)))

   `(helm-ls-git-untracked-face
     ((,detai-class :foreground ,detai-orange)
      (,detai-256-class  :foreground ,detai-256-orange)))

   `(helm-ls-git-added-copied-face
     ((,detai-class :foreground ,detai-green)
      (,detai-256-class  :foreground ,detai-256-green)))

   `(helm-ls-git-added-modified-face
     ((,detai-class :foreground ,detai-green-l)
      (,detai-256-class  :foreground ,detai-256-green-l)))

   `(helm-ls-git-deleted-not-staged-face
     ((,detai-class :foreground ,detai-red)
      (,detai-256-class  :foreground ,detai-256-red)))

   `(helm-ls-git-deleted-and-staged-face
     ((,detai-class :foreground ,detai-red-l)
      (,detai-256-class  :foreground ,detai-256-red-l)))

   `(helm-ls-git-conflict-face
     ((,detai-class :foreground ,detai-yellow)
      (,detai-256-class  :foreground ,detai-256-yellow)))

   ;; hi-lock-mode
   `(hi-yellow
     ((,detai-class (:foreground ,detai-yellow-lc
                                   :background ,detai-yellow-hc))
      (,detai-256-class (:foreground ,detai-256-yellow-lc
                                        :background ,detai-256-yellow-hc))))

   `(hi-pink
     ((,detai-class (:foreground ,detai-magenta-lc
                                   :background ,detai-magenta-hc))
      (,detai-256-class (:foreground ,detai-256-magenta-lc
                                        :background ,detai-256-magenta-hc))))

   `(hi-green
     ((,detai-class (:foreground ,detai-green-lc
                                   :background ,detai-green-hc))
      (,detai-256-class (:foreground ,detai-256-green-lc
                                        :background ,detai-256-green-hc))))

   `(hi-blue
     ((,detai-class (:foreground ,detai-blue-lc
                                   :background ,detai-blue-hc))
      (,detai-256-class (:foreground ,detai-256-blue-lc
                                        :background ,detai-256-blue-hc))))

   `(hi-black-b
     ((,detai-class (:foreground ,detai-emphasis
                                   :background ,detai-background
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :background ,detai-256-background
                                        :weight bold))))

   `(hi-blue-b
     ((,detai-class (:foreground ,detai-blue-lc
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-blue-lc
                                        :weight bold))))

   `(hi-green-b
     ((,detai-class (:foreground ,detai-green-lc
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-green-lc
                                        :weight bold))))

   `(hi-red-b
     ((,detai-class (:foreground ,detai-red
                                   :weight bold))))

   `(hi-black-hb
     ((,detai-class (:foreground ,detai-emphasis
                                   :background ,detai-background
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :background ,detai-256-background
                                        :weight bold))))

   ;; highlight-changes
   `(highlight-changes
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(highlight-changes-delete
     ((,detai-class (:foreground ,detai-red
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-red
                                        :underline t))))

   ;; highlight-indentation
   `(highlight-indentation-face
     ((,detai-class (:background ,detai-gray))
      (,detai-256-class (:background ,detai-256-gray))))

   `(highlight-indentation-current-column-face
     ((,detai-class (:background ,detai-gray))
      (,detai-256-class (:background ,detai-256-gray))))

   ;; highlight-symbol
   `(highlight-symbol-face
     ((,detai-class (:background ,detai-highlight))
      (,detai-256-class (:background ,detai-256-highlight))))

   ;; hl-line-mode
   `(hl-line
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-256-highlight-line))))

   `(hl-line-face
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-256-highlight-line))))

   ;; ido-mode
   `(ido-first-match
     ((,detai-class (:foreground ,detai-yellow
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight normal))))

   `(ido-only-match
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-green
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-yellow
                                        :weight normal))))

   `(ido-subdir
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(ido-incomplete-regexp
     ((,detai-class (:foreground ,detai-red
                                   :weight bold ))
      (,detai-256-class (:foreground ,detai-256-red
                                        :weight bold ))))

   `(ido-indicator
     ((,detai-class (:background ,detai-red
                                   :foreground ,detai-background
                                   :width condensed))
      (,detai-256-class (:background ,detai-256-red
                                        :foreground ,detai-256-background
                                        :width condensed))))

   `(ido-virtual
     ((,detai-class (:foreground ,detai-cyan))
      (,detai-256-class (:foreground ,detai-256-cyan))))

   ;; info
   `(info-header-xref
     ((,detai-class (:foreground ,detai-green
                                   :inherit bold
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-green
                                        :inherit bold
                                        :underline t))))

   `(info-menu
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(info-node
     ((,detai-class (:foreground ,detai-violet
                                   :inherit bold))
      (,detai-256-class (:foreground ,detai-256-violet
                                        :inherit bold))))

   `(info-quoted-name
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(info-reference-item
     ((,detai-class (:background nil
                                   :underline t
                                   :inherit bold))
      (,detai-256-class (:background nil
                                        :underline t
                                        :inherit bold))))

   `(info-string
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(info-title-1
     ((,detai-class (:height ,detai-height-plus-4))
      (,detai-256-class (:height ,detai-height-plus-4))))

   `(info-title-2
     ((,detai-class (:height ,detai-height-plus-3))
      (,detai-256-class (:height ,detai-height-plus-3))))

   `(info-title-3
     ((,detai-class (:height ,detai-height-plus-2))
      (,detai-256-class (:height ,detai-height-plus-2))))

   `(info-title-4
     ((,detai-class (:height ,detai-height-plus-1))
      (,detai-256-class (:height ,detai-height-plus-1))))

   ;; ivy
   `(ivy-current-match
     ((,detai-class (:background ,detai-gray :inherit bold))
      (,detai-256-class (:background ,detai-gray-l :inherit bold))))

   `(ivy-minibuffer-match-face-1
     ((,detai-class (:inherit bold))
      (,detai-256-class (:inherit bold))))

   `(ivy-minibuffer-match-face-2
     ((,detai-class (:foreground ,detai-violet
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-violet
                                        :underline t))))

   `(ivy-minibuffer-match-face-3
     ((,detai-class (:foreground ,detai-green
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-green
                                        :underline t))))

   `(ivy-minibuffer-match-face-4
     ((,detai-class (:foreground ,detai-yellow
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :underline t))))

   `(ivy-remote
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(swiper-line-face
     ((,detai-class (:background ,detai-highlight-line))))

   `(swiper-match-face-1
     ((,detai-class (:background ,detai-gray-d))))

   `(swiper-match-face-2
     ((,detai-class (:background ,detai-green))))

   `(swiper-match-face-3
     ((,detai-class (:background ,detai-orange))))

   `(swiper-match-face-4
     ((,detai-class (:background ,detai-magenta))))

   ;; jabber
   `(jabber-activity-face
     ((,detai-class (:weight bold
                               :foreground ,detai-red))
      (,detai-256-class (:weight bold
                                    :foreground ,detai-256-red))))

   `(jabber-activity-personal-face
     ((,detai-class (:weight bold
                               :foreground ,detai-blue))
      (,detai-256-class (:weight bold
                                    :foreground ,detai-256-blue))))

   `(jabber-chat-error
     ((,detai-class (:weight bold
                               :foreground ,detai-red))
      (,detai-256-class (:weight bold
                                    :foreground ,detai-256-red))))

   `(jabber-chat-prompt-foreign
     ((,detai-class (:weight bold
                               :foreground ,detai-red))
      (,detai-256-class (:weight bold
                                    :foreground ,detai-256-red))))

   `(jabber-chat-prompt-local
     ((,detai-class (:weight bold
                               :foreground ,detai-blue))
      (,detai-256-class (:weight bold
                                    :foreground ,detai-256-blue))))

   `(jabber-chat-prompt-system
     ((,detai-class (:weight bold
                               :foreground ,detai-green))
      (,detai-256-class (:weight bold
                                    :foreground ,detai-256-green))))

   `(jabber-chat-text-foreign
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(jabber-chat-text-local
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(jabber-chat-rare-time-face
     ((,detai-class (:underline t
                                  :foreground ,detai-green))
      (,detai-256-class (:underline t
                                       :foreground ,detai-256-green))))

   `(jabber-roster-user-away
     ((,detai-class (:slant italic
                              :foreground ,detai-green))
      (,detai-256-class (:slant italic
                                   :foreground ,detai-256-green))))

   `(jabber-roster-user-chatty
     ((,detai-class (:weight bold
                               :foreground ,detai-orange))
      (,detai-256-class (:weight bold
                                    :foreground ,detai-256-orange))))

   `(jabber-roster-user-dnd
     ((,detai-class (:slant italic
                              :foreground ,detai-red))
      (,detai-256-class (:slant italic
                                   :foreground ,detai-256-red))))

   `(jabber-roster-user-error
     ((,detai-class (:weight light
                               :slant italic
                               :foreground ,detai-red))
      (,detai-256-class (:weight light
                                    :slant italic
                                    :foreground ,detai-256-red))))

   `(jabber-roster-user-offline
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(jabber-roster-user-online
     ((,detai-class (:weight bold
                               :foreground ,detai-blue))
      (,detai-256-class (:weight bold
                                    :foreground ,detai-256-blue))))

   `(jabber-roster-user-xa
     ((,detai-class (:slant italic
                              :foreground ,detai-magenta))
      (,detai-256-class (:slant italic
                                   :foreground ,detai-256-magenta))))

   ;; js2-mode colors
   `(js2-error
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(js2-external-variable
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(js2-function-call
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(js2-function-param
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(js2-instance-member
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   `(js2-jsdoc-html-tag-delimiter
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(js2-jsdoc-html-tag-name
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(js2-jsdoc-tag
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   `(js2-jsdoc-type
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(js2-jsdoc-value
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(js2-magic-paren
     ((,detai-class (:underline t))
      (,detai-256-class (:underline t))))

   `(js2-object-property
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(js2-private-function-call
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   `(js2-private-member
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(js2-warning
     ((,detai-class (:underline ,detai-orange))
      (,detai-256-class (:underline ,detai-256-orange))))

   ;; jedi
   `(jedi:highlight-function-argument
     ((,detai-class (:inherit bold))
      (,detai-256-class (:inherit bold))))

   ;; linum-mode
   `(linum
     ((,detai-class (:foreground ,detai-line-number
                                   :background ,detai-fringe-bg
                                   :inherit default
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-line-number
                                        :background ,detai-256-fringe-bg
                                        :inherit default
                                        :underline nil))))

   ;; line-number (>= Emacs26)
   `(line-number
     ((,detai-class (:foreground ,detai-line-number
                                   :background ,detai-fringe-bg
                                   :inherit default
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-line-number
                                        :background ,detai-256-fringe-bg
                                        :inherit default
                                        :underline nil))))
   `(line-number-current-line
     ((,detai-class (:foreground ,detai-foreground
                                   :background ,detai-fringe-bg
                                   :inherit default
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :background ,detai-256-fringe-bg
                                        :inherit default
                                        :underline nil))))

   ;; linum-relative-current-face
   `(linum-relative-current-face
     ((,detai-class (:foreground ,detai-line-number
                                   :background ,detai-highlight-line
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-line-number
                                        :background ,detai-256-highlight-line
                                        :underline nil))))

   ;; lsp-mode
   `(lsp-ui-doc-header
     ((,detai-class (:inherit org-document-title))
      (,detai-256-class (:inherit org-document-title))))

   `(lsp-ui-doc-background
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-highlight-line))))

   ;; lusty-explorer
   `(lusty-directory-face
     ((,detai-class (:inherit didetai-red-directory))
      (,detai-256-class (:inherit didetai-red-directory))))

   `(lusty-file-face
     ((,detai-class nil)
      (,detai-256-class  nil)))

   `(lusty-match-face
     ((,detai-class (:inherit ido-first-match))
      (,detai-256-class (:inherit ido-first-match))))

   `(lusty-slash-face
     ((,detai-class (:foreground ,detai-cyan
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-cyan
                                        :weight bold))))

   ;; magit
   ;;
   ;; TODO: Add supports for all magit faces
   ;; https://github.com/magit/magit/search?utf8=%E2%9C%93&q=face
   ;;
   `(magit-diff-added
     ((,detai-class (:foreground ,detai-green
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-green
                                        :background ,detai-256-background))))

   `(magit-diff-added-highlight
     ((,detai-class (:foreground ,detai-green
                                   :background ,detai-highlight-line))
      (,detai-256-class (:foreground ,detai-256-green
                                        :background ,detai-256-highlight-line))))

   `(magit-diff-removed
     ((,detai-class (:foreground ,detai-red
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-red
                                        :background ,detai-256-background))))

   `(magit-diff-removed-highlight
     ((,detai-class (:foreground ,detai-red
                                   :background ,detai-highlight-line))
      (,detai-256-class (:foreground ,detai-256-red
                                        :background ,detai-256-highlight-line))))

   `(magit-section-title
     ((,detai-class (:foreground ,detai-yellow
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight bold))))

   `(magit-branch
     ((,detai-class (:foreground ,detai-orange
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-orange
                                        :weight bold))))

   `(magit-item-highlight
     ((,detai-class (:background ,detai-highlight-line
                                   :weight unspecified))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :weight unspecified))))

   `(magit-log-author
     ((,detai-class (:foreground ,detai-cyan))
      (,detai-256-class (:foreground ,detai-256-cyan))))

   `(magit-log-graph
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(magit-log-head-label-bisect-bad
     ((,detai-class (:background ,detai-red-hc
                                   :foreground ,detai-red-lc
                                   :box 1))
      (,detai-256-class (:background ,detai-256-red-hc
                                        :foreground ,detai-256-red-lc
                                        :box 1))))

   `(magit-log-head-label-bisect-good
     ((,detai-class (:background ,detai-green-hc
                                   :foreground ,detai-green-lc
                                   :box 1))
      (,detai-256-class (:background ,detai-256-green-hc
                                        :foreground ,detai-256-green-lc
                                        :box 1))))

   `(magit-log-head-label-default
     ((,detai-class (:background ,detai-highlight-line
                                   :box 1))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :box 1))))

   `(magit-log-head-label-local
     ((,detai-class (:background ,detai-blue-lc
                                   :foreground ,detai-blue-hc
                                   :box 1))
      (,detai-256-class (:background ,detai-256-blue-lc
                                        :foreground ,detai-256-blue-hc
                                        :box 1))))

   `(magit-log-head-label-patches
     ((,detai-class (:background ,detai-red-lc
                                   :foreground ,detai-red-hc
                                   :box 1))
      (,detai-256-class (:background ,detai-256-red-lc
                                        :foreground ,detai-256-red-hc
                                        :box 1))))

   `(magit-log-head-label-remote
     ((,detai-class (:background ,detai-green-lc
                                   :foreground ,detai-green-hc
                                   :box 1))
      (,detai-256-class (:background ,detai-256-green-lc
                                        :foreground ,detai-256-green-hc
                                        :box 1))))

   `(magit-log-head-label-tags
     ((,detai-class (:background ,detai-yellow-lc
                                   :foreground ,detai-yellow-hc
                                   :box 1))
      (,detai-256-class (:background ,detai-256-yellow-lc
                                        :foreground ,detai-256-yellow-hc
                                        :box 1))))

   `(magit-log-sha1
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   ;; man
   `(Man-overstrike
     ((,detai-class (:foreground ,detai-blue
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :weight bold))))

   `(Man-reverse
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(Man-underline
     ((,detai-class (:foreground ,detai-green :underline t))
      (,detai-256-class (:foreground ,detai-256-green :underline t))))

   ;; monky
   `(monky-section-title
     ((,detai-class (:foreground ,detai-yellow
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight bold))))

   `(monky-diff-add
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(monky-diff-del
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   ;; markdown-mode
   `(markdown-header-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(markdown-header-face-1
     ((,detai-class (:inherit markdown-header-face
                                :height ,detai-height-plus-4))
      (,detai-256-class (:inherit markdown-header-face
                                     :height ,detai-height-plus-4))))

   `(markdown-header-face-2
     ((,detai-class (:inherit markdown-header-face
                                :height ,detai-height-plus-3))
      (,detai-256-class (:inherit markdown-header-face
                                     :height ,detai-height-plus-3))))

   `(markdown-header-face-3
     ((,detai-class (:inherit markdown-header-face
                                :height ,detai-height-plus-2))
      (,detai-256-class (:inherit markdown-header-face
                                     :height ,detai-height-plus-2))))

   `(markdown-header-face-4
     ((,detai-class (:inherit markdown-header-face
                                :height ,detai-height-plus-1))
      (,detai-256-class (:inherit markdown-header-face
                                     :height ,detai-height-plus-1))))

   `(markdown-header-face-5
     ((,detai-class (:inherit markdown-header-face))
      (,detai-256-class (:inherit markdown-header-face))))

   `(markdown-header-face-6
     ((,detai-class (:inherit markdown-header-face))
      (,detai-256-class (:inherit markdown-header-face))))

   ;; message-mode
   `(message-cited-text
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(message-header-name
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(message-header-other
     ((,detai-class (:foreground ,detai-foreground
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :weight normal))))

   `(message-header-to
     ((,detai-class (:foreground ,detai-foreground
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :weight normal))))

   `(message-header-cc
     ((,detai-class (:foreground ,detai-foreground
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :weight normal))))

   `(message-header-newsgroups
     ((,detai-class (:foreground ,detai-yellow
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight bold))))

   `(message-header-subject
     ((,detai-class (:foreground ,detai-cyan
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-cyan
                                        :weight normal))))

   `(message-header-xheader
     ((,detai-class (:foreground ,detai-cyan))
      (,detai-256-class (:foreground ,detai-256-cyan))))

   `(message-mml
     ((,detai-class (:foreground ,detai-yellow
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight bold))))

   `(message-separator
     ((,detai-class (:foreground ,detai-comments
                                   :slant italic))
      (,detai-256-class (:foreground ,detai-256-comments
                                        :slant italic))))

   ;; mew
   `(mew-face-header-subject
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(mew-face-header-from
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(mew-face-header-date
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(mew-face-header-to
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(mew-face-header-key
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(mew-face-header-private
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(mew-face-header-important
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(mew-face-header-marginal
     ((,detai-class (:foreground ,detai-foreground
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :weight bold))))

   `(mew-face-header-warning
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(mew-face-header-xmew
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(mew-face-header-xmew-bad
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(mew-face-body-url
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(mew-face-body-comment
     ((,detai-class (:foreground ,detai-foreground
                                   :slant italic))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :slant italic))))

   `(mew-face-body-cite1
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(mew-face-body-cite2
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(mew-face-body-cite3
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(mew-face-body-cite4
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(mew-face-body-cite5
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(mew-face-mark-review
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(mew-face-mark-escape
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(mew-face-mark-delete
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(mew-face-mark-unlink
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(mew-face-mark-refile
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(mew-face-mark-unread
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(mew-face-eof-message
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(mew-face-eof-part
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   ;; mingus
   `(mingus-directory-face
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(mingus-pausing-face
     ((,detai-class (:foreground ,detai-magenta))
      (,detai-256-class (:foreground ,detai-256-magenta))))

   `(mingus-playing-face
     ((,detai-class (:foreground ,detai-cyan))
      (,detai-256-class (:foreground ,detai-256-cyan))))

   `(mingus-playlist-face
     ((,detai-class (:foreground ,detai-cyan ))
      (,detai-256-class (:foreground ,detai-256-cyan ))))

   `(mingus-song-file-face
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(mingus-stopped-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   ;; mmm
   `(mmm-init-submode-face
     ((,detai-class (:background ,detai-violet-d))
      (,detai-256-class (:background ,detai-256-violet-d))))

   `(mmm-cleanup-submode-face
     ((,detai-class (:background ,detai-orange-d))
      (,detai-256-class (:background ,detai-256-orange-d))))

   `(mmm-declaration-submode-face
     ((,detai-class (:background ,detai-cyan-d))
      (,detai-256-class (:background ,detai-256-cyan-d))))

   `(mmm-comment-submode-face
     ((,detai-class (:background ,detai-blue-d))
      (,detai-256-class (:background ,detai-256-blue-d))))

   `(mmm-output-submode-face
     ((,detai-class (:background ,detai-red-d))
      (,detai-256-class (:background ,detai-256-red-d))))

   `(mmm-special-submode-face
     ((,detai-class (:background ,detai-green-d))
      (,detai-256-class (:background ,detai-256-green-d))))

   `(mmm-code-submode-face
     ((,detai-class (:background ,detai-gray))
      (,detai-256-class (:background ,detai-256-gray))))

   `(mmm-default-submode-face
     ((,detai-class (:background ,detai-gray-d))
      (,detai-256-class (:background ,detai-256-gray-d))))

   ;; moccur
   `(moccur-current-line-face
     ((,detai-class (:underline t))
      (,detai-256-class (:underline t))))

   `(moccur-edit-done-face
     ((,detai-class (:foreground ,detai-comments
                                   :background ,detai-background
                                   :slant italic))
      (,detai-256-class (:foreground ,detai-256-comments
                                        :background ,detai-256-background
                                        :slant italic))))

   `(moccur-edit-face
     ((,detai-class (:background ,detai-yellow
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-yellow
                                        :foreground ,detai-256-background))))

   `(moccur-edit-file-face
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-256-highlight-line))))

   `(moccur-edit-reject-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(moccur-face
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-emphasis
                                   :weight bold))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-emphasis
                                        :weight bold))))

   `(search-buffers-face
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-emphasis
                                   :weight bold))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-emphasis
                                        :weight bold))))

   `(search-buffers-header-face
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-yellow
                                   :weight bold))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-yellow
                                        :weight bold))))

   ;; mu4e
   `(mu4e-cited-1-face
     ((,detai-class (:foreground ,detai-green
                                   :slant italic
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-green
                                        :slant italic
                                        :weight normal))))

   `(mu4e-cited-2-face
     ((,detai-class (:foreground ,detai-blue
                                   :slant italic
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :slant italic
                                        :weight normal))))

   `(mu4e-cited-3-face
     ((,detai-class (:foreground ,detai-orange
                                   :slant italic
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-orange
                                        :slant italic
                                        :weight normal))))

   `(mu4e-cited-4-face
     ((,detai-class (:foreground ,detai-yellow
                                   :slant italic
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :slant italic
                                        :weight normal))))

   `(mu4e-cited-5-face
     ((,detai-class (:foreground ,detai-cyan
                                   :slant italic
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-cyan
                                        :slant italic
                                        :weight normal))))

   `(mu4e-cited-6-face
     ((,detai-class (:foreground ,detai-green
                                   :slant italic
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-green
                                        :slant italic
                                        :weight normal))))

   `(mu4e-cited-7-face
     ((,detai-class (:foreground ,detai-blue
                                   :slant italic
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :slant italic
                                        :weight normal))))

   `(mu4e-flagged-face
     ((,detai-class (:foreground ,detai-magenta
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-magenta
                                        :weight bold))))

   `(mu4e-view-url-number-face
     ((,detai-class (:foreground ,detai-yellow
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight normal))))

   `(mu4e-warning-face
     ((,detai-class (:foreground ,detai-red
                                   :slant normal
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-red
                                        :slant normal
                                        :weight bold))))

   `(mu4e-header-highlight-face
     ((,detai-class (:inherit unspecified
                                :foreground unspecified
                                :background ,detai-highlight-line
                                :underline ,detai-emphasis
                                :weight normal))
      (,detai-256-class (:inherit unspecified
                                     :foreground unspecified
                                     :background ,detai-256-highlight-line
                                     :underline ,detai-256-emphasis
                                     :weight normal))))


   `(mu4e-draft-face
     ((,detai-class (:inherit font-lock-string-face))
      (,detai-256-class (:inherit font-lock-string-face))))

   `(mu4e-footer-face
     ((,detai-class (:inherit font-lock-comment-face))
      (,detai-256-class (:inherit font-lock-comment-face))))

   `(mu4e-forwarded-face
     ((,detai-class (:inherit font-lock-builtin-face
                                :weight normal))
      (,detai-256-class (:inherit font-lock-builtin-face
                                     :weight normal))))

   `(mu4e-header-face
     ((,detai-class (:inherit default))
      (,detai-256-class (:inherit default))))

   `(mu4e-header-marks-face
     ((,detai-class (:inherit font-lock-preprocessor-face))
      (,detai-256-class (:inherit font-lock-preprocessor-face))))

   `(mu4e-header-title-face
     ((,detai-class (:inherit font-lock-type-face))
      (,detai-256-class (:inherit font-lock-type-face))))

   `(mu4e-highlight-face
     ((,detai-class (:inherit font-lock-pseudo-keyword-face
                                :weight bold))
      (,detai-256-class (:inherit font-lock-pseudo-keyword-face
                                     :weight bold))))

   `(mu4e-moved-face
     ((,detai-class (:inherit font-lock-comment-face
                                :slant italic))
      (,detai-256-class (:inherit font-lock-comment-face
                                     :slant italic))))

   `(mu4e-ok-face
     ((,detai-class (:inherit font-lock-comment-face
                                :slant normal
                                :weight bold))
      (,detai-256-class (:inherit font-lock-comment-face
                                     :slant normal
                                     :weight bold))))

   `(mu4e-replied-face
     ((,detai-class (:inherit font-lock-builtin-face
                                :weight normal))
      (,detai-256-class (:inherit font-lock-builtin-face
                                     :weight normal))))

   `(mu4e-system-face
     ((,detai-class (:inherit font-lock-comment-face
                                :slant italic))
      (,detai-256-class (:inherit font-lock-comment-face
                                     :slant italic))))

   `(mu4e-title-face
     ((,detai-class (:inherit font-lock-type-face
                                :weight bold))
      (,detai-256-class (:inherit font-lock-type-face
                                     :weight bold))))

   `(mu4e-trashed-face
     ((,detai-class (:inherit font-lock-comment-face
                                :strike-through t))
      (,detai-256-class (:inherit font-lock-comment-face
                                     :strike-through t))))

   `(mu4e-unread-face
     ((,detai-class (:inherit font-lock-keyword-face
                                :weight bold))
      (,detai-256-class (:inherit font-lock-keyword-face
                                     :weight bold))))

   `(mu4e-view-attach-number-face
     ((,detai-class (:inherit font-lock-variable-name-face
                                :weight bold))
      (,detai-256-class (:inherit font-lock-variable-name-face
                                     :weight bold))))

   `(mu4e-view-contact-face
     ((,detai-class (:foreground ,detai-foreground
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :weight normal))))

   `(mu4e-view-header-key-face
     ((,detai-class (:inherit message-header-name
                                :weight normal))
      (,detai-256-class (:inherit message-header-name
                                     :weight normal))))

   `(mu4e-view-header-value-face
     ((,detai-class (:foreground ,detai-cyan
                                   :weight normal
                                   :slant normal))
      (,detai-256-class (:foreground ,detai-256-cyan
                                        :weight normal
                                        :slant normal))))

   `(mu4e-view-link-face
     ((,detai-class (:inherit link))
      (,detai-256-class (:inherit link))))

   `(mu4e-view-special-header-value-face
     ((,detai-class (:foreground ,detai-blue
                                   :weight normal
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :weight normal
                                        :underline nil))))

   ;; mumamo
   `(mumamo-background-chunk-submode1
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-256-highlight-line))))

   ;; nav
   `(nav-face-heading
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(nav-face-button-num
     ((,detai-class (:foreground ,detai-cyan))
      (,detai-256-class (:foreground ,detai-256-cyan))))

   `(nav-face-dir
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(nav-face-hdir
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(nav-face-file
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(nav-face-hfile
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   ;; nav-flash
   `(nav-flash-face
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-256-highlight-line))))

   ;; neo-tree
   `(neo-banner-face
     ((,detai-class (:foreground ,detai-blue
                                   :background ,detai-background
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :background ,detai-256-background
                                        :weight bold))))


   `(neo-header-face
     ((,detai-class (:foreground ,detai-emphasis
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :background ,detai-256-background))))

   `(neo-root-dir-face
     ((,detai-class (:foreground ,detai-green
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-green
                                        :background ,detai-256-background))))

   `(neo-dir-link-face
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :background ,detai-256-background))))

   `(neo-file-link-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(neo-button-face
     ((,detai-class (:underline nil))
      (,detai-256-class (:underline nil))))

   `(neo-expand-btn-face
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(neo-vc-default-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(neo-vc-user-face
     ((,detai-class (:foreground ,detai-red
                                   :slant italic))
      (,detai-256-class (:foreground ,detai-256-red
                                        :slant italic))))

   `(neo-vc-up-to-date-face
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(neo-vc-edited-face
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(neo-vc-needs-update-face
     ((,detai-class (:underline t))
      (,detai-256-class (:underline t))))

   `(neo-vc-needs-merge-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(neo-vc-unlocked-changes-face
     ((,detai-class (:foreground ,detai-red
                                   :background ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-red
                                        :background ,detai-256-comments))))

   `(neo-vc-added-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(neo-vc-removed-face
     ((,detai-class (:strike-through t))
      (,detai-256-class (:strike-through t))))

   `(neo-vc-conflict-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(neo-vc-missing-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(neo-vc-ignored-face
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   ;; adoc-mode / markup
   `(markup-meta-face
     ((,detai-class (:foreground ,detai-gray-l))
      (,detai-256-class (:foreground ,detai-256-gray-l))))

   `(markup-table-face
     ((,detai-class (:foreground ,detai-blue-hc
                                   :background ,detai-blue-lc))
      (,detai-256-class (:foreground ,detai-256-blue-hc
                                        :background ,detai-256-blue-lc))))

   `(markup-verbatim-face
     ((,detai-class (:background ,detai-orange-lc))
      (,detai-256-class (:background ,detai-256-orange-lc))))

   `(markup-list-face
     ((,detai-class (:foreground ,detai-violet-hc
                                   :background ,detai-violet-lc))
      (,detai-256-class (:foreground ,detai-256-violet-hc
                                        :background ,detai-256-violet-lc))))

   `(markup-replacement-face
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   `(markup-complex-replacement-face
     ((,detai-class (:foreground ,detai-violet-hc
                                   :background ,detai-violet-lc))
      (,detai-256-class (:foreground ,detai-256-violet-hc
                                        :background ,detai-256-violet-lc))))

   `(markup-gen-face
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(markup-secondary-text-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   ;; org-mode
   `(org-agenda-structure
     ((,detai-class (:foreground ,detai-emphasis
                                   :background ,detai-highlight-line
                                   :weight bold
                                   :slant normal
                                   :inverse-video nil
                                   :height ,detai-height-plus-1
                                   :underline nil
                                   :box (:line-width 2 :color ,detai-background)))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :background ,detai-256-highlight-line
                                        :weight bold
                                        :slant normal
                                        :inverse-video nil
                                        :height ,detai-height-plus-1
                                        :underline nil
                                        :box (:line-width 2 :color ,detai-256-background)))))

   `(org-agenda-calendar-event
     ((,detai-class (:foreground ,detai-emphasis))
      (,detai-256-class (:foreground ,detai-256-emphasis))))

   `(org-agenda-calendar-sexp
     ((,detai-class (:foreground ,detai-foreground
                                   :slant italic))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :slant italic))))

   `(org-agenda-date
     ((,detai-class (:foreground ,detai-comments
                                   :background ,detai-background
                                   :weight normal
                                   :inverse-video nil
                                   :overline nil
                                   :slant normal
                                   :height 1.0
                                   :box (:line-width 2 :color ,detai-background)))
      (,detai-256-class (:foreground ,detai-256-comments
                                        :background ,detai-256-background
                                        :weight normal
                                        :inverse-video nil
                                        :overline nil
                                        :slant normal
                                        :height 1.0
                                        :box (:line-width 2 :color ,detai-256-background)))) t)

   `(org-agenda-date-weekend
     ((,detai-class (:inherit org-agenda-date
                                :inverse-video nil
                                :background unspecified
                                :foreground ,detai-comments
                                :weight unspecified
                                :underline t
                                :overline nil
                                :box unspecified))
      (,detai-256-class (:inherit org-agenda-date
                                     :inverse-video nil
                                     :background unspecified
                                     :foreground ,detai-256-comments
                                     :weight unspecified
                                     :underline t
                                     :overline nil
                                     :box unspecified))) t)

   `(org-agenda-date-today
     ((,detai-class (:inherit org-agenda-date
                                :inverse-video t
                                :weight bold
                                :underline unspecified
                                :overline nil
                                :box unspecified
                                :foreground ,detai-blue
                                :background ,detai-background))
      (,detai-256-class (:inherit org-agenda-date
                                     :inverse-video t
                                     :weight bold
                                     :underline unspecified
                                     :overline nil
                                     :box unspecified
                                     :foreground ,detai-256-blue
                                     :background ,detai-256-background))) t)

   `(org-agenda-done
     ((,detai-class (:foreground ,detai-comments
                                   :slant italic))
      (,detai-256-class (:foreground ,detai-256-comments
                                        :slant italic))) t)

   `(org-archived
     ((,detai-class (:foreground ,detai-comments
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-comments
                                        :weight normal))))

   `(org-block
     ((,detai-class (:foreground ,detai-emphasis
                                   :background ,detai-highlight-alt))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :background ,detai-256-highlight-alt))))

   `(org-block-background
     ((,detai-class (:background ,detai-highlight-alt))
      (,detai-256-class (:background ,detai-256-highlight-alt))))

   `(org-block-begin-line
     ((,detai-class (:foreground ,detai-comments
                                   :background ,detai-gray-d
                                   :slant italic))
      (,detai-256-class (:foreground ,detai-256-comments
                                        :background ,detai-256-gray-d
                                        :slant italic))))

   `(org-block-end-line
     ((,detai-class (:foreground ,detai-comments
                                   :background ,detai-gray-d
                                   :slant italic))
      (,detai-256-class (:foreground ,detai-256-comments
                                        :background ,detai-256-gray-d
                                        :slant italic))))

   `(org-checkbox
     ((,detai-class (:background ,detai-background
                                   :foreground ,detai-foreground
                                   :box (:line-width 1 :style released-button)))
      (,detai-256-class (:background ,detai-256-background
                                        :foreground ,detai-256-foreground
                                        :box (:line-width 1 :style released-button)))))

   `(org-code
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(org-date
     ((,detai-class (:foreground ,detai-blue
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :underline t))))

   `(org-done
     ((,detai-class (:weight bold
                               :foreground ,detai-green))
      (,detai-256-class (:weight bold
                                    :foreground ,detai-256-green))))

   `(org-ellipsis
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(org-formula
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(org-headline-done
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(org-hide
     ((,detai-class (:foreground ,detai-background))
      (,detai-256-class (:foreground ,detai-256-background))))

   `(org-level-1
     ((,detai-class (:inherit ,detai-pitch
                                :height ,detai-height-plus-4
                                :foreground ,detai-green))
      (,detai-256-class (:inherit ,detai-pitch
                                     :height ,detai-height-plus-4
                                     :foreground ,detai-256-orange))))

   `(org-level-2
     ((,detai-class (:inherit ,detai-pitch
                                :height ,detai-height-plus-3
                                :foreground ,detai-blue))
      (,detai-256-class (:inherit ,detai-pitch
                                     :height ,detai-height-plus-3
                                     :foreground ,detai-256-green))))

   `(org-level-3
     ((,detai-class (:inherit ,detai-pitch
                                :height ,detai-height-plus-2
                                :foreground ,detai-yellow))
      (,detai-256-class (:inherit ,detai-pitch
                                     :height ,detai-height-plus-2
                                     :foreground ,detai-256-blue))))

   `(org-level-4
     ((,detai-class (:inherit ,detai-pitch
                                :height ,detai-height-plus-1
                                :foreground ,detai-orange))
      (,detai-256-class (:inherit ,detai-pitch
                                     :height ,detai-height-plus-1
                                     :foreground ,detai-256-yellow))))

   `(org-level-5
     ((,detai-class (:inherit ,detai-pitch
                                :foreground ,detai-cyan))
      (,detai-256-class (:inherit ,detai-pitch
                                     :foreground ,detai-256-cyan))))

   `(org-level-6
     ((,detai-class (:inherit ,detai-pitch
                                :foreground ,detai-green))
      (,detai-256-class (:inherit ,detai-pitch
                                     :foreground ,detai-256-green))))

   `(org-level-7
     ((,detai-class (:inherit ,detai-pitch
                                :foreground ,detai-red))
      (,detai-256-class (:inherit ,detai-pitch
                                     :foreground ,detai-256-red))))

   `(org-level-8
     ((,detai-class (:inherit ,detai-pitch
                                :foreground ,detai-blue))
      (,detai-256-class (:inherit ,detai-pitch
                                     :foreground ,detai-256-blue))))

   `(org-link
     ((,detai-class (:foreground ,detai-blue
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :underline t))))

   `(org-sexp-date
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   `(org-scheduled
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(org-scheduled-previously
     ((,detai-class (:foreground ,detai-cyan))
      (,detai-256-class (:foreground ,detai-256-cyan))))

   `(org-scheduled-today
     ((,detai-class (:foreground ,detai-blue
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :weight normal))))

   `(org-special-keyword
     ((,detai-class (:foreground ,detai-comments
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-comments
                                        :weight bold))))

   `(org-table
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(org-tag
     ((,detai-class (:weight bold))
      (,detai-256-class (:weight bold))))

   `(org-time-grid
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(org-todo
     ((,detai-class (:foreground ,detai-red
                                   :weight bold)))
     ((,detai-256-class (:foreground ,detai-256-red
                                        :weight bold))))

   `(org-upcoming-deadline
     ((,detai-class (:foreground ,detai-yellow
                                   :weight normal
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight normal
                                        :underline nil))))

   `(org-warning
     ((,detai-class (:foreground ,detai-orange
                                   :weight normal
                                   :underline nil))
      (,detai-256-class (:foreground ,detai-256-orange
                                        :weight normal
                                        :underline nil))))

   ;; org-habit (clear=blue, ready=green, alert=yellow, overdue=red. future=lower contrast)
   `(org-habit-clear-face
     ((,detai-class (:background ,detai-blue-lc
                                   :foreground ,detai-blue-hc))
      (,detai-256-class (:background ,detai-256-blue-lc
                                        :foreground ,detai-256-blue-hc))))

   `(org-habit-clear-future-face
     ((,detai-class (:background ,detai-blue-lc))
      (,detai-256-class (:background ,detai-256-blue-lc))))

   `(org-habit-ready-face
     ((,detai-class (:background ,detai-green-lc
                                   :foreground ,detai-green))
      (,detai-256-class (:background ,detai-256-green-lc
                                        :foreground ,detai-256-green))))

   `(org-habit-ready-future-face
     ((,detai-class (:background ,detai-green-lc))
      (,detai-256-class (:background ,detai-256-green-lc))))

   `(org-habit-alert-face
     ((,detai-class (:background ,detai-yellow
                                   :foreground ,detai-yellow-lc))
      (,detai-256-class (:background ,detai-256-yellow
                                        :foreground ,detai-256-yellow-lc))))

   `(org-habit-alert-future-face
     ((,detai-class (:background ,detai-yellow-lc))
      (,detai-256-class (:background ,detai-256-yellow-lc))))

   `(org-habit-overdue-face
     ((,detai-class (:background ,detai-red
                                   :foreground ,detai-red-lc))
      (,detai-256-class (:background ,detai-256-red
                                        :foreground ,detai-256-red-lc))))

   `(org-habit-overdue-future-face
     ((,detai-class (:background ,detai-red-lc))
      (,detai-256-class (:background ,detai-256-red-lc))))

   ;; latest additions
   `(org-agenda-dimmed-todo-face
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(org-agenda-restriction-lock
     ((,detai-class (:background ,detai-yellow))
      (,detai-256-class (:background ,detai-256-yellow))))

   `(org-clock-overlay
     ((,detai-class (:background ,detai-yellow))
      (,detai-256-class (:background ,detai-256-yellow))))

   `(org-column
     ((,detai-class (:background ,detai-highlight-line
                                   :strike-through nil
                                   :underline nil
                                   :slant normal
                                   :weight normal
                                   :inherit default))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :strike-through nil
                                        :underline nil
                                        :slant normal
                                        :weight normal
                                        :inherit default))))

   `(org-column-title
     ((,detai-class (:background ,detai-highlight-line
                                   :underline t
                                   :weight bold))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :underline t
                                        :weight bold))))

   `(org-date-selected
     ((,detai-class (:foreground ,detai-red
                                   :inverse-video t))
      (,detai-256-class (:foreground ,detai-256-red
                                        :inverse-video t))))

   `(org-document-info
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(org-document-title
     ((,detai-class (:foreground ,detai-emphasis
                                   :weight bold
                                   :height ,detai-height-plus-4))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :weight bold
                                        :height ,detai-height-plus-4))))

   `(org-drawer
     ((,detai-class (:foreground ,detai-cyan))
      (,detai-256-class (:foreground ,detai-256-cyan))))

   `(org-footnote
     ((,detai-class (:foreground ,detai-magenta
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-magenta
                                        :underline t))))

   `(org-latex-and-export-specials
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(org-mode-line-clock-overrun
     ((,detai-class (:inherit mode-line))
      (,detai-256-class (:inherit mode-line))))

   ;; outline
   `(outline-1
     ((,detai-class (:inherit org-level-1))
      (,detai-256-class (:inherit org-level-1))))

   `(outline-2
     ((,detai-class (:inherit org-level-2))
      (,detai-256-class (:inherit org-level-2))))

   `(outline-3
     ((,detai-class (:inherit org-level-3))
      (,detai-256-class (:inherit org-level-3))))

   `(outline-4
     ((,detai-class (:inherit org-level-4))
      (,detai-256-class (:inherit org-level-4))))

   `(outline-5
     ((,detai-class (:inherit org-level-5))
      (,detai-256-class (:inherit org-level-5))))

   `(outline-6
     ((,detai-class (:inherit org-level-6))
      (,detai-256-class (:inherit org-level-6))))

   `(outline-7
     ((,detai-class (:inherit org-level-7))
      (,detai-256-class (:inherit org-level-7))))

   `(outline-8
     ((,detai-class (:inherit org-level-8))
      (,detai-256-class (:inherit org-level-8))))

   ;; parenface
   `(paren-face
     ((,detai-256-class (:foreground ,detai-comments))))

   ;; perspective
   `(persp-selected-face
     ((,detai-class (:foreground ,detai-blue
                                   :weight bold))))

   ;; pretty-mode
   `(pretty-mode-symbol-face
     ((,detai-class (:foreground ,detai-yellow
                                   :weight normal))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight normal))))

   ;; popup
   `(popup-face
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-foreground))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-foreground))))

   `(popup-isearch-match
     ((,detai-class (:background ,detai-green))
      (,detai-256-class (:background ,detai-256-green))))

   `(popup-menu-face
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-foreground))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-foreground))))

   `(popup-menu-mouse-face
     ((,detai-class (:background ,detai-blue
                                   :foreground ,detai-foreground))
      (,detai-256-class (:background ,detai-256-blue
                                        :foreground ,detai-256-foreground))))

   `(popup-menu-selection-face
     ((,detai-class (:background ,detai-magenta
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-magenta
                                        :foreground ,detai-256-background))))

   `(popup-scroll-bar-background-face
     ((,detai-class (:background ,detai-comments))
      (,detai-256-class (:background ,detai-256-comments))))

   `(popup-scroll-bar-foreground-face
     ((,detai-class (:background ,detai-emphasis))
      (,detai-256-class (:background ,detai-256-emphasis))))

   `(popup-tip-face
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-foreground))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-foreground))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   `(rainbow-delimiters-depth-2-face
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(rainbow-delimiters-depth-3-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(rainbow-delimiters-depth-4-face
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(rainbow-delimiters-depth-5-face
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(rainbow-delimiters-depth-6-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(rainbow-delimiters-depth-7-face
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   `(rainbow-delimiters-depth-8-face
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(rainbow-delimiters-depth-9-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(rainbow-delimiters-depth-10-face
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(rainbow-delimiters-depth-11-face
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(rainbow-delimiters-depth-12-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(rainbow-delimiters-unmatched-face
     ((,detai-class (:foreground ,detai-foreground
                                   :background ,detai-background
                                   :inverse-video t))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :background ,detai-256-background
                                        :inverse-video t))))

   ;; realgud
   `(realgud-overlay-arrow1
     ((,detai-class (:foreground ,detai-green-d))
      (,detai-256-class (:foreground ,detai-256-green-d))))

   `(realgud-overlay-arrow2
     ((,detai-class (:foreground ,detai-yellow-d))
      (,detai-256-class (:foreground ,detai-256-yellow-d))))

   `(realgud-overlay-arrow3
     ((,detai-class (:foreground ,detai-orange-d))
      (,detai-256-class (:foreground ,detai-256-orange-d))))

   `(realgud-bp-enabled-face
     ((,detai-class (:inherit error)))
     ((,detai-256-class (:inherit error))))

   `(realgud-bp-disabled-face
     ((,detai-class (:inherit secondary-selection)))
     ((,detai-256-class (:inherit secondary-selection))))

   `(realgud-bp-line-enabled-face
     ((,detai-class (:foreground ,detai-red-d)))
     ((,detai-256-class (:foreground ,detai-256-red-d))))

   `(realgud-bp-line-disabled-face
     ((,detai-class (:inherit secondary-selection)))
     ((,detai-256-class (:inherit secondary-selection))))

   `(realgud-line-number
     ((,detai-class (:inerhit detai-line-number)))
     ((,detai-256-class (:inerhit detai-line-number))))

   `(realgud-backtrace-number
     ((,detai-class (:foreground ,detai-yellow-d
                                   :weight bold)))
     ((,detai-256-class (:foreground ,detai-256-yellow
                                       :weight bold))))

   ;; rhtm-mode
   `(erb-face
     ((,detai-class (:foreground ,detai-emphasis
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :background ,detai-256-background))))

   `(erb-delim-face
     ((,detai-class (:foreground ,detai-cyan
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-cyan
                                        :background ,detai-256-background))))

   `(erb-exec-face
     ((,detai-class (:foreground ,detai-emphasis
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :background ,detai-256-background))))

   `(erb-exec-delim-face
     ((,detai-class (:foreground ,detai-cyan
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-cyan
                                        :background ,detai-256-background))))

   `(erb-out-face
     ((,detai-class (:foreground ,detai-emphasis
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :background ,detai-256-background))))

   `(erb-out-delim-face
     ((,detai-class (:foreground ,detai-cyan
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-cyan
                                        :background ,detai-256-background))))

   `(erb-comment-face
     ((,detai-class (:foreground ,detai-emphasis
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :background ,detai-256-background))))

   `(erb-comment-delim-face
     ((,detai-class (:foreground ,detai-cyan
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-cyan
                                        :background ,detai-256-background))))

   ;; rst-mode
   `(rst-level-1-face
     ((,detai-class (:background ,detai-yellow
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-yellow
                                        :foreground ,detai-256-background))))

   `(rst-level-2-face
     ((,detai-class (:background ,detai-cyan
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-cyan
                                        :foreground ,detai-256-background))))

   `(rst-level-3-face
     ((,detai-class (:background ,detai-blue
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-blue
                                        :foreground ,detai-256-background))))

   `(rst-level-4-face
     ((,detai-class (:background ,detai-violet
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-violet
                                        :foreground ,detai-256-background))))

   `(rst-level-5-face
     ((,detai-class (:background ,detai-magenta
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-magenta
                                        :foreground ,detai-256-background))))

   `(rst-level-6-face
     ((,detai-class (:background ,detai-red
                                   :foreground ,detai-background))
      (,detai-256-class (:background ,detai-256-red
                                        :foreground ,detai-256-background))))

   ;; rpm-mode
   `(rpm-spec-dir-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(rpm-spec-doc-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(rpm-spec-ghost-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(rpm-spec-macro-face
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(rpm-spec-obsolete-tag-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(rpm-spec-package-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(rpm-spec-section-face
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(rpm-spec-tag-face
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(rpm-spec-var-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   ;; sh-mode
   `(sh-quoted-exec
     ((,detai-class (:foreground ,detai-violet
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-violet
                                        :weight bold))))

   `(sh-escaped-newline
     ((,detai-class (:foreground ,detai-yellow
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight bold))))

   `(sh-heredoc
     ((,detai-class (:foreground ,detai-yellow
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :weight bold))))

   ;; smartparens
   `(sp-pair-overlay-face
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-256-highlight-line))))

   `(sp-wrap-overlay-face
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-256-highlight-line))))

   `(sp-wrap-tag-overlay-face
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-256-highlight-line))))

   `(sp-show-pair-enclosing
     ((,detai-class (:inherit highlight))
      (,detai-256-class (:inherit highlight))))

   `(sp-show-pair-match-face
     ((,detai-class (:foreground ,detai-green
                                   :background ,detai-background
                                   :weight normal
                                   :inverse-video t))
      (,detai-256-class (:foreground ,detai-256-green
                                        :background ,detai-256-background
                                        :weight normal
                                        :inverse-video t))))

   `(sp-show-pair-mismatch-face
     ((,detai-class (:foreground ,detai-red
                                   :background ,detai-background
                                   :weight normal
                                   :inverse-video t))
      (,detai-256-class (:foreground ,detai-256-red
                                        :background ,detai-256-background
                                        :weight normal
                                        :inverse-video t))))

   ;; show-paren
   `(show-paren-match
     ((,detai-class (:foreground ,detai-green
                                   :background ,detai-background
                                   :weight normal
                                   :inverse-video t))
      (,detai-256-class (:foreground ,detai-256-green
                                        :background ,detai-256-background
                                        :weight normal
                                        :inverse-video t))))

   `(show-paren-mismatch
     ((,detai-class (:foreground ,detai-red
                                   :background ,detai-background
                                   :weight normal
                                   :inverse-video t))
      (,detai-256-class (:foreground ,detai-256-red
                                        :background ,detai-256-background
                                        :weight normal
                                        :inverse-video t))))

   ;; mic-paren
   `(paren-face-match
     ((,detai-class (:foreground ,detai-green
                                   :background ,detai-background
                                   :weight normal
                                   :inverse-video t))
      (,detai-256-class (:foreground ,detai-256-green
                                        :background ,detai-256-background
                                        :weight normal
                                        :inverse-video t))))

   `(paren-face-mismatch
     ((,detai-class (:foreground ,detai-red
                                   :background ,detai-background
                                   :weight normal
                                   :inverse-video t))
      (,detai-256-class (:foreground ,detai-256-red
                                        :background ,detai-256-background
                                        :weight normal
                                        :inverse-video t))))

   `(paren-face-no-match
     ((,detai-class (:foreground ,detai-red
                                   :background ,detai-background
                                   :weight normal
                                   :inverse-video t))
      (,detai-256-class (:foreground ,detai-256-red
                                        :background ,detai-256-background
                                        :weight normal
                                        :inverse-video t))))

   ;; SLIME
   `(slime-repl-inputed-output-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   ;; smerge
   `(smerge-base
      ((,detai-class (:background ,detai-diff-blue-base))
        (,detai-256-class (:background ,detai-256-diff-blue-base))))
   `(smerge-upper
      ((,detai-class (:background ,detai-diff-red-base))
        (,detai-256-class (:background ,detai-256-diff-red-base))))
   `(smerge-lower
      ((,detai-class (:background ,detai-diff-green-base))
        (,detai-256-class (:background ,detai-256-diff-green-base))))
   ;; WARNING: defining this face will overwrite the next two when displaying a
   ;; smerge diff in a file.
   ;; `(smerge-refined-changed
   ;;    ((,detai-class (:background ,detai-diff-blue-emphasis))
   ;;      (,detai-256-class (:background ,detai-256-diff-blue-emphasis))))
   `(smerge-refined-added
      ((,detai-class (:background ,detai-diff-green-emphasis))
        (,detai-256-class (:background ,detai-256-diff-green-emphasis))))
   `(smerge-refined-removed
      ((,detai-class (:background ,detai-diff-red-emphasis))
        (,detai-256-class (:background ,detai-256-diff-red-emphasis))))

   ;; speedbar
   `(speedbar-button-face
     ((,detai-class (:inherit ,detai-pitch
                                :foreground ,detai-comments))
      (,detai-256-class (:inherit ,detai-pitch
                                     :foreground ,detai-256-comments))))

   `(speedbar-directory-face
     ((,detai-class (:inherit ,detai-pitch
                                :foreground ,detai-blue))
      (,detai-256-class (:inherit ,detai-pitch
                                     :foreground ,detai-256-blue))))

   `(speedbar-file-face
     ((,detai-class (:inherit ,detai-pitch
                                :foreground ,detai-foreground))
      (,detai-256-class (:inherit ,detai-pitch
                                     :foreground ,detai-256-foreground))))

   `(speedbar-highlight-face
     ((,detai-class (:inherit ,detai-pitch
                                :background ,detai-highlight-line))
      (,detai-256-class (:inherit ,detai-pitch
                                     :background ,detai-256-highlight-line))))

   `(speedbar-selected-face
     ((,detai-class (:inherit ,detai-pitch
                                :foreground ,detai-yellow
                                :underline t))
      (,detai-256-class (:inherit ,detai-pitch
                                     :foreground ,detai-256-yellow
                                     :underline t))))

   `(speedbar-separator-face
     ((,detai-class (:inherit ,detai-pitch
                                :background ,detai-blue
                                :foreground ,detai-background
                                :overline ,detai-cyan-lc))
      (,detai-256-class (:inherit ,detai-pitch
                                     :background ,detai-256-blue
                                     :foreground ,detai-256-background
                                     :overline ,detai-256-cyan-lc))))

   `(speedbar-tag-face
     ((,detai-class (:inherit ,detai-pitch
                                :foreground ,detai-green))
      (,detai-256-class (:inherit ,detai-pitch
                                     :foreground ,detai-256-green))))

   ;; sunrise commander headings
   `(sr-active-path-face
     ((,detai-class (:background ,detai-blue
                                   :foreground ,detai-background
                                   :height ,detai-height-plus-1
                                   :weight bold))
      (,detai-256-class (:background ,detai-256-blue
                                        :foreground ,detai-256-background
                                        :height ,detai-height-plus-1
                                        :weight bold))))

   `(sr-editing-path-face
     ((,detai-class (:background ,detai-yellow
                                   :foreground ,detai-background
                                   :weight bold
                                   :height ,detai-height-plus-1))
      (,detai-256-class (:background ,detai-256-yellow
                                        :foreground ,detai-256-background
                                        :weight bold
                                        :height ,detai-height-plus-1))))

   `(sr-highlight-path-face
     ((,detai-class (:background ,detai-green
                                   :foreground ,detai-background
                                   :weight bold
                                   :height ,detai-height-plus-1))
      (,detai-256-class (:background ,detai-256-green
                                        :foreground ,detai-256-background
                                        :weight bold
                                        :height ,detai-height-plus-1))))

   `(sr-passive-path-face
     ((,detai-class (:background ,detai-comments
                                   :foreground ,detai-background
                                   :weight bold
                                   :height ,detai-height-plus-1))
      (,detai-256-class (:background ,detai-256-comments
                                        :foreground ,detai-256-background
                                        :weight bold
                                        :height ,detai-height-plus-1))))

   ;; sunrise commander marked
   `(sr-marked-dir-face
     ((,detai-class (:inherit didetai-red-marked))
      (,detai-256-class (:inherit didetai-red-marked))))

   `(sr-marked-file-face
     ((,detai-class (:inherit didetai-red-marked))
      (,detai-256-class (:inherit didetai-red-marked))))

   `(sr-alt-marked-dir-face
     ((,detai-class (:background ,detai-magenta
                                   :foreground ,detai-background
                                   :weight bold))
      (,detai-256-class (:background ,detai-256-magenta
                                        :foreground ,detai-256-background
                                        :weight bold))))

   `(sr-alt-marked-file-face
     ((,detai-class (:background ,detai-magenta
                                   :foreground ,detai-background
                                   :weight bold))
      (,detai-256-class (:background ,detai-256-magenta
                                        :foreground ,detai-256-background
                                        :weight bold))))

   ;; sunrise commander fstat
   `(sr-directory-face
     ((,detai-class (:inherit didetai-red-directory
                                :weight normal))
      (,detai-256-class (:inherit didetai-red-directory
                                     :weight normal))))

   `(sr-symlink-directory-face
     ((,detai-class (:inherit didetai-red-directory
                                :slant italic
                                :weight normal))
      (,detai-256-class (:inherit didetai-red-directory
                                     :slant italic
                                     :weight normal))))

   `(sr-symlink-face
     ((,detai-class (:inherit didetai-red-symlink
                                :slant italic
                                :weight normal))
      (,detai-256-class (:inherit didetai-red-symlink
                                     :slant italic
                                     :weight normal))))

   `(sr-broken-link-face
     ((,detai-class (:inherit didetai-red-warning
                                :slant italic
                                :weight normal))
      (,detai-256-class (:inherit didetai-red-warning
                                     :slant italic
                                     :weight normal))))

   ;; sunrise commander file types
   `(sr-compressed-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(sr-encrypted-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(sr-log-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(sr-packaged-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(sr-html-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(sr-xml-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   ;; sunrise commander misc
   `(sr-clex-hotchar-face
     ((,detai-class (:background ,detai-red
                                   :foreground ,detai-background
                                   :weight bold))
      (,detai-256-class (:background ,detai-256-red
                                        :foreground ,detai-256-background
                                        :weight bold))))

   ;; syslog-mode
   `(syslog-ip-face
     ((,detai-class (:background unspecified
                                   :foreground ,detai-yellow))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-yellow))))

   `(syslog-hour-face
     ((,detai-class (:background unspecified
                                   :foreground ,detai-green))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-green))))

   `(syslog-error-face
     ((,detai-class (:background unspecified
                                   :foreground ,detai-red
                                   :weight bold))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-red
                                        :weight bold))))

   `(syslog-warn-face
     ((,detai-class (:background unspecified
                                   :foreground ,detai-orange
                                   :weight bold))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-orange
                                        :weight bold))))

   `(syslog-info-face
     ((,detai-class (:background unspecified
                                   :foreground ,detai-blue
                                   :weight bold))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-blue
                                        :weight bold))))

   `(syslog-debug-face
     ((,detai-class (:background unspecified
                                   :foreground ,detai-cyan
                                   :weight bold))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-cyan
                                        :weight bold))))

   `(syslog-su-face
     ((,detai-class (:background unspecified
                                   :foreground ,detai-magenta))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-magenta))))

   ;; table
   `(table-cell
     ((,detai-class (:foreground ,detai-foreground
                                   :background ,detai-highlight-line))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :background ,detai-256-highlight-line))))

   ;; term
   `(term-color-black
     ((,detai-class (:foreground ,detai-background
                                   :background ,detai-highlight-line))
      (,detai-256-class (:foreground ,detai-256-background
                                        :background ,detai-256-highlight-line))))

   `(term-color-red
     ((,detai-class (:foreground ,detai-red
                                   :background ,detai-red-d))
      (,detai-256-class (:foreground ,detai-256-red
                                        :background ,detai-256-red-d))))

   `(term-color-green
     ((,detai-class (:foreground ,detai-green
                                   :background ,detai-green-d))
      (,detai-256-class (:foreground ,detai-256-green
                                        :background ,detai-256-green-d))))

   `(term-color-yellow
     ((,detai-class (:foreground ,detai-yellow
                                   :background ,detai-yellow-d))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :background ,detai-256-yellow-d))))

   `(term-color-blue
     ((,detai-class (:foreground ,detai-blue
                                   :background ,detai-blue-d))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :background ,detai-256-blue-d))))

   `(term-color-magenta
     ((,detai-class (:foreground ,detai-magenta
                                   :background ,detai-magenta-d))
      (,detai-256-class (:foreground ,detai-256-magenta
                                        :background ,detai-256-magenta-d))))

   `(term-color-cyan
     ((,detai-class (:foreground ,detai-cyan
                                   :background ,detai-cyan-d))
      (,detai-256-class (:foreground ,detai-256-cyan
                                        :background ,detai-256-cyan-d))))

   `(term-color-white
     ((,detai-class (:foreground ,detai-emphasis
                                   :background ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :background ,detai-256-foreground))))

   `(term-default-fg-color
     ((,detai-class (:inherit term-color-white))
      (,detai-256-class (:inherit term-color-white))))

   `(term-default-bg-color
     ((,detai-class (:inherit term-color-black))
      (,detai-256-class (:inherit term-color-black))))

   ;; tooltip. (NOTE: This setting has no effect on the os widgets for me
   ;; zencoding uses this)
   `(tooltip
     ((,detai-class (:background ,detai-yellow-hc
                                   :foreground ,detai-background
                                   :inherit ,detai-pitch))))

   ;; treemacs
   `(treemacs-directory-face
      ((,detai-class (:foreground ,detai-violet
                         :background ,detai-background
                         :weight bold))
        (,detai-256-class (:foreground ,detai-256-violet
                              :background ,detai-256-background
                              :weight bold))))

   `(treemacs-header-face
      ((,detai-class (:foreground ,detai-yellow
                         :background ,detai-background
                         :underline t
                         :weight bold))
        (,detai-256-class (:foreground ,detai-256-yellow
                              :background ,detai-256-background
                              :underline t
                              :weight bold))))

   `(treemacs-git-modified-face
      ((,detai-class (:foreground ,detai-green
                         :background ,detai-background))
        (,detai-256-class (:foreground ,detai-256-green
                              :background ,detai-256-background))))

   `(treemacs-git-renamed-face
      ((,detai-class (:foreground ,detai-red
                         :background ,detai-background))
        (,detai-256-class (:foreground ,detai-256-red
                              :background ,detai-256-background))))

   `(treemacs-git-ignored-face
      ((,detai-class (:foreground ,detai-gray-l
                         :background ,detai-background))
        (,detai-256-class (:foreground ,detai-256-gray-l
                              :background ,detai-256-background))))

   `(treemacs-git-untracked-face
      ((,detai-class (:foreground ,detai-red
                         :background ,detai-background))
        (,detai-256-class (:foreground ,detai-256-red
                              :background ,detai-256-background))))

   `(treemacs-git-added-face
      ((,detai-class (:foreground ,detai-green
                         :background ,detai-background))
        (,detai-256-class (:foreground ,detai-256-green
                              :background ,detai-256-background))))

   `(treemacs-git-conflict-face
      ((,detai-class (:foreground ,detai-orange
                         :background ,detai-background))
        (,detai-256-class (:foreground ,detai-256-orange
                              :background ,detai-256-background))))

   ;; tuareg
   `(tuareg-font-lock-governing-face
     ((,detai-class (:foreground ,detai-magenta
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-magenta
                                        :weight bold))))

   `(tuareg-font-lock-multistage-face
     ((,detai-class (:foreground ,detai-blue
                                   :background ,detai-highlight-line
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :background ,detai-256-highlight-line
                                        :weight bold))))

   `(tuareg-font-lock-operator-face
     ((,detai-class (:foreground ,detai-emphasis))
      (,detai-256-class (:foreground ,detai-256-emphasis))))

   `(tuareg-font-lock-error-face
     ((,detai-class (:foreground ,detai-yellow
                                   :background ,detai-red
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :background ,detai-256-red
                                        :weight bold))))

   `(tuareg-font-lock-interactive-output-face
     ((,detai-class (:foreground ,detai-cyan))
      (,detai-256-class (:foreground ,detai-256-cyan))))

   `(tuareg-font-lock-interactive-error-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   ;; undo-tree
   `(undo-tree-visualizer-default-face
     ((,detai-class (:foreground ,detai-comments
                                   :background ,detai-background))
      (,detai-256-class (:foreground ,detai-256-comments
                                        :background ,detai-256-background))))

   `(undo-tree-visualizer-unmodified-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(undo-tree-visualizer-current-face
     ((,detai-class (:foreground ,detai-blue
                                   :inverse-video t))
      (,detai-256-class (:foreground ,detai-256-blue
                                        :inverse-video t))))

   `(undo-tree-visualizer-active-branch-face
     ((,detai-class (:foreground ,detai-emphasis
                                   :background ,detai-background
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :background ,detai-256-background
                                        :weight bold))))

   `(undo-tree-visualizer-register-face
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   ;; volatile highlights
   `(vhl/default-face
      ((,detai-class (:background ,detai-highlight-alt))
        (,detai-256-class (:background ,detai-256-highlight-alt))))

   ;; w3m
   `(w3m-anchor
     ((,detai-class (:inherit link))
      (,detai-256-class (:inherit link))))

   `(w3m-arrived-anchor
     ((,detai-class (:inherit link-visited))
      (,detai-256-class (:inherit link-visited))))

   `(w3m-form
     ((,detai-class (:background ,detai-background
                                   :foreground ,detai-foreground))
      (,detai-256-class (:background ,detai-256-background
                                        :foreground ,detai-256-foreground))))

   `(w3m-header-line-location-title
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-yellow))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-yellow))))

   `(w3m-header-line-location-content

     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-foreground))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-foreground))))

   `(w3m-bold
     ((,detai-class (:foreground ,detai-emphasis
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :weight bold))))

   `(w3m-image-anchor
     ((,detai-class (:background ,detai-background
                                   :foreground ,detai-cyan
                                   :inherit link))
      (,detai-256-class (:background ,detai-256-background
                                        :foreground ,detai-256-cyan
                                        :inherit link))))

   `(w3m-image
     ((,detai-class (:background ,detai-background
                                   :foreground ,detai-cyan))
      (,detai-256-class (:background ,detai-256-background
                                        :foreground ,detai-256-cyan))))

   `(w3m-lnum-minibuffer-prompt
     ((,detai-class (:foreground ,detai-emphasis))
      (,detai-256-class (:foreground ,detai-256-emphasis))))

   `(w3m-lnum-match
     ((,detai-class (:background ,detai-highlight-line))
      (,detai-256-class (:background ,detai-256-highlight-line))))

   `(w3m-lnum
     ((,detai-class (:underline nil
                                  :bold nil
                                  :foreground ,detai-red))
      (,detai-256-class (:underline nil
                                       :bold nil
                                       :foreground ,detai-256-red))))

   `(w3m-session-select
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(w3m-session-selected
     ((,detai-class (:foreground ,detai-emphasis
                                   :bold t
                                   :underline t))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :bold t
                                        :underline t))))

   `(w3m-tab-background
     ((,detai-class (:background ,detai-background
                                   :foreground ,detai-foreground))
      (,detai-256-class (:background ,detai-256-background
                                        :foreground ,detai-256-foreground))))

   `(w3m-tab-selected-background
     ((,detai-class (:background ,detai-background
                                   :foreground ,detai-foreground))
      (,detai-256-class (:background ,detai-256-background
                                        :foreground ,detai-256-foreground))))

   `(w3m-tab-mouse
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-yellow))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-yellow))))

   `(w3m-tab-selected
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-emphasis
                                   :bold t))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-emphasis
                                        :bold t))))

   `(w3m-tab-unselected
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-foreground))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-foreground))))

   `(w3m-tab-selected-retrieving
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-red))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-red))))

   `(w3m-tab-unselected-retrieving
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-orange))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-orange))))

   `(w3m-tab-unselected-unseen
     ((,detai-class (:background ,detai-highlight-line
                                   :foreground ,detai-violet))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :foreground ,detai-256-violet))))

   ;; web-mode
   `(web-mode-builtin-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(web-mode-comment-face
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(web-mode-constant-face
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   `(web-mode-current-element-highlight-face
     ((,detai-class (:underline unspecified
                                  :weight unspecified
                                  :background ,detai-highlight-line))
      (,detai-256-class (:underline unspecified
                                       :weight unspecified
                                       :background ,detai-256-highlight-line))))

   `(web-mode-doctype-face
     ((,detai-class (:foreground ,detai-comments
                                   :slant italic
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-comments
                                        :slant italic
                                        :weight bold))))

   `(web-mode-folded-face
     ((,detai-class (:underline t))
      (,detai-256-class (:underline t))))

   `(web-mode-function-name-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(web-mode-html-attr-name-face
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(web-mode-html-attr-custom-face
     ((,detai-class (:inherit web-mode-html-attr-name-face))
      (,detai-256-class (:inherit web-mode-html-attr-name-face))))

   `(web-mode-html-attr-engine-face
     ((,detai-class (:inherit web-mode-block-delimiter-face))
      (,detai-256-class (:inherit web-mode-block-delimiter-face))))

   `(web-mode-html-attr-equal-face
     ((,detai-class (:inherit web-mode-html-attr-name-face))
      (,detai-256-class (:inherit web-mode-html-attr-name-face))))

   `(web-mode-html-attr-value-face
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(web-mode-html-tag-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(web-mode-keyword-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(web-mode-preprocessor-face
     ((,detai-class (:foreground ,detai-yellow
                                   :slant normal
                                   :weight unspecified))
      (,detai-256-class (:foreground ,detai-256-yellow
                                        :slant normal
                                        :weight unspecified))))

   `(web-mode-string-face
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(web-mode-type-face
     ((,detai-class (:inherit font-lock-type-face))
      (,detai-256-class (:inherit font-lock-type-face))))

   `(web-mode-variable-name-face
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(web-mode-warning-face
     ((,detai-class (:inherit font-lock-warning-face))
      (,detai-256-class (:inherit font-lock-warning-face))))

   `(web-mode-block-face
     ((,detai-class (:background unspecified))
      (,detai-256-class (:background unspecified))))

   `(web-mode-block-delimiter-face
     ((,detai-class (:inherit font-lock-preprocessor-face))
      (,detai-256-class (:inherit font-lock-preprocessor-face))))

   `(web-mode-block-comment-face
     ((,detai-class (:inherit web-mode-comment-face))
      (,detai-256-class (:inherit web-mode-comment-face))))

   `(web-mode-block-control-face
     ((,detai-class (:inherit font-lock-preprocessor-face))
      (,detai-256-class (:inherit font-lock-preprocessor-face))))

   `(web-mode-block-string-face
     ((,detai-class (:inherit web-mode-string-face))
      (,detai-256-class (:inherit web-mode-string-face))))

   `(web-mode-comment-keyword-face
     ((,detai-class (:box 1 :weight bold))
      (,detai-256-class (:box 1 :weight bold))))

   `(web-mode-css-at-rule-face
     ((,detai-class (:inherit font-lock-constant-face))
      (,detai-256-class (:inherit font-lock-constant-face))))

   `(web-mode-css-pseudo-class-face
     ((,detai-class (:inherit font-lock-builtin-face))
      (,detai-256-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-color-face
     ((,detai-class (:inherit font-lock-builtin-face))
      (,detai-256-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-filter-face
     ((,detai-class (:inherit font-lock-function-name-face))
      (,detai-256-class (:inherit font-lock-function-name-face))))

   `(web-mode-css-function-face
     ((,detai-class (:inherit font-lock-builtin-face))
      (,detai-256-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-function-call-face
     ((,detai-class (:inherit font-lock-function-name-face))
      (,detai-256-class (:inherit font-lock-function-name-face))))

   `(web-mode-css-priority-face
     ((,detai-class (:inherit font-lock-builtin-face))
      (,detai-256-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-property-name-face
     ((,detai-class (:inherit font-lock-variable-name-face))
      (,detai-256-class (:inherit font-lock-variable-name-face))))

   `(web-mode-css-selector-face
     ((,detai-class (:inherit font-lock-keyword-face))
      (,detai-256-class (:inherit font-lock-keyword-face))))

   `(web-mode-css-string-face
     ((,detai-class (:inherit web-mode-string-face))
      (,detai-256-class (:inherit web-mode-string-face))))

   `(web-mode-javascript-string-face
     ((,detai-class (:inherit web-mode-string-face))
      (,detai-256-class (:inherit web-mode-string-face))))

   `(web-mode-json-comment-face
     ((,detai-class (:inherit web-mode-comment-face))
      (,detai-256-class (:inherit web-mode-comment-face))))

   `(web-mode-json-context-face
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   `(web-mode-json-key-face
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   `(web-mode-json-string-face
     ((,detai-class (:inherit web-mode-string-face))
      (,detai-256-class (:inherit web-mode-string-face))))

   `(web-mode-param-name-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(web-mode-part-comment-face
     ((,detai-class (:inherit web-mode-comment-face))
      (,detai-256-class (:inherit web-mode-comment-face))))

   `(web-mode-part-face
     ((,detai-class (:inherit web-mode-block-face))
      (,detai-256-class (:inherit web-mode-block-face))))

   `(web-mode-part-string-face
     ((,detai-class (:inherit web-mode-string-face))
      (,detai-256-class (:inherit web-mode-string-face))))

   `(web-mode-symbol-face
     ((,detai-class (:foreground ,detai-violet))
      (,detai-256-class (:foreground ,detai-256-violet))))

   `(web-mode-whitespace-face
     ((,detai-class (:background ,detai-red))
      (,detai-256-class (:background ,detai-256-red))))

   ;; whitespace-mode
   `(whitespace-space
     ((,detai-class (:background unspecified
                                   :foreground ,detai-comments
                                   :inverse-video unspecified
                                   :slant italic))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-comments
                                        :inverse-video unspecified
                                        :slant italic))))

   `(whitespace-hspace
     ((,detai-class (:background unspecified
                                   :foreground ,detai-emphasis
                                   :inverse-video unspecified))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-emphasis
                                        :inverse-video unspecified))))

   `(whitespace-tab
     ((,detai-class (:background unspecified
                                   :foreground ,detai-red
                                   :inverse-video unspecified
                                   :weight bold))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-red
                                        :inverse-video unspecified
                                        :weight bold))))

   `(whitespace-newline
     ((,detai-class(:background unspecified
                                  :foreground ,detai-comments
                                  :inverse-video unspecified))
      (,detai-256-class (:background unspecified
                                       :foreground ,detai-256-comments
                                       :inverse-video unspecified))))

   `(whitespace-trailing
     ((,detai-class (:background unspecified
                                   :foreground ,detai-orange-lc
                                   :inverse-video t))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-orange-lc
                                        :inverse-video t))))

   `(whitespace-line
     ((,detai-class (:background unspecified
                                   :foreground ,detai-magenta
                                   :inverse-video unspecified))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-magenta
                                        :inverse-video unspecified))))

   `(whitespace-space-before-tab
     ((,detai-class (:background ,detai-red-lc
                                   :foreground unspecified
                                   :inverse-video unspecified))
      (,detai-256-class (:background ,detai-256-red-lc
                                        :foreground unspecified
                                        :inverse-video unspecified))))

   `(whitespace-indentation
     ((,detai-class (:background unspecified
                                   :foreground ,detai-yellow
                                   :inverse-video unspecified
                                   :weight bold))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-yellow
                                        :inverse-video unspecified
                                        :weight bold))))

   `(whitespace-empty
     ((,detai-class (:background unspecified
                                   :foreground ,detai-red-lc
                                   :inverse-video t))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-red-lc
                                        :inverse-video t))))

   `(whitespace-space-after-tab
     ((,detai-class (:background unspecified
                                   :foreground ,detai-orange
                                   :inverse-video t
                                   :weight bold))
      (,detai-256-class (:background unspecified
                                        :foreground ,detai-256-orange
                                        :inverse-video t
                                        :weight bold))))

   ;; wanderlust
   `(wl-highlight-folder-few-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(wl-highlight-folder-many-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(wl-highlight-folder-path-face
     ((,detai-class (:foreground ,detai-orange))
      (,detai-256-class (:foreground ,detai-256-orange))))

   `(wl-highlight-folder-unread-face
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(wl-highlight-folder-zero-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(wl-highlight-folder-unknown-face
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(wl-highlight-message-citation-header
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(wl-highlight-message-cited-text-1
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(wl-highlight-message-cited-text-2
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(wl-highlight-message-cited-text-3
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(wl-highlight-message-cited-text-4
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(wl-highlight-message-header-contents-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(wl-highlight-message-headers-face
     ((,detai-class (:foreground ,detai-red))
      (,detai-256-class (:foreground ,detai-256-red))))

   `(wl-highlight-message-important-header-contents
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(wl-highlight-message-header-contents
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(wl-highlight-message-important-header-contents2
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(wl-highlight-message-signature
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   `(wl-highlight-message-unimportant-header-contents
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(wl-highlight-summary-answedetai-red-face
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(wl-highlight-summary-disposed-face
     ((,detai-class (:foreground ,detai-foreground
                                   :slant italic))
      (,detai-256-class (:foreground ,detai-256-foreground
                                        :slant italic))))

   `(wl-highlight-summary-new-face
     ((,detai-class (:foreground ,detai-blue))
      (,detai-256-class (:foreground ,detai-256-blue))))

   `(wl-highlight-summary-normal-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(wl-highlight-summary-thread-top-face
     ((,detai-class (:foreground ,detai-yellow))
      (,detai-256-class (:foreground ,detai-256-yellow))))

   `(wl-highlight-thread-indent-face
     ((,detai-class (:foreground ,detai-magenta))
      (,detai-256-class (:foreground ,detai-256-magenta))))

   `(wl-highlight-summary-refiled-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(wl-highlight-summary-displaying-face
     ((,detai-class (:underline t
                                  :weight bold))
      (,detai-256-class (:underline t
                                       :weight bold))))

   ;; weechat
   `(weechat-error-face
     ((,detai-class (:inherit error))
      (,detai-256-class (:inherit error))))

   `(weechat-highlight-face
     ((,detai-class (:foreground ,detai-emphasis
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-emphasis
                                        :weight bold))))

   `(weechat-nick-self-face
     ((,detai-class (:foreground ,detai-green
                                   :weight unspecified
                                   :inverse-video t))
      (,detai-256-class (:foreground ,detai-256-green
                                        :weight unspecified
                                        :inverse-video t))))

   `(weechat-prompt-face
     ((,detai-class (:inherit minibuffer-prompt))
      (,detai-256-class (:inherit minibuffer-prompt))))

   `(weechat-time-face
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   ;; which-func-mode
   `(which-func
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   ;; which-key
   `(which-key-key-face
     ((,detai-class (:foreground ,detai-green
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-green
                                        :weight bold))))

   `(which-key-separator-face
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(which-key-note-face
     ((,detai-class (:foreground ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments))))

   `(which-key-command-description-face
     ((,detai-class (:foreground ,detai-foreground))
      (,detai-256-class (:foreground ,detai-256-foreground))))

   `(which-key-local-map-description-face
     ((,detai-class (:foreground ,detai-yellow-hc))
      (,detai-256-class (:foreground ,detai-256-yellow-hc))))

   `(which-key-group-description-face
     ((,detai-class (:foreground ,detai-red
                                   :weight bold))
      (,detai-256-class (:foreground ,detai-256-red
                                        :weight bold))))
   ;; window-number-mode
   `(window-number-face
     ((,detai-class (:foreground ,detai-green))
      (,detai-256-class (:foreground ,detai-256-green))))

   ;; yascroll
   `(yascroll:thumb-text-area
     ((,detai-class (:foreground ,detai-comments
                                   :background ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments
                                        :background ,detai-256-comments))))

   `(yascroll:thumb-fringe
     ((,detai-class (:foreground ,detai-comments
                                   :background ,detai-comments))
      (,detai-256-class (:foreground ,detai-256-comments
                                        :background ,detai-256-comments))))

   ;; zencoding
   `(zencoding-preview-input
     ((,detai-class (:background ,detai-highlight-line
                                   :box ,detai-emphasis))
      (,detai-256-class (:background ,detai-256-highlight-line
                                        :box ,detai-256-emphasis)))))

  (custom-theme-set-variables
   'detai
   `(ansi-color-names-vector [,detai-background ,detai-red ,detai-green ,detai-yellow
                                                  ,detai-blue ,detai-magenta ,detai-cyan ,detai-foreground])

   ;; compilation
   `(compilation-message-face 'default)

   ;; fill-column-indicator
   `(fci-rule-color ,detai-highlight-line)

   ;; magit
   `(magit-diff-use-overlays nil)

   ;; highlight-changes
   `(highlight-changes-colors '(,detai-magenta ,detai-violet))

   ;; highlight-tail
   `(highlight-tail-colors
     '((,detai-highlight-line . 0)
       (,detai-green-lc . 20)
       (,detai-cyan-lc . 30)
       (,detai-blue-lc . 50)
       (,detai-yellow-lc . 60)
       (,detai-orange-lc . 70)
       (,detai-magenta-lc . 85)
       (,detai-highlight-line . 100)))

   ;; pos-tip
   `(pos-tip-foreground-color ,detai-background)
   `(pos-tip-background-color ,detai-yellow-hc)

   ;; vc
   `(vc-annotate-color-map
     '((20 . ,detai-red)
       (40 . "#CF4F1F")
       (60 . "#C26C0F")
       (80 . ,detai-yellow)
       (100 . "#AB8C00")
       (120 . "#A18F00")
       (140 . "#989200")
       (160 . "#8E9500")
       (180 . ,detai-green)
       (200 . "#729A1E")
       (220 . "#609C3C")
       (240 . "#4E9D5B")
       (260 . "#3C9F79")
       (280 . ,detai-cyan)
       (300 . "#299BA6")
       (320 . "#2896B5")
       (340 . "#2790C3")
       (360 . ,detai-blue)))
   `(vc-annotate-very-old-color nil)
   `(vc-annotate-background nil)

   ;; weechat
   `(weechat-color-list
     '(unspecified ,detai-background ,detai-highlight-line
                  ,detai-red-d ,detai-red
                  ,detai-green-d ,detai-green
                  ,detai-yellow-d ,detai-yellow
                  ,detai-blue-d ,detai-blue
                  ,detai-magenta-d ,detai-magenta
                  ,detai-cyan-d ,detai-cyan
                  ,detai-foreground ,detai-emphasis))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'detai)

;; Local Variables:
;; no-byte-compile: t
;; fill-column: 95
;; End:

;;; detai-theme.el ends here
