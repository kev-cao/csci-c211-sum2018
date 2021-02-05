;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Homework 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image) ;Import image module

(define (adjust factor number)
  (floor (* factor number))) ;Scaling function

(define (backdrop scale) (overlay/align "middle" "bottom" (rectangle (adjust scale 250) (adjust scale 40) "solid" "forestgreen") ;Grass
                                (rectangle (adjust scale 250) (adjust scale 250) "solid" "deepskyblue"))) ;Background
(define (roof scale) (isosceles-triangle (adjust scale 100) 120 "solid" "brown")) ;Roof
(define (roof2 scale) (isosceles-triangle (adjust scale 130) 110 "solid" "brown")) ;Roof2
(define (chimney scale) (rectangle (adjust scale 20) (adjust scale 30) "solid" "firebrick")) ;Chimney
(define (tophalf scale) (rectangle (adjust scale 150) (adjust scale 50) "solid" "gray")) ;TopHalf
(define (bottomhalf scale) (rectangle (adjust scale 180) (adjust scale 70) "solid" "gray")) ;BottomHalf
(define (window scale) (above (beside (overlay (square (adjust scale 11) "solid" "lightcyan") (square (adjust scale 12) "outline" "black")) ;Lightcyan square gives color to window, black sqaure is the window outline
                              (overlay (square (adjust scale 11) "solid" "lightcyan") (square (adjust scale 12) "outline" "black")))
                      (beside (overlay (square (adjust scale 11) "solid" "lightcyan") (square (adjust scale 12) "outline" "black"))
                              (overlay (square (adjust scale 11) "solid" "lightcyan") (square (adjust scale 12) "outline" "black"))))) ;Window

                      
(define (door scale) (overlay/xy (overlay/offset (above (beside (overlay(rectangle (adjust scale 10) (adjust scale 15) "outline" "black") (rectangle (adjust scale 9) (adjust scale 14) "solid" "chocolate"))
                                                        (overlay(rectangle (adjust scale 10) (adjust scale 15) "outline" "black") (rectangle (adjust scale 9) (adjust scale 14) "solid" "chocolate"))) ;Blocks under door window, colored in so bottom circle of window doesn't show
                                                (beside (rectangle (adjust scale 10) (adjust scale 15) "outline" "black")
                                                        (rectangle (adjust scale 10) (adjust scale 15) "outline" "black"))) ;Lower rectangles of door design
                                         (adjust scale 0) (adjust scale -15)
                                         (overlay (circle (adjust scale 10) "outline" "black")
                                                  (circle (adjust scale 9) "solid" "lightcyan"))) ;Door window
                         (adjust scale -3) (adjust scale -4)
                         (overlay/xy (circle (adjust scale 12.5) "solid" "chocolate") ;Top rounded section of door
                         (adjust scale 0) (adjust scale 12.5)
                         (rectangle (adjust scale 25) (adjust scale 35) "solid" "chocolate")))) ;Holy god this was a pain to sort out all the parentheses. I should have defined the components, but I was thinking "Well I'm so far into it,  I can't stop now."

(define (cloud scale) (overlay/offset (overlay/offset (ellipse (adjust scale 30) (adjust scale 20) "solid" "snow")
                                              (adjust scale 15) (adjust scale 10)
                                              (ellipse (adjust scale 28) (adjust scale 15) "solid" "snow"))
                              (adjust scale -14) (adjust scale 8)
                              (ellipse (adjust scale 30) (adjust scale 17) "solid" "snow"))) ;Cloud
                         
                      


(define (house scale)
  (place-image (window scale) (adjust scale 160) (adjust scale 110)
               (place-image (window scale) (adjust scale 80) (adjust scale 110)
                            (place-image (window scale) (adjust scale 180) (adjust scale 185)
                                         (place-image (window scale) (adjust scale 65) (adjust scale 185)
                                                      (place-image (roof scale) (adjust scale 120) (adjust scale 65)
                                                                   (place-image (chimney scale) (adjust scale 175) (adjust scale 66)
                                                                                (place-image (tophalf scale) (adjust scale 120) (adjust scale 110)
                                                                                             (place-image (roof2 scale) (adjust scale 120) (adjust scale 120)
                                                                                                          (place-image (door scale) (adjust scale 120) (adjust scale 197)
                                                                                                                       (place-image (bottomhalf scale) (adjust scale 120) (adjust scale 185)
                                                                                                                                    (place-image (cloud scale) (adjust scale 220) (adjust scale 50)
                                                                                                                                                 (place-image (cloud scale) (adjust scale 35) (adjust scale 65) (backdrop scale))))))))))))))

(house 5)