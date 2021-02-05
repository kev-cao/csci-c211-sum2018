;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Merge-Sort) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Generative Recursion
; merge-sort: [ListOf Number] -> [ListOf Number]

(define (merge-sort lon)
  (local
      [(define take (λ (lon n) (cond
                          [(empty? lon) empty]
                          [(<= n 0) empty]
                          [else (cons (first lon) (take (rest lon) (sub1 n)))])))
       (define drop (λ (lon n) (cond
                          [(empty? lon) empty]
                          [(<= n 0) lon]
                          [else (drop (rest lon) (sub1 n))])))
       (define mid (/ (length lon) 2))
       (define merge (λ (L1 L2)
                (cond
                  [(empty? L1) L2]
                  [(empty? L2) L1]
                  [(< (first L1) (first L2))
                   (cons (first L1) (merge (rest L1) L2))]
                  [else (cons (first L2) (merge L1 (rest L2)))])))]
  (cond
    [(empty? lon) empty]
    [(empty? (rest lon)) lon]
    [else (merge (merge-sort (take lon mid)) (merge-sort (drop lon mid)))])))