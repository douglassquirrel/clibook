#lang racket

(provide request-to-fb-hash
         fb-to-urls-hash
         path-to-format-hash)

(define request-to-fb-hash (hash "whoami" (list "me")))

(define fb-to-urls-hash (hash "me" (list "/me")))

(define path-to-format-hash (hash "/me" "Your name is %name%"))