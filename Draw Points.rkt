;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Draw Points|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A Point is a structure:
(define-struct point [size x y color])


; A ListOfPoints is one of:
;  -- empty
;  -- (cons Point ListOfPoints)

; A World is a ListOfPoints


; drawPoints: World -> Image
; Renders World as an Image.
(define (drawPoints w)
  (cond
    [(empty? w) (empty-scene 1000 600)]
    [(cons? w)
     (place-image (text "Use up and down arrow keys to change size, use ] to cycle between colors, use z to undo, and use backspace to delete canvas." 15 "Black")
                  500 550
                  (place-image (circle 10 "solid" (point-color (first w)))
                               980 20
                               (place-image (circle (point-size (first w)) "solid" (point-color (first w)))
                                            (point-x (first w)) (point-y (first w))
                                            (drawPoints (rest w)))))]))

; meh: World and string -> World
; Takes in a World and Mouse-Event and returns the updated World
(define (meh w x y e)
  (cond
    [(string=? e "drag")
     (cons (make-point (point-size (first w)) x y (point-color (first w))) w)]
    [else w]))

; A ListOfColors is one of:
;  -- '()
;  -- (cons Color ListOfColors)
(define Colors (list "Red" "Blue" "Green" "Yellow" "Orange" "Purple" "Gray" "Brown" "Black" "White"))

; RotateColor: ListOfColors and Color -> Color
; Accepts a ListOfColors and a current color, then outputs a different color
(define (RotateColor aloc color)
  (cond
    [(empty? (rest aloc)) "Red"]
    [(cons? aloc)
     (cond
       [(string=? color (first aloc))
          (first (rest aloc))]
       [else (RotateColor (rest aloc) color)])]))



; keh: World and string -> World
; Takes in a World and Key-Event and returns the updated World
(define (keh w a-key)
  (cond
    [(key=? a-key "up")
     (cons (make-point (add1 (point-size (first w))) (point-x (first w)) (point-y (first w)) (point-color (first w))) w)]
    [(key=? a-key "down")
     (cond
       [(< (sub1 (point-size (first w))) 0) (first w)]
       [else (cons (make-point (sub1 (point-size (first w))) (point-x (first w)) (point-y (first w)) (point-color (first w))) w)])]
    [(key=? a-key "]")
     (cons (make-point (point-size (first w)) (point-x (first w)) (point-y (first w)) (RotateColor Colors (point-color (first w)))) w)]
    [(key=? a-key "z")
     (rest w)]
    [(key=? a-key "\b")
     (list (make-point 10 0 0 "white"))]
    [else w]))

; main: World -> World
; Runs the program through big-bang
(define (main initial)
  (big-bang initial
    [to-draw drawPoints]
    [on-mouse meh]
    [on-key keh]))

(main (list (make-point 10 -12 -12 "white")))
    