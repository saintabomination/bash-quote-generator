#!/bin/bash

SELECTED_QUOTE=$(shuf -n 1 quotes.txt)
IFS='_' read -ra ADDR <<< "$SELECTED_QUOTE"

ADDR[0]=$(sed 's/^/„/' <<< ${ADDR[0]})
ADDR[0]=$(sed 's/$/“/' <<< ${ADDR[0]})

for i in "${ADDR[@]}"; do
  echo $i
done
