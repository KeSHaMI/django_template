#!/bin/bash

file="/etc/hosts"
line="127.0.0.1 dev.django.local"

if grep -Fxq "$line" "$file"; then
  echo "line $line already exists in $file"
else
  sudo sh -c "echo '$line' >> $file"
  echo "Line $line added to $file"
fi
