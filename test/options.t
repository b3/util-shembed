#!/usr/bin/env bash

test_options_tags () {
    reset
    
    m="$errmsg -t usable only when adding/listing files"
    
    c="$cmd -u file1 -t tag1 -t tag2 script"
    assertNotReturn "$(stderr $c)" "0"
    assertEqual "$(stderr $c)" "$m"

    c="$cmd -U -t tag1 -t tag2 script"
    assertNotReturn "$(stderr $c)" "0"
    assertEqual "$(stderr $c)" "$m"

    c="$cmd -t tag1 -x file1 -t tag2 script"
    assertNotReturn "$(stderr $c)" "0"
    assertEqual "$(stderr $c)" "$m"

    c="$cmd -X -t tag1 -t tag2 script"
    assertNotReturn "$(stderr $c)" "0"
    assertEqual "$(stderr $c)" "$m"

    c="$cmd -r file1 -t tag1 -t tag2 script"
    assertNotReturn "$(stderr $c)" "0"
    assertEqual "$(stderr $c)" "$m"
}
