;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Lambda Breakdown|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define a
  (lambda (x)
    (lambda (y)
      ((lambda (x)
         (x y))
       x))))
(define b
  (lambda (x)
    (lambda (y)
      (x y))))

((a sub1) 4)
((b sub1) 4)

(define y 3)
(define d
  (lambda (x)
    ((lambda (a)
       (x (a y)))
     x)))

(define f
  (lambda (x)
    (x (x y))))

(d sub1)
(f sub1)

; add-x: Number [ListOf Number] -> [ListOf Number]
; Adds the given number to every number in the input list.
(define (add-x x lon)
  (cond
    [(empty? lon) empty]
    [(cons? lon) (cons (+ x (first lon)) (add-x x (rest lon)))]))
(add-x 2 (list 1 2 3 4))

; add-x*
(define (add-x* x lon)
  (let [(func (λ (y) (+ x y)))]
    (map func lon)))
(add-x** 2 (list 1 2 3 4))

; add-x**: Number [ListOf Number] -> [ListOf Number]
; Adds the given number to every number in the given list.
(define (add-x** x lon)
  (map (λ (y) (+ x y)) lon))

