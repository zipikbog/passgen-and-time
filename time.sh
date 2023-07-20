#!/bin/bash
if [[ $1 == "-h" || $1 == "--help" ]]; then
echo -e "\n считат за сколько выполниться команда заданная аргументом \$1
\n создал это все Алексей zipik"
exit 0
fi
START_TIME=$(date +"%s.%N")

"$1"

END_TIME=$(date +"%s.%3N")
difference=$(echo "$END_TIME - $START_TIME" | bc )
echo "$difference"
exit 0