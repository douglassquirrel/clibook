#lang racket

(require "pipeline.rkt")

;(make-pipe (list "hello world"))

(define requests
    (command-line
        #:args requests
        requests))

requests