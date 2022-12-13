"
Strategy object.

"
Class {
	#name : #Strat,
	#superclass : #Object,
	#instVars : [
		'stratChar'
	],
	#category : #'AOC-2022'
}

{ #category : #accessing }
Strat >> firstTry [
	"Assume XYZ stands from RPS"
	stratChar = $X
		ifTrue: [ ^ Hand new handChar: $r ]
		ifFalse: [ 
			stratChar = $Y
				ifTrue: [ ^ Hand new handChar: $p ]
				ifFalse: [ ^ Hand new handChar: $s ] ]
]

{ #category : #'logical operations' }
Strat >> secondTry: hand [
	"Assume XYZ stands for win requirements: X - Lose, Y - Draw, Z - Win."
	^ stratChar = $X
		ifTrue: [ hand winsAgainst  ]
		ifFalse: [ stratChar = $Y
						ifTrue: [ hand copy ]
						ifFalse: [ hand losesAgainst  ] ]
	
]

{ #category : #accessing }
Strat >> stratChar: c [
	('XYZ' includes: c)
		ifTrue: [ stratChar := c. ]
		ifFalse: [ self error: 'stratChar can only be one of "abc"' ]
]
