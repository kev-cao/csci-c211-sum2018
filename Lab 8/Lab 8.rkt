;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Lab 8|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct person [name age])
(define Kevin [make-person "Kevin" 19])
(define Kyle [make-person "Kyle" 15])
(define Chris [make-person "Chris" 20])
(define Ben [make-person "Ben" 18])

; build-list: Number (Natural) [Number -> X] -> [ListOf X]
; Constructs a list by applying the given function to the numbers from 0 to [(given number) - 1].
(define (do-nothing x) x)
(check-expect (build-list 8 do-nothing) (list 0 1 2 3 4 5 6 7))
(check-expect (build-list 5 add1) (list 1 2 3 4 5))

; filter: [X -> Boolean] [ListOf X] -> [ListOf X]
; Constructs a list created from items of a given list that hold true for a given predicate.
(check-expect (filter even? (list 1 2 3 4 5 6)) (list 2 4 6))
(check-expect (filter string? (list "hi" 2 #true)) (list "hi"))
(check-expect (filter boolean? (list "hi" 2 #true)) (list #true))
(check-expect (filter person? (list "hi" 2 #true Kevin)) (list Kevin))

; sort: [ListOf X] [X X -> Boolean] -> [ListOf X]
; Sorts the items in a given list, in order according to the given function.
(define (youngest p1 p2)
  (cond
    [(<= (person-age p1) (person-age p2)) true]
    [else false]))
(check-expect (sort (list 1 5 2 4 1)  <) (list 1 1 2 4 5))
(check-expect (sort (list Kevin Kyle Chris Ben) youngest) (list Kyle Ben Kevin Chris))

; map: [X -> Y] [ListOf X] -> [ListOf Y]
; Constructs a new list by applying a function to each item on a given list.
(check-expect (map add1 (list 1 2 3 4 5)) (list 2 3 4 5 6))
(check-expect (map sub1 (list 0 2 4 1 2)) (list -1 1 3 0 1))

; ormap: [X -> Boolean] [ListOf X] -> Boolean
; Determines whether the given predicate holds true for at least one item in a given list.
(check-expect (ormap even? (list 1 2 3 5 7 9)) true)
(check-expect (ormap even? (list 1 3 5 7)) false)

; andmap: [X -> Boolean] [ListOf X] -> Boolean
; Determines if a given predicate holds true for every item on a given list.
(check-expect (andmap even? (list 1 2 4 6 8 10)) false)
(check-expect (andmap even? (list 2 4 0 6 8)) true)

; foldr: [X Y -> Y] Y [ListOf X] -> Y
; Reduces a list using the given function from right to left.
(check-expect (foldr + 0 (list 1 2 4 5 1)) 13)
(check-expect (foldr * 1 (list 3 3 3)) 27)

; foldl: [X Y -> Y] Y [ListOf X] -> Y
; Reduces a list using the given function, but from left to right.
(check-expect (foldl cons empty (list 1 2 3)) (list 3 2 1))
(check-expect (foldl + 0 (list 1 2 3)) 6)

; apply: [X -> Y] [ListOf X] -> Y
; Applies a function using items from a list as the arguments
(check-expect (apply = (list 1 2 3)) (= 1 2 3))
(check-expect (apply max (list 1 2 3)) (max 1 2 3))
(check-expect (apply < (list 1 2 3)) (< 1 2 3))