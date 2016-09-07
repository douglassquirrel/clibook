#lang racket

(require json)

(provide result-to-string)

(define (result-to-string r) 
    (define h (string->jsexpr r))
    (define username (hash-ref h 'name))
    (string-append "Your name is " username))