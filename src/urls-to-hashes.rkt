#lang racket

(require "json.rkt"
         "urls.rkt")

(provide urls-to-hashes)

(define (url-to-hash url h)
    (define result (json->hash (slurp url)))
    (hash-set h (extract-path url) result))

(define (urls-to-hashes url-strings)
    (define paths (map extract-path url-strings))
    (define hashes (foldl url-to-hash (hash) url-strings))
    (map (lambda (path) (list path (hash-ref hashes path))) paths))