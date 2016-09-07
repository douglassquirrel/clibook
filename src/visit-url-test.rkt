#lang racket

(require net/url)

(provide visit-url-test)

(define (visit-url-test u)
    (println u)
    "{\"name\": \"Peter Parker\", \"id\": \"824872347287782\"}"
)