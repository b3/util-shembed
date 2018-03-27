#!/usr/bin/env bash

test_list() {
    reset

    # default action is -l
    assertReturn "$($cmd script)"   0
    assertEqual "$($cmd script)" "file1"

    # action is specified
    assertReturn "$($cmd script)"   0
    assertEqual "$($cmd -l script)" "file1"
}

test_list_with_tags() {
    reset

    # untagged files not listed
    assertReturn "$($cmd -l -t tag1 script)" 0
    assertEqual "$($cmd -l -t tag1 script)" ""

    # all files listed (tagged or not)
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

    # finding tagged file among many
    assertReturn "$($cmd -l -t tag3 script)" 0
    assertEqual "$($cmd -l -t tag3 script)" "file2"

    # conjonction of tags
    assertReturn "$($cmd -l -t tag1 -t tag2 script)" 0
    assertEqual "$($cmd -l -t tag2 -t tag1 script)" "file1
file3"

    # same filename under two different tags
    reset
    mute $cmd -a file2 -t tag1 script
    cp file3 file2
    mute "$(stderr $cmd -a file2 -t tag2 script)" 0
    assertEqual "$($cmd script)" "file1
file2
file2"
}
