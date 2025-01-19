(define (Y) (lambda (f)
	      ((lambda (x)
		(f x x)
		)
	      ))
  	(lambda (x)
	  (f x x)
	  )
  )


(define Y (lambda (f) ((lambda (x) (f (x x))) (lambda (x) (f (x x))))))

(define h 
  (lambda(f) 
    (lambda (n) 
      (if (zero? n) 
	1
	(+ n (f (- n 1)))))))

