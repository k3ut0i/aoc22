"
Most of logic is in RuckSack and Utils.
"
Class {
	#name : #Day03,
	#superclass : #DayAbstract,
	#category : #'AOC-2022'
}

{ #category : #utilities }
Day03 class >> charValue: c [
	c < $a
		ifTrue: [^ (c asciiValue - $A asciiValue + 27) ]
		ifFalse: [ ^ (c asciiValue - $a asciiValue + 1) ]
	
]

{ #category : #running }
Day03 >> runWithInput: f [
	| lines part1 linesBy3 part2 |
	lines := Utils readLinesFromFile: f.
	part1 := lines sumNumbers:  [ :line | self class charValue: (RuckSack fromString: line) overlappingType ].
	linesBy3 := lines groupsOf: 3.
	part2 := linesBy3 sumNumbers: [ :group | self class charValue: ((group fold: [ :g1 :g2 | g1 asSet intersection: g2 asSet ]) atRandom)].
	"had to use atRandom to get the only remaining element of the set."
	^ { part1 . part2 }
]
