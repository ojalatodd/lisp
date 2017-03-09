(defun throw-die ()
	"return number between 1 and 6"
	(+ (random 6) 1))

(defun throw-dice ()
   "return list of two numbers betw 1 & 6"
   (list (throw-die) (throw-die)))

(defun snake-eyes-p (throw)
   "returns true if input is list (1 1)"
   (equal throw '(1 1)))

(defun boxcars-p (throw)
   "returns true if input is list (6 6)"
   (equal throw '(6 6)))


(defun sum-throw (throw)
   (let ((first-dice (first throw))
         (second-dice (second throw) ))
     (+ first-dice second-dice) ))

(defun instant-win-p (throw)
   (cond
    ( (equal (sum-throw throw) 7) T)
    ( (equal (sum-throw throw) 11) T)
    (T NIL) ) )


(defun instant-loss-p (throw)
   (cond
    ((equal (sum-throw throw) 2) T)
    ((equal (sum-throw throw) 3) T)
    ((equal (sum-throw throw) 12) T)
    (T NIL)))

(defun say-throw (throw)
   (let ((sum (sum-throw throw)))
     (cond
      ((snake-eyes-p throw) 'SNAKEYES)
      ((boxcars-p throw) 'BOXCARS)
      (T sum))))

(defun craps ()
   "Plays a game of craps"
   (let* ((throw (throw-dice))
     (result (cond
	          ((instant-win-p throw) (list ‘you ‘win))
	          ((instant-loss-p throw) (list ‘you ‘lose))
	          (T (list 'your 'point 'is (sum-throw throw))))))
 	(append(list 'throw (first throw) 'and (second throw) '-- (say-throw throw) '-- result))))

(defun try-for-point (point)
   (let* ((throw (throw-dice))
	(result (cond
		((equal (sum-throw throw) point) (list ‘you ‘win))
		((equal (sum-throw throw) 7) (list ‘you ‘lose))
		(T (list 'throw 'again)))))
	(append(list 'throw (first throw) 'and (second throw) '-- (say-throw throw) '-- result))))

