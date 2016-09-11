#lang racket

(require json
         net/url)

(provide urls-to-hashes)

(define (extract-path u)
    (string-join (map path/param-path (url-path u)) "/"))

(define (slurp u)
    (port->string (get-pure-port u)))

(define (url-to-hash url h)
    (define result (string->jsexpr (slurp url))) 
    (hash-set h (extract-path url) result))

(define (urls-to-hashes url-strings)
    (define urls (map string->url url-strings))
    (define paths (map extract-path urls))
    (define hashes (foldl url-to-hash (hash) urls))
    (map (lambda (path) (list path (hash-ref hashes path))) paths))