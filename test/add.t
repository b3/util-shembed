#!/usr/bin/env bash

test_add_tags() {
    reset

    # raw
    c="$cmd -a file2 -t tag1 -t tag2 script"
    assertReturn "$($c)" 0
    cporig script
    assertEqual "$($c)" ""

    assertNotReturn "$(stderr $c)" 0
    assertEqual "$(stderr $c)" "$errmsg file already included file2"

    # base64
    c="$cmd -a git.pdf -b -t tag1 -t tag2 script"
    assertReturn "$($c)" 0
    cporig script
    assertEqual "$($c)" ""

    assertNotReturn "$(stderr $c)" 0
    assertEqual "$(stderr $c)" "$errmsg file already included git.pdf"
}
