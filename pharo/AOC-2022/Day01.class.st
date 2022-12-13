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

	| fs ss totalCalories sortedCalories |
	fs := (File named: f) openForRead.
	ss := Character lf split: fs upToEnd asString.
	fs close.
	totalCalories := ([ :s | s isEmpty ] split: ss) collect: [ 
		:a1 | (a1 collect: [  :ae | ae asNumber ]) sumNumbers  
		].
	sortedCalories := totalCalories sorted: [ :a :b | a >= b ].
	^ {totalCalories max . (sortedCalories at: 1) + (sortedCalories at: 2) + (sortedCalories at: 3)}
]
