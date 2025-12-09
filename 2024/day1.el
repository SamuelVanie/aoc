(defun smv/day1-part1 ()
  (interactive)
  (let* (
         (content (buffer-string))
         (matches (s-match-strings-all "^\\([0-9]+\\) \\([0-9]+\\)" content))
         (first-line (sort (mapcar (lambda (lst) (string-to-number (nth 1 lst))) matches) '<))
         (second-line (sort (mapcar (lambda (lst) (string-to-number  (nth 2 lst))) matches) '<))
         )
    (message "%s" (seq-reduce #'+ (map 'list (lambda (x y) (if (< x y) (- y x) (- x y))) first-line second-line) 0))
    )
 )

(defun smv/day1-part2 ()
  "Calculate the similarity score"
  (interactive)
  (let* (
         (content (buffer-string))
         (matches (s-match-strings-all "^\\([0-9]+\\) \\([0-9]+\\)" content))
         (first-line (mapcar (lambda (lst) (string-to-number (nth 1 lst))) matches))
         (second-line (mapcar (lambda (lst) (string-to-number  (nth 2 lst))) matches))
         )
    (message "%s" (seq-reduce #'+ (map 'list (lambda (x) (* x (count x second-line))) first-line) 0))
    )
  )
