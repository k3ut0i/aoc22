"
a hand in rock paper scissors game
"
Class {
	#name : #Hand,
	#superclass : #Object,
	#instVars : [
		'handChar'
	],
	#category : #'AOC-2022'
}

{ #category : #'instance creation' }
Hand class >> fromEnc: c [

	| h |
	('ABC' includes: c) ifFalse: [ self error: 'only accepts ABC encoding or RPS' ].
	h := self new.
	h handChar: (c = $A
			 ifTrue: [ $r ]
			 ifFalse: [ 
				 c = $B
					 ifTrue: [ $p ]
					 ifFalse: [ $s ] ]).
	^ h
]

{ #category : #comparing }
Hand >> = hand [
	^ hand handChar = self handChar
]

{ #category : #converting }
Hand >> asString [
	^ handChar = $r
		ifTrue: [ 'Rock' ]
		ifFalse: [ 
			handChar = $p
				ifTrue: [ 'Paper' ]
				ifFalse: [  'Scissors' ] ]
]

{ #category : #accessing }
Hand >> handChar [
	^ handChar
]

{ #category : #accessing }
Hand >> handChar: c [
	"set the class to a given char c. 
	 c must be one of (r p s)
	"
	('rps' includes: c) 
		ifTrue: [ handChar := c ]
		ifFalse: [ self error: 'only allowed characters are "rps" ' ]
]

{ #category : #comparing }
Hand >> hash [
	^ handChar hash

]

{ #category : #'logical operations' }
Hand >> losesAgainst [

	| wchar lchar |
	wchar := self winsAgainst handChar.
	lchar := ('rps' asOrderedCollection
			   removeAll: handChar asString , wchar asString;
			   yourself) at: 1.
	^ self class new handChar: lchar.
]

{ #category : #'logical operations' }
Hand >> losesAgainst: hand [
	"H1 losesAgainst: H2 is true if and only if H1 loses against H2, i.e., H2 wins."
	^ hand = (self losesAgainst)
]

{ #category : #printing }
Hand >> printOn: aStream [
	| title |
	title := 'Hand'.
	aStream
		nextPutAll: title;
		nextPutAll: '<';
		nextPutAll: self asString;
		nextPutAll: '>'. 
]

{ #category : #'logical operations' }
Hand >> winsAgainst [

	^ self class new handChar: (handChar = $r
			   ifTrue: [ $s ]
			   ifFalse: [ 
				   handChar = $p
					   ifTrue: [ $r ]
					   ifFalse: [ $p ] ])
]

{ #category : #'logical operations' }
Hand >> winsAgainst: hand [
	^ hand = (self winsAgainst).
]
