;Christian Marquardt
;2/14/2019
;Lab 2
;CSCI305
;Overview: Finding the maximum sum of a consecutive list using recursion in
;the language called lisp, I also used the example list he put on the lab 

(setq list1 '(-6 10 2 1 -3 -6 12))
(setq list2 '(-2 4 -3 5 -3 1 -2 3))
(setq max 0)
    
(defun sumConsec(list)
    (cond ((null list)
        (return-from sumConsec max)))
    (setq myLength (length list))
    (setq editLength (- myLength 2))
    (setq tempMax (first list))
    (setq index (first list))
    (loop for x from 0 to editLength
          do
          (setq index (+ index (nth (+ x 1) list)))
        (cond ((> index tempMax) (setq tempMax index))))
    (cond ((< max tempMax) (setq max tempMax)))
    (sumConsec(rest list)))

(print list2)
(print "Here is the max value of consectutive numbers")
(print "max= ")
(write (sumConsec list2))
(write-line " ")
(print list1)
(print "Here is the max value of consectutive numbers")
(print "max= ")
(write (sumConsec list1))
(write-line " ")
