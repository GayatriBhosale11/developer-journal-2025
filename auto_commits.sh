#!/bin/bash

touch activity.txt

for month in {1..12}
do
    for day in {1..28}
    do
        weekday=$((day % 7))

        # Skip random-like 2 days/week
        if [[ $weekday -eq 0 || $weekday -eq 3 ]]; then
            continue
        fi

        commits=$(( (RANDOM % 3) + 1 ))

        for ((i=1; i<=commits; i++))
        do
            echo "Update $month-$day-$i" >> activity.txt

            git add .

            DATE="2025-$(printf "%02d" $month)-$(printf "%02d" $day) 12:00:00"

            GIT_AUTHOR_DATE="$DATE" \
            GIT_COMMITTER_DATE="$DATE" \
            git commit -m "Update on $DATE"
        done
    done
done
