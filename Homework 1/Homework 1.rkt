;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Homework 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image) ;Import image module

(define backdrop (overlay/align "middle" "bottom" (rectangle 250 40 "solid" "forestgreen") ;Grass
                                (rectangle 250 250 "solid" "deepskyblue"))) ;Background
(define roof (isosceles-triangle 100 120 "solid" "brown")) ;Roof
(define roof2 (isosceles-triangle 130 110 "solid" "brown")) ;Roof2
(define chimney (rectangle 20 30 "solid" "firebrick")) ;Chimney
(define tophalf (rectangle 150 50 "solid" "gray")) ;TopHalf
(define bottomhalf (rectangle 180 70 "solid" "gray")) ;BottomHalf
(define window (above (beside (overlay (square 11 "solid" "lightcyan") (square 12 "outline" "black")) ;Lightcyan square gives color to window, black sqaure is the window outline
                              (overlay (square 11 "solid" "lightcyan") (square 12 "outline" "black")))
                      (beside (overlay (square 11 "solid" "lightcyan") (square 12 "outline" "black"))
                              (overlay (square 11 "solid" "lightcyan") (square 12 "outline" "black"))))) ;Window

                      
(define door (overlay/xy (overlay/offset (above (beside (overlay(rectangle 10 15 "outline" "black") (rectangle 9 14 "solid" "chocolate"))
                                                        (overlay(rectangle 10 15 "outline" "black") (rectangle 9 14 "solid" "chocolate"))) ;Blocks under door window, colored in so bottom circle of window doesn't show
                                                (beside (rectangle 10 15 "outline" "black")
                                                        (rectangle 10 15 "outline" "black"))) ;Lower rectangles of door design
                                         0 -15
                                         (overlay (circle 10 "outline" "black")
                                                  (circle 9 "solid" "lightcyan"))) ;Door window
                         -3 -4
                         (overlay/xy (circle 12.5 "solid" "chocolate") ;Top rounded section of door
                         0 12.5
                         (rectangle 25 35 "solid" "chocolate")))) ;Holy god this was a pain to sort out all the parentheses. I should have defined the components, but I was thinking "Well I'm so far into it,  I can't stop now."

(define cloud (overlay/offset (overlay/offset (ellipse 30 20 "solid" "snow")
                                              15 10
                                              (ellipse 28 15 "solid" "snow"))
                              -14 8
                              (ellipse 30 17 "solid" "snow"))) ;Cloud
                         
                      
(define house
  (place-image window 160 110
               (place-image window 80 110
                            (place-image window 180 185
                                         (place-image window 65 185
                                                      (place-image roof 120 65
                                                                   (place-image chimney 175 66
                                                                                (place-image tophalf 120 110
                                                                                             (place-image roof2 120 120
                                                                                                          (place-image door 120 197
                                                                                                                       (place-image bottomhalf 120 185
                                                                                                                                    (place-image cloud 220 50
                                                                                                                                                 (place-image cloud 35 65 backdrop)))))))))))))

house