#!/bin/sh

# Finds all git files without pack and prints the output.
hashes=$(find objects/ -type f -printf '%TY-%Tm-%Td %TT %p\n' | egrep -v "pack" | sed -nE "s/^.*objects\/(.+)\/(.+)/\1\2/p")

# For each output, save to txt file.
for hash in $hashes
do
    git show $hash > $hash.txt
done
