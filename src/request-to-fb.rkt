#lang racket

(provide request-to-fb)

(define request-to-fb-hash (hash "whoami" (list "me")))

(define (request-to-fb r)
    (hash-ref request-to-fb-hash r
              (lambda () (raise-argument-error 'request-to-fb 
                                               "known request" r))))