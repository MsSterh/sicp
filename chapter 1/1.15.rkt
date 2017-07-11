#lang racket

(define (cube x)
  (* x x x))

(define (p x)
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

(sine 12.15)

; 12.15 / 3 = 4.05 / 3 = 1.35 / 3 = 0.45 / 3 = 0.15 / 3 = 0.05
; procedure p is colled 5 times