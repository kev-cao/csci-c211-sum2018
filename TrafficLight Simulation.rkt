;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |TrafficLight Simulation|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

; an N-TrafficLight is one of:
;    0 - Light is green
;    1 - Light is yellow
;    2 - Light is red

; tl-render: N-TrafficLight -> Image
; Renders the current state as an image.
(define (tl-render N-TrafficLight)
  (cond
    [(= N-TrafficLight 0)
     (place-image (circle 20 "outline" "red")
                  25 25
                  (place-image (circle 20 "outline" "yellow")
                               25 75
                               (place-image (circle 20 "solid" "green")
                                            25 125
                                            (empty-scene 50 160))))]
    [(= N-TrafficLight 1)
     (place-image (circle 20 "outline" "red")
                  25 25
                  (place-image (circle 20 "solid" "yellow")
                               25 75
                               (place-image (circle 20 "outline" "green")
                                            25 125
                                            (empty-scene 50 160))))]
    [(= N-TrafficLight 2)
     (place-image (circle 20 "solid" "red")
                  25 25
                  (place-image (circle 20 "outline" "yellow")
                               25 75
                               (place-image (circle 20 "outline" "green")
                                            25 125
                                            (empty-scene 50 160))))]))

; tl-next; N-TrafficLight -> N-TrafficLight
; Takes the current state of the world and yields the next state.
(define (tl-next N-TrafficLight)
  (cond
    [(<= N-TrafficLight 1) (add1 N-TrafficLight)]
    [(= N-TrafficLight 2) 0]))



(define (traffic-light initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 2]))

(traffic-light 0)