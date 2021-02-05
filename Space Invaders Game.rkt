;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Space Invaders Game|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

; Task: Create a space-invaders game where a tank can move horizontally left and right at a speed of 2 pixels per tick,
;       and a UFO will descend. If the player hits spacebar, a missile will fire, which will move upwards at two times the speed
;       of the UFO. If the missile hits the UFO, the player wins. If the UFO touches the ground, the player loses.

(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])

; A UFO is a Posn
; Interpret: (make-posn x y) is the UFO's location.
; (using conventional top-down, left-to-right)

; A Tank is a structure
;      (make-tank Number Number)
; Interpret: (make-tank x dx), x specifies the position, dx specifies the tank's speed in pixels/tick

; A Missile is a Posn
; Interpret: (make-posn x y) is the Missile's location.

(define-struct Posn [x y])
(define-struct tank [pos vel])

; A SIGS (Space Invader Game) is one of:
; -- (make-aim UFO tank)
; -- (make-fired (UFO tank missile))
; Interpret: Represents the complete state of the game. Either tank is aiming, or has fired.

(define tank-im
  (overlay (rectangle 

; Render: SIGS -> Image
; Takes a SIGS (game state) and renders it as an image onto a BACKGROUND
(define (si-render sigs)
  (cond 