;can't live without : preload it so I get it even in the
             ; event of errors 
 ;; Set up packaging, first with Emacs's built-in "package.el" functionality
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("gnu"       . "http://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa"     . "https://melpa.org/packages/"))
;;(add-to-list 'package-archives
;;            '("milkbox"   . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("org"       . "http://orgmode.org/elpa/"))
(package-initialize)

;; Next we use "package.el" to get "use-package", which simplifies packaging
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Get quelpa-use-package, which allows 'packages' to come from arbitrary places
(use-package quelpa-use-package
  :init (setq quelpa-update-melpa-p nil))

;;; quelpa use-package
(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)

  (setq-default
   ad-redefinition-action 'accept                   ; Silence warnings for redefinition
   cursor-in-non-selected-windows t                 ; Hide the cursor in inactive windows
   display-time-default-load-average nil            ; Don't display load average
   fill-column 80                                   ; Set width for automatic line breaks
   help-window-select t                             ; Focus new help windows when opened
   indent-tabs-mode nil                             ; Prefers spaces over tabs
   inhibit-startup-screen t                         ; Disable start-up screen
   initial-scratch-message ""                       ; Empty the initial *scratch* buffer
   kill-ring-max 128                                ; Maximum length of kill ring
   load-prefer-newer t                              ; Prefers the newest version of a file
   mark-ring-max 128                                ; Maximum length of mark ring
   read-process-output-max (* 1024 1024)            ; Increase the amount of data reads from the process
   scroll-conservatively most-positive-fixnum       ; Always scroll by one line
   select-enable-clipboard t                        ; Merge system's and Emacs' clipboard
   tab-width 4                                      ; Set width for tabs
   use-package-always-ensure t                      ; Avoid the :ensure keyword for each package
   user-full-name "Terencio Agozzino"               ; Set the full name of the current user
   user-mail-address "terencio.agozzino@gmail.com"  ; Set the email address of the current user
   vc-follow-symlinks t                             ; Always follow the symlinks
   view-read-only t)                                ; Always open read-only buffers in view-mode

(cd "~/")                                         ; Move to the user directory
(column-number-mode 1)                            ; Show the column number
(display-time-mode 1)                             ; Enable time in the mode-line
(fset 'yes-or-no-p 'y-or-n-p)                     ; Replace yes/no prompts with y/n
(global-hl-line-mode)                             ; Hightlight current line
(set-default-coding-systems 'utf-8)               ; Default to utf-8 encoding
(show-paren-mode 1)                               ; Show the parent

;; To run quelpa-upgrade-all at most every 7 days, after all the init files are loaded:
(setq quelpa-upgrade-interval 7)
(add-hook #'after-init-hook #'quelpa-upgrade-all-maybe)

;; simple benchmark of calls to Emacs require and load functions. It
;;can be used to keep track of where time is being spent during Emacs
;;startup in order to optimize startup times.

;; https://github.com/dholm/benchmark-init-el
(use-package benchmark-init  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

;; font
(set-face-attribute 'default nil :font "Fira Code Medium")
;; Source Code Pro Medium
(set-fontset-font t 'latin "Fira Sans Regular")

(use-package ace-jump-mode)
(use-package ace-window)
(use-package ag)
(use-package aggressive-fill-paragraph)
;; (use-package ahg)

(use-package anzu)

;; (use-package arduino-mode)

(use-package async)

(use-package avy)

(use-package beacon)

(use-package bind-key)

(use-package browse-kill-ring)

;; (use-package caml)

;; (use-package cmake-mode)

(use-package company)

(use-package company-quickhelp)

(use-package counsel)

(use-package crux)

;; (use-package csv-mode)

;; (use-package dante)

(use-package dash)

(use-package dash-functional)

(use-package diff-hl)

(use-package diminish)

;; (use-package discover-my-major)

(use-package dired-details)
(setq-default dired-details-hidden-string "---" )
(use-package dired-atool)
(use-package dired-icon)
(use-package dired-collapse)
(use-package dired-dups)

(use-package dmenu
  :bind
  ("s-SPC" . 'dmenu))

;; (use-package dumb-jump)

;; (use-package easy-kill)

(use-package ebib)

;; (use-package elisp-slime-nav)

;; (use-package epl)

(use-package ess)

;; (use-package expand-region)

;; (use-package f)

;; (use-package faceup)

(use-package fill-column-indicator)

;; (use-package flx)

;; (use-package flx-ido)

(use-package flycheck)

;; (use-package flycheck-haskell)

;; (use-package flymake-easy)

;; (use-package flymake-haskell-multi)

;; (use-package fold-dwim)

;; (use-package fsm)

(use-package geiser)

(use-package gh);; github 

(use-package gist)

;; (use-package git-commit)

(use-package git-timemachine)

;; (use-package gitconfig-mode)

;; (use-package gitignore-mode)

(use-package gnuplot)

(use-package god-mode)

;; (use-package grizzl)

;; (use-package guru-mode)

;; (use-package haskell-mode)

;; (use-package helm)

;; (use-package helm-core)

;; (use-package helm-projectile)

(use-package highlight)

;; (use-package ht)

;; (use-package htmlize)

;; (use-package hydra)

;; (use-package identica-mode)

;; (use-package idris-mode)

;; (use-package iedit)

;; (use-package imenu-anywhere)

;; (use-package intero)

;; (use-package ivy)

;; (use-package jabber)

;; (use-package json-reformat)

;; (use-package json-snatcher)

;; (use-package key-chord)

;; (use-package let-alist)

;; (use-package lispy)

;; (use-package load-relative)

;; (use-package loc-changes)

;; (use-package logito)

;; (use-package macrostep)

;; (use-package makey)

;; (use-package marshal)

;; (use-package maude-mode)

;; (use-package memoize)

;; (use-package memory-usage)

;; (use-package monky)

;; (use-package move-text)

;; (use-package multiple-cursors)

;; (use-package nix-buffer)

;; (use-package nix-sandbox)

;; (use-package nixos-options)

;; (use-package noflet)

;; (use-package o-blog)

;; (use-package operate-on-number)

;; (use-package ov)

;; (use-package package-build)

;; (use-package parsebib)

;; (use-package pcache)

;; (use-package pkg-info)

(use-package popup)

;;(use-package pretty-sha-path
;;  :ensure t
;;  :config (pretty-sha-path-global-mode))

;; (use-package prop-menu)

(use-package quelpa)

(use-package quelpa-use-package)

;; (use-package racket-mode)

;; (use-package realgud)

;; (use-package rich-minority)

;; (use-package ruby-tools)

;; (use-package s)

;; (use-package seq)

;; (use-package shadchen)

;; (use-package slime)

(use-package smart-mode-line
  :ensure t)

;; (use-package smartrep)

;; (use-package smex)

(use-package solarized-theme
  :ensure t)

;; (use-package swiper)

;; (use-package test-simple)

;; (use-package tuareg)

(use-package undo-tree
  :ensure t)

;; (use-package use-package)

;; (use-package volatile-highlights)

;; (use-package wc-mode)

(use-package which-key
  :ensure t)

;; (use-package with-editor)

;; (use-package ws-butler)

(use-package xterm-color
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package yasnippet
  :ensure t)

(use-package zenburn-theme
  :ensure t)

;; (use-package zop-to-char)

;; (use-package zoutline)

;; Installed but apparently not on elpa/melpa
;; "ack-and-a-half"
;; "csv-nav"
;; "ido-completing-read+"
;; "ido-ubiquitous"
;; "image+"
;; "isar-mode"
;; "metal-mercury-mode"
;; "prelude-emacs-lisp"
;; "prelude-haskell"
;; "prelude-js"
;; "prelude-lisp"
;; "scala-mode2"
;; "simp-isar-mode"
;; "so-long"
;; "sunrise-commander"
;; "sunrise-x-buttons"
;; "sunrise-x-loop"
;; "sunrise-x-modeline"
