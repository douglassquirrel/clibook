#lang racket

(require json
         "urls.rkt")

(provide urls-to-hashes)

(define (stringify-keys h)
    (define (stringify-key assoc new-hash)
       (hash-set new-hash (symbol->string (car assoc)) (cdr assoc)))
    (foldl stringify-key (hash) (hash->list h)))

(define (url-to-hash url h)
    (define result (stringify-keys (string->jsexpr (slurp url))))
    (hash-set h (extract-path url) result))

(define (urls-to-hashes url-strings)
    (define paths (map extract-path url-strings))
    (define hashes (foldl url-to-hash (hash) url-strings))
    (map (lambda (path) (list path (hash-ref hashes path))) paths))