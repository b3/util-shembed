#!/usr/bin/env bash

test_add() {
	reset

    c="$cmd -a file2 script"

	# simple
    assertReturn "$($c)" 0
    cporig script
    assertEqual "$($c)" ""

	# twice the same filename
    assertNotReturn "$(stderr $c)" 0
    assertEqual "$(stderr $c)" "$errmsg file already included"
}

test_add_tags() {
    reset

    c="$cmd -a file2 -t tag1 -t tag2 script"

    assertReturn "$($c)" 0
    cporig script
    assertEqual "$($c)" ""

    assertNotReturn "$(stderr $c)" 0
    assertEqual "$(stderr $c)" "$errmsg file already included"
}
