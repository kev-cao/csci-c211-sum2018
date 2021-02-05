;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Lab 5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define a 600) ; a is really the size of the frame 

; picture : Number -> Image 
; picture plots a circle at successive locations on a sinusoide 
; parametric equations essentially are: x = t and y = (sin t)
(define (picture t)
  (place-image (circle 30 "solid" "red")
               (modulo t a) ; keep the circle in the frame 
               (+ 300 (* 200 (sin (/ (* 5 pi t) 600)))) ; adjust the y 
               (empty-scene a a)))

; A world is a number.
; to-draw: A function that takes in a world and returns an image.
; on-tick: A function that takes in a world and returns a World.


; springPicture : Number -> Image 
; picture plots a circle at successive locations on a sinusoide 
; parametric equations essentially are: x = t and y = (sin t)
(define (springPicture t)
  (place-image (circle 30 "solid" "red")
               200 ; keep the circle on a vertical line 
               (+ 300 (* 200 (sin (/ (* 5 pi t) 600)))) ; adjust the y 
               (empty-scene a a)))


(big-bang 600
  [to-draw picture]
  [on-tick add1])

(big-bang 600
  [to-draw springPicture]
  [on-tick add1])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; can you document and simplify this function

; y: number -> number
; Calculates t, which will be the y position for the ball and keeps the ball inside the frame. Also calculates what happens when the ball hits the edge of the frame (continue moving up/down or switch)
(define (y t)
  (cond ((<= 0 (modulo t (* 2 a)) (/ a 2)) (- (/ a 2) (modulo t (* 2 a))))
        ((<= (/ a 2) (modulo t (* 2 a)) a) (- (modulo t (* 2 a)) (/ a 2)))
        ((<= a (modulo t (* 2 a)) (* 3 (/ a 2))) (+ (/ a 2) (modulo t a)))
        (else (+ (/ a 2) (- (* 2 a) (modulo t (* 2 a)))))))

; same question as above (not as hard though)
; Calculates y, which will be the x position for the ball and keeps the ball inside the frame. Also calculates what happens when the ball hits the edge of the frame (continue moving left/right or switch)
(define (x t)
  (cond ((< (modulo t (* 2 a)) a) (modulo t (* 2 a)))
        (else (- a (modulo t a)))))

; picture : Number -> Image
; plotting a circle at (x(t), y(t)) where x(t) and y(t) are defined above
(define (bouncepicture t)
  (place-image (circle 30 "solid" "red")
               (x (* 2 t))
               (y (* 2 t))
               (empty-scene a a)))

(big-bang 600
  [to-draw bouncepicture]
  [on-tick add1])