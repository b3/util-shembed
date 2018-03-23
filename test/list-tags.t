#!/usr/bin/env bash

test_list_tags() {
    reset

    assertReturn "$($cmd -L script)" 0
    assertEqual "$($cmd -L script)" ""

    mute $cmd -a file2 -t tag1 -t tag2 script
    mute $cmd -a file3 -t tag2 -t tag1 -t tag3 script
    assertReturn "$($cmd -L script)" 0
    assertEqual "$($cmd -L script)" "tag1
tag2
tag3"
}
