;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Homework 3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A point is one of:
;     -- (make-point number number)
(define-struct point (x y))

; Examples: (make-point 1 3)
; Examples: (make-point 4 5)

; distanceBetween: point point -> number
; Calculates the distance between two points.
; (define (distanceBetween point point2)
;    (... expt ... - ... + ... sqrt ...)
(define (distanceBetween point point2)
  (sqrt
   (+
    (expt (- (point-x point) (point-x point2)) 2)
    (expt (- (point-y point) (point-y point2)) 2))))
(check-expect (distanceBetween (make-point 3 4) (make-point 6 8)) 5)
(check-expect (distanceBetween (make-point 0 8) (make-point 7 8)) 7)
(check-within (distanceBetween (make-point 5 8) (make-point 14 16)) 12.04 .01)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; A line is one of:
;    -- (make-line point point)
(define-struct line (point1 point2))

; Examples: (make-line (make-point 1 3) (make-point 4 5))
;           (make-line (make-point 2 5) (make-point 3 6))

; line-length: line -> number
; Calculates the length of a given line
; Examples: (line-length (make-line (make-point 1 3) (make-point 4 5))) -> #i3.6056
; (define (line-length line)
;     (... point-x ... point-y ... (line-point1 line) ... (line-point2 line) ...)
(define (line-length line)
  (sqrt
   (+
    (expt (- (point-x (line-point1 line)) (point-x (line-point2 line))) 2)
    (expt (- (point-y (line-point1 line)) (point-y (line-point2 line))) 2))))

(check-expect (line-length (make-line (make-point 3 4) (make-point 6 8))) 5)
(check-within (line-length (make-line (make-point 1 3) (make-point 4 5))) 3.6056 .1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; num1/2/3 are all numbers.
; Examples: 3, 4, 7, 12, 323
; halfSum: number number number -> number
; Calculates the sum of three given numbers divided by 2.
; Examples: (halfSum 4 10 12) -> 13, (halfSum 12 20 8) -> 20, (halfSum 3 5 7) -> 7.5
; (define (halfSum num1 num2 num3)
;    (... / ... +))
(define (halfSum num1 num2 num3)
  (/ (+ num1 num2 num3) 2))
(check-expect (halfSum 4 10 12) 13)
(check-expect (halfSum 12 20 8) 20)
(check-expect (halfSum 3 5 7) 7.5)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; A triangle is one of:
;     -- (make-triangle point point point)

(define-struct triangle (point1 point2 point3))

; Examples: (make-triangle 3 3 4 4 4 6)
;         : (make-triangle 4 6 1 2 2 3)

; areaTriangle: triangle -> number
; Calculates the area of a given triangle.
; Examples: (areaTriangle (make-point 0 5) (make-point 12 5) (make-point 12 21)) -> 96
;           (areaTriangle (make-point 0 5) (make-point 12 21) (make-point 31 15)) -> 188
;           (areaTriangle (make-point 17 28) (make-point 20 33) (make-point 44 39)) -> 51
; (define (areaTriangle triangle)
;    (... - ... * ... sqrt ... make-point ...)
(define (areaTriangle point1 point2 point3)
  (sqrt
   (*
    (halfSum (distanceBetween point1 point2) (distanceBetween point2 point3) (distanceBetween point1 point3))
    (- (halfSum (distanceBetween point1 point2) (distanceBetween point2 point3) (distanceBetween point1 point3))
       (distanceBetween point1 point2))
    (- (halfSum (distanceBetween point1 point2) (distanceBetween point2 point3) (distanceBetween point1 point3))
       (distanceBetween point2 point3))
    (- (halfSum (distanceBetween point1 point2) (distanceBetween point2 point3) (distanceBetween point1 point3))
       (distanceBetween point1 point3)))))

(check-expect (areaTriangle (make-point 0 5) (make-point 12 5) (make-point 12 21)) 96)
(check-within (areaTriangle (make-point 0 5) (make-point 12 21) (make-point 31 15)) 188 1)
(check-within (areaTriangle (make-point 17 28) (make-point 20 33) (make-point 44 39)) 51 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; A Circle is one of:
;     -- (make-circl point number)

(define-struct circl (center radius))
; A radius is a natural number.

; Examples: (make-circl (make-point 3 4) 5)
;           (make-circl (make-point 6 10) 12)

; areaCircle: Circle -> Number
; Calculates the area of a given circle.
; Example: (areaCircle (mak-circle (make-point 3 4) 5)) -> #i78.5398
; (define (areaCircle circle)
;    (... circl-radius ... pi ...)
(define (areaCircle circle)
  (* pi (expt (circl-radius circle) 2)))

(check-within (areaCircle (make-circl (make-point 3 4) 5)) 78.5398 .01)
(check-within (areaCircle (make-circl (make-point 4 10) 12)) 452.389 .01)
