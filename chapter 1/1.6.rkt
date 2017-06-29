#lang racket

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

; new if
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x)
                     x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

;(new-if (= 2 3) 0 5)
;(new-sqrt-iter 1.0 4)

(module+ test
  (require rackunit)

  (test-case
   "sqrt(x) by Newton method"

   (check-= (sqrt 9) 3.0 0.0001 "I work")
   (check-= (sqrt (+ 100 37)) 11.7047 0.0001 "I work")
   (check-= (square (sqrt 1000)) 1000 0.001 "I work")))
