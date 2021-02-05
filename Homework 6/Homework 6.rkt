;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Homework 6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)

; read-words: file -> list of strings


; A Frequency is a structure
;    - (make-frequency String Number)
(define-struct frequency (word count))
; Interpretation: The string represents a word, and the number represents the frequency of the number, or how often it was detected.
; Examples:
(define Yes-Freq (make-frequency "Yes" 12))
(define No-Freq (make-frequency "No" 8))
(define Maybe-Freq (make-frequency "Maybe" 23))
(define Undecided-Freq (make-frequency "Undecided" 30))

; A List-of-Strings is one of:
;    - '()
;    - (cons S (List-of-Strings))
; S is a string.

; A List-of-Frequency is one of:
;    - '()
;    - (cons Frequency (List-of-Frequency))
; Frequency is a structure.

; count-word: List-of-Frequency and String -> List-of-Frequency
; Increases the frequency of a word by one in the Frequency structure in a List-of-Frequency
; Example:
;     (define List-of-Frequency (cons Yes-Freq (cons No-Freq '())))
;     (count-word List-of-Frequency "Yes") -> List-of-Frequency [(define List-of-Frequency (cons (make-frequency "Yes" 13) (cons No-Freq '())))]
; (define (count-word alof w)
;    (cond
;        [(empty? alof) ...)]
;        [(cons? alof)
;           (cond
;              [(string=? (frequency-word (first alof)) w) ...]
;              [else (count-word (rest alof))...]))
(define (count-word alof w)
  (cond
    [(not (string? w)) "The second parameter must be a string."]
    [(not (list? alof)) "The first parameter must be a list."]
    [(empty? alof) (list (make-frequency w 1))]
    [(not (frequency? (first alof))) "The first parameter is not a List-of-Frequency."]
    [(cons? alof)
     (cond
       [(string=? (frequency-word (first alof)) w) (cons (make-frequency (frequency-word (first alof)) (add1 (frequency-count (first alof)))) (rest alof))]
       [else (cons (first alof) (count-word (rest alof) w))])]
    [else (error "Bad Input")]))



(check-expect (count-word (list
                           (make-frequency "A" 12)
                           (make-frequency "B" 14)) "C")
              (list
               (make-frequency "A" 12)
               (make-frequency "B" 14)
               (make-frequency "C" 1)))
;;;;;;;;;;;;
(check-expect (count-word (list
                           (make-frequency "A" 12)
                           (make-frequency "B" 14)) "A")
              (list
               (make-frequency "A" 13)
               (make-frequency "B" 14)))
;;;;;;;;;;;;
(check-expect (count-word (list
                           (make-frequency "A" 12)
                           (make-frequency "B" 14)) "B")
              (list
               (make-frequency "A" 12)
               (make-frequency "B" 15)))
;;;;;;;;;;;;
(check-expect (count-word (list ) "A")
              (list
               (make-frequency "A" 1)))
;;;;;;;;;;;;
(check-expect (count-word (list ) 2)
              "The second parameter must be a string.")
;;;;;;;;;;;;
(check-expect (count-word 2 "A")
              "The first parameter must be a list.")
;;;;;;;;;;;;
(check-expect (count-word (list "A" "B") "A")
              "The first parameter is not a List-of-Frequency.")


; count-all-words: List-of-Strings -> List-of-Frequency
; Takes a List-of-Strings, counts the frequency of all the words in the list, and converts it into a List-of-Frequencies
; Example: (count-all-words (list "A" "A" "A" "B" "C" "C" "E" "E")) -> (list (make-frequency "A" 3) (make-frequency "B" 1) (make-frequency "C" 2) (make-frequency "E" 2))
; (define (count-all-words alos)
;    (cond
;        [(empty? alos) ...]
;        [(cons? alos) ... (count-word (count-all-words (rest alos)) ... (first alos)...]
(define (count-all-words alos)
  (cond
    [(empty? alos) alos]
    [(cons? alos)
     (count-word (count-all-words (rest alos)) (first alos))]
    [else (error "Bad Input")]))

(check-expect (count-all-words (list "A" "A" "A" "B" "C" "C" "E" "E"))
              (list
               (make-frequency "E" 2)
               (make-frequency "C" 2)
               (make-frequency "B" 1)
               (make-frequency "A" 3)))
;;;;;;;;;;;;
(check-expect (count-all-words (list ))
              (list ))
;;;;;;;;;;;;
(check-expect (count-all-words (list "2" "1" "2" "3" "4" "4" "3" "4" "3" "4"))
              (list
               (make-frequency "4" 4)
               (make-frequency "3" 3)
               (make-frequency "2" 2)
               (make-frequency "1" 1)))

; greater-than: frequency frequency -> Boolean
; Compares two frequencies and determines if the frequency-count of the first is greater than the second; given a tie,
; then checks if the frequency-word of the first freqeuency comes first in the alphabet
; Example: (greater-than (make-frequency "Bernie" 12) (make-frequency "Trump" 17)) -> #false
;          (greater-than (make-frequency "Bernie" 15) (make-frequency "Barbie" 15)) -> #false
;          (greater-than (make-frequency "Barbie" 15) (make-frequency "Bernie" 15)) -> #true
; (define (greater-than freq freq2)
;     (cond
;         [(> (frequency-count freq) (frequency-count freq2) ...)]
;         [(= (frequency-count freq) (frequency-count freq2)...
;            (cond
;                [(string<=? ...]
;                [else ...])]
;         [else ...]))
(define (greater-than freq freq2)
  (cond
    [(> (frequency-count freq) (frequency-count freq2)) #true]
    [(= (frequency-count freq) (frequency-count freq2))
     (cond
       [(string<=? (frequency-word freq) (frequency-word freq2)) #true]
       [else #false])]
    [else #false]))

(check-expect (greater-than (make-frequency "Bernie" 12) (make-frequency "Trump" 17))
              #false)
;;;;;;;;;;;;
(check-expect (greater-than (make-frequency "Bernie" 15) (make-frequency "Barbie" 12))
              #true)
;;;;;;;;;;;;
(check-expect (greater-than (make-frequency "Bernie" 15) (make-frequency "Barbie" 15))
              #false)
;;;;;;;;;;;;
(check-expect (greater-than (make-frequency "Barbie" 15) (make-frequency "Bernie" 15))
              #true)


; biggest: A-List-of-Frequency -> Frequency
; Finds the biggest (as determined by greater-than) in a List-of-Frequency
; Examples: (biggest (list (make-frequency "A" 12) (make-frequency "B" 11) (make-frequency "C" 33))) ->  (make-frequency "C" 33)
;           (biggest (list (make-frequency "A" 12) (make-frequency "AB" 12) (make-frequency "B" 5))) -> (make-frequency "A" 12)
; (define (biggest alof)
;     (cond
;         [(empty? ...) ...]
;         [(greater-than (first alof) (first (rest alof))) ...]
;         [else (biggest (rest alof))]))
(define (biggest alof)
  (cond
    [(empty? (rest alof)) (first alof)]
    [(greater-than (first alof) (first (rest alof)))
        (biggest (cons (first alof) (rest (rest alof))))]
    [else (biggest (rest alof))]))

(check-expect (biggest (list (make-frequency "A" 12) (make-frequency "B" 11) (make-frequency "C" 33)))
              (make-frequency "C" 33))
;;;;;;;;;;;;
(check-expect (biggest (list (make-frequency "A" 12) (make-frequency "AB" 12) (make-frequency "B" 5)))
              (make-frequency "A" 12))


; remove-freq: A-List-of-Frequency and Frequency -> A-List-of-Frequency
; Removes a Frequency from a List-of-Frequency.
; Examples: (remove-freq (list (make-frequency "Bernie" 12) (make-frequency "Barbie" 12) (make-frequency "Trump" 15)) (make-frequency "Bernie" 12)) -> (list (make-frequency "Barbie" 12) (make-frequency "Trump" 15))
;           (remove-freq (list (make-frequency "Bernie" 12) (make-frequency "Barbie" 12) (make-frequency "Trump" 15)) (make-frequency "Barbie" 12)) -> (list (make-frequency "Bernie" 12) (make-frequency "Trump" 15))
(define (remove-freq alof freq)
  (cond
    [(empty? alof) alof]
    [(and (string=? (frequency-word (first alof)) (frequency-word freq)) (= (frequency-count (first alof)) (frequency-count freq)))
     (rest alof)]
    [else (cons (first alof) (remove-freq (rest alof) freq))]))

(check-expect (remove-freq (list (make-frequency "Bernie" 12) (make-frequency "Barbie" 12) (make-frequency "Trump" 15)) (make-frequency "Bernie" 12))
              (list (make-frequency "Barbie" 12) (make-frequency "Trump" 15)))
;;;;;;;;;;;;
(check-expect (remove-freq (list (make-frequency "Bernie" 12) (make-frequency "Barbie" 12) (make-frequency "Trump" 15)) (make-frequency "Barbie" 12))
              (list (make-frequency "Bernie" 12) (make-frequency "Trump" 15)))
;;;;;;;;;;;;
(check-expect (remove-freq (list (make-frequency "Bernie" 12) (make-frequency "Barbie" 12) (make-frequency "Trump" 15)) (make-frequency "ILoveFreq" 12))
              (list (make-frequency "Bernie" 12) (make-frequency "Barbie" 12) (make-frequency "Trump" 15)))



; sort: List-of-Frequency -> List-of-Frequency
; Takes a List-of-Frequency and rearranges it in descending order by count. Alphabetical order is the determinator for any ties.
; Example: (sort (list (make-frequency "E" 2) (make-frequency "B" 1) (make-frequency "C" 2) (make-frequency "A" 3))) -> (list (make-frequency "A" 3) (make-frequency "C" 2) (make-frequency "E" 2) (make-frequency "B" 1))
; (define (sort alof)
;    (cond
;        [(empty? alof)...]
;        [(> (frequency-count (first alof)) (frequency-count (first (rest (alof))))) ...]
;        [else (sort (rest alof))...]
(define (sort alof)
  (cond
    [(empty? alof) empty]
    [(cons? alof)
     (cons (biggest alof) (sort (remove-freq alof (biggest alof))))]))

(check-expect (sort (list (make-frequency "C" 2) (make-frequency "B" 1) (make-frequency "AB" 5) (make-frequency "A" 5) (make-frequency "D" 54)))
              (list (make-frequency "D" 54) (make-frequency "A" 5) (make-frequency "AB" 5) (make-frequency "C" 2) (make-frequency "B" 1)))
;;;;;;;;;;;;
(check-expect (sort (list (make-frequency "A" 5) (make-frequency "C" 12) (make-frequency "DD" 10) (make-frequency "" 12)))
              (list (make-frequency "" 12) (make-frequency "C" 12) (make-frequency "DD" 10) (make-frequency "A" 5)))

; process: List-of-Strings -> List-of-Frequency
; Takes a List-of-Strings, and converts it into a List-of-Frequency that has been sorted in descending order by count. Alphabetical order is the determinator for any ties.
; Example: (process (list "A" "B" "AB" "AB" "A" "C" "C" "C")) -> (list (make-frequency "C" 3) (make-frequency "A" 2) (make-frequency "AB" 2) (make-frequency "B" 2))
; (define (process alos)
;    (sort (count-all-words alos)))
(define (process alos)
  (sort (count-all-words alos)))

(check-expect (process (list "A" "B" "AB" "AB" "A" "C" "C" "C")) (list (make-frequency "C" 3) (make-frequency "A" 2) (make-frequency "AB" 2) (make-frequency "B" 1)))

(process (read-words "votes.txt"))





