#lang racket

(require "request-to-fb.rkt"
         "fb-to-urls.rkt"
         "visit-url.rkt"
         "visit-url-test.rkt")

(define url-visitor (make-parameter visit-url))

(define requests
    (command-line
        #:program "clibook"
        #:once-each
            [("-t" "--test") "Run in test mode (no requests to facebook)"
                       (url-visitor visit-url-test)]
        #:args requests
        requests))

(display (url-visitor))

(define (listify p) (compose1 flatten (curry map p)))  
(define pipeline (compose1 (listify (url-visitor))
                           (listify fb-to-urls)
                           request-to-fb))

(map pipeline requests)