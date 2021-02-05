;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Homework 4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Please simplify (if a false true) if a is a boolean value.
; A      Result
; False  True
; True   False
; Simplified: (not a)


;Please simplify (if a true false) if a is a boolean value.
; A      Result
; True   True
; False  False
; Simplified: a


;Please simplify (and a false) if a is a boolean value.
; A      Result
; True   False
; False  False
; Simplified: false

;Please simplify (or a false) if a is a boolean value.
; A      Result
; True   True
; False  False
; Simplified: a

;Please simplify (or a true) if a is a boolean value.
; A      Result
; True   True
; False  True
; Simplified: true

;Please simplify (not (false? a)) if a is a boolean value.
; A      Result
; True   True
; False  False
; Simplified: a

;Please simplify (or (< n 5) (< n 25)) if n is an integer value.
;                 -inf               5               25               inf
; (< n 5)           TTTTTTTTTTTTTTTTTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
; (< n 25)          TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTFFFFFFFFFFFFFFFFFFFF
; (or ...)          TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTFFFFFFFFFFFFFFFFFFFF
; Simplified: (< n 25)

;Please simplify (or (> n 3) (< n 5)) if n is an integer value.
;                 -inf               3                5               inf
; (> n 3)           FFFFFFFFFFFFFFFFFFTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
; (< n 5)           TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTFFFFFFFFFFFFFFFFFFF
; (or ...)          TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
; Simplified: true

;Please simplify (if (< n 20) true (> n 10)) if n is an integer value.
;                 -inf               10              20               inf
; (< n 20)          TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTFFFFFFFFFFFFFFFFFFFF
; (> n 10)          FFFFFFFFFFFFFFFFFFFTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
; (if ...)          TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
; Simplified: true

;Please simplify (if (< n 10) true (> n 20)) if n is an integer value.
;                 -inf               10              20               inf
; (< n 10)          TTTTTTTTTTTTTTTTTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
; (> n 20)          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFTTTTTTTTTTTTTTTTTT
; (if ...)          TTTTTTTTTTTTTTTTTFFFFFFFFFFFFFFFFFFTTTTTTTTTTTTTTTTTT
; Simplified: (or (< n 10) (> n 20))

;Please simplify
;(if (< n 10) 
;    (if (> n 5) 
;        true
;        false)
;    (< n 20))
;if n is an integer value.
;
;                 -inf       5        10             20               inf
; (< n 10)          TTTTTTTTTTTTTTTTTTFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
; (> n 5)           FFFFFFFFFFTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
; (< n 20)          TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTFFFFFFFFFFFFFFFFFFF
; (if (< n 10)...)  FFFFFFFFFFTTTTTTTTTTTTTTTTTTTTTTTTFFFFFFFFFFFFFFFFFFF
; Simplified: (and (> n 5) (< n 20))