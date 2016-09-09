#lang racket

(require json
         "hashes.rkt"
         "sprintf-hash.rkt"
         "url-result.rkt")

(provide result-to-string)

(define (remove-version-prefix path)
    (regexp-replace #rx"^v[^/]*/" path ""))

(define (result-to-string r) 
    (define path (remove-version-prefix (url-result-path r)))
    (define result-hash (string->jsexpr (url-result-content r)))
    (define f (hash-ref path-to-format-hash path))
    (sprintf-hash f result-hash))