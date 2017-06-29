#lang racket

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; (define (a-plus-abs-b-v2 a b)
;  (cond ((> b 0) (+ a b))
;        ((< b 0) (- a b))))

(module+ test
  (require rackunit)

  (test-case
   "sum a and |b|"

   (check-equal? 5 (a-plus-abs-b 2 3))
   (check-equal? 3 (a-plus-abs-b 1 -2))))