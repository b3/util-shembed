#!/usr/bin/env bash

test_extract_tagged_file() {
    # single file (no conflict)
    reset
    mute $cmd -a file2 -t tag1 script 
    rm file2
    assertReturn "$($cmd -x file2 script)" 0
    assertReturn "$(diff file2 file2.orig)" 0

    # two files with same name, extract only the tagged one
    reset
    cp file2 file1
    mute $cmd -a file1 -t tag1 script
    assertReturn "$($cmd -x file1 -t tag1 script)" 0
    assertReturn "$(diff file1 file2.orig)" 0
}

test_extract_all_tagged_files() {
    reset

    # extract all tagged files
    cp file2 file1
    mute $cmd -a file1 -t tag1 script
    mute $cmd -a git.pdf -b -t tag1 script
    assertReturn "$($cmd -X -t tag1 script)" 0
    assertReturn "$(diff file1 file2.orig)" 0
    assertReturn "$(diff git.pdf git.pdf.orig)" 0
}

test_extract_all_included_tagged_files() {
	reset

    cp file2 file1
    mute $cmd -a file1 -t tag1 script
	cp md.pdf git.pdf
    mute $cmd -a git.pdf -b -t tag1 script
    assertReturn "$($cmd -X script)" 0
    assertReturn "$(diff file1 file2.orig)" 0
	assertReturn "$(diff git.pdf md.pdf)" 0
}
