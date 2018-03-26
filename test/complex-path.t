#!/usr/bin/env bash

test_complex_path_basename() {
    reset

    mkdir dir
    cp file2 dir
    assertReturn "$($cmd -a dir/file2 script)" 0

    assertEqual "$($cmd script)" "file1
file2"
    rm dir/file2
    rmdir dir
}
