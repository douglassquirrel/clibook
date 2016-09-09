#lang racket

(require "hashes.rkt")

(provide request-to-fb)

(define (request-to-fb r)
    (hash-ref request-to-fb-hash r))