#lang racket

(require json)

(provide json->hash)

(define (stringify-keys h)
    (define (stringify-key assoc new-hash)
       (hash-set new-hash (symbol->string (car assoc)) (cdr assoc)))
    (foldl stringify-key (hash) (hash->list h)))

(define (json->hash s) (stringify-keys (string->jsexpr s)))