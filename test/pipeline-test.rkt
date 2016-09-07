#lang racket/base
 
(require rackunit
         "../src/pipeline.rkt")

(define 3x-squared (make-pipe (list (lambda (x) (* x x))
                                    (lambda (x) (* 3 x)))))

(check-equal? (3x-squared 2) 12 "pipe of two elements")
(check-equal? (3x-squared 3) 27 "pipe of two elements")