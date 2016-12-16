;;; packages.el --- makohoek-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Mattijs Korpershoek
;;
;; Author:  <mattijs.korpershoek@gmail.com>
;; URL: https://github.com/Makohoek/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `makohoek-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `makohoek-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `makohoek-org/pre-init-PACKAGE' and/or
;;   `makohoek-org/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst makohoek-org-packages
  '()
  "The list of Lisp packages required by the makohoek-org layer.
   Is empty, since already in the spacemacs org layer."
  )

(defun makohoek-development/post-init-org ()
  ;; point towards default reveal directory
  ;; FIXME: reveal.js should probably be a submodule of this repo
  (setq org-reveal-root "file:///home/mako/code/js/reveal.js-master/")
  )

;;; packages.el ends here