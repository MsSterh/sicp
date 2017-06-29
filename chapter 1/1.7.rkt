#lang racket

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- 1 (/ (square guess) x))) 0.00001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(module+ test
  (require rackunit)

  (test-case
   "sqrt(x) by Newton method"

   (check-= (sqrt 10000) 100.0 0.00001 "I work")
   (check-= (sqrt 0.0004) 0.02 0.000000001 "I work")
   (check-= (sqrt 9000000) 3000 0.00001 "I work")))
