#lang racket

(define (square x)
  (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? old-guess guess)
  (< (abs (- 1 (/ old-guess guess))) 0.000001))

(define (cube-iter old-guess guess x)
  (if (good-enough? old-guess guess)
      guess
      (cube-iter guess
                 (improve guess x)
                 x)))

(define (cube-root x)
  (cube-iter 1.0 x x))

(module+ test
  (require rackunit)

  (test-case
   "cube-root(x) by Newton method"

   (check-= (cube-root 27000000.0) 300.0 0.000001 "I work")
   (check-= (cube-root 0.000008) 0.02 0.000000001 "I work")
   (check-= (cube-root 3375.0) 15 0.000001 "I work")))
