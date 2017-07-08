#lang racket

(define (f_rec n)
  (cond ((< n 3) n)
        (else (+ (f_rec (- n 1)) (f_rec (- n 2)) (f_rec (- n 3))))))

(define (iter a b c n)
  (cond ((= n 0) (+ a b c))
        (else (+ (iter b c (+ a b c) (- n 1))))))

(define (f_iter n)
  (cond ((< n 3) n)
        (else (iter 0 1 2 (- n 3)))))

(module+ test
  (require rackunit)

  (test-case
   "f(n) = f(n-1) + f(n-2) + f(n-3)"

   (check-equal? (f_rec 0) 0)
   (check-equal? (f_rec 1) 1)
   (check-equal? (f_rec 2) 2)
   (check-equal? (f_rec 3) 3)
   (check-equal? (f_rec 4) 6)
   (check-equal? (f_rec 5) 11)
   (check-equal? (f_rec 6) 20)
   (check-equal? (f_rec 7) 37)

   (check-equal? (f_iter 0) 0)
   (check-equal? (f_iter 1) 1)
   (check-equal? (f_iter 2) 2)
   (check-equal? (f_iter 3) 3)
   (check-equal? (f_iter 4) 6)
   (check-equal? (f_iter 5) 11)
   (check-equal? (f_iter 6) 20)
   (check-equal? (f_iter 7) 37)
 )
)