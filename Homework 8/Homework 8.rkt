;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Homework 8|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;(foldr string-append "." (list "a" "b" "c" "d" "e")) -> "abcde."
;(foldl string-append "." (list "a" "b" "c" "d" "e")) -> "edcba."
;(foldr cons (list 1 2 3) (list 4 5 6)) -> (list 4 5 6 1 2 3)
;(foldl cons (list 1 2 3) (list 4 5 6)) -> (list 6 5 4 1 2 3)
;(foldr cons (list 4 5 6) (list 1 2 3)) -> (list 1 2 3 4 5 6)
;(foldl cons (list 4 5 6) (list 1 2 3)) -> (list 3 2 1 4 5 6)

; myfoldr: [X Y -> Y] Y [ListOf X] -> Y
; Reduces a list using a given function.
; Examples: (myfoldr string-append "." (list "a" "b" "c" "d" "e")) -> "abcde."
;           (myfoldr cons (list 4 5 6) (list 1 2 3)) -> (list 1 2 3 4 5 6)
;           (myfoldr cons (list 1 2 3) (list 4 5 6)) -> (list 4 5 6 1 2 3)
; (define (myfoldr fun base list)
;    (... fun ... base ... list ... (first list) ... (rest list) ... myfoldr ...))
(define (myfoldr fun base list)
  (cond
    [(empty? list) base]
    [else (fun (first list) (myfoldr fun base (rest list)))]))

(check-expect (myfoldr string-append "." (list "a" "b" "c" "d" "e")) "abcde.")
(check-expect (myfoldr cons (list 4 5 6) (list 1 2 3)) (list 1 2 3 4 5 6))
(check-expect (myfoldr cons (list 1 2 3) (list 4 5 6)) (list 4 5 6 1 2 3))

; myfoldl: [X Y -> Y] Y [ListOf X] -> Y
; Reduces a list using a given function.
; Examples: (foldl string-append "." (list "a" "b" "c" "d" "e")) -> "edcba."
;           (foldl cons (list 1 2 3) (list 4 5 6)) -> (list 6 5 4 1 2 3)
;           (foldl cons (list 4 5 6) (list 1 2 3)) -> (list 3 2 1 4 5 6)
; (define (myfoldl fun base list)
;    (... fun ... base ... list ... (first list) ... (rest list) ... myfoldl ...))
(define (myfoldl fun base list)
  (cond
    [(empty? list) base]
    [else (myfoldl fun (fun (first list) base) (rest list))]))
(check-expect (myfoldl string-append "." (list "a" "b" "c" "d" "e")) "edcba.")
(check-expect (myfoldl cons (list 1 2 3) (list 4 5 6)) (list 6 5 4 1 2 3))
(check-expect (myfoldl cons (list 4 5 6) (list 1 2 3)) (list 3 2 1 4 5 6))

; (map + (list 1 2 3 4 5) (list 3 4 5 6 7) (list -6 -5 -4 -3 -2)) -> (list -2 1 4 7 10)
; (map add1 (list 4 3 5 2 1 6 7)) -> (list 5 4 6 3 2 7 8)

; myMap: [X -> Y] [ListOf X] -> [ListOf Y]
; Constructs a new list by applying a given function to every item of a given list.
; Examples: (myMap + (list 1 2 3 4 5) (list 3 4 5 6 7) (list -6 -5 -4 -3 -2)) -> (list -2 1 4 7 10)
;           (myMap add1 (list 4 3 5 2 1 6 7)) -> (list 5 4 6 3 2 7 8)
; (define (myMap fun list)
;    (... fun ... list ... (first list) ... (rest list) ... myMap ...))

(define (myMap fun list)
  (cond
    [(empty? list) empty]
    [else (cons (fun (first list)) (myMap fun (rest list)))]))

(check-expect (myMap add1 (list 4 3 5 2 1 6 7)) (list 5 4 6 3 2 7 8))

; I was unable to set up a map that would accept an arbitrary number of arguments. I found something about rest-arguments, but that doesn't seem to work with ISL+.


(check-expect (apply + (list 4 3 2 5 7 1 6)) (+ 4 3 2 5 7 1 6))
(check-expect (apply max (list 5 8 10 12 24 2 4)) (max 5 8 10 12 24 2 4))


; myApply: [X ... -> Y] [ListOf X] -> Y
; Calls the given function and uses each item of the given list as arguments.
; Examples: (myApply + (list 4 3 2 5 7 1 6)) -> 28
;
; (define (myApply fun list)
;    (... fun ... list ... (first list) ... (rest list) ...))
(define (myApply fun list)
  (cond
    [(empty? list) (fun)]
    [(empty? (rest (rest list))) (fun (first list) (first (rest list)))]
    [else (fun (first list) (myApply fun (rest list)))]))
(check-expect (myApply + (list 4 3 2 5 7 1 6)) 28)
(check-expect (myApply * (list 2 4 5 6)) 240)
(check-expect (myApply max (list 59 241 240 -24 1240 -2)) 1240)

; myApply, however, does not work with functions that return Booleans, such as string=?, because it inevitably will result in the function
; comparing a type with a Boolean.


(check-expect (filter (lambda (x) (even? x)) (list 3 2 5 4 6 7 1 8)) (list 2 4 6 8))
(check-expect (filter (lambda (x) (even? x)) (list 3 2 5 4 6 7 1 8)) (cons 2 (cons 4 (cons 6 (cons 8 '())))))

; myFilter: [Any -> Boolean] [ListOf X] -> [ListOf X]
; Takes a filter and applies a given predicate to each item in the list, and constructs a list of only the items that held true.
; Examples: (myFilter (lambda (x) (even? x)) (list 3 2 5 4 6 7 1 8))
;
; (define (myFilter fun list)
;    (... empty? ... (first list) ... (rest list) ... myFilter ... fun ...))
(define (myFilter fun list)
  (cond
    [(empty? list) empty]
    [(fun (first list))
     (cons (first list) (myFilter fun (rest list)))]
    [else (myFilter fun (rest list))]))

(check-expect (myFilter (λ (x) (even? x)) (list 3 2 5 4 7 1 8)) (filter (λ (x) (even? x)) (list 3 2 5 4 7 1 8)))
(check-expect (myFilter (λ (x) (boolean? x)) (list #f 2 #t 4 #t 1 8)) (filter (λ (x) (boolean? x)) (list #f 2 #t 4 #t 1 8)))

; evenodd-Sort: [ListOf Number] -> [ListOf Number]
; Sorts a given list of numbers by having all the even numbers in ascending order first, followed by all the odd numbers in descending order.
; Examples: (evenodd-Sort (list 2 4 5 2 1 7 18 24 13 21)) -> (list 2 2 4 18 24 21 13 7 5 1)
;
; (define (evenodd-Sort lon)
;    (... filter ... append ... local ... lon ...))
(define (evenodd-Sort lon)
  (cond
    [(empty? lon) empty]
    [else
       (append (sort (filter even? lon) <) (sort (filter odd? lon) >))]))

(check-expect (evenodd-Sort (list 2 4 5 2 1 7 18 24 13 21)) (list 2 2 4 18 24 21 13 7 5 1))
(check-expect (evenodd-Sort (list)) (list))
(check-expect (evenodd-Sort (list 4 6 12 1514 1 0 41)) (list 0 4 6 12 1514 41 1))

; Other ISL+ Primitives:

; explode: String -> [ListOf 1String]
; Translate a string into a list of 1-letter strings
; This was intriguing; I think it would be a great way to help order given strings in alphabetical order, or to find if a letter was found in a string.
(check-expect (explode "hello") (list "h" "e" "l" "l" "o"))

; implode: [ListOf 1String] -> String
; Concatenates the list of 1-letter strings into one string.
; As with explode, I found this intriguing as it could be useful in analyzing strings, specifically in creating words.
(check-expect (implode (list "h" "e" "l" "l" "o")) "hello")

; argmax: [X -> Number] [ListOf X] -> X
; Finds the first element of the list that maximizes the output of the function.
; I found this to be incredibly useful. This way, I would not have to create code to analyze each item of the list myself if I wanted to find the largest of a list,
; for example.
(check-expect (argmax (λ (x) x) (list 3 4 6 12 124 5)) 124)

; argmix: [X -> Number] [ListOf X] -> X
; Finds the the first element of the list that minimizes the output of the function.
; Found this useful for the same reason I found argmax useful.
(check-expect (argmin (λ (x) x) (list 3 4 6 12 124 5)) 3)

; remove: Any [ListOf Any] -> [ListOf Any]
; Constructs a list like the given one, with the first occurence of the given item removed from the list.
; I liked how useful this could potentially be.
(check-expect (remove 5 (list 1 2 3 4 5 5 6)) (list 1 2 3 4 5 6))

; remove-all: Any [ListOf Any] -> [ListOf Any]
; Constructs a list like the given one, with all occurences of the given item removed from the list.
; Like remove, this is also potentially very useful.
(check-expect (remove-all 5 (list 1 2 3 4 5 5 5 5 6)) (list 1 2 3 4 6))



 


  




     