#!/bin/bash

TIMESTAMP=$(cat /home/manikandan_arch/.pacman_last_update_timestamp)
PACMAN_LAST_UPDATE_CHECKED=$(cat /var/log/pacman.log | grep -n 'starting full system upgrade' | tail -n1 | cut -d':' -f1)

PACMAN_NEXT_OPERATION=$(tail -n+$(($PACMAN_LAST_UPDATE_CHECKED + 1)) /var/log/pacman.log | head -n1)
NEXT_OPERATION=$(echo $PACMAN_NEXT_OPERATION | cut -d']' -f3)
NEW_TIMESTAMP=$(echo $PACMAN_NEXT_OPERATION | cut -d']' -f1 | cut -d'[' -f2)
if [ "$NEXT_OPERATION" = ' transaction started' ]
then
	TIMESTAMP=$NEW_TIMESTAMP
	echo $TIMESTAMP > /home/manikandan_arch/.pacman_last_update_timestamp
fi

TIME_SINCE=$(($(date +%s) - $(date --date="$TIMESTAMP" +%s)))
FORMATTED_TIME_SINCE=$(date -u -d @"$TIME_SINCE" +'%-Hh %-Mm %-Ss')
FORMATTED_DAYS_SINCE=$(($(date -u -d @"$TIME_SINCE" +'%-j') - 1))d
echo updated $FORMATTED_DAYS_SINCE $FORMATTED_TIME_SINCE ago
