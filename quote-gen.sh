#!/bin/bash

PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $PARENT_PATH

SELECTED_QUOTE=$(shuf -n 1 quotes.txt)
IFS='_' read -ra ADDR <<< "$SELECTED_QUOTE"
QUOTE_COLOR='\033[1;32m'
NO_COLOR='\033[0m'
AUTHOR_COLOR=$NO_COLOR

ADDR[0]=$(sed 's/^/„/' <<< ${ADDR[0]})
ADDR[0]=$(sed 's/$/“/' <<< ${ADDR[0]})
ADDR[0]="${QUOTE_COLOR}${ADDR[0]}\n${NO_COLOR}"
ADDR[1]=$(sed 's/^/- /' <<< ${ADDR[1]})
ADDR[1]="${AUTHOR_COLOR}${ADDR[1]}${NO_COLOR}"

for i in "${ADDR[@]}"; do
  echo -e $i
done
