#!/bin/bash

DENSITY=150
QUALITY=90
FILES='resume coverletter'

for file in $FILES; do
  convert -density "$DENSITY" "${file}.pdf" -quality "$QUALITY" "${file}.jpg"
done
