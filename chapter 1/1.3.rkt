#lang racket

(define (square x)
  (* x x))

(define (sum_of_squares x y)
  (+ (square x) (square y)))

(define (sum_of_max_squares a b c)
  (cond ((> c b) (sum_of_max_squares c a b))
        ((> c a) (sum_of_max_squares b c a))
        (else (sum_of_squares a b))))

(module+ test
  (require rackunit)

  (test-case
   "sum_of_max_squares returns a sum of two max numbers squared"

   (check-equal? 25 (sum_of_max_squares 4 2 3))
   (check-equal? 13 (sum_of_max_squares 1 2 3))
   (check-equal? 20 (sum_of_max_squares 4 2 1))
   (check-equal? 8 (sum_of_max_squares 2 2 2))
   (check-equal? 10 (sum_of_max_squares -3 3 1))
   (check-equal? 5 (sum_of_max_squares -2 -3 1))
   (check-equal? 5 (sum_of_max_squares -3 2 -1))))