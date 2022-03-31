;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Assignment2.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 2.2

(define (make-segment start-segment end-segment)
  (list start-segment end-segment))

(define (point x y)
  (list x y))

(define (make-point x y)
  (point x y))

(define (mid-point segment)
  (list (/ (+ (caar segment) (caadr segment)) 2)
        (/ (+ (cadar segment) (cadr (cadr segment))) 2)))




(define test-segment (make-segment (make-point 1 2) (make-point 1 4)))
(mid-point test-segment)
