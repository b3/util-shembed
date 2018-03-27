#!/usr/bin/env bash

test_extract() {
    reset

    # raw
    mute $cmd -a file2 script
    rm file2
    assertReturn "$($cmd -x file2 script)" 0
    assertReturn "$(diff file2 file2.orig)" 0

    # base64
    mute $cmd -a git.pdf -b script
    rm git.pdf
    assertReturn "$($cmd -x git.pdf script)" 0
    assertReturn "$(diff git.pdf git.pdf.orig)" 0
}

test_extract_all() {
    reset

    # extract all files
    mute $cmd -a file2 script
    mute $cmd -a git.pdf -b script
    assertReturn "$($cmd -X script)" 0
    assertReturn "$(diff file1 file1.orig)" 0
    assertReturn "$(diff file2 file2.orig)" 0
    assertReturn "$(diff git.pdf git.pdf.orig)" 0
}
