#lang racket

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- 1 (/ (cube guess) x))) 0.00001))

(define (cube-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-iter (improve guess x)
                 x)))

(define (cube-root x)
  (cube-iter 1.0 x))

(module+ test
  (require rackunit)

  (test-case
   "cube-root(x) by Newton method"

   (check-= (cube-root 27000000) 300.0 0.0001 "I work")
   (check-= (cube-root 0.000008) 0.02 0.0000001 "I work")
   (check-= (cube-root 3375) 15 0.0001 "I work")))
