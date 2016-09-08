#lang racket

(provide fb-to-urls)

(define homedir (find-system-path 'home-dir))
(define fb-token (file->string (build-path homedir ".clibook-token")))
(define version "2.7")

(define (make-url fragment) (string-append "https://graph.facebook.com/v"
                             version fragment
                             "?access_token=" fb-token))

(define fb-to-urls-map (hash "me" (list (make-url "/me"))))

(define (fb-to-urls r)
    (hash-ref fb-to-urls-map r
              (lambda () (raise-argument-error 'fb-to-urls
                                               "known request" r))))