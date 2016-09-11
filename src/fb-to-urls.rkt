#lang racket

(require "hashes.rkt")

(provide fb-to-urls)

(define homedir (find-system-path 'home-dir))
(define fb-token (file->string (build-path homedir ".clibook-token")))

(define (make-url fragment) (string-append "https://graph.facebook.com/"
                             fragment "?access_token=" fb-token))

(define (fb-to-urls r)
    (define paths (hash-ref fb-to-urls-hash r))
    (map make-url paths))