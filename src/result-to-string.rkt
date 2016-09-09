#lang racket

(require json
         "hashes.rkt"
         "url-result.rkt")

(provide result-to-string)

(define (remove-version-prefix path)
    (regexp-replace #rx"^v[^/]*/" path ""))

(define (replace-hash-value h key s)
    (string-replace s (format "%~a%" key) (hash-ref h key)))

(define (sprintf-hash form h)
    (foldl ((curry replace-hash-value) h) form (hash-keys h)))

(define (result-to-string r) 
    (define path (remove-version-prefix (url-result-path r)))
    (define result-hash (string->jsexpr (url-result-content r)))
    (define f (hash-ref path-to-format-hash path))
    (sprintf-hash f result-hash))