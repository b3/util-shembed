#!/usr/bin/env bash

test_list() {
    reset

    assertReturn "$($cmd script)"   0
    assertEqual "$($cmd script)" "file1"

    assertReturn "$($cmd script)"   0
    assertEqual "$($cmd -l script)" "file1"
}

test_list_with_tags() {
    reset

    # untagged files not listed
    assertReturn "$($cmd -l -t tag1 script)" 0
    assertEqual "$($cmd -l -t tag1 script)" ""

    # tagged files listed as plain files
    mute $cmd -a file2 -t tag1 -t tag2 script
    assertReturn "$($cmd script)" 0
    assertEqual "$($cmd script)" "file1
file2"

    reset
    mute $cmd -r file1 script
    mute $cmd -a file1 -t tag1 -t tag2 script
    mute $cmd -a file2 -t tag2 -t tag3 script
    mute $cmd -a file3 -t tag1 -t tag2 script
    mute $cmd -a git.pdf -b -t tag1 script

    # finding a tagged among many
    assertReturn "$($cmd -l -t tag3 script)" 0
    assertEqual "$($cmd -l -t tag3 script)" "file2"

    # conjonction of tags
    assertReturn "$($cmd -l -t tag1 -t tag2 script)" 0
    assertEqual "$($cmd -l -t tag2 -t tag2 script)" "file1
file3"
}
