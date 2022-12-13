"
A Game of Rock Paper Scissors
- hand1 : Hand
- hand2 : Hand
"
Class {
	#name : #RPS,
	#superclass : #Object,
	#instVars : [
		'hand1',
		'hand2'
	],
	#category : #'AOC-2022'
}

{ #category : #'instance creation' }
RPS class >> withHand1: h1 withHand2: h2 [

	^ self new
		  hand1: h1;
		  hand2: h2;
		  yourself
]

{ #category : #accessing }
RPS >> hand1: h1 [
	hand1 := h1
]

{ #category : #accessing }
RPS >> hand2: h [
	hand2 := h
]

{ #category : #algorithm }
RPS >> player2Score [

	| p2Won choiceScore winScore |
	p2Won := hand2 winsAgainst: hand1.
	winScore := hand1 = hand2
		            ifTrue: [ 3 ]
		            ifFalse: [ 
			            (hand2 winsAgainst: hand1)
				            ifTrue: [ 6 ]
				            ifFalse: [ 0 ] ].
	choiceScore := hand2 handChar = $r
		               ifTrue: [ 1 ]
		               ifFalse: [ 
			               hand2 handChar = $p
				               ifTrue: [ 2 ]
				               ifFalse: [ 3 ] ].
	^ winScore + choiceScore.
]
