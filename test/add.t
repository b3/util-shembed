#!/usr/bin/env bash

test_add() {
    reset

    # simple
    assertReturn "$($cmd -a file2 script)" 0
    cporig script
    assertEqual "$($cmd -a file2 script)" ""

    # filename already used
    assertNotReturn "$(stderr $cmd -a file2 script)" 0
    assertEqual "$(stderr $cmd -a file2 script)" "$errmsg file already included"
}
