"
An abstract class that combines the behaviour needed for every instance of the problem.
- common entry point *main* function to run all instances.
- common test point.
"
Class {
	#name : #DayAbstract,
	#superclass : #Object,
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
DayAbstract class >> new: dN mainAns: ma testAns: ta [
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

{ #category : #accessing }
DayAbstract >> day: d [
	dayNum := d
]

{ #category : #running }
DayAbstract >> main [
	^ self runWithInput: mainInputFile 
]

{ #category : #accessing }
DayAbstract >> mainAns: m [
	mainAns := m
]

{ #category : #accessing }
DayAbstract >> mainInputFile: f [
	mainInputFile := f.
]

{ #category : #initialization }
DayAbstract >> new: dN mainAns: ma testAns: ta [
	dayNum := dN.
	mainAns := ma.
	testAns := ta.
	
]

{ #category : #running }
DayAbstract >> runWithInput: inputFile [
	^ 'unimplemented function runWithInput.'
]

{ #category : #accessing }
DayAbstract >> testAns: ta [
	testAns := ta
	
]

{ #category : #accessing }
DayAbstract >> testInputFile: f [
	testInputFile := f
]
