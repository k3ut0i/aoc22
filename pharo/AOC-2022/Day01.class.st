"
A reduction problem.
"
Class {
	#name : #Day01,
	#superclass : #DayAbstract,
	#category : #'AOC-2022'
}

{ #category : #running }
Day01 >> runWithInput: f [

	| fs ss |
	fs := (File named: f) openForRead.
	ss := Character lf split: fs upToEnd asString.
	fs close.
	^ (([ :s | s isEmpty ] split: ss) collect: [ :a1 | 
		   | x |
		   x := 0.
		   a1 do: [ :e | x := x + e asNumber ].
		   x ]) max
]
