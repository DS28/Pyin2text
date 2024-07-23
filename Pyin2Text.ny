;nyquist plug-in
;version 4
;type analyze
;name "Pyin2Text.."
;author "DS28"
;date 2024.07.23

(setf note-names (list "C" "C#" "D" "D#" "E" "F" "F#" "G" "G#" "A" "A#" "B"))
(let ((labels (nth 1 (nth 0 (aud-get-info "labels")))))
  (do ((count 0 (+ 1 count)))
      ((>= count (length labels)) labels)
    (let ((notevalue (number-string-p (nth 2 (nth count labels)))))
      (setf notevalue (format nil "~a~a" (nth (rem (round (+ 57 (* 12 (/ (log (/ notevalue 440.0)) (log 2.0))))) 12) note-names) (/ (round (+ 57 (* 12 (/ (log (/ notevalue 440.0)) (log 2.0))))) 12)))
      (setf (nth 2 (nth count labels)) notevalue))))
