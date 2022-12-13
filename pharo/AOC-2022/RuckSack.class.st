"
RuckSack contains to compartments each holds a string of characters.
"
Class {
	#name : #RuckSack,
	#superclass : #Object,
	#instVars : [
		'c1',
		'c2'
	],
	#category : #'AOC-2022'
}

{ #category : #'instance creation' }
RuckSack class >> c1: s1 c2: s2 [
	| r |
	r := self new.
	^ r
		c1: s1;
		c2: s2.
]

{ #category : #'instance creation' }
RuckSack class >> fromString: s [
	| len |
	len := s size / 2.
	^ self c1: (s first: len) c2: (s last: len).

]

{ #category : #accessing }
RuckSack >> c1: s [
	c1 := Utils countElements: s.
]

{ #category : #accessing }
RuckSack >> c2: s [
	c2 := Utils countElements: s.
]
