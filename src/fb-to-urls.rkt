#lang racket

(provide fb-to-urls)

(define token "TEST-TOKEN")
(define version "2.7")

(define (make-url fragment) (string-append "https://graph.facebook.com/v"
                             version fragment
                             "?access_token=" token))

(define (fb-to-urls fb-request)
    (case fb-request
        [("me") (list (make-url "/me"))]
        [else (raise-argument-error 'fb-to-urls "known request" fb-request)]))