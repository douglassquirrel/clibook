#lang racket

(provide sprintf-dict)

(define (replace-dict-value d dict-get key s)
    (string-replace s (format "%~a%" key) (dict-get d key)))

(define (sprintf-dict form d [dict-get hash-ref])
    (define keys-used (remove-duplicates (regexp-match* #rx"%([^%]+)%" form
                                                        #:match-select cadr)))
    (foldl ((curry replace-dict-value) d dict-get) form keys-used))
    