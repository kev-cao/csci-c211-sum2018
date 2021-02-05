;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Lab 7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; sort: [ListOf Number] [Number Number -> Boolean] -> [ListOf Number]
; Takes a [ListOf Number] and sorts it according to the function parameter.
(sort (list 3 2 4 1 6 5) <)
(sort (list 3 2 4 1 6 5) >)


;; Question 1
; evenodd: Number Number -> Boolean
; Takes two numbers and checks if they are ordered correctly (Even numbers first. If both are of same type [even/odd], sort by ascending if even, descending if odd.)
; Examples: (evenodd 2 4) -> true
;           (evenodd 4 2) -> false
;           (evenodd 2 5) -> true
;           (evenodd 5 2) -> false
;           (evenodd 3 5) -> false
;           (evenodd 5 3) -> true
; (define (evenodd a b)
;    (cond
;        [(and (even? a) (even? b)) ...]
;        [(and (even? a) (odd? b)) ...]
;        [(and (odd? a) (even? b)) ...]
;        [(and (odd? a) (odd? b)) ...]))
(define (evenodd a b)
  (cond
    [(and (even? a) (even? b)) (< a b)]
    [(and (even? a) (odd? b)) true]
    [(and (odd? a) (even? b)) false]
    [(and (odd? a) (odd? a)) (> a b)]
    [else (error "Something went wrong.")]))

(check-expect (evenodd 2 4) #true)
(check-expect (evenodd 4 2) #false)
(check-expect (evenodd 2 5) #true)
(check-expect (evenodd 5 2) #false)
(check-expect (evenodd 3 5) #false)
(check-expect (evenodd 5 3) #true)

; EvenOdd-Sort: [ListOf Number] -> [ListOf Number]
; Takes a [ListOf Number] and sorts it so that even numbers are first in the list in ascending order, and odd numbers are last in the list in descending order.
; Examples: (EvenOdd-Sort (list 4 3 6 1 2 5)) -> (list 2 4 6 5 3 1)
;           (EvenOdd-Sort (list -2 5 4 -1 3 4)) -> (list -2 4 4 5 3 -1)
; (define (EvenOdd-Sort lon)
;     (... sort ... evenodd ... lon))
(define (EvenOdd-Sort lon)
  (sort lon evenodd))

(check-expect (EvenOdd-Sort (list 4 3 6 1 2 5)) (list 2 4 6 5 3 1))
(check-expect (EvenOdd-Sort (list -2 5 4 -1 3 4)) (list -2 4 4 5 3 -1))

;;Question 2
; 21Check: Number Number -> Boolean
; Takes two numbers and checks if they are ordered correctly (Numbers less than or equal to 21 are listed first. If both are of same type [<= 21/> 21],
; order numbers less than or equal to 21 in descending order, and numbers greater than 21 in ascending order.)
; Examples: (21Check 21 13) -> true
;           (21Check 13 21) -> false
;           (21Check 21 23) -> true
;           (21Check 23 21) -> false
;           (21Check 22 23) -> true
;           (21Check 23 22) -> false
; (define (21Check a b)
;    (cond
;        [(and (<= a 21) (<= b 21)) ...]
;        [(and (<= a 21) (> b 21)) ...]
;        [(and (> a 21) (<= b 21)) ...]
;        [(and (> a 21) (> b 21)) ...]))
(define (21Check a b)
  (cond
    [(and (<= a 21) (<= b 21)) (> a b)]
    [(and (<= a 21) (> b 21)) true]
    [(and (> a 21) (<= b 21)) false]
    [(and (> a 21) (> b 21)) (< a b)]
    [else (error "Something went wrong.")]))

(check-expect (21Check 21 13) #true)
(check-expect (21Check 13 21) #false)
(check-expect (21Check 21 23) #true)
(check-expect (21Check 23 21) #false)
(check-expect (21Check 22 23) #true)
(check-expect (21Check 23 22) #false)

; a Num is a Number (integer) that falls into this interval:
; between 10 and 30

; a [ListOf Num] is one of:
;  -- empty
;  -- (cons Num [ListOf Num])

; 21-Sort: [ListOf Num] -> [ListOf Num]
; Takes a [ListOf Num] and sorts it so that numbers less than or equal to 21 are listed first in descending order, and numbers greater than 21 are listed
; afterwards in ascending order.
; Examples: (21-Sort (list 18 19 20 21 22 23 24)) -> (list 21 20 19 18 22 23 24)
;           (21-Sort (list 14 18 16 20 21 28 24 29 22)) -> (list 21 20 18 16 14 22 24 28 29)
; (define (21-Sort lon)
;    (... sort ... 21Check ... lon))
(define (21-Sort lon)
  (sort lon 21Check))

(check-expect (21-Sort (list 18 19 20 21 22 23 24)) (list 21 20 19 18 22 23 24))
(check-expect (21-Sort (list 14 18 16 20 21 28 24 29 22)) (list 21 20 18 16 14 22 24 28 29))



