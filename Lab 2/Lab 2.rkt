;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Lab 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; +: number -> number
; Calculates the summation of two given numbers
(check-expect (+ 5 2) 7)
(check-expect (+ 2 5) 7)
(check-expect (+ 0 4) 4)
(check-expect (+ -5 3) -2)

; -: number -> number
; Calculates the difference between two given numbers by subtracting the second number from the first number
(check-expect (- 5 2) 3)
(check-expect (- 2 5) -3)
(check-expect (- 5 0) 5)
(check-expect (- -2 5) -7)

; *: number -> number
; Calculates the product of two given numbers
(check-expect (* 4 6) 24)
(check-expect (* 6 4) 24)
(check-expect (* 2 0) 0)
(check-expect (* -3 4) -12)

; /: number -> number
; Calculates the exact quotient of two given numbers by dividing the first number by the second number
(check-expect (/ 4 2) 2)
(check-expect (/ 2 4) .5)
(check-expect (/ 0 3) 0)
(check-expect (/ -10 5) -2)

; abs: number -> number
; Calculates the absolute value of a given number
(check-expect (abs 5) 5)
(check-expect (abs 0) 0)
(check-expect (abs -6) 6)

; add1: number -> number
; Increases a given number by an increment of 1
(check-expect (add1 2) 3)
(check-expect (add1 0) 1)
(check-expect (add1 -10) -9)

; ceiling: number -> number
; Determines the closest integer above the given number
(check-expect (ceiling 2.2) 3)
(check-expect (ceiling -4.6) -4)
(check-expect (ceiling 0.7) 1)

; denominator: number -> number
; Calculates the denominator of a given rational number
(check-expect (denominator 1/2) 2)
(check-expect (denominator 4/6) 3)
(check-expect (denominator 0/5) 1)

; exact->inexact: number -> number
; Converts an exact given number to an inexact one
(check-within (exact->inexact 10) 10.0 1)
(check-within (exact->inexact 0) 0.0 1)
(check-within (exact->inexact -5) -5.0 1)

; expt: number -> number
; Calculates the value of one given number (first number) with an exponent of another given number (second number)
(check-expect (expt 2 5) 32) 
(check-expect (expt 2 -2) .25)
(check-expect (expt 3 0) 1)
(check-expect (expt 0 3) 0)
(check-expect (expt -2 3) -8)

; floor: number -> number
; Determines the closest integer below a given number
(check-expect (floor 2.3) 2)
(check-expect (floor -4.5) -5)
(check-expect (floor 3.7) 3)

; gcd: number -> number
; Determines the greatest common factor of two given integers
(check-expect (gcd 10 12) 2)
(check-expect (gcd 12 24) 12)
(check-expect (gcd 0 5) 5)
(check-expect (gcd -4 -8) 4)
(check-expect (gcd -4 8) 4)

; log: number -> number
; Determines the base-e logarithm of a given number
(check-within (log 10) 2.0 1)
(check-within (log 12) 2.2 1)
(check-within (log 1/3) -2 1)
(check-expect (log 1) 0)

; max: number -> number
; Determines the larger of two given numbers
(check-expect (max 2 5) 5)
(check-expect (max 5 2) 5)
(check-expect (max -2 -4) -2)
(check-expect (max 4 4) 4)

; numerator: number -> number
; Calculates the numerator of a given rational number
(check-expect (numerator 2/3) 2)
(check-expect (numerator 4/6) 2)
(check-expect (numerator 0/100) 0)
(check-expect (numerator -6/10) -3)

; quotient: number -> number
; Calculates the integer quotient of two given numbers by dividing the first number by the second
(check-expect (quotient 4 2) 2)
(check-expect (quotient 2 4) 0)
(check-expect (quotient 8 -4) -2)

; random: number -> number
; Generates a random number a range of 0 to less than a given number
(check-within (random 12) 0 12)
(check-within (random 15) 0 15)

; remainder: number -> number
; Calculates the remainder when dividing two given numbers by dividing the first number by the second number
(check-expect (remainder 5 2) 1)
(check-expect (remainder 19 4) 3)
(check-expect (remainder -7 3) -1)
(check-expect (remainder 3 7) 3)

; sqr: number -> number
; Calculates the square of a given number
(check-expect (sqr 16) 256)
(check-expect (sqr 12) 144)
(check-expect (sqr -2) 4)
(check-expect (sqr 0) 0)

; tan: number -> number
; Calculates the tangent of a number in radians
(check-within (tan 10) 0 .8)
(check-expect (tan 0) 0)

; pi: the ratio between the circumference of a circle and its diameter and is a constant

; e: Euler's number, and a constant.

; string-append: string -> string
; Appends a second given string to the first given string
(check-expect (string-append "Hello" " world") "Hello world")

; string-length: string -> number
; Calculates the length of a string
(check-expect (string-length "Hello") 5)
(check-expect (string-length "Hi world") 8)

; string-ith: string and number -> string
; Extracts the x (equal to a given number)th position substring from a given string
(check-expect (string-ith "Hello" 4) "o")
(check-expect (string-ith "Hi world" 2) " ")

; substring: string and number -> string
; Extracts the substring starting from position x (first given number) up to position y (second given number) of a given string. If y is not given, then assume to end
(check-expect (substring "Hello" 1 3) "el")
(check-expect (substring "Hi world" 3) "world")

; circle: number and string -> image
; Creates a circle with a given radius, mode, and color

; ellipse: number and string -> image
; Creates an ellipse with a given width, height, mode, and color

; line: number and string -> image
; Creates a line connecting (0,0) to x1,y1 (denoted by the given first and second number, respectively) with a given color

; rectangle: number and string -> image
; Creates a rectangle with a given width, height, mode, and color

; text: number and string -> image
; Creates an image that draws a given string with a given font size and color

; triangle: number and string -> image
; Creates an equilateral triangle with a given side-length, mode, and color

; star: number and string -> image
; Creates a star with five points with a given side-length, mode, and color

; image-width: image -> number
; Returns the width of a given image
(check-expect (image-width(ellipse 20 40 "outline" "red")) 20)
(check-expect (image-width(beside (square 20 "solid" "orange")
                      (square 20 "outline" "blue"))) 40)

; image-height: image -> number
; Returns the height of a given image
(check-expect (image-height(ellipse 20 40 "outline" "red")) 40)
(check-expect (image-height(above (rectangle 20 30 "solid" "orange")
                                   (square 20 "outline" "blue"))) 50)

; overlay: image -> image
; Overlays all of the given images into a single image, lined up at their centers

; overlay/xy: image and number -> image
; Overlays the first given image on top of the given second image, shifted according by x (first number) pixels and y (second number) pixels

; overlay/align: image and string -> image
; Overlays two given images and uses strings (e.g. left, middle, right, etc.) to determine where the images are lined up

; empty-scene: string and number -> image
; Creates an empty scene (i.e. a rectangle with a blank outline) with a given width and height and color.

; place-image: image and number -> image
; Places a given image in a position denoted by x (first number) and y (second number) coordinates

; scene+line: image, number, and string -> image
; Adds a line of given color to an image of given size, shape, mode, and color to a position denoted by x (first number) and y (second number) coordinates.

; and: boolean -> boolean
; Takes two given expressions and if both expremaressions are true, then return true, else return false
(check-expect (and true true) true)
(check-expect (and true false) false)
(check-expect (and false false) false)

; or: boolean -> boolean
; Takes two given expressions and if at least one of the expressions is true, then return true, else return false
(check-expect (or true true) true)
(check-expect (or true false) true)
(check-expect (or false false) false)

; not: boolean -> boolean
; Takes a given expression and reverse its boolean value
(check-expect (not true) false)
(check-expect (not false) true)

; false?: boolean -> boolean
; Determines if an expression is false. If it is false, returns true, else false
(check-expect (false? false) true)
(check-expect (false? true) false)

; <: number -> boolean
; Compares two given numbers and checks if the first number is less than the second number. If it is, returns true, else returns false
(check-expect (< 4 5) true)
(check-expect (< 9 5) false)
(check-expect (< 6 6) false)

; <=: number -> boolean
; Compares two given numbers and checks if the first number is less than or equal to the second number. If it is, returns true, else returns false
(check-expect (<= 4 5) true)
(check-expect (<= 9 5) false)
(check-expect (<= 6 6) true)

; >: number -> boolean
; <: number -> boolean
; Compares two given numbers and checks if the first number is greater than the second number. If it is, returns true, else returns false
(check-expect (> 4 5) false)
(check-expect (> 9 5) true)
(check-expect (> 6 6) false)

; >=: number -> boolean
; Compares two given numbers and checks if the first number is greater than or equal to the second number. If it is, returns true, else returns false
(check-expect (>= 4 5) false)
(check-expect (>= 9 5) true)
(check-expect (>= 6 6) true)

; =: number -> boolean
; Compares two given numbers and checks if they are equal to each other. If they are, returns true, else returns false
(check-expect (= 4 4) true)
(check-expect (= 5 6) false)

; string=?: string -> boolean
; Compares two given strings and checks if they are exactly the same. If they are, returns true, else returns false
(check-expect (string=? "hello" "hello") true)
(check-expect (string=? "hello" "Hello") false)
(check-expect (string=? "hello" "hi") false)

; string<?: string -> boolean
; Compares given strings and checks if they are in strict alphabetical order, meaning no repeats. If they are, return true, else returns false
(check-expect (string<? "alan" "harry" "zack") true)
(check-expect (string<? "harry" "zack" "zack") false)
(check-expect (string<? "harry" "zack" "alan") false)

; string>?: string -> boolean
; Compares given strings and checks if they are in strict reverse alphabetical order, meaning no repeats. If they are, returns true, else returns false
(check-expect (string>? "zack" "harry" "alan") true)
(check-expect (string>? "zack" "zack" "harry") false)
(check-expect (string>? "harry" "zack" "alan") false)

; string>=?: string -> boolean
; Compares given strings and checks if they are in reverse alphabetical order. If they are, returns true, else false
(check-expect (string>=? "zack" "harry" "alan") true)
(check-expect (string>=? "zack" "zack" "harry") true)
(check-expect (string>=? "harry" "zack" "alan") false)

; string<=?: string -> boolean
; Compares given strings and checks if they are in alphabetical order. If they are, returns true, else returns false
(check-expect (string<=? "alan" "harry" "zack") true)
(check-expect (string<=? "harry" "zack" "zack") true)
(check-expect (string<=? "harry" "zack" "alan") false)

; number?: value -> boolean
; Takes a given data point and checks if it is a number. If it is, returns true, else returns false
(check-expect (number? 2) true)
(check-expect (number? "a") false)
(check-expect (number? true) false)

; string?: value -> boolean
; Takes a given data point and checks if it is a string. If it is, returns true, else returns false
(check-expect (string? "hello") true)
(check-expect (string? 2) false)
(check-expect (string? true) false)

; image?: value -> boolean
; Takes a given data point and checks if it is an image. If it is, returns true, else returns false
(check-expect (image? (circle 10 "solid" "brown")) true)
(check-expect (image? "hello") false)
(check-expect (image? true) false)

; boolean?: value -> boolean
; Takes a given data point and checks if it is a boolean. If it is, returns true, else returns false
(check-expect (boolean? false) true)
(check-expect (boolean? (= 1 2)) true)
(check-expect (boolean?  2) false)

; integer?: value -> boolean
; Takes a given data point and checks if it is an integer. If it is, returns true, else returns false
(check-expect (integer? 35) true)
(check-expect (integer? 23.5) false)
(check-expect (integer? true) false)

; rational?: value -> boolean
; Takes a given data point and checks if it is a rational number. If it is, returns true, else returns false
(check-expect (rational? 124) true)
(check-expect (rational? -51.253) true)
(check-expect (rational? pi) true)
(check-expect (rational? "hello") false)
; the only nonreal number I know is i, and i isn't defined so I won't be using at as an example. If I had to make an example, I would use (check-expect (rational? i) false)

; complex?: value -> boolean
; Takes a given data point and checks if it is a complex number. If it is, returns true, else returns false
(check-expect (complex? 2) true)
(check-expect (complex? -512.123) true)
(check-expect (complex? false) false)
; once again, because i isn't defined, I will have to show it here. (check-expect (complex? (+2 (*3 i))) true)

; exact?: number -> boolean
; Takes a given number and checks if it is an exact number. If it is, returns true, else returns false
(check-expect (exact? 3) true)
(check-expect (exact? 3.5) true)
(check-expect (exact? #i3.2) false)


; inexact?: number -> boolean
; Takes a given number and checks if it is an inexact number? If it is, returns true, else returns false
(check-expect (inexact? 5) false)
(check-expect (inexact? 7.9) false)
(check-expect (inexact? #i2.4) true)
