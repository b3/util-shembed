#!/usr/bin/env bash

test_remove() {
    reset

    assertReturn "$($cmd -r file1 script)" 0
    assertEqual "$($cmd -l script)" ""
}
