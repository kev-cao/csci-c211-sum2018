;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Lab 3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;GPA Calculator (From Letter to GPA)

; A Grade is a string,
; Examples: "A", "B", "C", "D", "F"
; calcBase: string -> number
; Calculates the GPA of a grade, not including + or -.
; Examples: (calcBase "A") -> 4.0, (calcBase "B") -> 3.0
; (define (calcBase Grade)
;    ( ... if ... cond ...))
(define (calcBase Grade)
   (cond
    [(> (string-length Grade) 3) "Please type in a valid grade. (Use capital letters)."]
    [(= (string-length Grade) 2)
     (cond
       [(not (or (string=? (string-ith Grade 1) "+") (string=? (string-ith Grade 1) "-"))) "Please type in a valid grade. (Use capital letters)."]
       [(string=? (string-ith Grade 0) "A") 4.0]
       [(string=? (string-ith Grade 0) "B") 3.0]
       [(string=? (string-ith Grade 0) "C") 2.0]
       [(string=? (string-ith Grade 0) "D") 1.0]
       [(string=? (string-ith Grade 0) "F") 0.0]
       [else "Please type in a valid grade. (Use capital letters)."])]
    [(string=? (string-ith Grade 0) "A") 4.0]
    [(string=? (string-ith Grade 0) "B") 3.0]
    [(string=? (string-ith Grade 0) "C") 2.0]
    [(string=? (string-ith Grade 0) "D") 1.0]
    [(string=? (string-ith Grade 0) "F") 0.0]  
    [else "Please type in a valid grade. (Use capital letters)."]))

(check-expect (calcBase "A") 4.0)
(check-expect (calcBase "A+") 4.0)
(check-expect (calcBase "F-") 0.0)
(check-expect (calcBase "C") 2.0)
(check-expect (calcBase "D") 1.0)
(check-expect (calcBase "B") 3.0)
(check-expect (calcBase "F") 0.0)
(check-expect (calcBase "a") "Please type in a valid grade. (Use capital letters).")
(check-expect (calcBase "X") "Please type in a valid grade. (Use capital letters).")
(check-expect (calcBase "D+") 1.0)
(check-expect (calcBase "AB") "Please type in a valid grade. (Use capital letters).")
(check-expect (calcBase "A+DASC") "Please type in a valid grade. (Use capital letters).")

; A baseGPA is a string.
; Examples: "A+", "B", "C-", "F"
; calcGPA: string -> number
; Calculates what the GPA will be after adding the suffix + or -.
; Examples: (calcGPA (calcBase "B+")) -> 3.3, (calcGPA (calcBase "A-")) -> 3.7
; (define (calcGPA baseGPA)
;    ( ... calcBase ... if ... cond ...))
(define (calcGPA baseGPA)
  (cond
    [(string=? baseGPA "A+") 4.0]
    [(string=? (string-ith baseGPA 0) "F") 0.0]
    [(= (string-length baseGPA) 2)
     (cond
       [(string? (calcBase baseGPA)) (calcBase baseGPA)]
       [(string=? (string-ith baseGPA 1) "+") (+ (calcBase baseGPA) .3)]
       [(string=? (string-ith baseGPA 1) "-") (- (calcBase baseGPA) .3)])]
    [else (calcBase baseGPA)]))

(check-expect (calcGPA "A") 4.0)
(check-expect (calcGPA "B-") 2.7)
(check-expect (calcGPA "C+") 2.3)
(check-expect (calcGPA "A+") 4.0)
(check-expect (calcGPA "F-") 0.0)
(check-expect (calcGPA "F+") 0.0)
(check-expect (calcGPA "X") "Please type in a valid grade. (Use capital letters).")
(check-expect (calcGPA "a") "Please type in a valid grade. (Use capital letters).")
(check-expect (calcGPA "x-") "Please type in a valid grade. (Use capital letters).")
          

; GPA Calculator (From Number to Grade)

; A GPA is a number.
; Examples: 3.2, 4.0, 2.65, 1.45
; calcGrade: number -> letter
; Calculates the letter grade of a given GPA.
; Examples: (calcGrade 0.35) -> D-, (calcGrade 3.89) -> A, (calcGrade 2.85) -> B
; (define (calcGrade GPA)
;    (... cond ... if ... >= ... <= ... > ... < ... - ...))

(define (calcGrade GPA)
  (cond
    [(not (number? GPA)) "Please type in a valid GPA within the inclusive range of 0 to 4"]
    [(or (> GPA 4) (< GPA 0)) "Please type in a valid GPA within the inclusive range of 0 to 4"]
    [(> (string-length (number->string GPA)) 8) "This calculator can only handle up to the hundredth place."]
    [(and (<= GPA 4) (>= GPA 3.85)) "A"]
    [(and (< GPA 3.85) (>= GPA 3.5)) "A-"]
    [(and (< GPA 3.5) (>= GPA 3.15)) "B+"]
    [(and (< GPA 3.15) (>= GPA 2.85)) "B"]
    [(and (< GPA 2.85) (>= GPA 2.5)) "B-"]
    [(and (< GPA 2.5) (>= GPA 2.15)) "C+"]
    [(and (< GPA 2.15) (>= GPA 1.85)) "C"]
    [(and (< GPA 1.85) (>= GPA 1.5)) "C-"]
    [(and (< GPA 1.5) (>= GPA 1.15)) "D+"]
    [(and (< GPA 1.15) (>= GPA 0.85)) "D"]
    [(and (< GPA 0.85) (>= GPA 0.5)) "D-"]
    [(< GPA 0.5) "F"]))

(check-expect (calcGrade 2.89) "B")
(check-expect (calcGrade 0.5) "D-")
(check-expect (calcGrade 3.4) "B+")
(check-expect (calcGrade 3.85) "A")
(check-expect (calcGrade 3.6) "A-")
(check-expect (calcGrade 2.65) "B-")
(check-expect (calcGrade 2.34) "C+")
(check-expect (calcGrade 2.14) "C")
(check-expect (calcGrade 1.5) "C-")
(check-expect (calcGrade 0.9) "D")
(check-expect (calcGrade 0.43) "F")
(check-expect (calcGrade 1.43) "D+")
(check-expect (calcGrade 4.6) "Please type in a valid GPA within the inclusive range of 0 to 4")
(check-expect (calcGrade 3.223) "This calculator can only handle up to the hundredth place.")
(check-expect (calcGrade "Hello") "Please type in a valid GPA within the inclusive range of 0 to 4")


; Leap Year Determinator

; A Year is a number.
; Examples: 1945, 1203, 2014, 2039
; leapYear?: number -> string
; Determines if the given year is a leap year or not.
; Examples: (leapYear? 2004) -> "Is a leap year.", (leapYear? 2000) -> "Is not a leap year.", (leapYear? 1500) -> "Is a leap year."
; (define (leapYear? Year)
;    (... cond ... if ... < ... >= ... number? ... remainder ... = ...))

(define (leapYear? Year)
  (cond
    [(not (number? Year)) "Please give a year."]
    [(< Year 1582)
     (cond
       [(= (remainder Year 4) 0) (string-append (number->string Year) " is a leap year.")]
       [else (string-append (number->string Year) " is not a leap year.")])]
    [(>= Year 1582)
     (cond
       [(= (remainder Year 4) 0)
        (cond
          [(not (= (remainder Year 100) 0)) (string-append (number->string Year) " is a leap year.")]
          [(= (remainder Year 400) 0) (string-append (number->string Year) " is a leap year.")]
          [else (string-append (number->string Year) " is not a leap year.")])]
       [else (string-append (number->string Year) " is not a leap year.")])]))

(check-expect (leapYear? 1500) "1500 is a leap year.")
(check-expect (leapYear? 1600) "1600 is a leap year.")
(check-expect (leapYear? 1700) "1700 is not a leap year.")
(check-expect (leapYear? 2012) "2012 is a leap year.")
(check-expect (leapYear? 0) "0 is a leap year.")
(check-expect (leapYear? 1212) "1212 is a leap year.")
(check-expect (leapYear? 1203) "1203 is not a leap year.")
(check-expect (leapYear? 1933) "1933 is not a leap year.")
(check-expect (leapYear? "ABC") "Please give a year.")
          
        