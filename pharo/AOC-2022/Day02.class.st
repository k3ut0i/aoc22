"
Day 02 problem.
	
"
Class {
	#name : #Day02,
	#superclass : #DayAbstract,
	#instVars : [
		'inputData'
	],
	#category : #'AOC-2022'
}

{ #category : #enumeration }
Day02 >> inputData: lines [

	inputData := lines collect: [ :line | 
		             { 
			             (line at: 1).
			             (line at: 3) } ]
]

{ #category : #running }
Day02 >> runWithInput: f [
	self inputData: (self class readLinesFromFile: f).
	^ { self scoreOnFirstTry. self scoreOnSecondTry }.
	
]

{ #category : #algorithm }
Day02 >> scoreOnFirstTry [

	| score |
	score := 0.
	
	inputData do: [ :each | 
		| currentGame currentScore |
		currentGame := RPS
			               withHand1: (Hand fromEnc: (each at: 1))
			               withHand2: (Strat new stratChar: (each at: 2)) firstTry.
		currentScore := currentGame player2Score.
		score := score + currentScore ].
	^ score
]

{ #category : #algorithm }
Day02 >> scoreOnSecondTry [

	
	^ inputData sumNumbers:  [ :each |
		| game h1 h2 |
			h1 := (Hand fromEnc: (each at: 1)).
			h2 := (Strat new stratChar: (each at: 2)) secondTry: h1 .
			game := RPS withHand1: h1
			    			withHand2: h2.
			game player2Score ].
]
