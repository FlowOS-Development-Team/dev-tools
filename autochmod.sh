#!/bin/bash
FILES="./*"
find $FILES -type f -print0 | while IFS= read -r -d '' file; do
  chmod 777 $file
  echo "Processing: $file"
done
