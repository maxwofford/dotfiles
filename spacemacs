;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     ;; Per-language syntax
     dockerfile
     emacs-lisp
     html
     latex
     markdown
     org
     ruby
     ruby-on-rails
     shell
     syntax-checking
     ;; Other layers
     auto-completion
     better-defaults
     colors
     git
     github
     magit
     spell-checking
     spotify
     version-control
     wakatime
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages
   '(
     spray
     coffee-mode
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'doge
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         solarized-dark
                         monokai
                         solarized-light
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   ;; Don't remap evil 'Y' key to 'y$'
   dotspacemacs-remap-Y-to-y$ nil
   )
  ;; User initialization goes here
  )
(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  )

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  ;; Set indentation to 2
  (setq-default js-indent-level 2)
  (setq-default sh-basic-offset 2)
  (setq-default sh-indentation 2)
  (setq-default web-mode-code-indent-offet 2)
  (setq-default web-mode-css-indent-offset 2)
  (setq-default web-mode-markup-indent-offset 2)
  ;; Keybindings to activley used files
  (global-set-key (kbd "C-c e") ;; .emacs
                  (lambda()
                    (interactive)(find-file "~/.spacemacs")))
  (global-set-key (kbd "C-c o") ;; .main.org
                  (lambda()
                    (interactive)(find-file "~/documents/org/.main.org")))
  ;; Org-mode configuration-----------------------------------------------------
  (setq org-agenda-files '("~/documents/org"))
  ;; org-mode todo states
  (setq org-todo-keywords
        (quote ((sequence "IDEA" "TODO" "NEXT" "|" "DONE")
                (sequence "MEET"))))
  ;; org-archive keybinding
  (add-hook 'org-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c m") 'org-archive-subtree)))
  ;; org-capture-mode starts in evil-insert-state
  (add-hook 'org-capture-mode-hook 'evil-insert-state)
  ;; org-capture templates
  (setq org-capture-templates
        (quote (("t" "Todo" entry (file org-default-notes-file)
                 "** TODO %?\n")
                ("e" "Next" entry (file org-default-notes-file)
                 "** NEXT %?\n")
                ("m" "Meeting" entry (file org-default-notes-file)
                 "** MEET %?%t\n")
                ("r" "Retrospective" entry (file org-default-notes-file)
                 "** %TTeam retrospective\n*** Topics to bring up\n- %?")
                ("n" "Note" entry (file org-default-notes-file)
                 "** %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
                ("i" "Idea" entry (file org-default-notes-file)
                 "** IDEA %?\n")
                )))
  ;; org-capture config
  (setq org-default-notes-file "~/documents/org/.main.org")
  (define-key global-map (kbd "C-c c") 'org-capture)
  ;; associate shell-script-mode with .sh files
  (add-to-list 'auto-mode-alist '("\\.sh\\'" . shell-script-mode))
  ;; full document previews
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(org-agenda-files (quote ("~/documents/org/.main.org")) t)
 '(package-selected-packages
   (quote
    (toc-org smeargle org-repo-todo org-present org-pomodoro org-bullets mmm-mode markdown-toc magit htmlize helm-gitignore helm-flyspell helm-c-yasnippet gitconfig-mode gitattributes-mode git-timemachine git-messenger flycheck-pos-tip evil-org company-statistics company-quickhelp auto-yasnippet ac-ispell auto-complete company flycheck yasnippet request gitignore-mode magit-popup git-commit with-editor markdown-mode alert log4e gntp macrostep elisp-slime-nav diff-hl window-numbering volatile-highlights vi-tilde-fringe smooth-scrolling rfringe rainbow-delimiters powerline popup pcre2el paradox page-break-lines open-junk-file neotree move-text linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete hl-anything highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-descbinds helm-ag guide-key-tip google-translate golden-ratio gh-md fringe-helper flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-terminal-cursor-changer evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-jumper evil-indent-textobject evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu clean-aindent-mode buffer-move auto-highlight-symbol auto-dictionary aggressive-indent adaptive-wrap ace-window ace-link ace-jump-mode avy names anzu iedit smartparens highlight flx pos-tip guide-key s popwin projectile helm helm-core async parent-mode spinner pkg-info epl evil-leader evil use-package bind-key dash)))
 '(ring-bell-function (quote ignore) t)
 '(wakatime-api-key "7c99663d-d356-4b3e-bd86-70459c5aed4a")
 '(wakatime-cli-path "/usr/local/bin/wakatime"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
