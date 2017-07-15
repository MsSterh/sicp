#lang racket

(define (* a b)
  (mult a b 0))

(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (mult a b x)
  (cond ((= b 0) x)
        ((even? b) (mult (double a) (halve b) x))
        (else (mult (double a) (halve (- b 1)) (+ x a)))))

(module+ test
  (require rackunit)

  (test-case
   "Multiply a and b"

   (check-equal? (* 2 0) 0)
   (check-equal? (* 2 1) 2)
   (check-equal? (* 2 2) 4)
   (check-equal? (* 2 3) 6)
   (check-equal? (* 2 4) 8)
 )
)


