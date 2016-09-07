#lang racket

(require "request-to-fb.rkt"
         "fb-to-urls.rkt")

(define (listify p) (curry map p))  
(define pipeline (compose1 (listify fb-to-urls)
                           request-to-fb))

(define requests
    (command-line
        #:args requests
        requests))

(map pipeline requests)