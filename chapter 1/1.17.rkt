#lang racket

;(define (f b n a)
;  (cond ((= n 0) a)
;        ((even? n) (f (* b b) (halve n) a))
;        (else (f (* b b) (halve (- n 1)) (* a b)))))

;(define (fast-expt b n)
;  (f b n 1))

(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))

; By iteration

(define (multilpy a b)
  (multiply-iter a b 0))

(define (multiply-iter a b count)
  (cond ((= b 0) count)
        ((even? b) (multiply-iter (double a) (halve b) count))
        (else (multiply-iter (double a) (halve (- b 1)) (+ count a)))))

; By recursion

(define (multilpy-rec a b)
  (cond ((= b 0) 0)
        (else (multiply-recur a b))))

(define (multiply-recur a b)
  (cond ((= b 1) a)
        ((even? b) (multiply-recur (double a) (halve b)))
        (else (+ a (multiply-recur (double a) (halve (- b 1)))))))

(module+ test
  (require rackunit)

  (test-case
   "Multilpy a and b in logarithmic complexity"

   (check-equal? (multilpy 2 0) 0)
   (check-equal? (multilpy 3 1) 3)
   (check-equal? (multilpy 4 2) 8)
   (check-equal? (multilpy 5 8) 40)
   (check-equal? (multilpy 7 7) 49)
   (check-equal? (multilpy 6 9) 54)
   (check-equal? (multilpy-rec 2 0) 0)
   (check-equal? (multilpy-rec 3 1) 3)
   (check-equal? (multilpy-rec 4 2) 8)
   (check-equal? (multilpy-rec 5 8) 40)
   (check-equal? (multilpy-rec 7 7) 49)
   (check-equal? (multilpy-rec 6 9) 54)
 )
)


