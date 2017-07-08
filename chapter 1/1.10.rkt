#lang racket

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)

(define (f_eq n) (* 2 n))

(define (g_eq n)
  (if (= n 0)
      0
      (expt 2 n)))

(define (expt_2 n)
  (if (= n 0)
      1
      (expt 2 (expt_2 (- n 1)))))

(define (h_eq n)
  (if (= n 0)
      0
      (expt_2 n)))

(define (h_eq_2 n)
  (cond ((= n 0) 0)
        ((= n 1) 2)
        (else (expt 2 (A 2 (- n 1))))))

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

(f 2)
(g 2)
(h 2)
(k 2)

(module+ test
  (require rackunit)

  (test-case
   "f(n) == 2n"

   (check-equal? (f 0) (f_eq 0))
   (check-equal? (f 1) (f_eq 1))
   (check-equal? (f 2) (f_eq 2))
   (check-equal? (f 6) (f_eq 6))
  )

  (test-case
   "g(n) == 2^n"

   (check-equal? (g 0) (g_eq 0))
   (check-equal? (g 1) (g_eq 1))
   (check-equal? (g 2) (g_eq 2))
   (check-equal? (g 6) (g_eq 6))
  )

  (test-case
   "h(n) == 2^(2^(2^(..))) repeat n-times"

   (check-equal? (h 0) (h_eq 0))
   (check-equal? (h 1) (h_eq 1))
   (check-equal? (h 2) (h_eq 2))
   (check-equal? (h 3) (h_eq 3))
   (check-equal? (h 4) (h_eq 4))
  )

  (test-case
   "h(n) == 2^(A(a, n - 1))"

   (check-equal? (h 0) (h_eq_2 0))
   (check-equal? (h 1) (h_eq_2 1))
   (check-equal? (h 2) (h_eq_2 2))
   (check-equal? (h 3) (h_eq_2 3))
   (check-equal? (h 4) (h_eq_2 4))
  )
)