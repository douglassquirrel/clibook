#lang racket

(require net/url)

(provide visit-url)

(define (visit-url u)
    (port->string (get-pure-port (string->url u))))