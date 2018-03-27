#!/usr/bin/env bash

test_complex_path_becomes_basename() {
    reset

    mkdir dir
    cp file2 dir
    assertReturn "$($cmd -a dir/file2 script)" 0
    assertEqual "$($cmd script)" "file1
file2"
    rm dir/file2
    rmdir dir
}

test_basename_becomes_complex_path() {
    reset

    mkdir dir
    assertReturn "$($cmd -x dir/file1 script)" 0
    assertReturn "$(diff file1 dir/file1)" 0
    rm dir/file1
    rmdir dir
}
