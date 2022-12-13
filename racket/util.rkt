#lang racket

(provide read-lines)
(define (read-lines port)
  (let loop ([lines '()])
    (let ([line (read-line port)])
      (if (eof-object? line)
          (reverse lines)
          (loop (cons line lines))))))

(provide split-when)
(define (split-when ls proc)
  (let loop ([rest ls]
             [batch '()]
             [collection '()])
    (if (empty? rest)
        (reverse (cons (reverse batch) collection))
        (if (proc (car rest))
            (loop (cdr rest) '() (cons (reverse batch) collection))
            (loop (cdr rest) (cons (car rest) batch) collection)))))
