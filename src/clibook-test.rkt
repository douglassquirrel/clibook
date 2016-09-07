#lang racket

(require "request-to-fb.rkt")

(define pipeline (compose1 request-to-fb))

(define requests
    (command-line
        #:args requests
        requests))

(map pipeline requests)