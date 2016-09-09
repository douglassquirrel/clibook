#lang racket

(require net/url
         "url-result.rkt")

(provide visit-url-test)

(define (visit-url-test u)
    (println u)
    (url-result "me" 
                "{\"name\": \"Peter Parker\", \"id\": \"824872347287782\"}"))