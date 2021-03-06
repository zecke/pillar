Class {
	#name : #PRCheckBookDocument,
	#superclass : #PRAbstractOutputDocument,
	#category : 'Pillar-BookTester-CommandLine'
}

{ #category : #building }
PRCheckBookDocument >> buildOn: aPRProject [ 
	
	| parsedDocument transformedDocument bTester stream |
	parsedDocument := self parseInputFile: file.
	transformedDocument := self transformDocument: parsedDocument.
	bTester := PRBookTesterVisitor new.
	bTester start: transformedDocument.
	stream := String streamContents: 
				 [ :s |
					s << file fullName.
					s crlf.
					s << 'Passed: ' << (bTester allTestResults size - bTester failedTests size) asString.
					s crlf.
					s << 'Failed: ' << bTester failedTests size asString.
					s crlf;crlf. 
					bTester failedTests do: [ :each | 
														s << each explanation.
														s crlf.
											  			s << each text.
											  		 	s crlf; crlf. ].
				   s << 'File Checked!'.
					s crlf;crlf.].
	Stdio stdout 
		nextPutAll: stream contents.
	bTester allTestResults do: [:each | bTester finalStatus: (bTester finalStatus and: each status) ].	
	^ PRStatus withStatus: bTester finalStatus
]
