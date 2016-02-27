
(define (split-number-handler number)
  ;; Handle a `split-number' request.
  (let* ((int (floor number))
         (dec (floor (* 1000 (- number int)))))
    (list (inexact->exact int)
          (inexact->exact dec))))

