#lang racket

(define (inc x) (+ x 1))

(define (dec x) (- x 1))

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(+ 4 5)

;(define (+ a b)
;  (if (= a 0)
;      b
;      (+ (dec a) (inc b))))
