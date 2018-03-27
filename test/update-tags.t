#!/usr/bin/env bash

test_update_tagged_file() {
    reset

    # raw
    mute $cmd -a file2 -t tag1 -t tag2 script
    cp file3 file2
    assertReturn "$($cmd -u file2 -t tag2 script)" 0

    mute $cmd -x file2 -t tag2 script
    assertReturn "$(diff file2 file3)" 0

    # base64
    mute $cmd -a git.pdf -b -t tag1 -t tag2 script
    cp md.pdf git.pdf
    assertReturn "$($cmd -u git.pdf -t tag2 script)" 0

    mute $cmd -x git.pdf -t tag2 script
    assertReturn "$(diff git.pdf md.pdf)" 0
}

test_update_all_tagged_files() {
    reset

    mute $cmd -a file2 -t tag1 -t tag2 script
    mute $cmd -a git.pdf -b -t tag1 -t tag3 script
    cp file3 file1
    cp file3 file2
    cp md.pdf git.pdf
    assertReturn "$($cmd -U -t tag1 script)" 0

    # tagged files updated but untagged files not updated
    mute $cmd -X script
    assertReturn "$(diff file1 file1.orig)" 0
    assertReturn "$(diff file2 file3)" 0
    assertReturn "$(diff git.pdf md.pdf)" 0
}
