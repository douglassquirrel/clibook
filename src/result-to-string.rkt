#lang racket

(require json)

(provide result-to-string)

(define (replace-hash-value h key s)
    (string-replace s (format "%~a%" key) (hash-ref h key)))

(define (sprintf-hash form h)
    (foldl ((curry replace-hash-value) h) form (hash-keys h)))

(define (result-to-string r) 
    (sprintf-hash "Your name is %name%" (string->jsexpr r)))