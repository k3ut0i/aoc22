Class {
	#name : #DayTest,
	#superclass : #TestCase,
	#instVars : [
		'mainInputFile',
		'testInputFile',
		'dayNum',
		'testAns',
		'mainAns'
	],
	#category : #'AOC-2022'
}

{ #category : #'instance creation' }
DayTest class >> new: dN mainAns: ma testAns: ta [
	| c dayStr inputDir |
	inputDir := '/home/keutoi/projects/aoc22/input/'.
	dayStr := dN < 10 ifTrue: [ '0' , dN asString ] ifFalse: [ dN asString ].
	c := self new.
	^ self new 
		day: dN;
		mainAns: ma;
		testAns: ta;
		mainInputFile: inputDir , 'day' , dayStr;
		testInputFile: inputDir , 'day' , dayStr , 'test'.
]

{ #category : #setting }
DayTest >> day: d [
	dayNum := d
]

{ #category : #setting }
DayTest >> day: dN mainAns: ma testAns: ta [

	| dayStr inputDir |
	inputDir := '/home/keutoi/projects/aoc22/input/'.
	dayStr := dN < 10
		          ifTrue: [ '0' , dN asString ]
		          ifFalse: [ dN asString ].
	^ self
		  day: dN;
		  mainAns: ma;
		  testAns: ta;
		  mainInputFile: inputDir , 'day' , dayStr;
		  testInputFile: inputDir , 'day' , dayStr , 'test'
]

{ #category : #setting }
DayTest >> mainAns: m [
	mainAns := m
]

{ #category : #setting }
DayTest >> mainInputFile: f [
	mainInputFile := f.
]

{ #category : #setting }
DayTest >> testAns: ta [
	testAns := ta
	
]

{ #category : #tests }
DayTest >> testDay01 [
	(self day: 01 mainAns: #(70369 203002) testAns: #(24000 45000)) testRun: (Day01 new).
]

{ #category : #tests }
DayTest >> testDay02 [
	(self day: 2 mainAns: #(12586 13193) testAns: #(15 12)) testRun: Day02 new.
]

{ #category : #setting }
DayTest >> testInputFile: f [
	testInputFile := f
]

{ #category : #'test methods' }
DayTest >> testRun: dayObject [
	self assert: (dayObject runWithInput: testInputFile) equals: testAns.
	self assert: (dayObject runWithInput: mainInputFile) equals: mainAns.
	
]
