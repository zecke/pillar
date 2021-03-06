Class {
	#name : #PRTransformerEnvironmentTest,
	#superclass : #PRNodeTransformerTest,
	#instVars : [
		'testingFileSystem'
	],
	#category : 'Pillar-BookTester-Annotations-Tests'
}

{ #category : #'test file creation' }
PRTransformerEnvironmentTest class >> pillarAnnotationsContentsForTest [
"Needs completion"
	^ 
'!A Pillar document test for annotation transformers

${loader:account=QDucasse|project=MetacelloTestBook-Code|tag=Chapter3}$

Definition of a class and a method within it
[[[classDefinition=true
Object subclass: #PRTClass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Pillar-BookTesterResults''
]]]

[[[methodDefinition=true
PRTClass >> bla
	^ ''bla''
]]]

Definition of a test class and a test method within it
[[[classDefinition=true
TestCase subclass: #PRTClassTest
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Pillar-BookTesterResults''
]]]

[[[methodDefinition=true 
PRTClassTest >> testBla
	self assert: PRTClass new bla equals: ''bla''		
]]]

We can now check that everything is working:

${run:testClass=PRTClassTest}$

[[[testcase=true 
PRTClass new bla >>> ''bla''
]]]

${showClass:class=PRTClass}$

${showMethod:method=bla|class=PRTClass}$
'
]

{ #category : #'test file creation' }
PRTransformerEnvironmentTest class >> pillarAnnotationsFileNameForTest [
	
	^'test.pillar'
]
