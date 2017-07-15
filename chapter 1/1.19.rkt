#lang racket

(define (fib-classic n)
  (fib-iter-classic 1 0 n))

(define (fib-iter-classic a b count)
  (if (= count 0)
      b
      (fib-iter-classic (+ a b) a (- count 1))))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count) (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q)) ; вычислить p’
                   (+ (* q q) (* 2 p q)) ; вычислить q’
                   (/ count 2)))
(else (fib-iter (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(module+ test
  (require rackunit)

  (test-case
   "Fib n (logarithmic complexity)"

   (check-equal? (fib 2) (fib-classic 2))
   (check-equal? (fib 4) (fib-classic 4))
   (check-equal? (fib 7) (fib-classic 7))
   (check-equal? (fib 10) (fib-classic 10))
 )
)


