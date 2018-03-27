#!/usr/bin/env bash

test_add_with_tags() {
    reset

    # simple
    assertReturn "$($cmd -a file2 -t tag1 -t tag2 script)" 0
    cporig script
    assertEqual "$($cmd -a file2 -t tag1 -t tag2 script)" ""

    # filename already used 
    assertNotReturn "$(stderr $cmd -a file2 script)" 0
    assertEqual "$(stderr $cmd -a file2 script)" "$errmsg file already included"

    # filename already used with same tag
    assertNotReturn "$(stderr $cmd -a file2 -t tag1 -t tag2 script)" 0
    assertEqual "$(stderr $cmd -a file2 -t tag1 -t tag2 script)" "$errmsg file already included"
}
