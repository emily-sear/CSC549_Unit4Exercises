;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Assignment2.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 2.3

(define (make-rectangle segment-top segment-right segment-bottom segment-left)
  (list segment-top segment-right segment-bottom segment-left))

(define (make-rectangle-segments segment-top segment-left)
  (cond
    ((and (= (caar segment-top) (caar segment-left))
           (= (cadar segment-top) (cadar segment-left)))
      (make-rectangle segment-top (make-segment (make-point (caadr segment-top) (cadr (cadr segment-top))) (make-point (caadr segment-top) (cadr (cadr segment-left))))
                      (make-segment (make-point (cadar segment-left) (cadr (cadr segment-left))) (make-point (caadr segment-top) (cadr (cadr segment-left))))
                      segment-left))
    (else (display "Something went wrong please make sure your left segment and top segment have the first points matching."))))

(define (find-width top-segment)
  (if (< (caadr top-segment) (caar top-segment)) (- (caar top-segment) (caadr top-segment))
      (- (caadr top-segment) (caar top-segment))))

(define (find-length segment)
  (if (< (cadar segment) (cadr (cadr segment))) (- (cadr (cadr segment)) (cadar segment))
      (- (cadar segment) (cadr (cadr segment)))))

(define (find-area rectangle)
  (* (find-width (car rectangle)) (find-length (cadr rectangle))))

(define (find-perimeter rectangle)
  (+ (* (find-width (car rectangle)) 2) (* (find-length (cadr rectangle)) 2)))

(define (make-segment start-segment end-segment)
  (list start-segment end-segment))

(define (point x y)
  (list x y))

(define (make-point x y)
  (point x y))

(define (mid-point segment)
  (list (/ (+ (caar segment) (caadr segment)) 2)
        (/ (+ (cadar segment) (cadr (cadr segment))) 2)))

(define rectangle (make-rectangle-segments (make-segment (make-point 1 1) (make-point 3 1)) (make-segment (make-point 1 1) (make-point 1 4))))

(find-width (car rectangle))
(find-length (cadr rectangle))

(find-area rectangle)
(find-perimeter rectangle)
