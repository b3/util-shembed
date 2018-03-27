#!/usr/bin/env bash

test_remove() {
    reset

    assertReturn "$($cmd -r file1 script)" 0
    assertEqual "$($cmd -l script)" ""
}

test_remove_tagged() {
    reset
    cp file2 file1
    mute $cmd -a file1 -t tag1 script

    # removing only the tagged file
    assertReturn "$($cmd -r file1 -t tag1 script)" 0
    assertEqual "$($cmd -l script)" "file1"
    assertReturn "$($cmd -x file1 script)" 0
    assertReturn "$(diff file1 file1.orig)" 0
}
