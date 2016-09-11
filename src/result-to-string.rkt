#lang racket

(require "hashes.rkt"
         "sprintf-dict.rkt")

(provide result-to-string)

(define (result-to-string r) 
    (define path (first r))
    (define result-hash (second r))
    (define f (hash-ref path-to-format-hash path))
    (sprintf-dict f result-hash))