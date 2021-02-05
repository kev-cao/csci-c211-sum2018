;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Lab 6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A Question is a structure:
(define-struct question (points total))

;;;; Exam 02 ;;;;

;; Question 1 (17 points)
; My Answer:
; a ListOfNumbers is one of:
;  -- empty
;  -- (cons Number ListOfNumbers)
; Examples: (cons 5 (cons 4 (cons 3 '()))), (cons 32 '()), '()
;
; sumlist: ListOfNumbers -> Number
; Takes in a given list of Numbers and outputs the sum of all the numbers in the list
; Examples: (sumlist (list 5 4 3)) -> 12, (sumlist (list 32)) -> 32, (sumlist '()) -> '()
; (define (sumlist alon)
;    (cond
;        [(empty? alon) ...]
;        [(cons? alon) (... (first alon) ... (sumlist (rest alon)))]))
(define (sumlist alon)
  (cond
    [(empty? alon) empty]
    [(empty? (rest alon)) (first alon)]
    [(cons? alon) (+ (first alon) (sumlist (rest alon)))]))

(check-expect (sumlist (list 5 4 3)) 12)
(check-expect (sumlist (list 32)) 32)
(check-expect (sumlist '()) '())

; My Analysis:
; I believe my answer to have received partial credit. I made sure to enumerate ListOfNumbers, and I do not think I missed anything in the design recipe. I felt
; that giving the data definition for Number was unnecessary, given that Number is an atomic value, and I would have ended up saying "A Number is a Number". However, while
; check-expects all passed, when given an empty list, the function should return 0, as the signature statement states that the output is a Number, not a ListOfNumbers. So my
; second clause of the cond statement should not exist, and the first clause should be corrected to [(empty? alon) 0] instead.

; My Given Score:
(define Q1 (make-question 14 17))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Question 2 (23 points)
; My Answer:
; a ListOfNumbers is one of:
;  -- empty
;  -- (cons Number ListOfNumbers)
; Examples: (cons 5 (cons 4 (cons 3 '()))), (cons 32 '()), '()
;
; remove-even: ListOfNumbers -> ListOfNumbers
; Takes a ListOfNumbers, removes all even numbers, and outputs the new ListOfNumbers
; Examples: (remove-even (list 5 4 3)) -> (list 5 3), (remove-even (list 32)) -> '(), (remove-even '()) -> '()
; (define (remove-even alon)
;    (cond
;        [(empty? alon) ...]
;        [(cons? alon) (... cons ... (first alon) ... (remove-even (rest alon)) ...)]))
(define (remove-even alon)
  (cond
    [(empty? alon) empty]
    [(cons? alon)
     (cond
       [(= (remainder (first alon) 2) 0) (remove-even (rest alon))]
       [else (cons (first alon) (remove-even (rest alon)))])]))

(check-expect (remove-even (list 5 4 3)) (list 5 3))
(check-expect (remove-even (list 32)) '())
(check-expect (remove-even '()) '())

; My Analysis:
; I believe my answer to have receieved full credit. Once again, ListOfNumbers has been enumerated, and I don't see anything missing in the design recipe. The check-expects
; for my function all passed, and I checked the same examples as I did in the first question as I believed they covered a good range of possible inputs.

(define Q2 (make-question 23 23))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Question 3 (23 points)
; My Answer:
; a ListOfNumbers is one of:
;  -- empty
;  -- (cons Number ListOfNumbers)
; Examples: (cons 5 (cons 4 (cons 3 '()))), (cons 32 '()), '()
;
; add1List: ListOfNumbers -> ListOfNumbers
; Takes a ListOfNumbers, adds 1 to each Number in the list, and outputs new list.
; Examples: (add1List (list 5 4 3)) -> (list 6 5 4), (add1List (list 32)) -> (list 33), (add1List '()) -> '()
; (define (add1List alon)
;    (cond
;        [(empty? alon) ...]
;        [(cons? alon) (... (cons (add1 (first alon)) ... (add1List (rest alon)) ...))]))
(define (add1List alon)
  (cond
    [(empty? alon) empty]
    [(cons? alon) (cons (add1 (first alon)) (add1List (rest alon)))]))  ; I made a mistake here. Where it says (first alon), I accidentally wrote list instead of alon.

(check-expect (add1List (list 5 4 3)) (list 6 5 4))
(check-expect (add1List (list 32)) (list 33))
(check-expect (add1List '()) '())

; My Analysis:
; I believe my answer to have lost perhaps one point here. Once again, ListOfNumbers was enumerated and the design recipe seemed to be satisfactory. The check-expects
; all passed, using the same examples as the last two questions. However, I did accidentally write list instead of alon in the second clause of the cond statement, so
; that unsurprisingly broke the code as list is a function and it expected a parameter and parenthesis for it.

(define Q3 (make-question 21 23))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Question 4 (5 points)
; My Answer:
; a
(define a #true)
(define b #false)
(check-expect (if a true false) a)
(check-expect (if b true false) b)

; My Analysis:
; I believe my answer to have received full credit. Given that a is a Boolean, it could only have two possible values, #true or #false. I've tested both poissibilities and
; compared it to my answer, and both check-expects passed.

(define Q4 (make-question 5 5))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Question 5 (7 points)
; My Answer:
; (not a)
(check-expect (if a false true) (not a))
(check-expect (if b false true) (not b))

; My Analysis:
; I believe my answer to have received full credit. Once again, a is a Boolean, and can only have two possible values. Both possibilities were tested and when compared to my
; answer, both check-expects passed.

(define Q5 (make-question 7 7))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Question 6 (10 points)
; My Answer:
; (<= n 15)
(check-expect (if (> 10 15) false true) (<= 10 15))
(check-expect (if (> 15 15) false true) (<= 15 15))
(check-expect (if (> 25 15) false true) (<= 25 15))

; My Analysis
; I believe my answer to have received full credit. I tested the three possible descriptions for n (n is less than 15, n is equal to 15, and n is greater than 15) and when
; I ran the check-expects to compare the question to my answer, all tests passed.

(define Q6 (make-question 10 10))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Question 7 (15 points)
; My Answer:
; (and (> n 15) (<= n 50))
(check-expect (if (> 10 15) (if (> 10 50) false true) false) (and (> 10 15) (<= 10 50)))
(check-expect (if (> 15 15) (if (> 15 50) false true) false) (and (> 15 15) (<= 15 50)))
(check-expect (if (> 25 15) (if (> 25 50) false true) false) (and (> 25 15) (<= 25 50)))
(check-expect (if (> 50 15) (if (> 50 50) false true) false) (and (> 50 15) (<= 50 50)))
(check-expect (if (> 75 15) (if (> 75 50) false true) false) (and (> 75 15) (<= 75 50)))

; My Analysis:
; I believe my answer to have received full credit. I tested out the five possible descriptions for n this time (n is less than 15, n is equal to 15, n is greater than 15
; but less than 50, n is equal to 50, and n is greater than 50). All five of the check-expects passed when comparing the question to my answer.

(define Q7 (make-question 15 15))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; A Question is a (make-question Number Number)

; A ListOfQuestions is one of:
;  -- empty
;  -- (cons Question ListOfQuestions)

; totalScore: ListOfQuestions -> Number
; Calculates the total number of points earned in a given ListOfQuestions
; Example: (totalScore (list (make-question 20 20) (make-question 15 30) (make-question 25 27))) -> 60, (totalScore '()) -> '()
; (define (totalScore aloq)
;    (cond
;        [(empty? aloq) ...]
;        [(cons? aloq) (... (question-points (first aloq)) ... (totalScore (rest aloq)) ...)]))
(define (totalScore aloq)
  (cond
    [(empty? aloq) empty]
    [(empty? (rest aloq)) (question-points (first aloq))]
    [(cons? aloq) (+ (question-points (first aloq)) (totalScore (rest aloq)))]))

(check-expect (totalScore (list (make-question 20 20) (make-question 15 30) (make-question 25 27))) 60)
(check-expect (totalScore '()) '())

; totalPoints: ListOfQuestions -> Number
; Calculates the total amount of possible points in a given ListOfQuestions
; Example: (totalPoints (list (make-question 20 20) (make-question 15 30) (make-question 25 27))) -> 77, (totalPoints '()) -> '()
; (define (totalPoints aloq)
;    (cond
;        [(empty? aloq) ...]
;        [(cons? aloq) (... (question-total (first aloq)) ... (totalScore (rest aloq)) ...)]))
(define (totalPoints aloq)
  (cond
    [(empty? aloq) empty]
    [(empty? (rest aloq)) (question-total (first aloq))]
    [(cons? aloq) (+ (question-total (first aloq)) (totalPoints (rest aloq)))]))

(check-expect (totalPoints (list (make-question 20 20) (make-question 15 30) (make-question 25 27))) 77)
(check-expect (totalPoints '()) '())

; percentage: ListOfQuestions -> Number
; Calculates the percentage of points earned out of the total possible points in a ListOfQuestions
; Example (percentage (list (make-question 20 20) (make-question 15 30) (make-question 25 27))) -> #i 77.9, (percentage '()) -> '()
; (define (percentage aloq)
;    (cond
;        [(empty? aloq) ...]
;        [(cons? aloq) (... (totalScore aloq) ... (totalPoints aloq) ...)]))
(define (percentage aloq)
  (cond
    [(empty? aloq) empty]
    [(cons? aloq) (* (/ (totalScore aloq) (totalPoints aloq)) 100)]))

(check-within (percentage (list (make-question 20 20) (make-question 15 30) (make-question 25 27))) 77.9 .1)
(check-expect (percentage '()) '())


;Total Score Calculator
; % is a number.
; Examples: 44, 56, 0, 94
; calcGrade: number -> string
; Takes a given number and converts it to the correct letter grade.
; Examples: (calcGrade 92) -> "A-", (calcGrade 33) -> "F', (calcGrade 76) -> "C"
; (define (calcGrade $)
;    (... cond ... < ... >= ...)
(define (calcGrade %)
  (cond
    [(< % 59.5) "F"]
    [(< % 62.5) "D-"]
    [(< % 66.5) "D"]
    [(< % 69.5) "D+"]
    [(< % 72.5) "C-"]
    [(< % 76.5) "C"]
    [(< % 79.5) "C+"]
    [(< % 82.5) "B-"]
    [(< % 86.5) "B"]
    [(< % 89.5) "B+"]
    [(< % 92.5) "A-"]
    [(< % 96.5) "A"]
    [(>= % 97) "A+"]))
(check-expect (calcGrade 50) "F")
(check-expect (calcGrade 83) "B")
(check-expect (calcGrade 70) "C-")
(check-expect (calcGrade 97.1) "A+")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Calculating My Score

(define ExamQuestions (list Q1 Q2 Q3 Q4 Q5 Q6 Q7))

(string-append "I graded my exam to be a " (number->string (totalScore ExamQuestions)) " out of " (number->string (totalPoints ExamQuestions)) ". " "That is a " (calcGrade (percentage ExamQuestions)) ".")

