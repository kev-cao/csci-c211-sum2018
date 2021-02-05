;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Homework 7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; build-list: Number [Number -> Any] -> [ListOf Any]
; Creates a list of a given n elements and applies the given function to the integers from 0 to n-1 in order.
; Examples:
(define (do-nothing x) x)
(check-expect (build-list 8 do-nothing) (list 0 1 2 3 4 5 6 7))
(check-expect (build-list 5 add1) (list 1 2 3 4 5))
(check-expect (build-list 10 even?) (list #t #f #t #f #t #f #t #f #t #f))

; (build-list 10 (λ (x) x))
; Expecting: (list 0 1 2 3 4 5 6 7 8 9)
(check-expect (build-list 10 (λ (x) x)) (list 0 1 2 3 4 5 6 7 8 9))

; (build-list 10 (λ (x) (+ 1 x)))
; Expecting: (list 1 2 3 4 5 6 7 8 9 10)
(check-expect (build-list 10 (λ (x) (+ 1 x))) (list 1 2 3 4 5 6 7 8 9 10))

; (build-list 10 (λ (x) 1))
; Expecting: (list 1 1 1 1 1 1 1 1 1 1)
(check-expect (build-list 10 (λ (x) 1)) (list 1 1 1 1 1 1 1 1 1 1))

; (build-list 5 (λ (x) (/ x 10)))
; Expecting: (list 0 .1 .2 .3 .4)
(check-expect (build-list 5 (λ (x) (/ x 10))) (list 0 .1 .2 .3 .4))

; (build-list 10 (λ (x) (expt 3 x)))
; Expecting: (list 1 3 9 27 81 243 729 2187 6561 19683)
(check-expect (build-list 10 (λ (x) (expt 3 x))) (list 1 3 9 27 81 243 729 2187 6561 19683))

; evens-first: Number (Natural) -> [ListOf Number]
; Returns a list of the first n even numbers.
; Examples: (evens-first 4) -> (list 0 2 4 6)
;           (evens-first 7) -> (list 0 2 4 6 8 10 12)
;           (evens-first 0) -> empty
; (define (evens-first n)
;    (... build-list ... n ...))
(define (evens-first n)
  (build-list n (λ (x) (* x 2))))
(check-expect (evens-first 4) (list 0 2 4 6))
(check-expect (evens-first 7) (list 0 2 4 6 8 10 12))
(check-expect (evens-first 0) empty)

; evens*-first: Number (Natural) -> [ListOf Number]
; Returns a list of the first n even numbers, starting from 2.
; Examples: (evens*-first 4) -> (list 2 4 6 8)
;           (evens*-first 7) -> (list 2 4 6 8 10 12 14)
;           (evens*-first 0) -> empty
; (define (evens*-first n)
;    (... build-list ... n ...))
(define (evens*-first n)
  (build-list n (λ (x) (+ (* x 2) 2))))
(check-expect (evens*-first 4) (list 2 4 6 8))
(check-expect (evens*-first 7) (list 2 4 6 8 10 12 14))
(check-expect (evens*-first 0) empty)

; odds-first: Number (Natural) -> [ListOf Number]
; Returns a list of the first n odd numbers.
; Examples: (odds-first 5) -> (list 1 3 5 7 9)
;           (odds-first 3) -> (list 1 3 5)
;           (odds-first 0) -> empty
; (define (odds-first n)
;    (... build-list ... n ...))
(define (odds-first n)
  (build-list n (λ (x) (+ (* x 2) 1))))
(check-expect (odds-first 5) (list 1 3 5 7 9))
(check-expect (odds-first 3) (list 1 3 5))
(check-expect (odds-first 0) empty)

; powers-of-ten: Number (Natural) -> [ListOf Number]
; Returns the powers of 10 in descending order by one, starting from 0, up to a given number n.
; Examples: (powers-of-ten 5) -> (list 1 0.1 0.01 0.001 0.0001)
;           (powers-of-ten 10) -> (list 1 0.1 0.01 0.001 0.0001 0.00001 0.000001 0.0000001 0.00000001 0.000000001)
;           (powers-of-ten 0) -> empty
; (define (powers-of-ten n)
;    (... map ... build-list ... n ...))
(define (powers-of-ten n)
  (map (λ (x) (expt 10 x)) (build-list n (λ (x) (* x -1)))))
(check-expect (powers-of-ten 5) (list 1 0.1 0.01 0.001 0.0001))
(check-expect (powers-of-ten 10) (list 1 0.1 0.01 0.001 0.0001 0.00001 0.000001 0.0000001 0.00000001 0.000000001))
(check-expect (powers-of-ten 0) empty)

; (build-list 10 (λ (x) (if (= x 3) 1 0)))
; Expecting: (list 0 0 0 1 0 0 0 0 0 0)
(check-expect (build-list 10 (λ (x) (if (= x 3) 1 0))) (list 0 0 0 1 0 0 0 0 0 0))

; (build-list 10 (λ (x) (if (= x 4) 1 0)))
; Expecting: (list 0 0 0 0 1 0 0 0 0 0)
(check-expect (build-list 10 (λ (x) (if (= x 4) 1 0))) (list 0 0 0 0 1 0 0 0 0 0))

; (build-list 10 (λ (x) (if (= x 5) 1 0)))
; Expecting: (list 0 0 0 0 0 1 0 0 0 0)
(check-expect (build-list 10 (λ (x) (if (= x 5) 1 0))) (list 0 0 0 0 0 1 0 0 0 0))

; diagonal: Number (Natural) -> [ListOf [ListOf Number]]
; Takes a number and returns a list of that many lists of 0 and 1 in a diagonal arrangement.
; Examples: (diagonal 3) -> (list (list 1 0 0) (list 0 1 0) (list 0 0 1))
;           (diagonal 10) -> (list
;                              (list 1 0 0 0 0 0 0 0 0 0)
;                              (list 0 1 0 0 0 0 0 0 0 0)
;                              (list 0 0 1 0 0 0 0 0 0 0)
;                              (list 0 0 0 1 0 0 0 0 0 0)
;                              (list 0 0 0 0 1 0 0 0 0 0)
;                              (list 0 0 0 0 0 1 0 0 0 0)
;                              (list 0 0 0 0 0 0 1 0 0 0)
;                              (list 0 0 0 0 0 0 0 1 0 0)
;                              (list 0 0 0 0 0 0 0 0 1 0)
;                              (list 0 0 0 0 0 0 0 0 0 1))
; (define (diagonal n)
;    (... build-list ... map ... n ...))
(define (diagonal n)
  (map (λ (x) (build-list n (λ (y) (if (= y x) 1 0)))) (build-list n (λ (x) x))))
(check-expect (diagonal 3) (list (list 1 0 0) (list 0 1 0) (list 0 0 1)))
(check-expect (diagonal 10) (list
                              (list 1 0 0 0 0 0 0 0 0 0)
                              (list 0 1 0 0 0 0 0 0 0 0)
                              (list 0 0 1 0 0 0 0 0 0 0)
                              (list 0 0 0 1 0 0 0 0 0 0)
                              (list 0 0 0 0 1 0 0 0 0 0)
                              (list 0 0 0 0 0 1 0 0 0 0)
                              (list 0 0 0 0 0 0 1 0 0 0)
                              (list 0 0 0 0 0 0 0 1 0 0)
                              (list 0 0 0 0 0 0 0 0 1 0)
                              (list 0 0 0 0 0 0 0 0 0 1)))

; (build-list 10 (λ (x) (random 10)))
; I can't do a check-expect unfortunately due to the fact that this would be randomized. I will assume that it generates a list of 10 integers,
; randomly selected from an inclusive pool from 0 to 9.
(build-list 10 (λ (x) (random 10)))

; (build-list 10 (λ (x) (random (add1 x)))
; Once again, I can't do a check-expect. However, this will basically generate a list so that each number in the list is randomly selected from a pool
; from 0 to its position number.
(build-list 10 (λ (x) (random (add1 x))))

; random-between: Number Number Number -> [ListOf Number]
; generates a list of a given amount of numbers randomly chosen between the given low and high.
; (define (random-between low high how-many)
;    (... random ... low ... high ... how-many ... build-list ...))
(define (random-between low high how-many)
  (build-list how-many (λ (x) (+ (random (- high low)) low))))
(random-between 1 2 5)
(random-between 12 14 10)
(random-between 10 90 14)