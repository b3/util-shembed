#!/usr/bin/env bash

test_remove() {
    reset

    assertReturn "$($cmd -r file1 script)" 0
    assertEqual "$($cmd -l script)" ""
}

test_remove_all() {
    reset

    mute $cmd -a file2 script
    assertReturn "$($cmd -R script)" 0
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

test_remove_all_tagged() {
    reset

    mute $cmd -a file2 -t tag1 script
    mute $cmd -a git.pdf -b -t tag1 script
    mute $cmd -a md.pdf -b -t tag2 script

    # removing all tagged files 
    assertReturn "$($cmd -R -t tag1 script)" 0
    assertEqual "$($cmd -l script)" "file1
md.pdf
"
    # removing all files (tagged or not)
    assertReturn "$($cmd -R script)" 0
    assertEqual "$($cmd -l script)" ""
}
