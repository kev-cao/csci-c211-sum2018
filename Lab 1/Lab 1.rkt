;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Lab 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Check-Expect Converting Infix to Prefix

(check-expect (+ 5 (* 4 3)) 17)

(check-expect (* 3 (+ 5 4)) 27)

(check-expect (/ -7 (+ 8 (* 5 9))) (/ -7 53))

(check-expect (+ (* 7 0.5) (* 6 0.4) (* 5 0.3)) 7.4)

(define x 5)

(define y 10)

(check-expect (- (* 2 x) (+ 3 4 5)) -2)

(check-expect (+ (* 2 x) (* 3 y)) 40)


; Circle Assignment

(require 2htdp/image)

(define redcircle (circle 10 "solid" "red"))
(define 1Circle redcircle)
(define 2Circles (beside redcircle
                         redcircle))
(define 3Circles (beside redcircle
                         redcircle
                         redcircle))
(define 4Circles (beside redcircle
                         redcircle
                         redcircle
                         redcircle))

(above 1Circle
       2Circles
       3Circles
       4Circles)

;Sandbox (Trying out other codes)

(define head (circle 10 "outline" "black"))
(define blank (circle 10 "outline" "white"))
(define body (line 0 30 "black"))
(define limb1 (line -15 20 "black"))
(define limb2 (line 15 20 "black"))
(define textbox (rectangle 40 20 "outline" "black"))
(define word (text "Hello!" 15 "black"))


(above (beside blank
               blank
               blank
               blank
               head
               blank
               (overlay word textbox))
       (beside blank
               limb1
               body
               limb2)
       (beside blank
               limb1
               limb2))

       

