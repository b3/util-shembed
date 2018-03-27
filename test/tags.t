#!/usr/bin/env bash

test_samefilename_tagged_differently() {
    reset

    # adding is allowed
    assertReturn "$cmd -a file2 -t tag1 script" 0
    cp file3 file2 
    assertReturn "$cmd -a file2 -t tag2 -t tag3 script" 0

    # extraction of specified tagged file
    assertReturn "$cmd -x file2 -t tag1 script" 0
    assertReturn "diff file2 file2.orig" 0

    assertReturn "$cmd -x file2 -t tag2 script" 0
    assertReturn "diff file2 file3.orig" 0

    # adding already tagged file is not allowed
    reset
    mute $cmd -a file2 -t tag1 script

    assertNotReturn "$(stderr $cmd -a file2 script)" 0
    assertEqual "$(stderr $cmd -a file2 script)" "$errmsg file already included"
}
