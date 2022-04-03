;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Assignment2.12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 2.12
(define (lower-bound x)
  (let ((percent (* x .1)))
    (- x percent)))

(define (upper-bound x)
  (let ((percent (* x .1)))
    (+ x percent)))

(define (lower-bound-percent x percent-int)
  (let ((percent (* x percent-int)))
    (- x percent)))

(define (upper-bound-percent x percent-int)
  (let ((percent (* x percent-int)))
    (+ x percent)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let
      ((p1 (* (lower-bound x) (lower-bound y)))
       (p2 (* (lower-bound x) (upper-bound y)))
       (p3 (* (upper-bound x) (lower-bound y)))
       (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p2 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y)))))

(define (make-interval a b)
  (list a b))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/(+ (lower-bound i)
       (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i)
        (lower-bound i)) 2))

(define (get-tolerance center percent-tolerance)
  (* center percent-tolerance))

(define (make-center-percent center percent-tolerance)
  (list center "+/-" (get-tolerance center percent-tolerance)))

(make-center-percent 6.8 .1)
