#!/bin/bash

SELECTED_QUOTE=$(shuf -n 1 quotes.txt)
IFS='_' read -ra ADDR <<< "$SELECTED_QUOTE"

for i in "${ADDR[@]}"; do
  echo $i
done
