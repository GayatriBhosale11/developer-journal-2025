#!/bin/bash

touch worklog.txt

for month in 1 2 4 5
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
            echo "2026 activity $month-$day-$i" >> worklog.txt

            git add .

            DATE="2026-$(printf "%02d" $month)-$(printf "%02d" $day) 13:$((RANDOM % 60)):00"

            GIT_AUTHOR_DATE="$DATE" \
            GIT_COMMITTER_DATE="$DATE" \
            git commit -m "Development progress"
        done
    done
done

