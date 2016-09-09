#lang racket

(provide sprintf-hash)

(define (replace-hash-value h key s)
    (string-replace s (format "%~a%" key) (hash-ref h key)))

(define (sprintf-hash form h)
    (foldl ((curry replace-hash-value) h) form (hash-keys h)))