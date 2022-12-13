Class {
	#name : #HandTest,
	#superclass : #TestCase,
	#category : #'AOC-2022-Tests'
}

{ #category : #tests }
HandTest >> testPaperBeatsRock [
	^ self assert: (Hand new handChar: $p; winsAgainst) equals: (Hand new handChar: $r).
]

{ #category : #tests }
HandTest >> testRockBeatsScissors [
	^ self assert: (Hand new handChar: $r; winsAgainst) equals: (Hand new handChar: $s).
]

{ #category : #tests }
HandTest >> testScissorsBeatsPaper [
	^ self assert: (Hand new handChar: $s; winsAgainst) equals: (Hand new handChar: $p).
]
