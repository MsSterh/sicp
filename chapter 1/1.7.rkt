#lang racket

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? old-guess guess)
  (< (abs (- 1 (/ old-guess guess))) 0.000001))

(define (sqrt-iter old-guess guess x)
  (if (good-enough? old-guess guess)
      guess
      (sqrt-iter guess
                 (improve guess x)
                 x)))
(define (sqrt x)
  (sqrt-iter 1.0 x x))

(module+ test
  (require rackunit)

  (test-case
   "sqrt(x) by Newton method"

   (check-= (sqrt 10000.0) 100.0 0.00001 "I work")
   (check-= (sqrt 0.0004) 0.02 0.000000001 "I work")
   (check-= (sqrt 9000000.0) 3000 0.00001 "I work")))
