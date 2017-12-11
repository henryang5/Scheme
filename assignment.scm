;;; Henry Ang
;;; CSC 3310 Concepts in Programming Language
;;; 11/13/17
;;; Scheme programming assignment

#|
Write a Scheme program that implements the following functions:
(convert number base)
The function should convert the number in base 10 to its equivalent in base base
This procedure, called roll-till-you-win, takes as argument a particular bet and simulates the
rolling of a die until the bet wins
(define (roll-till-you-win bet)
(let ((die-roll (1+ (random 6))))
(display die-roll)
(newline)
(cond ((=die-roll bet) (display “You won!”))
(else (roll-till-you-win bet)))))
Modify roll-till-you-win so that the procedure makes a random bet at each roll. The new
procedure should take no arguments and simply keep rolling the die until the random bet
happens to be the same as the new roll. 
Here is a sample printout of the result:
Bet: 5 Result: 4
Bet: 1 Result: 3
Bet: 4 Result: 4
You won!
|# 

(define(convert number base)
    (if(< base 2)(display "Base must be > 1")
        (let ((quotient (truncate(/ number base))))
        (let ((remainder (modulo number base)))
        (cond ((= quotient 0) (display remainder))
            (else (begin (convert quotient base) 
		  				 (display remainder))))))))

(define (roll-till-you-win)
	(let ((die-roll1 (1+ (random 6))))
		(display "Bet: ")
        (display die-roll1)
        (display " ") 
	(let ((die-roll2 (1+ (random 6))))
		(display "Result: ")
        (display die-roll2)
        (newline)
	(cond ((= die-roll1 die-roll2) (display "You won!"))
		   (else (roll-till-you-win))))))

(define(list-primes n)
  (cond((< n 2)(display "No primes found"))
      (else
      (let loop ((i 2))
      (if (eqv? (is-prime i (truncate(/ i 2))) #t)
          (begin
              (display i)
              (newline))
              (display ""))
      (if (< i n)
          (loop (+ i 1)))))))

(define(is-prime number max)
    (cond ((= max 1) #t)
          ((= (modulo number max) 0) #f)
          (else (is-prime number (- max 1)))))


