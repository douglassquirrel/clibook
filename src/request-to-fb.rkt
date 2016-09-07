#lang racket

(provide request-to-fb)

(define (request-to-fb r)
    (case r
        [("whoami") "me"]
        [else #f]))