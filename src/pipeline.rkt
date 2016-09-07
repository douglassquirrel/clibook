#lang racket

(provide make-pipe)

(define (make-pipe procedures)
    (lambda (x) (foldl apply-with-error x procedures)))
        
(define (apply-with-error p x) (p x))