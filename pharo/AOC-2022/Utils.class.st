"
Utility methods for this project.
- count elements of a collection
"
Class {
	#name : #Utils,
	#superclass : #Object,
	#category : #'AOC-2022'
}

{ #category : #utilities }
Utils class >> countElements: aCollection [
	| d |
	d := Dictionary new.
	aCollection do: [ :each | d at: each update: [ :v | v + 1 ] initial: 1 ].
	^ d
]

{ #category : #utilities }
Utils class >> mergeDict: d1 with: d2 using: aBlock [
	d2 keysDo: [ :k | d1 at: k update: [ :v | aBlock value: v value: (d2 at: k) ] initial: [ d2 at: k ] ].
	^ d1.
]

{ #category : #utilities }
Utils class >> readLinesFromFile: f [

	| fs lines |
	fs := (File named: f) openForRead.
	lines := Character lf split: fs upToEnd asString trim.
	fs close.
	^ lines.
]
