#!/bin/bash

# create files needed for tests
init () {
    cat <<-EOF > script.orig
#!/bin/bash
:

# include file2

exit 0

# begin file1
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec hendrerit
tempor tellus. Donec pretium posuere tellus. Proin quam nisl, tincidunt et,
# end file1
EOF
    chmod +x script.orig

    cat <<-EOF > file1.orig
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec hendrerit
tempor tellus. Donec pretium posuere tellus. Proin quam nisl, tincidunt et,
EOF

    cat <<-EOF > file2.orig
this is file2 this is file2 this is file2 this is file2 this is file2 this is
file2 this is file2 this is file2 this is file2 this is file2 this is file2
EOF

    cat <<-EOF > file3.orig
this is file3 this is file3 this is file3 this is file3 this is file3 this is
file3 this is file3 this is file3 this is file3 this is file3 this is file3
EOF

    base64 -d <<-EOF > git.pdf.orig
JVBERi0xLjQKJbXtrvsKMyAwIG9iago8PCAvTGVuZ3RoIDQgMCBSCiAgIC9GaWx0ZXIgL0ZsYXRl
RGVjb2RlCj4+CnN0cmVhbQp4nG2RTU4DMQyF9zmFL4Bx/JfkBJWQWBSWiAUaRBGaLgoLrk+miqcD
VKMo8hf7PdtzSgTL97CD2xeCw1cSR7LiTeC7v93185GenoGQ4DUp3MMJ8rnkZrnUM5pUNYbpmEyR
qkOuSFzgCN4MW9YAM5RsWFsOUCRjKwKimKmtYehMK1EqqCaLQhDuRFZBVUGjujqOOHWNIRYZc7gF
GL0MwYiG4TRACpk5MobKuAb8vYAJ3v+t5BH2Y+WfB8hUMRced+7PQcQExcvZjpBr2xA2RiUGdkFm
hjmBsKJtq6Q5usgVEl5zFP0FCVgrluYbq2wV3XzTziUnyEWnT93za7PNYGqEhQW4rzn78ieNGav4
FbI23bfeFJtt5whyKXMvSL4VutbAW9qnH7qQlC0KZW5kc3RyZWFtCmVuZG9iago0IDAgb2JqCiAg
IDI5NwplbmRvYmoKMiAwIG9iago8PAogICAvRXh0R1N0YXRlIDw8CiAgICAgIC9hMCA8PCAvQ0Eg
MSAvY2EgMSA+PgogICA+Pgo+PgplbmRvYmoKNSAwIG9iago8PCAvVHlwZSAvUGFnZQogICAvUGFy
ZW50IDEgMCBSCiAgIC9NZWRpYUJveCBbIDAgMCA3NTAgNDYxLjUzODQ1MiBdCiAgIC9Db250ZW50
cyAzIDAgUgogICAvR3JvdXAgPDwKICAgICAgL1R5cGUgL0dyb3VwCiAgICAgIC9TIC9UcmFuc3Bh
cmVuY3kKICAgICAgL0kgdHJ1ZQogICAgICAvQ1MgL0RldmljZVJHQgogICA+PgogICAvUmVzb3Vy
Y2VzIDIgMCBSCj4+CmVuZG9iagoxIDAgb2JqCjw8IC9UeXBlIC9QYWdlcwogICAvS2lkcyBbIDUg
MCBSIF0KICAgL0NvdW50IDEKPj4KZW5kb2JqCjYgMCBvYmoKPDwgL0NyZWF0b3IgKGNhaXJvIDEu
MTQuOCAoaHR0cDovL2NhaXJvZ3JhcGhpY3Mub3JnKSkKICAgL1Byb2R1Y2VyIChjYWlybyAxLjE0
LjggKGh0dHA6Ly9jYWlyb2dyYXBoaWNzLm9yZykpCj4+CmVuZG9iago3IDAgb2JqCjw8IC9UeXBl
IC9DYXRhbG9nCiAgIC9QYWdlcyAxIDAgUgo+PgplbmRvYmoKeHJlZgowIDgKMDAwMDAwMDAwMCA2
NTUzNSBmIAowMDAwMDAwNzA0IDAwMDAwIG4gCjAwMDAwMDA0MTEgMDAwMDAgbiAKMDAwMDAwMDAx
NSAwMDAwMCBuIAowMDAwMDAwMzg5IDAwMDAwIG4gCjAwMDAwMDA0ODMgMDAwMDAgbiAKMDAwMDAw
MDc2OSAwMDAwMCBuIAowMDAwMDAwODk2IDAwMDAwIG4gCnRyYWlsZXIKPDwgL1NpemUgOAogICAv
Um9vdCA3IDAgUgogICAvSW5mbyA2IDAgUgo+PgpzdGFydHhyZWYKOTQ4CiUlRU9GCg==
EOF

    base64 -d <<-EOF > md.pdf.orig
JVBERi0xLjUKJbXtrvsKNCAwIG9iago8PCAvTGVuZ3RoIDUgMCBSCiAgIC9GaWx0ZXIgL0ZsYXRl
RGVjb2RlCj4+CnN0cmVhbQp4nG2RS07EMAyG9zmFL4CxYzuPEyAhsRhYIhaoiEGosxhYcH3cIe4U
GFVJ5M/270cZyL8r9ksLo0lTyzAd0jHRyXV/A9fPBPvPJAXJaukCX+679fOeHp+AkOAlKdzBEfiU
8nO7hilSK8ANKVc4QOmGnTXADJUNW+cAVRh7FRBFpr6aoTOtRKmimiwKQbITWQVVBY3aWnHYyTWG
WETMUS3A6GUIhjUKTgOkkJkjYqiMZ8DfC5jg7d9KHmA3Fv2xB6aGXDOICUpZ3EHiXcoR5tY3JFtG
JY/pDYW9pQSSFW2bJb1gEblAotYcSX9BgswZq25LCWVsTTbtnGOCnHV8amv+W2wzmBphzQLZFybV
PMqya0q5QNamfetdsdt2jiDntFIqUtkKXWrgNe3SN72ultsKZW5kc3RyZWFtCmVuZG9iago1IDAg
b2JqCiAgIDMwMwplbmRvYmoKMyAwIG9iago8PAogICAvRXh0R1N0YXRlIDw8CiAgICAgIC9hMCA8
PCAvQ0EgMSAvY2EgMSA+PgogICA+Pgo+PgplbmRvYmoKMiAwIG9iago8PCAvVHlwZSAvUGFnZSAl
IDEKICAgL1BhcmVudCAxIDAgUgogICAvTWVkaWFCb3ggWyAwIDAgNzUwIDQ2MS41Mzg0NTIgXQog
ICAvQ29udGVudHMgNCAwIFIKICAgL0dyb3VwIDw8CiAgICAgIC9UeXBlIC9Hcm91cAogICAgICAv
UyAvVHJhbnNwYXJlbmN5CiAgICAgIC9JIHRydWUKICAgICAgL0NTIC9EZXZpY2VSR0IKICAgPj4K
ICAgL1Jlc291cmNlcyAzIDAgUgo+PgplbmRvYmoKMSAwIG9iago8PCAvVHlwZSAvUGFnZXMKICAg
L0tpZHMgWyAyIDAgUiBdCiAgIC9Db3VudCAxCj4+CmVuZG9iago2IDAgb2JqCjw8IC9Qcm9kdWNl
ciAoY2Fpcm8gMS4xNi4wIChodHRwczovL2NhaXJvZ3JhcGhpY3Mub3JnKSkKICAgL0NyZWF0b3Ig
PEZFRkYwMDQ5MDA2RTAwNkIwMDczMDA2MzAwNjEwMDcwMDA2NTAwMjAwMDMxMDAyRTAwMzAwMDJF
MDAzMjAwMjAwMDI4MDA2ODAwNzQwMDc0MDA3MDAwNzMwMDNBMDAyRjAwMkYwMDY5MDA2RTAwNkIw
MDczMDA2MzAwNjEwMDcwMDA2NTAwMkUwMDZGMDA3MjAwNjcwMDI5PgogICAvQ3JlYXRpb25EYXRl
IChEOjIwMjEwMjAxMjA1NjQwKzAxJzAwKQo+PgplbmRvYmoKNyAwIG9iago8PCAvVHlwZSAvQ2F0
YWxvZwogICAvUGFnZXMgMSAwIFIKPj4KZW5kb2JqCnhyZWYKMCA4CjAwMDAwMDAwMDAgNjU1MzUg
ZiAKMDAwMDAwMDcxNCAwMDAwMCBuIAowMDAwMDAwNDg5IDAwMDAwIG4gCjAwMDAwMDA0MTcgMDAw
MDAgbiAKMDAwMDAwMDAxNSAwMDAwMCBuIAowMDAwMDAwMzk1IDAwMDAwIG4gCjAwMDAwMDA3Nzkg
MDAwMDAgbiAKMDAwMDAwMTA2MiAwMDAwMCBuIAp0cmFpbGVyCjw8IC9TaXplIDgKICAgL1Jvb3Qg
NyAwIFIKICAgL0luZm8gNiAwIFIKPj4Kc3RhcnR4cmVmCjExMTQKJSVFT0YK
EOF

    reset
}

# reset files
reset() {
    for f in *.orig
    do
        cp -f "$f" "${f%%.orig}"
    done
}

# remove all files
clean () {
    for f in *.orig
    do
        rm -f "$f" "${f%%.orig}"
    done
}
