;; Exercise 6.26

 (defun right-side (x)
 	(cdr (member '-vs- x)))


(defun left-side (x)
	(reverse  (cdr(member '-vs- (reverse x)))))

(defun count-common (x)
	(length (intersection (right-side x) (left-side x))))

(defun compare (x)
	(cons (count-common x) '(common features)))
