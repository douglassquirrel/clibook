#lang racket

(provide request-to-fb)

(define (request-to-fb r)
    (case r
        [("whoami") (list "me")]
        [else (raise-argument-error 'request-to-fb "known request" r)]))