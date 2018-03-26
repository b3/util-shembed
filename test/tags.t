#!/usr/bin/env bash

test_samefilename_differents_tag() {
	reset

	assertReturn "$cmd -a file2 -t tag1 script" 0
	cp file3 file2 
	assertReturn "$cmd -a file2 -t tag2 -t tag3 script" 0
	
	assertReturn "$cmd -x file2 -t tag1 script" 0
	assertReturn "diff file2 file2.orig" 0

	assertReturn "$cmd -x file2 -t tag2 script" 0
	assertReturn "diff file2 file3.orig" 0
}
