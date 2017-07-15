#lang racket

;(define (fast-expt b n)
;  (cond ((= n 0) 1)
;        ((even? n) (square (fast-expt b (/ n 2))))
;        (else (* b (fast-expt b (- n 1))))))

;(define (* a b)
;  (if (= b 0)
;      0
;      (+ a (* a (- b 1)))))

(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

;(define (halve a)
;  (hal a 1))

(define (hal a h)
  (cond ((= a (double h)) h)
        (else (hal a (- h 1)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (f b n a)
  (cond ((= n 0) a)
        ((even? n) (f (* b b) (halve n) a))
        (else (f (* b b) (halve (- n 1)) (* a b)))))

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
 )
)


