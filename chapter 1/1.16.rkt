#lang racket

;(define (fast-expt b n)
;  (cond ((= n 0) 1)
;        ((even? n) (square (fast-expt b (/ n 2))))
;        (else (* b (fast-expt b (- n 1))))))

(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (f b n a)
  (cond ((= n 0) a)
        ((even? n) (f (square b) (/ n 2) a))
        (else (f (square b) (/ (- n 1) 2) (* a b)))))

(define (fast-expt b n)
  (f b n 1))

(module+ test
  (require rackunit)

  (test-case
   "Quick exp by iteration"

   (check-equal? (fast-expt 2 0) 1)
   (check-equal? (fast-expt 2 1) 2)
   (check-equal? (fast-expt 2 2) 4)
   (check-equal? (fast-expt 2 3) 8)
   (check-equal? (fast-expt 2 4) 16)
   (check-equal? (fast-expt 2 5) 32)
   (check-equal? (fast-expt 2 6) 64)
   (check-equal? (fast-expt 2 7) 128)
   (check-equal? (fast-expt 2 8) 256)
   (check-equal? (fast-expt 4 3) 64)
   (check-equal? (fast-expt 4 4) 256)
   (check-equal? (fast-expt 4 5) 1024)
   (check-equal? (fast-expt 4 6) 4096)
   (check-equal? (fast-expt 4 7) 16384)
   (check-equal? (fast-expt 4 8) 65536)
   (check-equal? (fast-expt 3 5) 243)
   (check-equal? (fast-expt 3 6) 729)
   (check-equal? (fast-expt 2 8) 256)
   (check-equal? (fast-expt -4 3) -64)
   (check-equal? (fast-expt -2 3) -8)
 )
)