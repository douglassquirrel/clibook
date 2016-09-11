#lang racket

(require net/url)

(provide extract-path slurp)

(define (extract-path u)
    (string-join (map path/param-path (url-path (string->url u))) "/"))

(define (slurp u)
    (port->string (get-pure-port (string->url u))))