#lang racket

(require "request-to-fb.rkt"
         "fb-to-urls.rkt"
         "visit-url.rkt")

(define (listify p) (compose1 flatten (curry map p)))  
(define pipeline (compose1 (listify visit-url)
                           (listify fb-to-urls)
                           request-to-fb))

(define requests
    (command-line
        #:args requests
        requests))

(map pipeline requests)