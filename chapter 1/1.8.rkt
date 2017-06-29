#lang racket

;(define (average x y)
;  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ (/ x (square y)) (* 2 y)) 3))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- 1 (/ (square guess) x))) 0.0001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 10000)
(sqrt 0.0004)
(sqrt 9000000)

(module+ test
  (require rackunit)

  (test-case
   "sqrt(x) by Newton method"

   (check-= (sqrt 10000) 100.0 0.0001 "I work")
   (check-= (sqrt 0.0004) 0.02 0.0000001 "I work")
   (check-= (sqrt 9000000) 3000 0.11 "I work")))
