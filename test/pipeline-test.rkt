#lang racket
 
(require rackunit
         "../src/pipeline.rkt")

(define 3x-squared (make-pipe (list (lambda (x) (* x x))
                                    (lambda (x) (* 3 x)))))

(define trim-up-dup (make-pipe (list string-upcase string-trim
                                     (lambda (x) (string-append x x)))))

(check-equal? (3x-squared 2) 12 "pipe of two elements")
(check-equal? (3x-squared 3) 27 "pipe of two elements")

(check-equal? (trim-up-dup " hello") "HELLOHELLO" "3-element pipe")
(check-equal? (trim-up-dup " star ") "STARSTAR" "3-element-pipe")