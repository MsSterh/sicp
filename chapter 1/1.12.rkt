#lang racket

;            1
;          1   1
;        1   2   1
;      1   3   3   1
;    1   4   6   4   1
;  1   5   10  10  5   1

(define (pascals_triangle i j)
  (cond ((= j 0) 1)
        ((= i j) 1)
        (else (+ (pascals_triangle (- i 1) (- j 1)) (pascals_triangle (- i 1) j)))
  ))

(module+ test
  (require rackunit)

  (test-case
   "Pascal's triangle"

   (check-equal? (pascals_triangle 0 0) 1)
   (check-equal? (pascals_triangle 3 0) 1)
   (check-equal? (pascals_triangle 7 0) 1)
   (check-equal? (pascals_triangle 3 3) 1)
   (check-equal? (pascals_triangle 5 5) 1)
   (check-equal? (pascals_triangle 3 1) 3)
   (check-equal? (pascals_triangle 4 2) 6)
   (check-equal? (pascals_triangle 4 3) 4)
   (check-equal? (pascals_triangle 5 1) 5)
   (check-equal? (pascals_triangle 5 3) 10)
 )
)