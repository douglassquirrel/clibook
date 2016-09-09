#lang racket

(require net/url
         "url-result.rkt")

(provide visit-url)

(define (extract-path u)
    (string-join (map path/param-path (url-path u)) "/"))

(define (visit-url url-string)
    (define u (string->url url-string))
    (url-result (extract-path u) (port->string (get-pure-port u))))