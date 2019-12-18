#!/bin/bash

for encrypted_file in ${INPUT_FILES//,/ }
do
  gpg --quiet --batch --yes --decrypt --passphrase="$INPUT_PASSPHRASE" \
  --output "${encrypted_file%.*}" "$encrypted_file"
done
