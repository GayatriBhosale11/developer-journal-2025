#!/bin/bash

touch notes.txt

for month in 1 2 3 4
do
    for day in {1..28}
    do
        weekday=$((day % 7))

        # Active only 2-3 days/week
        if [[ $weekday -ne 1 && $weekday -ne 4 && $weekday -ne 6 ]]; then
            continue
        fi

        commits=$(( (RANDOM % 2) + 1 ))

        for ((i=1; i<=commits; i++))
        do
            echo "Work log $month-$day-$i" >> notes.txt

            git add .

            DATE="2025-$(printf "%02d" $month)-$(printf "%02d" $day) 14:$((RANDOM % 60)):00"

            GIT_AUTHOR_DATE="$DATE" \
            GIT_COMMITTER_DATE="$DATE" \
            git commit -m "Small progress update"
        done
    done
done
