;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Homework 9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A [ListOf X] is one of:
;  -- empty
;  -- (cons X [ListOf X])

; An N is one of:
;  -- 0
;  -- (add1 N)


; generate: N N N -> [ListOf N]
; Returns a list of a given amount of natural numbers between a given range from low to high
; Examples: (generate 5 4 12) -> (list 5 8 10 11 4)
;           (generate 6 4 5) -> (list 4 4 4 4 4 4)
; (define (generate size low high)
;    (... random ... build-list ... let ... size ... low ... high ...))
(define (generate size low high)
  (let [(low2 ((λ (x) (if (< x 0) 0 x)) low))]
    (let [(high2 ((λ (x) (if (< x 0) 0 x)) high))]
      (build-list size (λ (x) (+ (random ((λ (x y) (if (= (- x y) 0) 1 (- x y))) high2 low2)) low2))))))

(check-expect (generate 6 4 5) (list 4 4 4 4 4 4))

(check-expect (generate 5 -10 0) (list 0 0 0 0 0))

; A Digit is one of: 
;    -- 0
;    -- 1
;    -- 2
;    -- 3
;    -- 4
;    -- 5
;    -- 6
;    -- 7
;    -- 8
;    -- 9

; amtDigits: Number -> Number
; Counts the number of digits in a number.
; Examples: (amtDigits 12) -> 2
;          (amtDigits 9) -> 1
;          (amtDigits 1245) -> 4
; (define (amtDigits n)
;    (... number->string ... local ... ormap ... string-length ... n ...))
(define (amtDigits n)
  (local
    [(define convert (λ (x) (cond
                              [(< x 0) (* x -1)]
                              [(ormap (λ (x) (string=? "/" x)) (explode (number->string x))) (convert (* x 10))]
                              [else x])))]
    (string-length (number->string (convert n)))))

(check-expect (amtDigits 12) 2)
(check-expect (amtDigits 9) 1)
(check-expect (amtDigits -14) 2)
(check-expect (amtDigits 1.431594213) 10)

; A Vowel is one of:
;   -- a
;   -- e
;   -- i
;   -- o
;   -- u

; vowel?: Any -> Boolean
; Checks if the given input is a vowel.
; Examples: (vowel? "a") -> true
;           (vowel? 2) -> false
; (define (vowel? l)
;    (... string? ... string=? ... ormap ...))
(define (vowel? l)
  (cond
    [(not (string? l)) #false]
    [else (ormap (λ (x) (string=? x l)) (list "a" "e" "i" "o" "u"))]))

(check-expect (vowel? "a") #true)
(check-expect (vowel? "u") #true)
(check-expect (vowel? "k") #false)
(check-expect (vowel? 2) #false)

; extractVowel: String -> [ListOf Vowel]
; Extracts all the vowels from a string and outputs a list of those vowels.
; Examples: (extractVowel "hello") -> (list "e" "o")
;           (extractVowel "Seen") -> (list "e" "e")
;           (extractVowel "Rhythm") -> empty
; (define (extractVowel s)
;    (... vowel? ... filter ... explode ...))
(define (extractVowel s)
  (filter vowel? (explode s)))

(check-expect (extractVowel "Hello") (list "e" "o"))
(check-expect (extractVowel "Seen") (list "e" "e"))
(check-expect (extractVowel "Rhythm") empty)



;; Sum2016 Exam 03

;Please design a function that produces a list of random integers. The function has only one
;argument (the size of the resulting list) and it should simulate throwing a dice (so the integers
;in the list should be numbers between1 1 and 6 (inclusive)). Don’t forget the design recipe.

; a DieNum is a Number in the interval [1, 6]

; dice: Number -> [ListOf DieNum]
; Picks a random number between 1 and 6, inclusive, a given amount of times.
; Examples: (dice 5) -> (list 2 5 1 4 6)
;           (dice 9) -> (list 3 5 1 2 4 5 6 6 1)
; (define (dice how-many)
;    (... random ... build-list ...))
(define (dice how-many)
  (build-list how-many (λ (x) (+ (random 6) 1))))

(dice 12)


;Please design a function that receives a (possibly empty) list of integers and calculates and reports
;the largest value in the list. Don’t forget the design recipe.

; A [Maybe X] is one of:
;  -- empty
;  -- X

; myMax: [ListOf Number] -> [Maybe Number]
; Consumes a list of numbers and calculates the largest value in the list.
; Examples: (myMax (list 1 2 3 4 5 6 7)) -> 7
;           (myMax (list 2 14 123 44 32 5)) -> 123
;           (myMax empty) -> empty
; (define (myMax lon)
;    (... max ... apply ...))
(define (myMax lon)
  (cond
    [(empty? lon) empty]
    [else (apply max lon)]))
(check-expect (myMax (list 1 2 3 4 5 6 7)) 7)
(check-expect (myMax (list 2 14 123 44 32 5)) 123)
(check-expect (myMax empty) empty)

; myMax*: [ListOf Number] -> [Maybe Number]
; Consumes a list of numbers and calculates the largest value in the list. (Not using the max function)
; Examples: (myMax* (list 1 2 3 4 5 6 7)) -> 7
;           (myMax* (list 2 14 123 44 32 5)) -> 123
;           (myMax* empty) -> empty
; (define (myMax lon)
;    (... foldl ...))
(define (myMax* lon)
  (cond
    [(empty? lon) empty]
    [else (foldl (λ (x y) (if (> x y) x y)) (- (first lon) 1) lon)]))

(check-expect (myMax* (list 1 2 3 4 5 6 7)) 7)
(check-expect (myMax* (list 2 14 123 44 32 5)) 123)
(check-expect (myMax* empty) empty)


;Write code to sort a list of integers such that all the negative numbers (if any) are listed first, in
;descending order, followed by the positive integers (if any) in ascending order. Any 0’s (if there
;are any) should be at the very end in the sorted result.

; weirdSort: [ListOf Number] -> [Maybe Number]
; Sorts a list of numbers so that all negative numbers are listed first in descending order, followed by positive numbers in ascending order. All 0's are put at the end
; of the list.
; Examples: (weirdSort (list -4 12 9 1 -56 -1 2 0 4 0)) -> (list -1 -4 -56 1 2 4 9 12 0 0)
;           (weirdSort empty) -> empty
; (define (weirdSort lon)
;    (... filter ... sort ... append ...))
(define (weirdSort lon)
  (append (sort (filter (λ (x) (< x 0)) lon) >)
          (sort (filter (λ (x) (> x 0)) lon) <)
          (filter (λ (x) (= x 0)) lon)))

(check-expect (weirdSort (list -4 12 9 1 -56 -1 2 0 4 0)) (list -1 -4 -56 1 2 4 9 12 0 0))
(check-expect (weirdSort (list -4 -3 -2 -1)) (list -1 -2 -3 -4))
(check-expect (weirdSort (list 4 2 5 16)) (list 2 4 5 16))
(check-expect (weirdSort (list 0 0 0)) (list 0 0 0))
(check-expect (weirdSort empty) empty)


;What is the value of the following ISL+ expression:
;(build-list 7 (lambda (x) (/ x 3)))

(check-expect (build-list 7 (λ (x) (/ x 3))) (list 0 1/3 2/3 1 4/3 5/3 2))


;What is the value of the following ISL+ expression:
;(foldr cons '(7 8 9) '(6 5 4))

(check-expect (foldr cons '(7 8 9) '(6 5 4)) (list 6 5 4 7 8 9))


;What is the value of the following ISL+ expression:
;(foldl cons '(4 5 6) '(7 8 9))

(check-expect (foldl cons '(4 5 6) '(7 8 9)) (list 9 8 7 4 5 6))
