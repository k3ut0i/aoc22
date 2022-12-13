"
An abstract class that combines the behaviour needed for every instance of the problem.
- common entry point *main* function to run all instances.
- common test point.
"
Class {
	#name : #DayAbstract,
	#superclass : #Object,
	#category : #'AOC-2022'
}

{ #category : #utilities }
DayAbstract class >> readLinesFromFile: f [

	| fs lines |
	fs := (File named: f) openForRead.
	lines := Character lf split: fs upToEnd asString trim.
	fs close.
	^ lines.
]

{ #category : #running }
DayAbstract >> runWithInput: inputFile [
	^ 'unimplemented function runWithInput.'
]
