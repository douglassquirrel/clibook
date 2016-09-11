#lang racket

(require "request-to-fb.rkt"
         "fb-to-urls.rkt"
         "urls-to-hashes.rkt"
         "result-to-string.rkt")

(define requests
    (command-line
        #:program "clibook"
        #:args requests
        requests))

(define (listify p) (compose1 flatten (curry map p)))  
(define pipeline (compose1 (listify result-to-string)
                           urls-to-hashes
                           (listify fb-to-urls)
                           request-to-fb))

(define display-results (flatten (map pipeline requests)))
(display (string-join display-results "\n"))
(newline)
