;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Assignment2.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Excerise 2.1

(define (make-rat-helper n d)
  (let ((g (greatest-common-divisor (make-pos n) (make-pos d))))
    (cons (/ n g) (list (/ d g)))))

(define (check-for-negatives x)
  (cond
    ((and (< (car x) 0) (> (cadr x) 0)) (list (car x) (cadr x)))
    ((and (> (car x) 0) (< (cadr x) 0)) (list (/ (car x) -1) (/ (cadr x) -1)))
    ((and (< (car x) 0) (< (cadr x) 0)) (list (car x) (/ (cadr x) -1)))
    (else x)))

(define (make-pos x)
  (cond
    ((< x 0) (/ x -1))
    (else x)))

(define (make-rat n d)
  (check-for-negatives (make-rat-helper n d)))

(define (numer x) (car x))
(define (denom x) (car (cdr x)))




(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))



(define (greatest-common-divisor a b)
  (if (= b 0) a
      (greatest-common-divisor b (remainder a b))))



(define one-half (make-rat 1 2))
;(display one-half)

(define one-third (make-rat -1 3))
(define fourth-fifths (make-rat 4 -5))
;(display one-third)

(add-rat one-half one-third)
(mul-rat one-half one-third)
(add-rat one-third one-third)
(mul-rat one-half fourth-fifths)

